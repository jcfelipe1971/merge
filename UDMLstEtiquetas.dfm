object DMLstEtiquetas: TDMLstEtiquetas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 508
  Top = 424
  Height = 300
  Width = 450
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 32
    Top = 16
  end
  object DSxTemp: TDataSource
    DataSet = xTemp
    Left = 112
    Top = 64
  end
  object xTemp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM TMP_COD_BARRAS'
      'WHERE'
      'ENTRADA = ?ENTRADA AND'
      '('
      'CODIGOBARRAS STARTING WITH ?CODIGOBARRAS /* EL SELECCIONADO*/'
      'OR ID_A = 0 /* LOS QUE SE DEJAN EN BLANCO */'
      ')')
    UniDirectional = False
    AfterOpen = xTempAfterOpen
    Left = 32
    Top = 64
  end
  object frArticulos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frArticulosGetValue
    OnBeforePrint = frArticulosEnterRect
    OnEnterRect = frArticulosEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 192
    Top = 16
    ReportForm = {19000000}
  end
  object frDBDSxTemp: TfrDBDataSet
    DataSource = DSxTemp
    OnFirst = frDBDSxTempFirst
    OnNext = frDBDSxTempNext
    Left = 192
    Top = 64
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
    Left = 112
    Top = 16
  end
  object frxArticulos: TfrxHYReport
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
    OnBeforePrint = frxArticulosBeforePrint
    OnGetValue = frxArticulosGetValue
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
  object frxDBDSxTemp: TfrxDBDataset
    UserName = 'frxDBDSxTemp'
    OnFirst = frDBDSxTempFirst
    OnNext = frDBDSxTempNext
    CloseDataSource = False
    DataSource = DSxTemp
    Left = 264
    Top = 64
  end
  object xCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_ALBARAN_PROV'
      'WHERE '
      'ID_E = ?ID_E')
    UniDirectional = False
    Left = 32
    Top = 112
  end
  object xArticuloIdioma: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM ART_ARTICULOS_IDIOMAS'
      'WHERE'
      'EMPRESA = ?EMPRESA AND '
      'ARTICULO = ?ARTICULO AND'
      'IDIOMA = ?IDIOMA')
    UniDirectional = False
    DataSource = DSxTemp
    Left = 32
    Top = 160
  end
  object DSDSxArticuloIdioma: TDataSource
    DataSet = xArticuloIdioma
    Left = 112
    Top = 160
  end
end
