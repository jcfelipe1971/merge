object DMLstEntrefechasAlbArt: TDMLstEntrefechasAlbArt
  OldCreateOrder = False
  OnCreate = ZDMLstEntrefechasCreate
  Left = 430
  Top = 556
  Height = 342
  Width = 354
  object xArt_Desde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo_largo as titulo FROM ART_ARTICULOS'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 40
    Top = 64
  end
  object DSxArt_Desde: TDataSource
    DataSet = xArt_Desde
    Left = 104
    Top = 64
  end
  object SPMinMaxFechaArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure DAME_MIN_MAX_FECHA_ARTICULO'
      '(?empresa,?ejercicio,?canal,?serie,?tipo,?almacen)')
    Transaction = TLocal
    AutoTrans = True
    Left = 200
    Top = 64
  end
  object xArt_Hasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT titulo_largo as titulo FROM ART_ARTICULOS'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 40
    Top = 112
  end
  object DSxArt_Hasta: TDataSource
    DataSet = xArt_Hasta
    Left = 104
    Top = 112
  end
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_GES_ESTADOS'
      'WHERE estado=?estado')
    UniDirectional = False
    Left = 40
    Top = 16
  end
  object DSxEstados: TDataSource
    DataSet = xEstados
    Left = 104
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 200
    Top = 16
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS' 
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 40
    Top = 160
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 104
    Top = 160
  end
end
