object ZDMMarcManDirecto: TZDMMarcManDirecto
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 652
  Top = 318
  Height = 149
  Width = 123
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 28
    Top = 22
  end
end
