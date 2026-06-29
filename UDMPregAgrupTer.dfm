object DMPregAgrupTer: TDMPregAgrupTer
  OldCreateOrder = False
  OnCreate = DMPregAgrupTerCreate
  Left = 413
  Top = 226
  Height = 456
  Width = 483
  object xTiposDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_TIPOS_DESTINO'
      'WHERE TIPO = ?TIPO')
    UniDirectional = False
    Left = 48
    Top = 32
  end
  object DSxTiposDestino: TDataSource
    DataSet = xTiposDestino
    Left = 144
    Top = 32
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 256
    Top = 32
  end
  object xAgrupacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_AGRUPACIONES_CLIENTE'
      'WHERE EMPRESA = ?EMPRESA AND'
      'AGRUPACION = ?AGRUPACION')
    UniDirectional = False
    Left = 48
    Top = 80
  end
  object DSxAgrupacion: TDataSource
    DataSet = xAgrupacion
    Left = 144
    Top = 80
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 144
    Top = 128
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL  FROM SYS_TERCEROS'
      'WHERE TERCERO = ?TERCERO')
    UniDirectional = False
    Left = 48
    Top = 128
  end
end
