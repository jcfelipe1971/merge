object DMRepisas: TDMRepisas
  OldCreateOrder = False
  OnCreate = DMCanalesCreate
  Left = 806
  Top = 240
  Height = 127
  Width = 243
  object QMRepisas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_REPISAS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  REPISA=?old_REPISA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_REPISAS'
      '  (REPISA,DESCRIPCION,EMPRESA)'
      'VALUES'
      '  (?REPISA,?DESCRIPCION,?EMPRESA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_REPISAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  REPISA=?REPISA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_REPISAS'
      'WHERE EMPRESA=?EMPRESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_REPISAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  REPISA=?REPISA ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMRepisasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'REPISA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_REPISAS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'ART_REPISAS')
    CamposBloqueo.Strings = (
      'EMPRESA'
      'REPISA')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 18
    Top = 12
    object QMRepisasREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMRepisasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object QMRepisasEMPRESA: TIntegerField
      DisplayLabel = 'empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSQMRepisas: TDataSource
    DataSet = QMRepisas
    Left = 72
    Top = 26
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 134
    Top = 10
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 174
    Top = 26
  end
end
