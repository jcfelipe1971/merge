object DMImpTarifasTyC: TDMImpTarifasTyC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 749
  Top = 400
  Height = 262
  Width = 351
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 177
    Top = 12
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 252
    Top = 12
  end
end
