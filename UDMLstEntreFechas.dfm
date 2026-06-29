object DMLstEntrefechas: TDMLstEntrefechas
  OldCreateOrder = False
  OnCreate = DMLstEntrefechasCreate
  Left = 465
  Top = 540
  Height = 272
  Width = 368
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 280
    Top = 16
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 50
    Top = 13
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 144
    Top = 15
  end
end
