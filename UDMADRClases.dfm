object DMADRClases: TDMADRClases
  OldCreateOrder = False
  OnCreate = DMADRClasesCreate
  Left = 449
  Top = 329
  Height = 137
  Width = 323
  object QMADRClases: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ADR_CLASES'
      'WHERE'
      '  CLASS=?old_CLASS ')
    InsertSQL.Strings = (
      'INSERT INTO ADR_CLASES'
      '  (CLASS,NAME)'
      'VALUES'
      '  (?CLASS,?NAME)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ADR_CLASES'
      'WHERE'
      '  CLASS=?CLASS ')
    SelectSQL.Strings = (
      'SELECT * FROM ADR_CLASES'
      'ORDER BY CLASS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ADR_CLASES'
      'SET'
      '  NAME=?NAME '
      'WHERE'
      '  CLASS=?CLASS ')
    ClavesPrimarias.Strings = (
      'CLASS ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ADR_CLASES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMADRClasesCLASS: TFIBStringField
      DisplayLabel = 'Clase'
      FieldName = 'CLASS'
      Size = 15
    end
    object QMADRClasesNAME: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NAME'
      Size = 256
    end
  end
  object DSQMADRClases: TDataSource
    DataSet = QMADRClases
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
