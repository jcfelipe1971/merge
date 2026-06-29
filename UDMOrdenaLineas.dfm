object DMOrdenaLineas: TDMOrdenaLineas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 819
  Top = 245
  Height = 183
  Width = 237
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 128
    Top = 24
  end
  object xLineas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    UniDirectional = False
    Left = 56
    Top = 24
  end
end
