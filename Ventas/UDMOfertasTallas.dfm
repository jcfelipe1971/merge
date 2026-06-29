inherited DMOfertasTallas: TDMOfertasTallas
  OldCreateOrder = True
  Left = 367
  Top = 130
  object SPActualiza_Precio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure xActualiza_Precio(?ID_S,?EMPRESA,?TIPO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 480
    Top = 24
  end
end
