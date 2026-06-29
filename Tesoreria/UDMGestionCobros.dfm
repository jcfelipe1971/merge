object DMGestionCobros: TDMGestionCobros
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 687
  Top = 214
  Height = 698
  Width = 479
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 64
    Top = 8
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT STD.DIR_CLASE, CU.CLIENTE, ST.TERCERO, ST.NOMBRE_COMERCIA' +
        'L, ST.NOMBRE_R_SOCIAL,  CU.FORMA_PAGO, ST.NIF, AGENTE, STD.DIR_C' +
        'OMPLETA_N,'
      '       ST.TELEFONO01, ST.TELEFAX, ST.EMAIL, PAIS_C2'
      'FROM CON_CUENTAS_GES_CLI CU'
      
        'JOIN EMP_CLIENTES EC ON (EC.CLIENTE = CU.CLIENTE AND EC.EMPRESA ' +
        '= CU.EMPRESA)'
      'JOIN SYS_TERCEROS ST ON (EC.TERCERO = ST.TERCERO)'
      'JOIN SYS_TERCEROS_DIRECCIONES STD ON (ST.TERCERO = STD.TERCERO)'
      'WHERE'
      'CU.EMPRESA = :EMPRESA AND'
      'CU.EJERCICIO = :EJERCICIO AND'
      'CU.CANAL = :CANAL AND'
      'CU.CLIENTE = :CLIENTE AND'
      'STD.DIR_CLASE IN (0, 1, 3)'
      'ORDER BY STD.DIR_CLASE DESC, DIR_DEFECTO')
    UniDirectional = False
    Left = 64
    Top = 56
    object xClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClientesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xClientesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xClientesFORMA_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xClientesNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xClientesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xClientesDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xClientesTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xClientesTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xClientesEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xClientesPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xClientesNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 208
    Top = 56
  end
  object DSRecibosCobroCliente: TDataSource
    DataSet = xRecibosCobroCliente
    Left = 208
    Top = 104
  end
  object DSIncidencias: TDataSource
    DataSet = xIncidencias
    Left = 208
    Top = 248
  end
  object DSRecibosCobroProveedor: TDataSource
    DataSet = xRecibosCobroProveedor
    Left = 208
    Top = 152
  end
  object xRecibosCobroProveedor: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT EC.ID_CARTERA, ECD.ID_CARTERA_DETALLE,REGISTRO,'
      'FECHA_REGISTRO,VENCIMIENTO,CUENTA,DOC_NUMERO,DOC_SERIE, '
      'DOC_TIPO,BASES,LIQUIDO,MONEDA, TIPO_EFECTO,REMESA,'
      'CONFIRMING,ORD_PAGO,ECD.RESPONSABLE'
      'FROM EMP_CARTERA EC '
      'JOIN EMP_CARTERA_DETALLE ECD'
      'ON(EC.ID_CARTERA = ECD.ID_CARTERA)'
      'WHERE'
      'ECD.ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE')
    SelectSQL.Strings = (
      
        'SELECT EC.EMPRESA,EC.EJERCICIO,EC.CANAL,EC.ID_CARTERA, ECD.ID_CA' +
        'RTERA_DETALLE,REGISTRO,'
      'FECHA_REGISTRO,VENCIMIENTO,CUENTA,DOC_NUMERO,DOC_SERIE, '
      'DOC_TIPO,BASES,LIQUIDO,MONEDA, TIPO_EFECTO,REMESA,'
      'CONFIRMING,ORD_PAGO'
      'FROM EMP_CARTERA EC '
      'JOIN EMP_CARTERA_DETALLE ECD'
      'ON(EC.ID_CARTERA = ECD.ID_CARTERA)'
      'WHERE '
      'EC.EMPRESA = ?EMPRESA AND '
      'EC.EJERCICIO <= ?EJERCICIO AND '
      'EC.CANAL = ?CANAL AND'
      'EC.COD_CLI_PRO = ?COD_CLI_PRO AND '
      'SIGNO = '#39'P'#39' AND ECD.PAGADO = 0 AND '
      'ECD.RECIBIDO = 0 AND'
      'ECD.REMESA = 0 AND '
      'ECD.VISIBLE = 1')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE '
      'SET'
      'RESPONSABLE = ?RESPONSABLE,'
      
        'WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ' +
        '?CANAL AND'
      'SIGNO = '#39'P'#39' AND REGISTRO = ?REGISTRO  AND LINEA = ?LINEA '
      ''
      '')
    Left = 64
    Top = 152
    object xRecibosCobroProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecibosCobroProveedorEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecibosCobroProveedorCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecibosCobroProveedorID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xRecibosCobroProveedorID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Detalle'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xRecibosCobroProveedorREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xRecibosCobroProveedorFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fecha Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xRecibosCobroProveedorVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosCobroProveedorCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xRecibosCobroProveedorDOC_NUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xRecibosCobroProveedorDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xRecibosCobroProveedorDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xRecibosCobroProveedorBASES: TFloatField
      DisplayLabel = 'Bases'
      FieldName = 'BASES'
    end
    object xRecibosCobroProveedorLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xRecibosCobroProveedorMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xRecibosCobroProveedorTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xRecibosCobroProveedorREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xRecibosCobroProveedorCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xRecibosCobroProveedorORD_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORD_PAGO'
    end
  end
  object xTotalRecibos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT SUM(BASES) as Base, SUM(liquido) as liquido FROM EMP_CART' +
        'ERA EC '
      'JOIN EMP_CARTERA_DETALLE ECD '
      'ON (EC.ID_CARTERA = ECD.ID_CARTERA) '
      'WHERE '
      'EC.EMPRESA = ?EMPRESA AND '
      'EC.EJERCICIO <= ?EJERCICIO AND '
      'EC.CANAL = ?CANAL AND '
      'EC.COD_CLI_PRO = ?COD_CLI_PRO AND '
      'SIGNO = ?SIGNO AND '
      'ECD.PAGADO = 0 AND '
      'ECD.RECIBIDO = 0 AND '
      'ECD.REMESA = 0 AND '
      'ECD.VISIBLE = 1')
    UniDirectional = False
    Left = 64
    Top = 200
    object xTotalRecibosBASE: TFloatField
      DisplayLabel = 'Base'
      FieldName = 'BASE'
    end
    object xTotalRecibosLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
  end
  object DSxTotalRecibos: TDataSource
    DataSet = xTotalRecibos
    Left = 208
    Top = 200
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 208
    Top = 8
  end
  object xRecibosCobroCliente: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT EC.EMPRESA,EC.EJERCICIO,EC.CANAL,EC.ID_CARTERA, ECD.ID_CA' +
        'RTERA_DETALLE,'
      
        '       REGISTRO,FECHA_REGISTRO,VENCIMIENTO,CUENTA,DOC_NUMERO,DOC' +
        '_SERIE, DOC_TIPO,'
      
        '       BASES,LIQUIDO,MONEDA, TIPO_EFECTO,REMESA,CONFIRMING,ORD_P' +
        'AGO,ECD.RESPONSABLE,'
      
        '       ECD.CARTA1, ECD.CARTA2, ECD.CARTA3, ECD.CARTA4, ECD.CARTA' +
        '5,T.NOMBRE_R_SOCIAL'
      'FROM EMP_CARTERA EC '
      'JOIN EMP_CARTERA_DETALLE ECD'
      'ON (EC.ID_CARTERA = ECD.ID_CARTERA)'
      'LEFT JOIN OPE_EMPLEADO E'
      'ON (ECD.EMPRESA=E.EMPRESA AND ECD.RESPONSABLE=E.EMPLEADO)'
      'LEFT JOIN SYS_TERCEROS T'
      'ON (E.TERCERO=T.TERCERO)'
      'WHERE '
      'ECD.ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE')
    SelectSQL.Strings = (
      
        'SELECT EC.EMPRESA,EC.EJERCICIO,EC.CANAL,EC.ID_CARTERA, ECD.ID_CA' +
        'RTERA_DETALLE,'
      
        '       REGISTRO,FECHA_REGISTRO,VENCIMIENTO,CUENTA,DOC_NUMERO,DOC' +
        '_SERIE, DOC_TIPO,'
      
        '       BASES,LIQUIDO,MONEDA, TIPO_EFECTO,REMESA,CONFIRMING,ORD_P' +
        'AGO,ECD.RESPONSABLE,'
      
        '       ECD.CARTA1, ECD.CARTA2, ECD.CARTA3, ECD.CARTA4, ECD.CARTA' +
        '5,T.NOMBRE_R_SOCIAL'
      'FROM EMP_CARTERA EC'
      'JOIN EMP_CARTERA_DETALLE ECD'
      'ON (EC.ID_CARTERA = ECD.ID_CARTERA)'
      'LEFT JOIN OPE_EMPLEADO E'
      'ON (ECD.EMPRESA=E.EMPRESA AND ECD.RESPONSABLE=E.EMPLEADO)'
      'LEFT JOIN SYS_TERCEROS T'
      'ON (E.TERCERO=T.TERCERO)'
      'WHERE '
      'ECD.EMPRESA = ?EMPRESA AND'
      'ECD.EJERCICIO <= ?EJERCICIO AND'
      'ECD.CANAL = ?CANAL AND'
      'EC.COD_CLI_PRO = ?COD_CLI_PRO AND '
      'ECD.SIGNO = '#39'C'#39' AND ECD.PAGADO = 0 AND'
      'ECD.RECIBIDO = 0 AND'
      'ECD.REMESA = 0 AND '
      'ECD.VISIBLE = 1')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CARTERA_DETALLE '
      'SET'
      'RESPONSABLE = ?RESPONSABLE,'
      'CARTA1 = ?CARTA1,'
      'CARTA2 = ?CARTA2,'
      'CARTA3 = ?CARTA3,'
      'CARTA4 = ?CARTA4,'
      'CARTA5 = ?CARTA5'
      'WHERE '
      'ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE')
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE'#13)
    AccionesInhibidas = [Borrar, Insertar]
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 104
    object xRecibosCobroClienteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRecibosCobroClienteEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xRecibosCobroClienteCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xRecibosCobroClienteID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xRecibosCobroClienteID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Det. Cart.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xRecibosCobroClienteREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xRecibosCobroClienteFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fecha Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xRecibosCobroClienteVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xRecibosCobroClienteCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xRecibosCobroClienteDOC_NUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xRecibosCobroClienteDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xRecibosCobroClienteDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xRecibosCobroClienteBASES: TFloatField
      DisplayLabel = 'Bases'
      FieldName = 'BASES'
    end
    object xRecibosCobroClienteLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xRecibosCobroClienteMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xRecibosCobroClienteTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xRecibosCobroClienteREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xRecibosCobroClienteCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xRecibosCobroClienteORD_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORD_PAGO'
    end
    object xRecibosCobroClienteRESPONSABLE: TIntegerField
      DisplayLabel = 'Resp.'
      FieldName = 'RESPONSABLE'
    end
    object xRecibosCobroClienteCARTA1: TIntegerField
      DisplayLabel = 'Carta 1'
      FieldName = 'CARTA1'
    end
    object xRecibosCobroClienteCARTA2: TIntegerField
      DisplayLabel = 'Carta 2'
      FieldName = 'CARTA2'
    end
    object xRecibosCobroClienteCARTA3: TIntegerField
      DisplayLabel = 'Carta 3'
      FieldName = 'CARTA3'
    end
    object xRecibosCobroClienteCARTA4: TIntegerField
      DisplayLabel = 'Carta 4'
      FieldName = 'CARTA4'
    end
    object xRecibosCobroClienteCARTA5: TIntegerField
      DisplayLabel = 'Carta 5'
      FieldName = 'CARTA5'
    end
    object xRecibosCobroClienteNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object xIncidencias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_INCIDENCIAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  INCIDENCIA=?old_INCIDENCIA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_INCIDENCIAS'
      
        '  (FECHA,FECHA_RECEPCION,DATOS_INCIDENCIA,FECHA_RESPUESTA,RESPUE' +
        'STA_INCIDENCIA,INCIDENCIA,COD_CLI_PRO,TERCERO,ID_S,ID_E,DOC_SERI' +
        'E,DOC_RIG,ENTRADA,AGENTE,CONTACTO,EMPRESA,TITULO_INCIDENCIA,TITU' +
        'LO_TERCERO,DOC_EJERCICIO,DOC_CANAL,DIRECCION,DIR_NOMBRE,TIT_AGEN' +
        'TE,TIT_TIPO_INCIDENCIA_KRI,USUARIO,TIPO_TERCERO,DOC_TIPO,TIPO_IN' +
        'CIDENCIA_KRI,NOMBRE_USUARIO)'
      'VALUES'
      
        '  (?FECHA,?FECHA_RECEPCION,?DATOS_INCIDENCIA,?FECHA_RESPUESTA,?R' +
        'ESPUESTA_INCIDENCIA,?INCIDENCIA,?COD_CLI_PRO,?TERCERO,?ID_S,?ID_' +
        'E,?DOC_SERIE,?DOC_RIG,?ENTRADA,?AGENTE,?CONTACTO,?EMPRESA,?TITUL' +
        'O_INCIDENCIA,?TITULO_TERCERO,?DOC_EJERCICIO,?DOC_CANAL,?DIRECCIO' +
        'N,?DIR_NOMBRE,?TIT_AGENTE,?TIT_TIPO_INCIDENCIA_KRI,?USUARIO,?TIP' +
        'O_TERCERO,?DOC_TIPO,?TIPO_INCIDENCIA_KRI,?NOMBRE_USUARIO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_INCIDENCIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  INCIDENCIA=?INCIDENCIA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_INCIDENCIAS'
      'WHERE '
      'EMPRESA = ?EMPRESA AND '
      'COD_CLI_PRO = ?COD_CLI_PRO AND '
      'TIPO_TERCERO = '#39'CLI'#39' ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_INCIDENCIAS'
      'SET'
      '  FECHA=?FECHA '
      '  ,FECHA_RECEPCION=?FECHA_RECEPCION '
      '  ,DATOS_INCIDENCIA=?DATOS_INCIDENCIA '
      '  ,FECHA_RESPUESTA=?FECHA_RESPUESTA '
      '  ,RESPUESTA_INCIDENCIA=?RESPUESTA_INCIDENCIA '
      '  ,COD_CLI_PRO=?COD_CLI_PRO '
      '  ,TERCERO=?TERCERO '
      '  ,ID_S=?ID_S '
      '  ,ID_E=?ID_E '
      '  ,DOC_SERIE=?DOC_SERIE '
      '  ,DOC_RIG=?DOC_RIG '
      '  ,ENTRADA=?ENTRADA '
      '  ,AGENTE=?AGENTE '
      '  ,CONTACTO=?CONTACTO '
      '  ,TITULO_INCIDENCIA=?TITULO_INCIDENCIA '
      '  ,TITULO_TERCERO=?TITULO_TERCERO '
      '  ,DOC_EJERCICIO=?DOC_EJERCICIO '
      '  ,DOC_CANAL=?DOC_CANAL '
      '  ,DIRECCION=?DIRECCION '
      '  ,DIR_NOMBRE=?DIR_NOMBRE '
      '  ,TIT_AGENTE=?TIT_AGENTE '
      '  ,TIT_TIPO_INCIDENCIA_KRI=?TIT_TIPO_INCIDENCIA_KRI '
      '  ,USUARIO=?USUARIO '
      '  ,TIPO_TERCERO=?TIPO_TERCERO '
      '  ,DOC_TIPO=?DOC_TIPO '
      '  ,TIPO_INCIDENCIA_KRI=?TIPO_INCIDENCIA_KRI '
      '  ,NOMBRE_USUARIO=?NOMBRE_USUARIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  INCIDENCIA=?INCIDENCIA ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'INCIDENCIA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_INCIDENCIAS'
    UpdateTransaction = TLocal
    Left = 64
    Top = 248
    object xIncidenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xIncidenciasINCIDENCIA: TIntegerField
      DisplayLabel = 'Incidencia'
      FieldName = 'INCIDENCIA'
    end
    object xIncidenciasTITULO_INCIDENCIA: TFIBStringField
      DisplayLabel = 'Tit. Incidencia'
      FieldName = 'TITULO_INCIDENCIA'
      Size = 60
    end
    object xIncidenciasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xIncidenciasFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recep.'
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
      DisplayLabel = 'Titulo Ter.'
      FieldName = 'TITULO_TERCERO'
      Size = 60
    end
    object xIncidenciasDATOS_INCIDENCIA: TBlobField
      DisplayLabel = 'Datos Inc.'
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
      DisplayLabel = 'Ejerc. Doc.'
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
      DisplayLabel = 'N. Dir.'
      FieldName = 'DIRECCION'
    end
    object xIncidenciasDIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Direcci'#243'n.'
      FieldName = 'DIR_NOMBRE'
      Size = 76
    end
    object xIncidenciasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xIncidenciasCONTACTO: TIntegerField
      DisplayLabel = 'Contacto'
      FieldName = 'CONTACTO'
    end
    object xIncidenciasTIT_CONTACTO: TFIBStringField
      DisplayLabel = 'Tit. Contacto'
      FieldName = 'TIT_CONTACTO'
      Size = 81
    end
    object xIncidenciasTIT_AGENTE: TFIBStringField
      DisplayLabel = 'Tit. Agente'
      FieldName = 'TIT_AGENTE'
      Size = 60
    end
    object xIncidenciasTIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tipo Inc.'
      FieldName = 'TIPO_INCIDENCIA_KRI'
      Size = 3
    end
    object xIncidenciasTIT_TIPO_INCIDENCIA_KRI: TFIBStringField
      DisplayLabel = 'Tit. Tipo Inc.'
      FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
      Size = 40
    end
    object xIncidenciasUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xIncidenciasNOMBRE_USUARIO: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_USUARIO'
      Size = 31
    end
  end
  object SMTP: TIdSMTP
    SASLMechanisms = <>
    Left = 368
    Top = 56
  end
  object Mail: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 368
    Top = 8
  end
  object xMailResponsablesEnviados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT RESPONSABLE, ID_CARTERA_DETALLE FROM  TMP_ENVIA_MAIL_RESP'
      'ORDER BY'
      'RESPONSABLE ')
    UniDirectional = False
    Left = 64
    Top = 296
    object xMailResponsablesEnviadosID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'ID Cart. Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xMailResponsablesEnviadosRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
  end
  object DSMailResponsablesEnviados: TDataSource
    DataSet = xMailResponsablesEnviados
    Left = 208
    Top = 296
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 368
    Top = 104
  end
  object xCartas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CARTERA_CARTAS'
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CARTERA_CARTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SIGNO = '#39'C'#39' AND'
      'VISIBLE = 1 AND'
      'PAGADO = 0 AND'
      'REMESA < 1 AND'
      'CONFIRMING = 0 AND'
      'DOCUMENTO = '#39#39' AND'
      'ORD_PAGO = 0'
      'ORDER BY VENCIMIENTO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CARTERA_CARTAS'
      'SET'
      '  PAGO_AUTORIZADO=?PAGO_AUTORIZADO '
      'WHERE'
      '  ID_CARTERA_DETALLE=?ID_CARTERA_DETALLE ')
    ClavesPrimarias.Strings = (
      'ID_CARTERA_DETALLE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CARTERA_CARTAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 344
    object xCartasID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xCartasID_CARTERA_DETALLE: TIntegerField
      DisplayLabel = 'Id Cartera Det.'
      FieldName = 'ID_CARTERA_DETALLE'
    end
    object xCartasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xCartasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xCartasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xCartasSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xCartasREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xCartasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCartasCTA_PAGO: TFIBStringField
      DisplayLabel = 'Cta. Pago'
      FieldName = 'CTA_PAGO'
      Size = 15
    end
    object xCartasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xCartasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xCartasDOC_NUMERO: TIntegerField
      DisplayLabel = 'Numero Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xCartasDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xCartasFORMA_PAGO: TFIBStringField
      DisplayLabel = 'Forma Pago'
      FieldName = 'FORMA_PAGO'
      Size = 3
    end
    object xCartasID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      DisplayWidth = 10
      FieldName = 'ID_DOC'
    end
    object xCartasNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xCartasNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xCartasVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xCartasLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xCartasTIPO_EFECTO: TFIBStringField
      DisplayLabel = 'Tipo Efecto'
      FieldName = 'TIPO_EFECTO'
      Size = 3
    end
    object xCartasBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xCartasRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xCartasCARTA1: TIntegerField
      DisplayLabel = 'Carta 1'
      FieldName = 'CARTA1'
    end
    object xCartasCARTA2: TIntegerField
      DisplayLabel = 'Carta 2'
      FieldName = 'CARTA2'
    end
    object xCartasCARTA3: TIntegerField
      DisplayLabel = 'Carta 3'
      FieldName = 'CARTA3'
    end
    object xCartasCARTA4: TIntegerField
      DisplayLabel = 'Carta 4'
      FieldName = 'CARTA4'
    end
    object xCartasCARTA5: TIntegerField
      DisplayLabel = 'Carta 5'
      FieldName = 'CARTA5'
    end
    object xCartasOBSERVACIONES: TFIBStringField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES'
      Size = 100
    end
    object xCartasLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object xCartasFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xCartasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCartasCOD_CLI_PRO: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'COD_CLI_PRO'
    end
    object xCartasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xCartasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xCartasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xCartasTELEFONO01: TFIBStringField
      DisplayLabel = 'Telefono 1'
      FieldName = 'TELEFONO01'
    end
    object xCartasTELEFONO02: TFIBStringField
      DisplayLabel = 'Telefono 2'
      FieldName = 'TELEFONO02'
    end
    object xCartasTELEFAX: TFIBStringField
      DisplayLabel = 'Telefax'
      FieldName = 'TELEFAX'
    end
    object xCartasEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xCartasORIGEN_IMPAGADO: TIntegerField
      DisplayLabel = 'Origen Impag.'
      FieldName = 'ORIGEN_IMPAGADO'
    end
    object xCartasTEXTO: TFIBStringField
      DisplayLabel = 'Desc. Cartera'
      FieldName = 'TEXTO'
      Size = 60
    end
    object xCartasVISIBLE: TIntegerField
      DisplayLabel = 'Visible'
      FieldName = 'VISIBLE'
    end
    object xCartasPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xCartasREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xCartasCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xCartasDOCUMENTO: TFIBStringField
      DisplayLabel = 'Doc. Pago'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xCartasORD_PAGO: TIntegerField
      DisplayLabel = 'Ord. Pago'
      FieldName = 'ORD_PAGO'
    end
    object xCartasSU_DOCUMENTO: TFIBStringField
      DisplayLabel = 'Su Documento'
      FieldName = 'SU_DOCUMENTO'
      Size = 40
    end
    object xCartasRECIBIDO: TIntegerField
      DisplayLabel = 'Recibido'
      FieldName = 'RECIBIDO'
    end
    object xCartasFOLIO: TFIBStringField
      DisplayLabel = 'Folio'
      FieldName = 'FOLIO'
      Size = 40
    end
    object xCartasPAGO_AUTORIZADO: TIntegerField
      DisplayLabel = 'Pago Autorizado'
      FieldName = 'PAGO_AUTORIZADO'
    end
  end
  object DSxCartas: TDataSource
    DataSet = xCartas
    Left = 208
    Top = 344
  end
  object xTotal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT SUM(LIQUIDO) AS TOTAL FROM VER_CARTERA_CARTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'SIGNO = '#39'C'#39' AND'
      'VISIBLE = 1 AND'
      'PAGADO = 0 AND'
      'REMESA < 1 AND'
      'CONFIRMING = 0 AND'
      'DOCUMENTO = '#39#39' AND'
      'ORD_PAGO = 0')
    UniDirectional = False
    Left = 64
    Top = 392
    object xTotalTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object DSxTotal: TDataSource
    DataSet = xTotal
    Left = 208
    Top = 392
  end
  object xCarteraDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_DETALLE'
      'WHERE '
      ' FECHA_CIERRE >= ?F1  AND  FECHA_CIERRE <= ?F2')
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      '-- Recibos no agrupados, pagados, no remesados'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      
        '       , cast(0 as integer) id_cartera_agrup, cast('#39#39' as varchar' +
        '(100)) agrupacion,'
      '      case'
      '          when (f.agente is null) then'
      '               cl.agente'
      '          else f.agente'
      '          end as agente,'
      '          cl.ruta  as ruta'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      
        'left join con_cuentas cc on c.empresa = cc.empresa and c.ejercic' +
        'io = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuent' +
        'a'
      
        'left join con_cuentas_asientos a on c.empresa = a.empresa and c.' +
        'canal = a.canal and d.ric = a.ric and a.ejercicio = (select ejer' +
        'cicio'
      
        '                                                                ' +
        '                                                     from e_pron' +
        'ostica_ejercicio(c.empresa, d.fecha_cierre))'
      'left join ges_cabeceras_s f on c.id_doc = f.id_s'
      
        'left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cl' +
        'i_pro = cl.cliente'
      'where'
      'c.empresa = :empresa and'
      'c.ejercicio = :ejercicio and'
      'c.canal = :canal and'
      'c.signo = '#39'C'#39' and'
      'c.doc_tipo in ('#39'AFC'#39', '#39'FAC'#39', '#39'NRC'#39') and'
      'x.id_cartera_detalle is null and'
      'd.id_cartera_detalle is not null and'
      'd.documento = '#39#39' and'
      'd.remesa <= 0 and'
      'd.pagado = 1 and'
      'd.visible = 1'
      '-- and c.cuenta = '#39'430002603'#39
      ''
      'union'
      ''
      '-- Recibos no agrupados, pagados, remesados'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      
        '       , cast(0 as integer) id_cartera_agrup, cast('#39#39' as varchar' +
        '(100)) agrupacion,'
      '      case'
      '          when (f.agente is null) then'
      '               cl.agente'
      '          else f.agente'
      '          end as agente,'
      '          cl.ruta  as ruta'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      
        'left join con_cuentas cc on c.empresa = cc.empresa and c.ejercic' +
        'io = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuent' +
        'a'
      
        'join emp_cartera_remesas r on d.empresa = r.empresa and d.ejerci' +
        'cio_remesa = r.ejercicio and d.canal = r.canal and d.remesa = r.' +
        'remesa'
      
        'left join con_cuentas_asientos a on r.empresa = a.empresa and r.' +
        'canal = a.canal and r.ric_abono = a.ric and d.ejercicio_abono = ' +
        'a.ejercicio'
      'left join ges_cabeceras_s f on c.id_doc = f.id_s'
      
        'left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cl' +
        'i_pro = cl.cliente'
      'where'
      'c.empresa = :empresa and'
      'c.ejercicio = :ejercicio and'
      'c.canal = :canal and'
      'c.signo = '#39'C'#39' and'
      'c.doc_tipo in ('#39'AFC'#39', '#39'FAC'#39', '#39'NRC'#39') and'
      'x.id_cartera_detalle is null and'
      'd.id_cartera_detalle is not null and'
      'd.documento = '#39#39' and'
      'd.remesa > 0 and'
      'd.visible = 1'
      '-- and c.cuenta = '#39'430002603'#39
      '--'
      ''
      'union'
      ''
      '-- Recibos agrupados, pagados, no remesados'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      '       , x.id_cartera_rec id_cartera_agrup,'
      
        '       cast('#39'REG. '#39' || x.signo || '#39'-'#39' || x.ejercicio || '#39'-'#39' || x' +
        '.registro as varchar(100)) agrupacion,'
      '      case'
      '          when (f.agente is null) then'
      '               cl.agente'
      '          else f.agente'
      '          end as agente,'
      '          cl.ruta  as ruta'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera = x.id_cartera' +
        '_rec'
      'left join emp_cartera cx on x.id_cartera = cx.id_cartera'
      
        'left join emp_cartera_detalle dx on cx.id_cartera = dx.id_carter' +
        'a'
      
        'left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejerc' +
        'icio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.c' +
        'uenta'
      
        'left join con_cuentas_asientos a on cx.empresa = a.empresa and c' +
        'x.canal = a.canal and dx.ric = a.ric and a.ejercicio = (select e' +
        'jercicio'
      
        '                                                                ' +
        '                                                        from e_p' +
        'ronostica_ejercicio(cx.empresa, dx.fecha_cierre))'
      'left join ges_cabeceras_s f on c.id_doc = f.id_s'
      
        'left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cl' +
        'i_pro = cl.cliente'
      'where'
      'c.empresa = :empresa and'
      'c.ejercicio = :ejercicio and'
      'c.canal = :canal and'
      'c.signo = '#39'C'#39' and'
      'c.doc_tipo in ('#39'AFC'#39', '#39'FAC'#39', '#39'NRC'#39') and'
      'x.id_cartera_detalle is not null and'
      'd.id_cartera_detalle is not null and'
      'dx.documento = '#39#39' and'
      'dx.remesa <= 0 and'
      'dx.pagado = 1 and'
      'd.visible = 0'
      '--and c.cuenta = '#39'430000003'#39
      ''
      'union'
      ''
      '-- Recibos agrupados, pagados, remesados'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.remesa, d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      '       , x.id_cartera_rec id_cartera_agrup,'
      
        '       cast('#39'REG. '#39' || x.signo || '#39'-'#39' || x.ejercicio || '#39'-'#39' || x' +
        '.registro as varchar(100)) agrupacion,'
      '      case'
      '          when (f.agente is null) then'
      '               cl.agente'
      '          else f.agente'
      '          end as agente,'
      '          cl.ruta  as ruta'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera = x.id_cartera' +
        '_rec'
      'left join emp_cartera cx on x.id_cartera = cx.id_cartera'
      
        'left join emp_cartera_detalle dx on cx.id_cartera = dx.id_carter' +
        'a'
      
        'left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejerc' +
        'icio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.c' +
        'uenta'
      
        'join emp_cartera_remesas r on dx.empresa = r.empresa and dx.ejer' +
        'cicio_remesa = r.ejercicio and dx.canal = r.canal and dx.remesa ' +
        '= r.remesa'
      
        'left join con_cuentas_asientos a on r.empresa = a.empresa and r.' +
        'canal = a.canal and r.ric_abono = a.ric and dx.ejercicio_abono =' +
        ' a.ejercicio'
      'left join ges_cabeceras_s f on c.id_doc = f.id_s'
      
        'left join emp_clientes cl on c.empresa = cl.empresa and c.cod_cl' +
        'i_pro = cl.cliente'
      'where'
      'c.empresa = :empresa and'
      'c.ejercicio = :ejercicio and'
      'c.canal = :canal and'
      'c.signo = '#39'C'#39' and'
      'c.doc_tipo in ('#39'AFC'#39', '#39'FAC'#39', '#39'NRC'#39') and'
      'x.id_cartera_detalle is not null and'
      'd.id_cartera_detalle is not null and'
      'dx.documento = '#39#39' and'
      'dx.remesa > 0 and'
      'dx.pagado = 1 and'
      'd.visible = 0'
      '--and c.cuenta = '#39'430000003'#39
      '--'
      'order by 8')
    UniDirectional = False
    Left = 64
    Top = 440
    object xCarteraDetalleID_CARTERA: TIntegerField
      DisplayLabel = 'Id Cartera'
      FieldName = 'ID_CARTERA'
    end
    object xCarteraDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejer.'
      FieldName = 'EJERCICIO'
    end
    object xCarteraDetalleREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xCarteraDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xCarteraDetalleCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xCarteraDetalleTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 150
    end
    object xCarteraDetalleVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venciminento'
      FieldName = 'VENCIMIENTO'
    end
    object xCarteraDetalleFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fec. Pago'
      FieldName = 'FECHA_PAGO'
    end
    object xCarteraDetalleDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fec. Documento'
      FieldName = 'DOC_FECHA'
    end
    object xCarteraDetalleDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xCarteraDetalleDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xCarteraDetalleDOC_NUMERO: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'DOC_NUMERO'
    end
    object xCarteraDetallePAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xCarteraDetalleDOCUMENTO: TFIBStringField
      DisplayLabel = 'Tal./Pag.'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xCarteraDetalleREMESA: TIntegerField
      DisplayLabel = 'Remesa'
      FieldName = 'REMESA'
    end
    object xCarteraDetalleFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fec. Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xCarteraDetalleID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object xCarteraDetalleLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xCarteraDetalleID_CARTERA_AGRUP: TIntegerField
      DisplayLabel = 'Id Cart. Agrup'
      FieldName = 'ID_CARTERA_AGRUP'
    end
    object xCarteraDetalleAGRUPACION: TFIBStringField
      DisplayLabel = 'Reg. Agrup.'
      FieldName = 'AGRUPACION'
      Size = 100
    end
    object xCarteraDetalleAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xCarteraDetalleRUTA: TIntegerField
      DisplayLabel = 'Ruta'
      FieldName = 'RUTA'
    end
  end
  object DSxCarteraDetalle: TDataSource
    DataSet = xCarteraDetalle
    Left = 208
    Top = 440
  end
  object xTotalCarteraDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    UniDirectional = False
    Left = 64
    Top = 496
    object xTotalCarteraDetalleTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object DSxTotalCarteraDetalle: TDataSource
    DataSet = xTotalCarteraDetalle
    Left = 208
    Top = 496
  end
  object xPagados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT * FROM EMP_CARTERA_DETALLE'
      'WHERE '
      ' FECHA_CIERRE >= ?F1  AND  FECHA_CIERRE <= ?F2')
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      ''
      '-- Recibos no agrupados, pagados, no confirming, no ord_pago'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.confirming, d.ord_pago,'
      '       d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      
        '       , cast(0 as integer) id_cartera_agrup, cast('#39#39' as varchar' +
        '(100)) agrupacion'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      
        'left join con_cuentas cc on c.empresa = cc.empresa and c.ejercic' +
        'io = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuent' +
        'a'
      
        'left join con_cuentas_asientos a on c.empresa = a.empresa and c.' +
        'canal = a.canal and d.ric = a.ric and a.ejercicio = (select ejer' +
        'cicio'
      
        '                                                                ' +
        '                                                     from e_pron' +
        'ostica_ejercicio(c.empresa, d.fecha_cierre))'
      'where'
      'c.empresa = 1 and'
      'c.ejercicio = 2024 and'
      'c.canal = 1 and'
      'c.signo = '#39'P'#39' and'
      'c.doc_tipo in ('#39'AFA'#39', '#39'AFP'#39', '#39'FCR'#39', '#39'FAP'#39', '#39'NRA'#39', '#39'NRP'#39') and'
      'x.id_cartera_detalle is null and'
      'd.id_cartera_detalle is not null and'
      'd.confirming = 0 and'
      'd.ord_pago = 0 and'
      'd.pagado = 1 and'
      'd.visible = 1'
      '-- and c.cuenta = '#39'400000132'#39
      ''
      'union'
      ''
      '-- Recibos no agrupados, pagados, confirming, no ord_pago'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.confirming, d.ord_pago,'
      '       d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      
        '       , cast(0 as integer) id_cartera_agrup, cast('#39#39' as varchar' +
        '(100)) agrupacion'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      
        'left join con_cuentas cc on c.empresa = cc.empresa and c.ejercic' +
        'io = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuent' +
        'a'
      
        'left join emp_cartera_confirming co on d.empresa = co.empresa an' +
        'd d.ejercicio_confirming = co.ejercicio and d.canal = c.canal an' +
        'd d.signo = co.signo and d.confirming = co.num_confirming'
      
        'left join emp_cartera_conf_descontado des on d.id_cartera_detall' +
        'e = des.id_cartera_detalle'
      
        'left join con_cuentas_asientos a on des.empresa = a.empresa and ' +
        'des.canal = a.canal and des.ric_descuento = a.ric and a.ejercici' +
        'o = des.ejercicio_ric_descuento'
      'where'
      'c.empresa = 1 and'
      'c.ejercicio = 2024 and'
      'c.canal = 1 and'
      'c.signo = '#39'P'#39' and'
      'c.doc_tipo in ('#39'AFA'#39', '#39'AFP'#39', '#39'FCR'#39', '#39'FAP'#39', '#39'NRA'#39', '#39'NRP'#39') and'
      'x.id_cartera_detalle is null and'
      'd.id_cartera_detalle is not null and'
      'd.confirming > 0 and'
      'd.ord_pago = 0 and'
      'd.pagado = 1 and'
      'd.visible = 1'
      '-- and c.cuenta = '#39'400000132'#39
      ''
      'union'
      ''
      '-- Recibos no agrupados, pagados, no confirming, ord_pago'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.confirming, d.ord_pago,'
      '       d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      
        '       , cast(0 as integer) id_cartera_agrup, cast('#39#39' as varchar' +
        '(100)) agrupacion'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      
        'left join con_cuentas cc on c.empresa = cc.empresa and c.ejercic' +
        'io = cc.ejercicio and c.canal = cc.canal and c.cuenta = cc.cuent' +
        'a'
      
        'left join emp_cartera_ord_pago o on d.empresa = o.empresa and d.' +
        'ejercicio_ord_pago = o.ejercicio and d.canal = c.canal and d.sig' +
        'no = o.signo and d.ord_pago = o.num_orden'
      
        'left join con_cuentas_asientos a on o.empresa = a.empresa and o.' +
        'canal = a.canal and o.ric = a.ric and a.ejercicio = o.ejercicio'
      'where'
      'c.empresa = 1 and'
      'c.ejercicio = 2024 and'
      'c.canal = 1 and'
      'c.signo = '#39'P'#39' and'
      'c.doc_tipo in ('#39'AFA'#39', '#39'AFP'#39', '#39'FCR'#39', '#39'FAP'#39', '#39'NRA'#39', '#39'NRP'#39') and'
      'x.id_cartera_detalle is null and'
      'd.id_cartera_detalle is not null and'
      'd.confirming = 0 and'
      'd.ord_pago > 0 and'
      'd.pagado = 1 and'
      'd.visible = 1'
      '-- and c.cuenta = '#39'400000132'#39
      ''
      'union'
      ''
      '-- Recibos agrupados, pagados, no confirming, no ord_pago'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.confirming, d.ord_pago,'
      '       d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      '       , x.id_cartera id_cartera_agrup,'
      
        '       cast('#39'REG. '#39' || x.signo || '#39'-'#39' || x.ejercicio || '#39'-'#39' || x' +
        '.registro as varchar(100)) agrupacion'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      'left join emp_cartera cx on x.id_cartera = cx.id_cartera'
      
        'left join emp_cartera_detalle dx on cx.id_cartera = dx.id_carter' +
        'a'
      
        'left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejerc' +
        'icio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.c' +
        'uenta'
      
        'left join con_cuentas_asientos a on cx.empresa = a.empresa and c' +
        'x.canal = a.canal and dx.ric = a.ric and a.ejercicio = (select e' +
        'jercicio'
      
        '                                                                ' +
        '                                                        from e_p' +
        'ronostica_ejercicio(cx.empresa, dx.fecha_cierre))'
      'where'
      'c.empresa = 1 and'
      'c.ejercicio = 2024 and'
      'c.canal = 1 and'
      'c.signo = '#39'P'#39' and'
      'c.doc_tipo in ('#39'AFA'#39', '#39'AFP'#39', '#39'FCR'#39', '#39'FAP'#39', '#39'NRA'#39', '#39'NRP'#39') and'
      'x.id_cartera_detalle is not null and'
      'd.id_cartera_detalle is not null and'
      'dx.confirming = 0 and'
      'dx.ord_pago = 0 and'
      'dx.pagado = 1 and'
      'd.visible = 0'
      '-- and c.cuenta = '#39'400000017'#39
      ''
      'union'
      ''
      '-- Recibos agrupados, pagados, confirming, no ord_pago'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.confirming, d.ord_pago,'
      '       d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      '       , x.id_cartera id_cartera_agrup,'
      
        '       cast('#39'REG. '#39' || x.signo || '#39'-'#39' || x.ejercicio || '#39'-'#39' || x' +
        '.registro as varchar(100)) agrupacion'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      'left join emp_cartera cx on x.id_cartera = cx.id_cartera'
      
        'left join emp_cartera_detalle dx on cx.id_cartera = dx.id_carter' +
        'a'
      
        'left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejerc' +
        'icio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.c' +
        'uenta'
      
        'left join emp_cartera_confirming co on dx.empresa = co.empresa a' +
        'nd dx.ejercicio_confirming = co.ejercicio and dx.canal = c.canal' +
        ' and dx.signo = co.signo and dx.confirming = co.num_confirming'
      
        'left join emp_cartera_conf_descontado des on dx.id_cartera_detal' +
        'le = des.id_cartera_detalle'
      
        'left join con_cuentas_asientos a on des.empresa = a.empresa and ' +
        'des.canal = a.canal and des.ric_descuento = a.ric and a.ejercici' +
        'o = des.ejercicio_ric_descuento'
      'where'
      'c.empresa = 1 and'
      'c.ejercicio = 2024 and'
      'c.canal = 1 and'
      'c.signo = '#39'P'#39' and'
      'c.doc_tipo in ('#39'AFA'#39', '#39'AFP'#39', '#39'FCR'#39', '#39'FAP'#39', '#39'NRA'#39', '#39'NRP'#39') and'
      'x.id_cartera_detalle is not null and'
      'd.id_cartera_detalle is not null and'
      'dx.confirming > 0 and'
      'dx.ord_pago = 0 and'
      'dx.pagado = 1 and'
      'd.visible = 0'
      '-- and c.cuenta = '#39'400000017'#39
      ''
      'union'
      ''
      '-- Recibos agrupados, pagados, no confirming, ord_pago'
      
        'select c.id_cartera, c.ejercicio, c.registro, d.linea, c.cuenta,' +
        ' cc.titulo, d.vencimiento, a.fecha fecha_pago,'
      
        '       c.doc_fecha, c.doc_tipo, c.doc_serie, c.doc_numero, d.pag' +
        'ado, d.documento, d.confirming, d.ord_pago,'
      '       d.fecha_cierre, c.id_doc, d.liquido'
      '       --'
      '       , x.id_cartera id_cartera_agrup,'
      
        '       cast('#39'REG. '#39' || x.signo || '#39'-'#39' || x.ejercicio || '#39'-'#39' || x' +
        '.registro as varchar(100)) agrupacion'
      'from emp_cartera c'
      'left join emp_cartera_detalle d on c.id_cartera = d.id_cartera'
      
        'left join emp_cartera_documento x on d.id_cartera_detalle = x.id' +
        '_cartera_detalle'
      'left join emp_cartera cx on x.id_cartera = cx.id_cartera'
      
        'left join emp_cartera_detalle dx on cx.id_cartera = dx.id_carter' +
        'a'
      
        'left join con_cuentas cc on cx.empresa = cc.empresa and cx.ejerc' +
        'icio = cc.ejercicio and cx.canal = cc.canal and cx.cuenta = cc.c' +
        'uenta'
      
        'left join emp_cartera_ord_pago o on dx.empresa = o.empresa and d' +
        'x.ejercicio_ord_pago = o.ejercicio and dx.canal = c.canal and dx' +
        '.signo = o.signo and dx.ord_pago = o.num_orden'
      
        'left join con_cuentas_asientos a on o.empresa = a.empresa and o.' +
        'canal = a.canal and o.ric = a.ric and a.ejercicio = o.ejercicio'
      'where'
      'c.empresa = 1 and'
      'c.ejercicio = 2024 and'
      'c.canal = 1 and'
      'c.signo = '#39'P'#39' and'
      'c.doc_tipo in ('#39'AFA'#39', '#39'AFP'#39', '#39'FCR'#39', '#39'FAP'#39', '#39'NRA'#39', '#39'NRP'#39') and'
      'x.id_cartera_detalle is not null and'
      'd.id_cartera_detalle is not null and'
      'dx.confirming = 0 and'
      'dx.ord_pago > 0 and'
      'dx.pagado = 1 and'
      'd.visible = 0'
      '-- and c.cuenta = '#39'400000132'#39
      ''
      ''
      '')
    UniDirectional = False
    Left = 64
    Top = 550
    object xPagadosID_CARTERA: TIntegerField
      DisplayLabel = 'ID Cartera '
      FieldName = 'ID_CARTERA'
    end
    object xPagadosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPagadosREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xPagadosLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object xPagadosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xPagadosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 150
    end
    object xPagadosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Vencimiento'
      FieldName = 'VENCIMIENTO'
    end
    object xPagadosFECHA_PAGO: TDateTimeField
      DisplayLabel = 'Fecha Pago'
      FieldName = 'FECHA_PAGO'
    end
    object xPagadosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Documento'
      FieldName = 'DOC_FECHA'
    end
    object xPagadosDOC_TIPO: TFIBStringField
      DisplayLabel = 'Tipo Documento'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xPagadosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Serie Documento'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xPagadosDOC_NUMERO: TIntegerField
      DisplayLabel = 'N'#250'mero de Documento'
      FieldName = 'DOC_NUMERO'
    end
    object xPagadosPAGADO: TIntegerField
      DisplayLabel = 'Pagado'
      FieldName = 'PAGADO'
    end
    object xPagadosDOCUMENTO: TFIBStringField
      DisplayLabel = 'Documento'
      FieldName = 'DOCUMENTO'
      Size = 15
    end
    object xPagadosCONFIRMING: TIntegerField
      DisplayLabel = 'Confirming'
      FieldName = 'CONFIRMING'
    end
    object xPagadosORD_PAGO: TIntegerField
      DisplayLabel = 'Orden de Pago'
      FieldName = 'ORD_PAGO'
    end
    object xPagadosFECHA_CIERRE: TDateTimeField
      DisplayLabel = 'Fecha de Cierre'
      FieldName = 'FECHA_CIERRE'
    end
    object xPagadosID_DOC: TIntegerField
      DisplayLabel = 'ID de Documento'
      FieldName = 'ID_DOC'
    end
    object xPagadosLIQUIDO: TFloatField
      DisplayLabel = 'L'#237'quido'
      FieldName = 'LIQUIDO'
    end
    object xPagadosID_CARTERA_AGRUP: TIntegerField
      DisplayLabel = 'ID Cartera Agrupaci'#243'n'
      FieldName = 'ID_CARTERA_AGRUP'
    end
    object xPagadosAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      Size = 100
    end
  end
  object DSxPagados: TDataSource
    DataSet = xPagados
    Left = 208
    Top = 550
  end
  object xTotalPagados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1
    UniDirectional = False
    Left = 64
    Top = 606
    object FloatField2: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object DSxTotalPagados: TDataSource
    DataSet = xTotalPagados
    Left = 208
    Top = 606
  end
end
