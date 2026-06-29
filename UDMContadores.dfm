object DMContadores: TDMContadores
  OldCreateOrder = False
  OnCreate = DMContadoresCreate
  Left = 453
  Top = 348
  Height = 428
  Width = 363
  object DSxConta_E: TDataSource
    DataSet = QMConta_E
    Left = 152
    Top = 16
  end
  object QMConta_EE: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EE'
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EE'
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CONT_REC_EE'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      'order by tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CONT_REC_EE'
      'SET'
      '  CONTADOR=?CONTADOR '
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EJERCICIO '
      'EMPRESA '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CONT_REC_EE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 64
    object QMConta_EEEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConta_EEEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConta_EETIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConta_EETITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConta_EECONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMConta_EEACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConta_EERECUPERA: TIntegerField
      DisplayLabel = 'Recupera'
      FieldName = 'RECUPERA'
    end
    object QMConta_EEBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloqueado'
      FieldName = 'BLOQUEADO'
    end
  end
  object DSxConta_EE: TDataSource
    DataSet = QMConta_EE
    Left = 152
    Top = 64
  end
  object QMConta_EEC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EEC'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EEC'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CONT_REC_EEC'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      '  and canal=?canal'
      'order by tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CONT_REC_EEC'
      'SET'
      '  CONTADOR=?CONTADOR '
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CONT_REC_EEC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 112
    object QMConta_EECEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConta_EECEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConta_EECCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConta_EECTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConta_EECTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConta_EECCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMConta_EECACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConta_EECRECUPERA: TIntegerField
      DisplayLabel = 'Recupera'
      FieldName = 'RECUPERA'
    end
  end
  object DSxConta_EEC: TDataSource
    DataSet = QMConta_EEC
    Left = 152
    Top = 112
  end
  object QMConta_EECS: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EECS'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EECS'
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CONT_REC_EECS'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      '  and canal=?canal'
      'order by tipo,serie')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CONT_REC_EECS'
      'SET'
      '  CONTADOR=?CONTADOR '
      'WHERE'
      '  CANAL=?CANAL AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO ')
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'CANAL '
      'EJERCICIO '
      'EMPRESA '
      'SERIE '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CONT_REC_EECS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 160
    object QMConta_EECSEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConta_EECSEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConta_EECSCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMConta_EECSSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConta_EECSTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConta_EECSTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConta_EECSCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMConta_EECSACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConta_EECSRECUPERA: TIntegerField
      DisplayLabel = 'Recupera'
      FieldName = 'RECUPERA'
    end
  end
  object DSxConta_EECS: TDataSource
    DataSet = QMConta_EECS
    Left = 152
    Top = 160
  end
  object QMConta_EES: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EES'
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EES'
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CONT_REC_EES'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      'order by tipo,serie')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CONT_REC_EES'
      'SET'
      '  CONTADOR=?CONTADOR '
      'WHERE'
      '  EJERCICIO=?EJERCICIO AND '
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO ')
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EJERCICIO '
      'EMPRESA '
      'SERIE '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CONT_REC_EES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 208
    object QMConta_EESEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConta_EESEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMConta_EESSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMConta_EESTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConta_EESTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConta_EESCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMConta_EESACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConta_EESRECUPERA: TIntegerField
      DisplayLabel = 'Recupera'
      FieldName = 'RECUPERA'
    end
  end
  object DSxConta_EES: TDataSource
    DataSet = QMConta_EES
    Left = 152
    Top = 208
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 264
    Top = 16
  end
  object QMConta_E: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_E'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_E'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CONT_REC_E'
      'where empresa=?empresa'
      'order by tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CONT_REC_E'
      'SET'
      '  CONTADOR=?CONTADOR '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO ')
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CONT_REC_E'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMConta_EEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConta_ETIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMConta_ETITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMConta_ECONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMConta_EACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMConta_ERECUPERA: TIntegerField
      DisplayLabel = 'Recupera'
      FieldName = 'RECUPERA'
    end
  end
  object QMContaEC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_EMP_CONT_REC_EC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_EMP_CONT_REC_EC'
      '  (CONTADOR,RECUPERA,ACTIVO,TITULO,CANAL,EMPRESA,TIPO)'
      'VALUES'
      '  (?CONTADOR,?RECUPERA,?ACTIVO,?TITULO,?CANAL,?EMPRESA,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMP_CONT_REC_EC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_EMP_CONT_REC_EC'
      'WHERE EMPRESA = ?EMPRESA AND'
      'CANAL = ?CANAL'
      'order by tipo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_EMP_CONT_REC_EC'
      'SET'
      '  CONTADOR=?CONTADOR '
      '  ,RECUPERA=?RECUPERA '
      '  ,ACTIVO=?ACTIVO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO ')
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CANAL '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_EMP_CONT_REC_EC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 256
    object QMContaECEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContaECCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMContaECTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMContaECTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMContaECCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMContaECACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMContaECRECUPERA: TIntegerField
      DisplayLabel = 'Recupera'
      FieldName = 'RECUPERA'
    end
  end
  object DSQMContaEC: TDataSource
    DataSet = QMContaEC
    Left = 152
    Top = 256
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 264
    Top = 64
  end
end
