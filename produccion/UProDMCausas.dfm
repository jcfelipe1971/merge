object ProDMCausas: TProDMCausas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 747
  Top = 218
  Height = 224
  Width = 339
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 200
    Top = 24
  end
  object QMCausa: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_CAUSAS'
      'WHERE'
      '  CAUSA=?old_CAUSA AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_CAUSAS'
      '  (EMPRESA,CAUSA,DESCRIPCION,ORDEN)'
      'VALUES'
      '  (?EMPRESA,?CAUSA,?DESCRIPCION,?ORDEN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_CAUSAS'
      'WHERE'
      '  CAUSA=?CAUSA AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_CAUSAS'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_CAUSAS'
      'SET'
      '  DESCRIPCION=?DESCRIPCION'
      ' ,ORDEN=?ORDEN'
      'WHERE'
      '  CAUSA=?CAUSA AND '
      '  EMPRESA=?EMPRESA ')
    AfterPost = QMCausaAfterPost
    OnNewRecord = QMCausaNewRecord
    ClavesPrimarias.Strings = (
      'CAUSA '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_CAUSAS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QMCausaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCausaCAUSA: TFIBStringField
      DisplayLabel = 'Causa'
      FieldName = 'CAUSA'
      Size = 3
    end
    object QMCausaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMCausaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
  end
  object DSQMCausa: TDataSource
    DataSet = QMCausa
    Left = 120
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 24
  end
end
