object DMLstCBDocs: TDMLstCBDocs
  OldCreateOrder = False
  OnCreate = DMLstCBDocsCreate
  OnDestroy = DMLstCBDocsDestroy
  Left = 912
  Top = 219
  Height = 652
  Width = 525
  object frCodBarras: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frCodBarrasGetValue
    OnBeforePrint = frCodBarrasEnterRect
    OnEnterRect = frCodBarrasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 24
    ReportForm = {19000000}
  end
  object frUserDSCodBarras: TfrUserDataset
    RangeEnd = reCount
    Left = 264
    Top = 120
  end
  object frDBxDetalleDoc: TfrDBDataSet
    DataSource = DSxDetalleDoc
    OnFirst = frDBxDetalleDocFirst
    OnNext = frDBxDetalleDocNext
    Left = 264
    Top = 72
  end
  object xDetalleDoc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM C_CREA_CODBARRAS_ALB_FAC(?EMPRESA,?EJERCICIO,?CANA' +
        'L,?SERIE,?TIPO,?RIG,?VACIAS)'
      'ORDER BY LINEA')
    UniDirectional = False
    AfterOpen = xDetalleDocAfterOpen
    Left = 40
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 152
    Top = 24
  end
  object DSxDetalleDoc: TDataSource
    DataSet = xDetalleDoc
    Left = 152
    Top = 72
  end
  object CodBarras: TCodeBar
    Alto = 100
    OrigenY = 0
    OrigenX = 0
    Modulo = 1
    Ratio = 2
    ChequearDigito = False
    TipoChequeo = csmModulo10
    Porcentaje = 20
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 152
    Top = 264
  end
  object xArtBarras: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_BARRAS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 40
    Top = 264
  end
  object xArtTyC: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT  '
      
        ' art.empresa,art.articulo,art.titulo_largo as titulo,art.familia,fam.titulo as t' +
        'it_familia,bar.barras,bar.tipo,'
      
        ' amc.s_color,ac.titulo as tit_color,artt.cod_talla,artt.talla, a' +
        'mc.titulo as titulo_modelo'
      'FROM ART_ARTICULOS ART'
      'left join art_articulos_barras bar'
      'on art.empresa=bar.empresa and art.articulo=bar.articulo'
      'join art_articulos_m_c_tallas amct'
      'on art.id_a_m_c_t = amct.id_a_m_c_t'
      'join art_articulos_mod_color amc'
      'on amct.id_a_m_c = amc.id_a_m_c'
      'join art_tallas artt'
      'on artt.id_a_t = amct.id_a_t'
      'join art_colores ac'
      'on ac.id_a_c = amc.id_a_c'
      'join art_familias fam'
      'on art.empresa = fam.empresa and art.familia=fam.familia'
      'WHERE art.empresa=?empresa and art.articulo = ?articulo')
    UniDirectional = False
    DataSource = DSxDetalleDoc
    Left = 40
    Top = 120
  end
  object DSxArtTyC: TDataSource
    DataSet = xArtTyC
    Left = 152
    Top = 120
  end
  object xArtTarifaNOR: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM ART_TARIFAS_PRECIOS'
      'WHERE '
      'empresa=?empresa and '
      'articulo = ?articulo and'
      'tarifa = '#39'NOR'#39' and '
      'linea = 1')
    UniDirectional = False
    DataSource = DSxDetalleDoc
    Left = 40
    Top = 168
  end
  object DSxArtTarifaNOR: TDataSource
    DataSet = xArtTarifaNOR
    Left = 152
    Top = 168
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS'
      'WHERE ID_A=?ID_A')
    UniDirectional = True
    DataSource = DSxDetalleDoc
    Left = 40
    Top = 216
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 152
    Top = 216
  end
  object frxCodBarras: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxCodBarrasBeforePrint
    OnGetValue = frxCodBarrasGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 264
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxUserDSCodBarras: TfrxUserDataSet
    RangeEnd = reCount
    UserName = 'frxUserDSCodBarras'
    Left = 264
    Top = 168
  end
  object xDocOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERAS_PEDIDO'
      'WHERE'
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSxDetalleDoc
    AfterOpen = xDocOrigenAfterOpen
    BeforeClose = xDocOrigenBeforeClose
    Left = 40
    Top = 344
  end
  object DSxDocOrigen: TDataSource
    DataSet = xDocOrigen
    Left = 152
    Top = 344
  end
  object xDocDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_CABECERAS_PEDIDO_PROV'
      'WHERE'
      'ID_E = :ID_E')
    UniDirectional = False
    DataSource = DSxDetalleDoc
    AfterOpen = xDocDestinoAfterOpen
    BeforeClose = xDocDestinoBeforeClose
    Left = 40
    Top = 392
  end
  object DSxDocDestino: TDataSource
    DataSet = xDocDestino
    Left = 152
    Top = 392
  end
  object xDetalleDocOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_PEDIDO'
      'WHERE'
      'ID_S = :ID_S AND'
      'ID_DETALLES_S = :ID_DETALLES_S')
    UniDirectional = False
    DataSource = DSxDetalleDoc
    Left = 40
    Top = 440
  end
  object DSxDetalleDocOrigen: TDataSource
    DataSet = xDetalleDocOrigen
    Left = 152
    Top = 440
  end
  object xDetalleDocDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_PEDIDO_PROV'
      'WHERE'
      'ID_E = :ID_E AND'
      'ID_DETALLES_E = :ID_DETALLES_E')
    UniDirectional = False
    DataSource = DSxDetalleDoc
    Left = 40
    Top = 488
  end
  object DSxDetalleDocDestino: TDataSource
    DataSet = xDetalleDocDestino
    Left = 152
    Top = 488
  end
  object xProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PROVEEDOR = :PROVEEDOR')
    UniDirectional = False
    DataSource = DSxDocDestino
    Left = 264
    Top = 392
  end
  object DSxProveedor: TDataSource
    DataSet = xProveedor
    Left = 376
    Top = 392
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
    DataSource = DSxDocOrigen
    Left = 264
    Top = 344
  end
  object DSxCliente: TDataSource
    DataSet = xCliente
    Left = 376
    Top = 344
  end
end
