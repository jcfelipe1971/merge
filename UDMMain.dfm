object DMMain: TDMMain
  OldCreateOrder = False
  OnCreate = DMMainCreate
  OnDestroy = DMMainDestroy
  Left = 415
  Top = 157
  Height = 714
  Width = 932
  object PSDImpresora: TPrinterSetupDialog
    Left = 392
    Top = 56
  end
  object DataBase: THYDatabase
    DBName = 'ServidorFB:ABSHOT'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    DefaultTransaction = TLocal
    Timeout = 0
    Left = 32
    Top = 8
  end
  object Teclas: TTeclas
    ActualizarPopUps = False
    TecNFirst = 16464
    TecNPrior = 16449
    TecNNext = 16467
    TecNLast = 16469
    TecNInsert = 16429
    TecNDelete = 16430
    TecNEdit = 16453
    TecNPost = 16455
    TecNCancel = 16472
    TecNRefresh = 16466
    TecNEnlace = 8305
    TecXBuscar = 16450
    TecXAprox = 16465
    TecXExacta = 16471
    TecXImprime = 16457
    TecXRango = 16454
    TecXReport = 16460
    TecXCopy = 16451
    TecXCut = 16472
    TecXPaste = 16470
    TecXSalir = 16499
    Left = 392
    Top = 104
  end
  object EntornoBusqueda: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 392
    Top = 8
  end
  object ILOrdGrid: TImageList
    AllocBy = 3
    Left = 32
    Top = 104
  end
  object ToolbarImages: TImageList
    Left = 32
    Top = 152
  end
  object QListados: TFIBTableSet
    Database = DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM DIC_LISTADOS'
      'WHERE'
      '  LISTADO=?old_LISTADO ')
    InsertSQL.Strings = (
      'INSERT INTO DIC_LISTADOS'
      '  (DEF_LISTADO,GRUPO,TITULO,LISTADO,EDITABLE,CABECERA,TIPO)'
      'VALUES'
      
        '  (?DEF_LISTADO,?GRUPO,?TITULO,?LISTADO,?EDITABLE,?CABECERA,?TIP' +
        'O)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM DIC_LISTADOS'
      'WHERE'
      '  LISTADO=?LISTADO ')
    SelectSQL.Strings = (
      'SELECT * FROM DIC_LISTADOS'
      'WHERE LISTADO=?LISTADO'
      '')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE DIC_LISTADOS'
      'SET'
      '  DEF_LISTADO=?DEF_LISTADO '
      '  ,GRUPO=?GRUPO '
      '  ,TITULO=?TITULO '
      '  ,EDITABLE=?EDITABLE '
      '  ,CABECERA=?CABECERA '
      '  ,TIPO=?TIPO '
      'WHERE'
      '  LISTADO=?LISTADO ')
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'LISTADO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'DIC_LISTADOS'
    UpdateTransaction = TLocal
    Left = 392
    Top = 296
    object QListadosLISTADO: TIntegerField
      DisplayLabel = 'Listado'
      FieldName = 'LISTADO'
    end
    object QListadosGRUPO: TIntegerField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
    end
    object QListadosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QListadosDEF_LISTADO: TBlobField
      DisplayLabel = 'Def. Listado'
      FieldName = 'DEF_LISTADO'
      Size = 8
    end
    object QListadosEDITABLE: TIntegerField
      DisplayLabel = 'Editable'
      FieldName = 'EDITABLE'
    end
    object QListadosCABECERA: TIntegerField
      DisplayLabel = 'Cabecera'
      FieldName = 'CABECERA'
    end
    object QListadosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object HYPrinterOptions: THYPrinterOptions
    Codigos.Strings = (
      #27'C'
      #12
      ''
      ''
      #18
      #15
      #14
      #27'G'
      ''
      #18
      #18
      #27'H'
      ''
      ''
      '')
    RatioComprimida = 1.65
    RatioExpandida = 0.5
    Left = 480
    Top = 56
  end
  object xFactorMoneda: TFIBTableSetRO
    Database = DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MONEDAS_CAMBIOS'
      'WHERE'
      '  NUM_CAMBIO=?NUM_CAMBIO ')
    SelectSQL.Strings = (
      'SELECT ORIGEN, DESTINO, F_ALTA, FACTOR  FROM SYS_MONEDAS_CAMBIOS'
      'ORDER BY F_ALTA DESC')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'NUM_CAMBIO ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'SYS_MONEDAS_CAMBIOS'
    Left = 392
    Top = 392
  end
  object frRxRichObject1: TfrRxRichObject
    Left = 32
    Top = 344
  end
  object frPrintGrid1: TfrPrintGrid
    FitWidth.Enabled = False
    FitWidth.ShrinkOptions = [frsoProportional, frsoShrinkOnly]
    FitWidth.ResizePercent = 30
    FitWidth.ApplyBeforeOnCustomize = False
    PageSize = 9
    PageWidth = 0
    PageHeight = 0
    PageMargins.Left = 0
    PageMargins.Top = 0
    PageMargins.Right = 0
    PageMargins.Bottom = 0
    Title.Font.Charset = DEFAULT_CHARSET
    Title.Font.Color = clWindowText
    Title.Font.Height = -16
    Title.Font.Name = 'Arial'
    Title.Font.Style = [fsBold]
    Title.Color = clWhite
    Title.Frame = []
    Title.FrameWidth = 1
    PageHeader.Font.Charset = DEFAULT_CHARSET
    PageHeader.Font.Color = clWindowText
    PageHeader.Font.Height = -13
    PageHeader.Font.Name = 'Arial'
    PageHeader.Font.Style = []
    PageHeader.Color = clWhite
    PageHeader.Frame = []
    PageHeader.FrameWidth = 1
    PageFooter.Font.Charset = DEFAULT_CHARSET
    PageFooter.Font.Color = clWindowText
    PageFooter.Font.Height = -13
    PageFooter.Font.Name = 'Arial'
    PageFooter.Font.Style = []
    PageFooter.Color = clWhite
    PageFooter.Frame = []
    PageFooter.FrameWidth = 1
    Header.Font.Charset = DEFAULT_CHARSET
    Header.Font.Color = clWhite
    Header.Font.Height = -13
    Header.Font.Name = 'Arial'
    Header.Font.Style = [fsBold]
    Header.Color = clNavy
    Header.Frame = [frLeft, frTop, frRight, frBottom]
    Header.FrameWidth = 1
    Body.Font.Charset = DEFAULT_CHARSET
    Body.Font.Color = clWindowText
    Body.Font.Height = -13
    Body.Font.Name = 'Arial'
    Body.Font.Style = []
    Body.Color = clWhite
    Body.Frame = [frLeft, frTop, frRight, frBottom]
    Body.FrameWidth = 1
    Left = 112
    Top = 344
  end
  object frRoundRectObject1: TfrRoundRectObject
    Left = 200
    Top = 296
  end
  object frChartObject1: TfrChartObject
    Left = 112
    Top = 296
  end
  object frBarCodeObject1: TfrBarCodeObject
    Left = 32
    Top = 296
  end
  object frOLEObject1: TfrOLEObject
    Left = 32
    Top = 248
  end
  object frHTMExport1: TfrHTMExport
    ScaleX = 1
    ScaleY = 1
    Left = 112
    Top = 248
  end
  object frCSVExport1: TfrCSVExport
    ScaleX = 1
    ScaleY = 1
    Delimiter = ';'
    Left = 200
    Top = 248
  end
  object frTextExport1: TfrTextExport
    ScaleX = 1
    ScaleY = 1
    Left = 32
    Top = 200
  end
  object frRTFExport1: TfrRTFExport
    ScaleX = 1.3
    ScaleY = 1
    Left = 200
    Top = 200
  end
  object frFIBComponents1: TfrFIBComponents
    Left = 200
    Top = 344
  end
  object frDataStorage1: TfrDataStorage
    Left = 112
    Top = 200
  end
  object frRichObject1: TfrRichObject
    Left = 288
    Top = 200
  end
  object frCheckBoxObject1: TfrCheckBoxObject
    Left = 288
    Top = 248
  end
  object frShapeObject1: TfrShapeObject
    Left = 288
    Top = 296
  end
  object frCrossObject1: TfrCrossObject
    Left = 32
    Top = 392
  end
  object frDialogControls1: TfrDialogControls
    Left = 112
    Top = 392
  end
  object frHyDesigner1: TfrHyDesigner
    Left = 288
    Top = 344
  end
  object FSLookAndFeel: TLFFibFormStorage
    Options = []
    UseRegistry = False
    StoredValues = <>
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 392
    Top = 152
  end
  object ILMain_In: TImageList
    Left = 112
    Top = 56
  end
  object ILMain_Ac: TImageList
    Left = 32
    Top = 56
  end
  object frHYReport1: TfrHYReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    Left = 200
    Top = 392
    ReportForm = {19000000}
  end
  object PsfrPDFExport1: TPsfrPDFExport
    Default = True
    ImageDPI = 200
    ImagePixelFormat = pfDevice
    JPEGQuality = 50
    ExportImageFormat = ifJPG
    EncryptionLevel = el40Bit
    Left = 536
    Top = 488
  end
  object PsfrHTMLExport1: TPsfrHTMLExport
    LinkFont.Charset = DEFAULT_CHARSET
    LinkFont.Color = clBlue
    LinkFont.Height = -24
    LinkFont.Name = 'Wingdings'
    LinkFont.Style = []
    Left = 624
    Top = 488
  end
  object PsfrRTFExport1: TPsfrRTFExport
    ExportImageFormat = ifJPG
    Left = 624
    Top = 536
  end
  object PsfrEXCELExport1: TPsfrEXCELExport
    ExportImages = False
    ExportFrames = False
    LineSpacing = lsActual
    PositionalGridDimensions.Height = 4234
    PositionalGridDimensions.Width = 16934
    Left = 720
    Top = 488
  end
  object PsfrJPEGExport1: TPsfrJPEGExport
    ScaleX = 1
    ScaleY = 1
    Left = 536
    Top = 536
  end
  object PsfrGIFExport1: TPsfrGIFExport
    ScaleX = 1
    ScaleY = 1
    Left = 720
    Top = 536
  end
  object PsfrBMPExport1: TPsfrBMPExport
    ScaleX = 1
    ScaleY = 1
    Left = 536
    Top = 584
  end
  object PsfrEMFExport1: TPsfrEMFExport
    ScaleX = 1
    ScaleY = 1
    Left = 624
    Top = 584
  end
  object PsfrWMFExport1: TPsfrWMFExport
    ScaleX = 1
    ScaleY = 1
    Left = 720
    Top = 584
  end
  object frxReport1: TfrxReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38671.6417249306
    ReportOptions.LastChange = 38671.6417249306
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 440
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxRTFExport1: TfrxRTFExport
    UseFileCache = True
    ShowProgress = True
    Wysiwyg = True
    Creator = 'FastReport http://www.fast-report.com'
    Left = 32
    Top = 488
  end
  object frxRichObject1: TfrxRichObject
    Left = 112
    Top = 536
  end
  object frxOLEObject1: TfrxOLEObject
    Left = 200
    Top = 584
  end
  object frxHTMLExport1: TfrxHTMLExport
    UseFileCache = True
    ShowProgress = True
    FixedWidth = True
    Background = False
    Left = 112
    Top = 488
  end
  object frxCSVExport1: TfrxCSVExport
    UseFileCache = True
    ShowProgress = True
    Separator = ';'
    OEMCodepage = False
    Left = 32
    Top = 440
  end
  object frxCheckBoxObject1: TfrxCheckBoxObject
    Left = 32
    Top = 584
  end
  object frxBarCodeObject1: TfrxBarCodeObject
    Left = 32
    Top = 536
  end
  object frxChartObject1: TfrxChartObject
    Left = 440
    Top = 536
  end
  object frxFIBHYComponents1: TfrxFIBHYComponents
    Left = 440
    Top = 584
  end
  object frxHYDesigner1: TfrxHYDesigner
    DefaultScriptLanguage = 'PascalScript'
    DefaultFont.Charset = DEFAULT_CHARSET
    DefaultFont.Color = clWindowText
    DefaultFont.Height = -13
    DefaultFont.Name = 'Arial'
    DefaultFont.Style = []
    DefaultLeftMargin = 10
    DefaultRightMargin = 10
    DefaultTopMargin = 10
    DefaultBottomMargin = 10
    DefaultPaperSize = 9
    DefaultOrientation = poPortrait
    Restrictions = []
    RTLLanguage = False
    Left = 200
    Top = 488
  end
  object frxCrossObject1: TfrxCrossObject
    Left = 112
    Top = 584
  end
  object frxDialogControls1: TfrxDialogControls
    Left = 200
    Top = 536
  end
  object frxDotMatrixExport: TfrxDotMatrixExport
    UseFileCache = True
    ShowProgress = True
    EscModel = 0
    GraphicFrames = False
    SaveToFile = False
    UseIniSettings = True
    Left = 288
    Top = 488
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    PrintOptimized = True
    Outline = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Background = False
    Creator = 'FastReport (http://www.fast-report.com)'
    HTMLTags = True
    Left = 112
    Top = 440
  end
  object frxHYMailExport: TfrxHYMailExport
    UseFileCache = True
    ShowProgress = True
    ShowExportDialog = True
    SmtpPort = 25
    UseIniFile = False
    BaseDeDatos = DataBase
    Transaction = TLocal
    Left = 288
    Top = 536
  end
  object frOLEExcelExport1: TfrOLEExcelExport
    Left = 816
    Top = 488
  end
  object frRtfAdvExport1: TfrRtfAdvExport
    Left = 816
    Top = 536
  end
  object frHTML2Export1: TfrHTML2Export
    Scale = 1
    Navigator.Position = []
    Navigator.Font.Charset = DEFAULT_CHARSET
    Navigator.Font.Color = clWindowText
    Navigator.Font.Height = -11
    Navigator.Font.Name = 'MS Sans Serif'
    Navigator.Font.Style = []
    Navigator.InFrame = False
    Navigator.WideInFrame = False
    Left = 816
    Top = 584
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 112
    Top = 8
  end
  object LFManager: TLFManager
    IniStorage = FSLookAndFeel
    Left = 480
    Top = 152
  end
  object frxXLSExport: TfrxXLSExport
    UseFileCache = True
    ShowProgress = True
    ExportStyles = False
    MergeCells = False
    AsText = False
    Background = False
    FastExport = True
    PageBreaks = False
    Left = 288
    Top = 440
  end
  object frxXMLExport: TfrxXMLExport
    UseFileCache = True
    ShowProgress = True
    ExportStyles = False
    ExportPageBreaks = False
    Background = True
    Creator = 'FastReport'
    Left = 288
    Top = 584
  end
  object ILOrdenFabricacion: TImageList
    Left = 200
    Top = 56
  end
  object ILTPV_Ac: TImageList
    AllocBy = 3
    Height = 48
    Width = 48
    Left = 112
    Top = 104
  end
  object ILTPV_In: TImageList
    AllocBy = 3
    Height = 48
    Width = 48
    Left = 200
    Top = 104
  end
  object DataBaseAdjuntos: THYDatabase
    DBName = 'ServidorFB:PROLASE-ADJ'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    DefaultTransaction = TLocalAdjuntos
    Timeout = 0
    Left = 632
    Top = 8
  end
  object TLocalAdjuntos: THYTransaction
    Active = False
    DefaultDatabase = DataBaseAdjuntos
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 728
    Top = 8
  end
  object DataBaseImagenes: THYDatabase
    DBName = 'ServidorFB:PROLASE-IMG'
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    DefaultTransaction = TLocalImagenes
    Timeout = 0
    Left = 632
    Top = 56
  end
  object TLocalImagenes: THYTransaction
    Active = False
    DefaultDatabase = DataBaseImagenes
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 728
    Top = 56
  end
  object TDesconexionBaseAdjunto: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TDesconexionBaseAdjuntoTimer
    Left = 632
    Top = 104
  end
  object TDesconexionBaseImagenes: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TDesconexionBaseImagenesTimer
    Left = 632
    Top = 152
  end
end
