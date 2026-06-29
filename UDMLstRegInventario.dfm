object DMLstRegInventario: TDMLstRegInventario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 567
  Top = 251
  Height = 332
  Width = 436
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 48
    Top = 16
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM ART_REG_INVENTARIO'
      'WHERE EMPRESA = ?EMPRESA AND'
      '  EJERCICIO_MOV = ?EJERCICIO AND'
      '  CANAL = ?CANAL AND'
      '  RIG = ?RIG')
    SelectSQL.Strings = (
      'SELECT * FROM ART_REG_INVENTARIO'
      'WHERE '
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO_MOV = ?EJERCICIO AND'
      'CANAL = ?CANAL'
      'ORDER BY RIG')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 48
    Top = 64
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_REG_INVENTARIO_DETALLE '
      'WHERE'
      'ID_REG=?ID_REG'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 48
    Top = 112
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 160
    Top = 64
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 160
    Top = 112
  end
  object frxRegInventario: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 45320.755154213
    ReportOptions.LastChange = 45320.755154213
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxRegInventarioBeforePrint
    OnGetValue = frxRegInventarioGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 264
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frRegInventario: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frRegInventarioGetValue
    OnBeforePrint = frRegInventarioEnterRect
    OnEnterRect = frRegInventarioEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 160
    Top = 16
    ReportForm = {19000000}
  end
  object frDSQMCabecera: TfrDBDataSet
    DataSource = DSQMCabecera
    Left = 264
    Top = 64
  end
  object frDSQMDetalle: TfrDBDataSet
    DataSource = DSQMDetalle
    Left = 264
    Top = 112
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 0
    ValorGrupo = 0
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = False
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    ControlaLongitud = True
    Left = 344
    Top = 16
  end
  object xAlmacen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_ALMACENES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ALMACEN = :ALMACEN')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 48
    Top = 160
  end
  object DSxAlmacen: TDataSource
    DataSet = xAlmacen
    Left = 160
    Top = 160
  end
end
