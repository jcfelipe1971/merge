object DMTraspasoPeriodo: TDMTraspasoPeriodo
  OldCreateOrder = False
  OnCreate = DMTraspasoPeriodoCreate
  Left = 647
  Top = 314
  Height = 295
  Width = 564
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 456
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
    Left = 456
    Top = 56
  end
end
