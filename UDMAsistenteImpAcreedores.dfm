object DMAsistenteImpAcreedores: TDMAsistenteImpAcreedores
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 252
  Top = 160
  Height = 321
  Width = 404
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 152
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 8
  end
  object QImportaAcreedor: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TUpdate
    AutoTrans = True
    Left = 56
    Top = 8
  end
end
