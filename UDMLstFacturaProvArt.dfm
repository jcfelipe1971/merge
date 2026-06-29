object DMLstFacturaProvArt: TDMLstFacturaProvArt
  OldCreateOrder = False
  OnCreate = DMLstFacturaProvArtCreate
  OnDestroy = DMLstFacturaDestroy
  Left = 505
  Top = 284
  Height = 328
  Width = 346
  object frFactura: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frFacturaGetValue
    OnBeforePrint = frFacturaEnterRect
    OnEnterRect = frFacturaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    OpenDataSource = False
    Left = 192
    Top = 64
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 112
    Top = 64
  end
  object frDSxArticulo: TfrDBDataSet
    DataSource = DSxArticulo
    Left = 192
    Top = 112
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 112
    Top = 112
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 112
    Top = 16
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERA_DETALLE_FAC_PROV'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :DESDE AND'
      'FECHA <= :HASTA AND'
      'ARTICULO >= :ARTICULO AND'
      'ARTICULO <= :ARTICULO2 AND'
      'ESTADO = :ESTADO'
      'ORDER BY ARTICULO, FECHA, RIG')
    UniDirectional = False
    AfterOpen = QMDetalleAfterOpen
    BeforeClose = QMDetalleBeforeClose
    Left = 32
    Top = 64
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ARTICULOS_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'ARTICULO = :ARTICULO')
    UniDirectional = False
    DataSource = DSDetalle
    Left = 32
    Top = 112
  end
end
