object DMTraspasoMultiCanal: TDMTraspasoMultiCanal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 562
  Top = 227
  Height = 288
  Width = 418
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 16
  end
end
