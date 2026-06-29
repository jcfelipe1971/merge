object DMLstEntrefechasCli: TDMLstEntrefechasCli
  OldCreateOrder = False
  OnCreate = DMLstEntrefechasCreate
  Left = 801
  Top = 147
  Height = 306
  Width = 256
  object SPMinMaxFechaCliente: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE DAME_MIN_MAX_FECHA_CLIENTE_DOC'
      '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 142
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 46
    Top = 24
  end
end
