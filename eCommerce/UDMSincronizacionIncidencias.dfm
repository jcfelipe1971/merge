object DMSincronizacionIncidencias: TDMSincronizacionIncidencias
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 487
  Top = 189
  Height = 254
  Width = 302
  object DataBase: THYDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    DefaultTransaction = TLocal
    Timeout = 0
    Left = 48
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 128
    Top = 72
  end
  object Qo: TFIBQuery
    Database = DataBase
    ParamCheck = True
    Transaction = TLocal
    Left = 48
    Top = 120
  end
end
