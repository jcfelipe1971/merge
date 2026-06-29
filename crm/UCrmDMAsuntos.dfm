object CrmDMAsuntos: TCrmDMAsuntos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 363
  Top = 281
  Height = 224
  Width = 428
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 240
    Top = 16
  end
  object QMAsuntos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_ASUNTOS'
      'WHERE'
      '  ID_ASUNTO=?old_ID_ASUNTO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_ASUNTOS'
      '  (ID_ASUNTO,TITULO)'
      'VALUES'
      '  (?ID_ASUNTO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_ASUNTOS'
      'WHERE'
      '  ID_ASUNTO=?ID_ASUNTO ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_ASUNTOS'
      'ORDER BY TITULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_ASUNTOS'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID_ASUNTO=?ID_ASUNTO ')
    BeforePost = QMAsuntosBeforePost
    ClavesPrimarias.Strings = (
      'ID_ASUNTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_ASUNTOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMAsuntosID_ASUNTO: TIntegerField
      DisplayLabel = 'Id Asunto'
      FieldName = 'ID_ASUNTO'
    end
    object QMAsuntosTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMAsuntos: TDataSource
    DataSet = QMAsuntos
    Left = 128
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 16
  end
end
