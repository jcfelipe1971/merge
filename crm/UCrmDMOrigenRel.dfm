object CrmDMOrigenRel: TCrmDMOrigenRel
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
  object QMOrigRel: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_SYS_ORIGEN_CONTACTO'
      'WHERE'
      '  TORIGEN=?old_TORIGEN ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_SYS_ORIGEN_CONTACTO'
      '  (TORIGEN,DESCRIPCION)'
      'VALUES'
      '  (?TORIGEN,?DESCRIPCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_SYS_ORIGEN_CONTACTO'
      'WHERE'
      '  TORIGEN=?TORIGEN ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_SYS_ORIGEN_CONTACTO'
      'ORDER BY TORIGEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_SYS_ORIGEN_CONTACTO'
      'SET'
      '  DESCRIPCION=?DESCRIPCION '
      'WHERE'
      '  TORIGEN=?TORIGEN ')
    ClavesPrimarias.Strings = (
      'TORIGEN ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_SYS_ORIGEN_CONTACTO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMOrigRelTORIGEN: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TORIGEN'
      Size = 3
    end
    object QMOrigRelDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSQMOrigRel: TDataSource
    DataSet = QMOrigRel
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
