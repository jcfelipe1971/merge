object DMTallas: TDMTallas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 294
  Top = 198
  Height = 188
  Width = 226
  object xget_tallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 100
    SelectSQL.Strings = (
      'SELECT * FROM XGET_TALLAS')
    UniDirectional = False
    Left = 56
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 136
    Top = 24
  end
end
