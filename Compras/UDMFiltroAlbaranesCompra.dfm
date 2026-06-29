object DMFiltroAlbaranesCompra: TDMFiltroAlbaranesCompra
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 582
  Top = 381
  Height = 283
  Width = 361
  object QMFiltro: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_ALBARAN_PROV'
      'WHERE '
      'EMPRESA = ?EMPRESA'
      'ORDER BY EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_DETALLE_ALBARAN_PROV'
    UpdateTransaction = TLocal
    Left = 44
    Top = 20
  end
  object DSQMFiltro: TDataSource
    DataSet = QMFiltro
    Left = 156
    Top = 20
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 268
    Top = 18
  end
end
