object DMImportarEscProduccion: TDMImportarEscProduccion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 195
  Top = 107
  Height = 433
  Width = 882
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 752
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 752
    Top = 104
  end
end
