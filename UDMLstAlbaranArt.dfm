object DMLstAlbaranArt: TDMLstAlbaranArt
  OldCreateOrder = False
  OnCreate = DMLstAlbaranArtCreate
  OnDestroy = DMLstAlbaranArtDestroy
  Left = 495
  Top = 170
  Height = 352
  Width = 379
  object frAlbaran: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frAlbaranGetValue
    OnBeforePrint = frAlbaranEnterRect
    OnEnterRect = frAlbaranEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 184
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
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERA_DETALLE_ALB'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'FECHA >= :DESDE AND'
      'FECHA <= :HASTA AND'
      'ARTICULO <= :ARTICULO2 AND'
      'ARTICULO >= :ARTICULO AND'
      'ESTADO = :ESTADO'
      'ORDER BY ARTICULO, FECHA, RIG')
    UniDirectional = False
    AfterOpen = QMDetalleAfterOpen
    AfterScroll = QMDetalleAfterScroll
    Left = 32
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
    Left = 32
    Top = 200
  end
  object xCliente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
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
    DataSource = DSxAlbaran
    Left = 32
    Top = 152
  end
  object DSxAlbaran: TDataSource
    DataSet = xAlbaran
    Left = 104
    Top = 104
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
    Left = 264
    Top = 8
  end
  object xAlbaran: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = '#39'FAC'#39' AND'
      'RIG = :RIG')
    UniDirectional = False
    DataSource = DSDetalle
    AfterOpen = xAlbaranAfterOpen
    AfterScroll = xAlbaranAfterScroll
    Left = 32
    Top = 104
  end
  object SPDameCambio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure s_cambia_importe(?ORIGEN,?DESTINO,?FECHA,?IMPO' +
        'RTE,0)')
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 56
  end
end
