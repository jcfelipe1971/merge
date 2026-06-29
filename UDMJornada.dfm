object DMJornada: TDMJornada
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 390
  Top = 191
  Height = 569
  Width = 872
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 344
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 416
    Top = 16
  end
  object QMJornada: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_JORNADA'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_JORNADA'
      '  (CODIGO,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_JORNADA'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_JORNADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_JORNADA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_JORNADA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 72
    object QMJornadaCODIGO: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object QMJornadaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSQMJornada: TDataSource
    DataSet = QMJornada
    Left = 160
    Top = 72
  end
  object QMTipoJornada: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_TIPO_JORNADA'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_TIPO_JORNADA'
      '  (CODIGO,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_TIPO_JORNADA'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_TIPO_JORNADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_TIPO_JORNADA'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_TIPO_JORNADA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 120
    object IntegerField1: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSQMTipoJornada: TDataSource
    DataSet = QMTipoJornada
    Left = 160
    Top = 120
  end
  object QMAreas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_AREAS'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_AREAS'
      '  (CODIGO,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_AREAS'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_AREAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_AREAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_AREAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 168
    object IntegerField2: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSQMAreas: TDataSource
    DataSet = QMAreas
    Left = 160
    Top = 168
  end
  object QMCCostos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_CENTRO_DE_COSTO'
      'WHERE'
      '  CODIGO=?old_CODIGO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_CENTRO_DE_COSTO'
      '  (CODIGO,DESCRIPCION)'
      'VALUES'
      '  (?CODIGO,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_CENTRO_DE_COSTO'
      'WHERE'
      '  CODIGO=?CODIGO ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_CENTRO_DE_COSTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_CENTRO_DE_COSTO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  CODIGO=?CODIGO ')
    ClavesPrimarias.Strings = (
      'CODIGO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_CENTRO_DE_COSTO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 224
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
    end
    object FIBStringField3: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSQMCCostos: TDataSource
    DataSet = QMCCostos
    Left = 160
    Top = 224
  end
end
