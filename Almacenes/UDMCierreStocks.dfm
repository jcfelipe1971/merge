object DMCierreStocks: TDMCierreStocks
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 880
  Top = 246
  Height = 242
  Width = 311
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 40
    Top = 16
  end
  object SPProcesa: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_crea_periodo (?EMPRESA,?EJERCICIO,?CANAL' +
        ',?MODO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 112
    Top = 16
  end
end
