object DMCondicionesAgeAgrupArt: TDMCondicionesAgeAgrupArt
  OldCreateOrder = False
  OnCreate = DMCondicionescliCreate
  Left = 402
  Top = 189
  Height = 382
  Width = 571
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 206
    Top = 14
  end
  object DSxAgentes: TDataSource
    DataSet = xAgentes
    Left = 84
    Top = 22
  end
  object QMCondArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGE_AGRUP_ART'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  AGRUPACION=?old_AGRUPACION AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGE_AGRUP_ART'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENTE,AGRUPACION,TITULO_AGRUPACION,A' +
        'RTICULO,TITULO_ARTICULO,P_COMISION,ACTIVO,COMISION_LINEAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?AGRUPACION,?TITULO_AGRUPA' +
        'CION,?ARTICULO,?TITULO_ARTICULO,?P_COMISION,?ACTIVO,?COMISION_LI' +
        'NEAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGE_AGRUP_ART'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGE_AGRUP_ART'
      'WHERE EMPRESA=?EMPRESA AND '
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               AGENTE=?AGENTE AND'
      '               AGRUPACION=?AGRUPACION '
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGE_AGRUP_ART'
      'SET'
      '   P_COMISION=?P_COMISION '
      '  ,ACTIVO=?ACTIVO '
      '  ,COMISION_LINEAL=?COMISION_LINEAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  ARTICULO=?ARTICULO ')
    DataSource = DSxAgrupacion
    AfterCancel = QMCondArticulosAfterCancel
    AfterOpen = QMCondArticulosAfterOpen
    BeforePost = QMCondArticulosBeforePost
    OnNewRecord = QMCondArticulosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE '
      'AGRUPACION '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGE_AGRUP_ART'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 154
    Top = 126
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
    object QMCondArticulosAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondArticulosTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
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
    Left = 258
    Top = 126
  end
  object xAgentes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO,EMPRESA,AGENTE'
      ' FROM VER_AGENTES'
      'WHERE empresa=?empresa and'
      '              agente=?agente')
    UniDirectional = False
    Left = 28
    Top = 20
    object xAgentesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAgentesAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'AGENTE'
    end
    object xAgentesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 152
    Top = 74
  end
  object QMCondFamilias: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CONDICIONES_AGE_AGRUP_FAM'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  AGENTE=?old_AGENTE AND '
      '  AGRUPACION=?old_AGRUPACION AND '
      '  FAMILIA=?old_FAMILIA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_CONDICIONES_AGE_AGRUP_FAM'
      
        '  (EMPRESA,EJERCICIO,CANAL,AGENTE,AGRUPACION,TITULO_AGRUPACION,F' +
        'AMILIA,TITULO_FAMILIA,P_COMISION,ACTIVO,COMISION_LINEAL)'
      'VALUES'
      
        '  (?EMPRESA,?EJERCICIO,?CANAL,?AGENTE,?AGRUPACION,?TITULO_AGRUPA' +
        'CION,?FAMILIA,?TITULO_FAMILIA,?P_COMISION,?ACTIVO,?COMISION_LINE' +
        'AL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CONDICIONES_AGE_AGRUP_FAM'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CONDICIONES_AGE_AGRUP_FAM'
      'WHERE EMPRESA=?EMPRESA AND '
      '               EJERCICIO=?EJERCICIO AND'
      '               CANAL=?CANAL AND'
      '               AGENTE=?AGENTE AND'
      '               AGRUPACION=?AGRUPACION '
      'ORDER BY FAMILIA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CONDICIONES_AGE_AGRUP_FAM'
      'SET'
      '   P_COMISION=?P_COMISION '
      '  ,ACTIVO=?ACTIVO '
      '  ,COMISION_LINEAL=?COMISION_LINEAL'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  AGENTE=?AGENTE AND '
      '  AGRUPACION=?AGRUPACION AND '
      '  FAMILIA=?FAMILIA ')
    DataSource = DSxAgrupacion
    AfterCancel = QMCondFamiliasAfterCancel
    AfterOpen = QMCondFamiliasAfterOpen
    BeforePost = QMCondFamiliasBeforePost
    OnNewRecord = QMCondFamiliasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'AGENTE '
      'AGRUPACION '
      'FAMILIA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CONDICIONES_AGE_AGRUP_FAM'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 154
    Top = 226
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
    object QMCondFamiliasAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupaci'#243'n'
      FieldName = 'AGRUPACION'
      Size = 3
    end
    object QMCondFamiliasTITULO_AGRUPACION: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_AGRUPACION'
      Size = 40
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
    Left = 262
    Top = 224
  end
  object QControlaDuplicados: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from ver_condiciones_age_agrup_art'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      
        '           agente=?agente and agrupacion=?agrupacion and articul' +
        'o=?articulo')
    Transaction = TLocal
    AutoTrans = True
    Left = 460
    Top = 80
  end
  object QControlaDuplicadosFam: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select * from ver_condiciones_age_agrup_fam'
      
        'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal' +
        ' and'
      '           agente=?agente and agrupacion=?agrupacion and'
      '            familia=?familia')
    Transaction = TLocal
    AutoTrans = True
    Left = 462
    Top = 144
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
      'SELECT EMPRESA,ARTICULO,TITULO_LARGO AS TITULO'
      'FROM ART_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND'
      '               ARTICULO=?ARTICULO')
    UniDirectional = False
    DataSource = DSQMCondArticulos
    Left = 258
    Top = 178
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
    Left = 342
    Top = 178
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
      ' FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND'
      '               FAMILIA=?FAMILIA')
    UniDirectional = False
    DataSource = DSQMCondFamilias
    Left = 264
    Top = 282
  end
  object DSxFamilias: TDataSource
    DataSet = xFamilias
    Left = 350
    Top = 278
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EMPRESA,TITULO,AGRUPACION'
      ' FROM VER_EMP_AGRUPACIONES'
      'where empresa=?empresa and agrupacion=?agrupacion'
      '')
    UniDirectional = False
    DataSource = DSxAgentes
    Left = 84
    Top = 74
    object xAgrupacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xAgrupacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xAgrupacionAGRUPACION: TFIBStringField
      DisplayLabel = 'Agrupacion'
      FieldName = 'AGRUPACION'
      Size = 3
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
    Left = 310
    Top = 14
  end
end
