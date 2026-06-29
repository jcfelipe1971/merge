object DMADRUNNumbers: TDMADRUNNumbers
  OldCreateOrder = False
  OnCreate = DMADRUNNumbersCreate
  Left = 449
  Top = 329
  Height = 137
  Width = 323
  object QMADRUNNumbers: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ADR_NUMBERS'
      'WHERE'
      '  UN_NUMBER=?old_UN_NUMBER ')
    InsertSQL.Strings = (
      'INSERT INTO ADR_NUMBERS'
      '  (UN_NUMBER,NAME)'
      'VALUES'
      '  (?UN_NUMBER,?NAME)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ADR_NUMBERS'
      'WHERE'
      '  UN_NUMBER=?UN_NUMBER ')
    SelectSQL.Strings = (
      'SELECT * FROM ADR_NUMBERS'
      'ORDER BY UN_NUMBER')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ADR_NUMBERS'
      'SET'
      '  NAME=?NAME '
      'WHERE'
      '  UN_NUMBER=?UN_NUMBER ')
    ClavesPrimarias.Strings = (
      'UN_NUMBER ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ADR_NUMBERS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMADRUNNumbersUN_NUMBER: TFIBStringField
      DisplayLabel = 'Numero UN'
      FieldName = 'UN_NUMBER'
      Size = 15
    end
    object QMADRUNNumbersNAME: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NAME'
      Size = 256
    end
  end
  object DSQMADRUNNumbers: TDataSource
    DataSet = QMADRUNNumbers
    Left = 184
    Top = 56
  end
  object TLocal: THYTransaction
    Active = True
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
