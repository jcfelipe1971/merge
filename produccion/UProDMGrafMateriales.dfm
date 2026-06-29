object ProDMGrafMateriales: TProDMGrafMateriales
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 16
  end
  object xGrafCosteMateriales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_graf_comparacion_materiales(?id_orden)')
    UniDirectional = False
    Left = 48
    Top = 15
  end
end
