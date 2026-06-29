object DMADRPackingGroups: TDMADRPackingGroups
  OldCreateOrder = False
  OnCreate = DMADRPackingGroupsCreate
  Left = 449
  Top = 329
  Height = 137
  Width = 323
  object QMADRPackingGroups: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ADR_PACKING_GROUPS'
      'WHERE'
      '  PACKING_GROUP=?old_PACKING_GROUP ')
    InsertSQL.Strings = (
      'INSERT INTO ADR_PACKING_GROUPS'
      '  (PACKING_GROUP,NAME)'
      'VALUES'
      '  (?PACKING_GROUP,?NAME)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ADR_PACKING_GROUPS'
      'WHERE'
      '  PACKING_GROUP=?PACKING_GROUP ')
    SelectSQL.Strings = (
      'SELECT * FROM ADR_PACKING_GROUPS'
      'ORDER BY PACKING_GROUP')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ADR_PACKING_GROUPS'
      'SET'
      '  NAME=?NAME '
      'WHERE'
      '  PACKING_GROUP=?PACKING_GROUP ')
    ClavesPrimarias.Strings = (
      'PACKING_GROUP ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ADR_PACKING_GROUPS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMADRPackingGroupsPACKING_GROUP: TFIBStringField
      DisplayLabel = 'Grupo Embalaje'
      FieldName = 'PACKING_GROUP'
      Size = 15
    end
    object QMADRPackingGroupsNAME: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NAME'
      Size = 256
    end
  end
  object DSQMADRPackingGroups: TDataSource
    DataSet = QMADRPackingGroups
    Left = 184
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 56
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 184
    Top = 8
  end
end
