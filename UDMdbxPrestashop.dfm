object DMPrestashop: TDMPrestashop
  OldCreateOrder = False
  Left = 423
  Top = 326
  Height = 284
  Width = 279
  object dbxMYSQLConnection: TSQLConnection
    DriverName = 'MYSQL'
    GetDriverFunc = 'getSQLDriverMYSQL'
    LibraryName = 'dbexpmys.dll'
    LoginPrompt = False
    Params.Strings = (
      'BlobSize=-1'
      'Database=DBNAME'
      'ErrorResourceFile='
      'HostName=ServerName'
      'LocaleCode=0000'
      'Password=password'
      'User_Name=user')
    VendorLib = 'LIBMYSQL.dll'
    Left = 48
    Top = 16
  end
  object dbxQMySql: TSQLQuery
    NoMetadata = True
    SQLConnection = dbxMYSQLConnection
    Params = <>
    Left = 144
    Top = 16
  end
  object dbxDSMySql: TSQLDataSet
    SQLConnection = dbxMYSQLConnection
    Params = <>
    Left = 144
    Top = 64
  end
  object MYSQLConnection: TADOConnection
    ConnectionString = 'DSN=Nutrienda'
    LoginPrompt = False
    Left = 56
    Top = 136
  end
end
