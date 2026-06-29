object DMCondicionesAgecliArt: TDMCondicionesAgecliArt
  OldCreateOrder = False
  OnCreate = DMCondicionescliCreate
  Left = 456
  Top = 330
  Height = 366
  Width = 490
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 176
    Top = 14
  end
  object DSxAgentes: TDataSource
    DataSet = xAgentes
    Left = 80
    Top = 18
  end
  object QMCondArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGE_CLI_ART'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGE_CLI_ART'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENTE,CLIENTE,TITULO_CLIENTE,ARTICUL' +
        'O,TITULO_ARTICULO,P_COMISION,ACTIVO,COMISION_LINEAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?CLIENTE,?TITULO_CLIENTE,?' +
        'ARTICULO,?TITULO_ARTICULO,?P_COMISION,?ACTIVO,?COMISION_LINEAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGE_CLI_ART'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  CLIENTE=?CLIENTE AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGE_CLI_ART'
      'WHERE EMPRESA=?EMPRESA AND '
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '              AGENTE=?AGENTE AND'
      '              CLIENTE=?CLIENTE '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGE_CLI_ART'
      'SET'
      '   P_COMISION=?P_COMISION '
      '  ,ACTIVO=?ACTIVO'
      '  ,COMISION_LINEAL=?COMISION_LINEAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  CLIENTE=?CLIENTE AND'
      '  ARTICULO=?ARTICULO '
      ''
      '  '
      '')
    DataSource = DSxAgentes
    AfterCancel = QMCondArticulosAfterCancel
    AfterOpen = QMCondArticulosAfterOpen
    BeforePost = QMCondArticulosBeforePost
    OnNewRecord = QMCondArticulosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE '
      'CLIENTE '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGE_CLI_ART'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 82
    Top = 124
    object QMCondArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondArticulosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondArticulosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondArticulosAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCondArticulosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCondArticulosTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMCondArticulosARTICULOChange
      Size = 15
    end
    object QMCondArticulosTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMCondArticulosP_COMISION: TFloatField
      DisplayLabel = '% Comisi'#243'n'
      FieldName = 'P_COMISION'
    end
    object QMCondArticulosACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondArticulosCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lineal'
      FieldName = 'COMISION_LINEAL'
    end
  end
  object DSQMCondArticulos: TDataSource
    DataSet = QMCondArticulos
    Left = 178
    Top = 124
  end
  object xAgentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,AGENTE,TERCERO,TITULO'
      'FROM VER_AGENTES'
      'WHERE empresa=?empresa and'
      '              agente=?agente')
    UniDirectional = False
    Left = 20
    Top = 18
    object xAgentesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAgentesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAgentesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xAgentesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT CLIENTE,EMPRESA,EJERCICIO,CANAL,TITULO'
      'FROM VER_CLIENTES'
      'where empresa = ?empresa and '
      '           ejercicio = ?ejercicio and'
      '           canal = ?canal and'
      '           cliente =?cliente ')
    UniDirectional = False
    DataSource = DSxAgentes
    Left = 80
    Top = 74
    object xClientesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xClientesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xClientesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClientesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 178
    Top = 76
  end
  object QMCondFamilias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGE_CLI_FAM'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  CLIENTE=?old_CLIENTE AND'
      '  FAMILIA=?old_FAMILIA')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGE_CLI_FAM'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENTE,CLIENTE,TITULO_CLIENTE,FAMILIA' +
        ',TITULO_FAMILIA,P_COMISION,ACTIVO,COMISION_LINEAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?CLIENTE,?TITULO_CLIENTE,?' +
        'FAMILIA,?TITULO_FAMILIA,?P_COMISION,?ACTIVO,?COMISION_LINEAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGE_CLI_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  CLIENTE=?CLIENTE AND'
      '  FAMILIA=?FAMILIA')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGE_CLI_FAM'
      'WHERE EMPRESA=?EMPRESA AND '
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               AGENTE=?AGENTE AND'
      '               CLIENTE=?CLIENTE '
      'ORDER BY FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGE_CLI_FAM'
      'SET'
      '   P_COMISION=?P_COMISION '
      '  ,ACTIVO=?ACTIVO '
      '  ,COMISION_LINEAL=?COMISION_LINEAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  CLIENTE=?CLIENTE AND'
      '  FAMILIA=?FAMILIA ')
    DataSource = DSxAgentes
    AfterCancel = QMCondFamiliasAfterCancel
    AfterOpen = QMCondFamiliasAfterOpen
    BeforePost = QMCondFamiliasBeforePost
    OnNewRecord = QMCondFamiliasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE '
      'CLIENTE '
      'FAMILIA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGE_CLI_FAM'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 82
    Top = 224
    object QMCondFamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCondFamiliasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCondFamiliasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCondFamiliasAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object QMCondFamiliasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCondFamiliasTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object QMCondFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      OnChange = QMCondFamiliasFAMILIAChange
      Size = 5
    end
    object QMCondFamiliasTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object QMCondFamiliasP_COMISION: TFloatField
      DisplayLabel = '% Comisi'#243'n'
      FieldName = 'P_COMISION'
    end
    object QMCondFamiliasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMCondFamiliasCOMISION_LINEAL: TFloatField
      DisplayLabel = 'Com. Lineal'
      FieldName = 'COMISION_LINEAL'
    end
  end
  object DSQMCondFamilias: TDataSource
    DataSet = QMCondFamilias
    Left = 178
    Top = 224
  end
  object QControlaDuplicados: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from ver_condiciones_age_cli_art'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      
        '           agente=?agente and cliente=?cliente and articulo=?art' +
        'iculo')
    Transaction = TLocal
    AutoTrans = True
    Left = 386
    Top = 84
  end
  object QControlaDuplicadosFam: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from ver_condiciones_age_cli_fam'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      '           agente=?agente and cliente=?cliente and'
      '            familia=?familia')
    Transaction = TLocal
    AutoTrans = True
    Left = 388
    Top = 146
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT EMPRESA,TITULO_LARGO AS TITULO,ARTICULO'
      'FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND'
      '               ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMCondArticulos
    Left = 178
    Top = 174
    object xArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object DSXArticulos: TDataSource
    DataSet = xArticulos
    Left = 254
    Top = 174
  end
  object xFamilias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT EMPRESA,FAMILIA,TITULO'
      'FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND'
      '               FAMILIA=?FAMILIA')
    UniDirectional = False
    DataSource = DSQMCondFamilias
    Left = 178
    Top = 272
    object xFamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamilias: TDataSource
    DataSet = xFamilias
    Left = 258
    Top = 272
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 14
  end
end
