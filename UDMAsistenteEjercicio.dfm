object DMAsistenteEjercicio: TDMAsistenteEjercicio
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 561
  Top = 254
  Height = 457
  Width = 471
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 40
    Top = 8
  end
  object QCreaEjercicio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE G_EJERCICIOS_ALTA_ESPECIFICO(:EMPRESA, :EJERCI' +
        'CIO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 56
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 144
    Top = 8
  end
end
