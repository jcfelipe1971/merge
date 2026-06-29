object DMSincronizacionKri: TDMSincronizacionKri
  OldCreateOrder = False
  Left = 475
  Top = 292
  Height = 150
  Width = 215
  object DataBase: THYDatabase
    DBName = '10.10.9.12:C:\Delfos\Datos\JVV.FDB'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterke')
    DefaultTransaction = TLocal
    Timeout = 0
    Left = 24
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 152
    Top = 16
  end
  object Qo: TFIBQuery
    Database = DataBase
    ParamCheck = True
    Transaction = TLocal
    Left = 88
    Top = 16
  end
end
