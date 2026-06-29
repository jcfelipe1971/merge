object DMMonedasMaestros: TDMMonedasMaestros
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 367
  Height = 374
  Width = 458
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 64
    Top = 24
  end
  object QCambiaMoneda: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure e_cambia_monedas_maestros (?EMPRESA,?EJERCICIO' +
        ',?CANAL,?MAESTRO,?MODO,?AGRUPACION,?MONEDAO,?MONEDAD)')
    Transaction = TLocal
    AutoTrans = True
    Left = 64
    Top = 72
  end
  object QCambiaMonedaTodos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure e_cambia_monedas_maestros_todos (?EMPRESA,?EJE' +
        'RCICIO,?CANAL,?MAESTRO,?MODO,?AGRUPACION,?MONEDAD)')
    Transaction = TLocal
    AutoTrans = True
    Left = 64
    Top = 120
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 176
    Top = 24
  end
end
