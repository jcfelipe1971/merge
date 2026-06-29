object DMPrestashop: TDMPrestashop
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 1277
  Top = 267
  Height = 284
  Width = 279
  object MYSQLConnection: TADOConnection
    ConnectionString = 'DSN=PrestaShop'
    ConnectionTimeout = 30
    LoginPrompt = False
    Left = 56
    Top = 24
  end
  object QMySQL: TADOQuery
    CacheSize = 100
    Connection = MYSQLConnection
    LockType = ltReadOnly
    Parameters = <>
    Left = 144
    Top = 24
  end
end
