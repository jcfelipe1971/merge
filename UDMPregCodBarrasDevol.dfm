object DMPregCodBarrasDevol: TDMPregCodBarrasDevol
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 338
  Top = 143
  Height = 231
  Width = 265
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 144
    Top = 16
  end
  object xAlmacen_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ALMACENES'
      'where empresa=?empresa and almacen=?almacen')
    UniDirectional = False
    Left = 46
    Top = 71
  end
  object xAlmacen_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT titulo FROM ART_ALMACENES'
      'where empresa=?empresa and almacen=?almacen')
    UniDirectional = False
    Left = 44
    Top = 126
  end
  object DSxAlmacen_Desde: TDataSource
    DataSet = xAlmacen_Desde
    Left = 142
    Top = 71
  end
  object DSxAlmacen_Hasta: TDataSource
    DataSet = xAlmacen_Hasta
    Left = 142
    Top = 127
  end
end
