object ProDMTipoMaquinas: TProDMTipoMaquinas
  OldCreateOrder = False
  OnCreate = DMProTipoMaquinasCreate
  Left = 423
  Top = 288
  Height = 150
  Width = 342
  object QMTipos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TIPO_MAQUINAS'
      'WHERE'
      '  TIPO=?old_TIPO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TIPO_MAQUINAS'
      '  (TIPO,DESCRIPCION,EMPRESA)'
      'VALUES'
      '  (?TIPO,?DESCRIPCION,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_TIPO_MAQUINAS'
      'WHERE'
      '  TIPO=?TIPO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TIPO_MAQUINAS'
      'where empresa=?empresa')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TIPO_MAQUINAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TIPO=?TIPO AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMTiposBeforePost
    OnNewRecord = QMTiposNewRecord
    ClavesPrimarias.Strings = (
      'TIPO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TIPO_MAQUINAS'
    UpdateTransaction = TLocal
    Left = 32
    Top = 20
    object QMTiposEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTiposTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMTiposDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSQMTipos: TDataSource
    DataSet = QMTipos
    Left = 120
    Top = 20
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 209
    Top = 20
  end
end
