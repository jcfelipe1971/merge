object DMDuplicarTarifa: TDMDuplicarTarifa
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 469
  Top = 305
  Height = 177
  Width = 207
  object SPDuplicar: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_duplicar_tarifa(?empresa, ?tarifa_o, ?ta' +
        'rifa_d)'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 32
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 136
    Top = 20
  end
end
