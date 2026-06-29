object DMLstFacturaArt: TDMLstFacturaArt
  OldCreateOrder = False
  OnCreate = DMLstFacturaArtCreate
  OnDestroy = DMLstFacturaDestroy
  Left = 654
  Top = 185
  Height = 352
  Width = 379
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
    Left = 24
    Top = 8
    ReportForm = {19000000}
  end
  object frDBDetalle: TfrDBDataSet
    DataSource = DSDetalle
    OpenDataSource = False
    Left = 184
    Top = 56
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERA_DETALLE_FAC'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA AND'
      'ARTICULO >= :ARTICULO_DESDE AND'
      'ARTICULO <= :ARTICULO_HASTA AND'
      'ESTADO = :ESTADO'
      'ORDER BY ARTICULO, FECHA, RIG, LINEA')
    UniDirectional = False
    AfterOpen = QMDetalleAfterOpen
    BeforeClose = QMDetalleBeforeClose
    Left = 24
    Top = 56
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 104
    Top = 56
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    RefreshSQL.Strings = (
      '')
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
    Left = 24
    Top = 200
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CLIENTES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'CLIENTE = :CLIENTE')
    UniDirectional = False
    DataSource = DSxFactura
    Left = 24
    Top = 152
  end
  object DSxFactura: TDataSource
    DataSet = xFactura
    Left = 104
    Top = 104
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 104
    Top = 8
  end
  object xFactura: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERAS_FACTURA_LST'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = '#39'FAC'#39' AND'
      'RIG = :RIG')
    UniDirectional = False
    DataSource = DSDetalle
    AfterOpen = xFacturaAfterOpen
    BeforeClose = xFacturaBeforeClose
    Left = 24
    Top = 104
  end
end
