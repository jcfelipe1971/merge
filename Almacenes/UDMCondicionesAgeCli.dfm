object DMCondicionesAgecli: TDMCondicionesAgecli
  OldCreateOrder = False
  OnCreate = DMCondicionescliCreate
  Left = 625
  Top = 231
  Height = 296
  Width = 458
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 301
    Top = 10
  end
  object DSxAgentes: TDataSource
    DataSet = xAgentes
    Left = 372
    Top = 175
  end
  object QMCondClientes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGE_CLI'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  CLIENTE=?old_CLIENTE ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGE_CLI'
      
        '  (AGENTE,CLIENTE,P_COMISION,EMPRESA,EJERCICIO,CANAL,TITULO_CLIE' +
        'NTE,ACTIVO,FECHA_ALTA)'
      'VALUES'
      
        '  (?AGENTE,?CLIENTE,?P_COMISION,?EMPRESA,?EJERCICIO,?CANAL,?TITU' +
        'LO_CLIENTE,?ACTIVO,?FECHA_ALTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGE_CLI'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  CLIENTE=?CLIENTE ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGE_CLI'
      'WHERE EMPRESA=?EMPRESA AND '
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               AGENTE=?AGENTE'
      'ORDER BY CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGE_CLI'
      'SET'
      '  P_COMISION=?P_COMISION '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,ACTIVO=?ACTIVO '
      '  ,FECHA_ALTA=?FECHA_ALTA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  CLIENTE=?CLIENTE ')
    DataSource = DSxAgentes
    AfterOpen = QMCondClientesAfterOpen
    BeforePost = QMCondClientesBeforePost
    OnNewRecord = QMCondClientesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL'
      'AGENTE'
      'CLIENTE')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGE_CLI'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 58
    object QMCondClientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondClientesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondClientesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondClientesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCondClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMCondClientesCLIENTEChange
    end
    object QMCondClientesTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondClientesP_COMISION: TFloatField
      DisplayLabel = '% Comisi'#243'n'
      FieldName = 'P_COMISION'
    end
    object QMCondClientesACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondClientesFECHA_ALTA: TDateTimeField
      DisplayLabel = 'Fec. Alta'
      FieldName = 'FECHA_ALTA'
    end
  end
  object DSQMCondClientes: TDataSource
    DataSet = QMCondClientes
    Left = 169
    Top = 60
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 370
    Top = 69
  end
  object QMCondAgrupacion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGE_AGRUP'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  AGRUPACION=?old_AGRUPACION ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGE_AGRUP'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENTE,AGRUPACION,TITULO_AGRUPACION,P' +
        '_COMISION,ACTIVO)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?AGRUPACION,?TITULO_AGRUPA' +
        'CION,?P_COMISION,?ACTIVO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGE_AGRUP'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGRUPACION=?AGRUPACION ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGE_AGRUP'
      'WHERE EMPRESA=?EMPRESA AND'
      '               EJERCICIO=?EJERCICIO AND '
      '               CANAL=?CANAL AND'
      '               AGENTE=?AGENTE'
      'ORDER BY AGRUPACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGE_AGRUP'
      'SET'
      '   P_COMISION=?P_COMISION '
      '  ,ACTIVO=?ACTIVO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGRUPACION=?AGRUPACION ')
    DataSource = DSxAgentes
    AfterOpen = QMCondAgrupacionAfterOpen
    BeforePost = QMCondAgrupacionBeforePost
    OnNewRecord = QMCondAgrupacionNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE '
      'AGRUPACION ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGE_AGRUP'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 113
    object QMCondAgrupacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondAgrupacionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondAgrupacionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondAgrupacionAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCondAgrupacionAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      OnChange = QMCondAgrupacionAGRUPACIONChange
      Size = 3
    end
    object QMCondAgrupacionTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
    end
    object QMCondAgrupacionP_COMISION: TFloatField
      DisplayLabel = '% Comisi'#243'n'
      FieldName = 'P_COMISION'
    end
    object QMCondAgrupacionACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object DSQMCondAgrupacion: TDataSource
    DataSet = QMCondAgrupacion
    Left = 169
    Top = 113
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 372
    Top = 126
  end
  object QControlaDuplicados: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select count(*) from ver_condiciones_age_cli'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      '           agente=?agente and cliente=?cliente ')
    Transaction = TLocal
    AutoTrans = True
    Left = 171
    Top = 165
  end
  object QControlaDuplicadosAg: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select count(*) from ver_condiciones_age_agrup'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      '           agente=?agente and agrupacion=?agrupacion')
    Transaction = TLocal
    AutoTrans = True
    Left = 58
    Top = 165
  end
  object xAgentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,AGENTE FROM VER_AGENTES'
      'WHERE empresa=?empresa and'
      '              agente=?agente')
    UniDirectional = False
    Left = 300
    Top = 175
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_CLIENTES'
      'where empresa = ?empresa and '
      '           ejercicio = ?ejercicio and'
      '           canal = ?canal and'
      '           cliente =?cliente')
    UniDirectional = False
    DataSource = DSQMCondClientes
    Left = 282
    Top = 68
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_EMP_AGRUPACIONES'
      'where empresa=?empresa and agrupacion=?agrupacion')
    UniDirectional = False
    DataSource = DSQMCondAgrupacion
    Left = 300
    Top = 126
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 373
    Top = 10
  end
end
