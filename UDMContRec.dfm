object DMContRec: TDMContRec
  OldCreateOrder = False
  OnCreate = DMContadoresCreate
  Left = 554
  Top = 157
  Height = 470
  Width = 557
  object DSxContRec_E: TDataSource
    DataSet = QMContRec_E
    Left = 312
    Top = 64
  end
  object QMContRec_EE: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONT_REC_EE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  TIPO=?old_TIPO AND '
      '  CONTADOR=?old_CONTADOR ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONT_REC_EE'
      '  (FECHA,CONTADOR,EJERCICIO,EMPRESA,TIPO)'
      'VALUES'
      '  (?FECHA,?CONTADOR,?EJERCICIO,?EMPRESA,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONT_REC_EE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONT_REC_EE'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      '  and tipo=?tipo'
      'order by contador desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONT_REC_EE'
      'SET'
      '  FECHA=?FECHA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    DataSource = DSxTipoEE
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'TIPO '
      'CONTADOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONT_REC_EE'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 208
    Top = 112
    object QMContRec_EEEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContRec_EEEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMContRec_EETIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMContRec_EECONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMContRec_EEFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxContRec_EE: TDataSource
    DataSet = QMContRec_EE
    Left = 312
    Top = 112
  end
  object QMContRec_EEC: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONT_REC_EEC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  TIPO=?old_TIPO AND '
      '  CONTADOR=?old_CONTADOR ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONT_REC_EEC'
      '  (FECHA,CONTADOR,CANAL,EJERCICIO,EMPRESA,TIPO)'
      'VALUES'
      '  (?FECHA,?CONTADOR,?CANAL,?EJERCICIO,?EMPRESA,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONT_REC_EEC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONT_REC_EEC'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      '  and canal=?canal'
      '  and tipo=?tipo'
      'order by contador desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONT_REC_EEC'
      'SET'
      '  FECHA=?FECHA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    DataSource = DSxTipoEEC
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'TIPO '
      'CONTADOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONT_REC_EEC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 208
    Top = 160
    object QMContRec_EECEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContRec_EECEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMContRec_EECCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMContRec_EECTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMContRec_EECCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMContRec_EECFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxContRec_EEC: TDataSource
    DataSet = QMContRec_EEC
    Left = 312
    Top = 160
  end
  object QMContRec_EECS: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONT_REC_EECS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  CONTADOR=?old_CONTADOR ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONT_REC_EECS'
      '  (FECHA,SERIE,CONTADOR,EMPRESA,EJERCICIO,CANAL,TIPO)'
      'VALUES'
      '  (?FECHA,?SERIE,?CONTADOR,?EMPRESA,?EJERCICIO,?CANAL,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONT_REC_EECS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONT_REC_EECS'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      '  and canal=?canal'
      '  and tipo=?tipo'
      'order by serie, contador desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONT_REC_EECS'
      'SET'
      '  FECHA=?FECHA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    DataSource = DSxTipoEECS
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'CONTADOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONT_REC_EECS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 208
    Top = 208
    object QMContRec_EECSEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContRec_EECSEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMContRec_EECSCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMContRec_EECSSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMContRec_EECSTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMContRec_EECSCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMContRec_EECSFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxContRec_EECS: TDataSource
    DataSet = QMContRec_EECS
    Left = 312
    Top = 208
  end
  object QGen: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 208
    Top = 16
  end
  object QMContRec_EES: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONT_REC_EES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  SERIE=?old_SERIE AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  TIPO=?old_TIPO AND '
      '  CONTADOR=?old_CONTADOR ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_CONT_REC_EES'
      '  (FECHA,CONTADOR,SERIE,EJERCICIO,EMPRESA,TIPO)'
      'VALUES'
      '  (?FECHA,?CONTADOR,?SERIE,?EJERCICIO,?EMPRESA,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONT_REC_EES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONT_REC_EES'
      'where empresa=?empresa'
      '  and ejercicio=?ejercicio'
      '  and tipo=?tipo'
      'order by serie, contador desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_CONT_REC_EES'
      'SET'
      '  FECHA=?FECHA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  SERIE=?SERIE AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    DataSource = DSxTipoEES
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'SERIE '
      'EJERCICIO '
      'TIPO '
      'CONTADOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONT_REC_EES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 208
    Top = 256
    object QMContRec_EESEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContRec_EESSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMContRec_EESEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMContRec_EESTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMContRec_EESCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMContRec_EESFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxContRec_EES: TDataSource
    DataSet = QMContRec_EES
    Left = 312
    Top = 256
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 32
    Top = 16
  end
  object QMContRec_E: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_CONT_REC_E'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  TIPO=?old_TIPO AND '
      '  CONTADOR=?old_CONTADOR ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_CONT_REC_E'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  TIPO=?TIPO AND '
      '  CONTADOR=?CONTADOR ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_CONT_REC_E'
      'where'
      '  empresa=?empresa and'
      '  tipo=?tipo'
      'order by contador desc')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSxTipoE
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = NoInserta
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'TIPO '
      'CONTADOR ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_CONT_REC_E'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 208
    Top = 64
    object QMContRec_EEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMContRec_ETIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMContRec_ECONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object QMContRec_EFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSxTipoE: TDataSource
    DataSet = xTipoE
    Left = 112
    Top = 64
  end
  object xTipoE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TIPO,TITULO FROM VER_EMP_CONT_REC_E'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND TIPO=?TIPO')
    SelectSQL.Strings = (
      'SELECT DISTINCT TIPO,TITULO FROM VER_EMP_CONT_REC_E'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND RECUPERA=1'
      'ORDER BY TIPO')
    UniDirectional = False
    AfterOpen = xTipoEAfterOpen
    Left = 32
    Top = 64
  end
  object DSxTipoEE: TDataSource
    DataSet = xTipoEE
    Left = 112
    Top = 112
  end
  object xTipoEE: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TIPO, TITULO FROM VER_EMP_CONT_REC_EE'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND TIPO=?TIPO')
    SelectSQL.Strings = (
      'SELECT DISTINCT TIPO,TITULO FROM VER_EMP_CONT_REC_EE'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND RECUPERA=1'
      'ORDER BY TIPO')
    UniDirectional = False
    AfterOpen = xTipoEEAfterOpen
    Left = 32
    Top = 112
  end
  object DSxTipoEEC: TDataSource
    DataSet = xTipoEEC
    Left = 112
    Top = 160
  end
  object xTipoEEC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TIPO, TITULO FROM VER_EMP_CONT_REC_EEC'
      'WHERE EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL'
      'AND TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT DISTINCT TIPO,TITULO FROM VER_EMP_CONT_REC_EEC'
      'WHERE '
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL'
      'AND RECUPERA=1'
      'ORDER BY TIPO')
    UniDirectional = False
    AfterOpen = xTipoEECAfterOpen
    Left = 32
    Top = 160
  end
  object DSxTipoEECS: TDataSource
    DataSet = xTipoEECS
    Left = 112
    Top = 208
  end
  object xTipoEECS: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TIPO,TITULO FROM VER_EMP_CONT_REC_EECS'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL '
      'AND SERIE=?SERIE '
      'AND TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT DISTINCT TIPO,TITULO FROM VER_EMP_CONT_REC_EECS'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND CANAL=?CANAL'
      'AND RECUPERA=1'
      'ORDER BY TIPO')
    UniDirectional = False
    AfterOpen = xTipoEECSAfterOpen
    Left = 32
    Top = 208
  end
  object DSxTipoEES: TDataSource
    DataSet = xTipoEES
    Left = 112
    Top = 256
  end
  object xTipoEES: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT TIPO, TITULO FROM VER_EMP_CONT_REC_EES'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND SRIE=?SERIE '
      'AND TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT DISTINCT TIPO,TITULO FROM VER_EMP_CONT_REC_EES'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'AND EJERCICIO=?EJERCICIO'
      'AND RECUPERA=1'
      'ORDER BY TIPO DESC')
    UniDirectional = False
    AfterOpen = xTipoEESAfterOpen
    Left = 32
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
    Left = 112
    Top = 16
  end
end
