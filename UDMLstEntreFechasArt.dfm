object DMLstEntreFechasArt: TDMLstEntreFechasArt
  OldCreateOrder = False
  OnCreate = DMLstEntrefechasCreate
  Left = 479
  Top = 217
  Height = 124
  Width = 307
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_GES_ESTADOS'
      'WHERE ESTADO=?ESTADO')
    UniDirectional = False
    Left = 40
    Top = 8
  end
  object DSxEstados: TDataSource
    DataSet = xEstados
    Left = 104
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 176
    Top = 8
  end
end
