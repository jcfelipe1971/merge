object DMPregEtiqAgrup: TDMPregEtiqAgrup
  OldCreateOrder = False
  OnCreate = DMPregAgrupTerCreate
  Left = 905
  Top = 225
  Height = 281
  Width = 251
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 38
    Top = 26
  end
  object xAgrupClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA = ?EMPRESA AND'
      'AGRUPACION = ?AGRUPACION')
    UniDirectional = False
    Left = 38
    Top = 96
  end
  object DSxAgrupClientes: TDataSource
    DataSet = xAgrupClientes
    Left = 140
    Top = 96
  end
  object xAgrupProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_PROVEEDOR'
      'WHERE EMPRESA = ?EMPRESA AND'
      'AGRUPACION = ?AGRUPACION')
    UniDirectional = False
    Left = 38
    Top = 150
  end
  object DSxAgrupProveedores: TDataSource
    DataSet = xAgrupProveedores
    Left = 142
    Top = 150
  end
end
