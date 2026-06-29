object DMCalculaStockMinMax: TDMCalculaStockMinMax
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 586
  Top = 423
  Height = 150
  Width = 215
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 8
    Top = 8
  end
end
