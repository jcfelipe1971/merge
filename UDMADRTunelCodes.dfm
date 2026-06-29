object DMADRTunelCodes: TDMADRTunelCodes
  OldCreateOrder = False
  OnCreate = DMADRTunelCodesCreate
  Left = 449
  Top = 329
  Height = 137
  Width = 323
  object QMADRTunelCodes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ADR_TUNEL_CODES'
      'WHERE'
      '  CODE=?old_CODE ')
    InsertSQL.Strings = (
      'INSERT INTO ADR_TUNEL_CODES'
      '  (CODE,NAME)'
      'VALUES'
      '  (?CODE,?NAME)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ADR_TUNEL_CODES'
      'WHERE'
      '  CODE=?CODE ')
    SelectSQL.Strings = (
      'SELECT * FROM ADR_TUNEL_CODES'
      'ORDER BY CODE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ADR_TUNEL_CODES'
      'SET'
      '  NAME=?NAME '
      'WHERE'
      '  CODE=?CODE ')
    ClavesPrimarias.Strings = (
      'CODE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ADR_TUNEL_CODES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 56
    object QMADRTunelCodesCODE: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODE'
      Size = 15
    end
    object QMADRTunelCodesNAME: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NAME'
      Size = 256
    end
  end
  object DSQMADRTunelCodes: TDataSource
    DataSet = QMADRTunelCodes
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
