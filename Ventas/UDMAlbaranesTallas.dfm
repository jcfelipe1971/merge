inherited DMAlbaranesTallas: TDMAlbaranesTallas
  OldCreateOrder = True
  Left = 306
  Top = 154
  object SPActualiza_Precio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure xActualiza_Precio(?ID_S,?EMPRESA,?TIPO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 408
    Top = 24
  end
end
