object FSelecAgrupFac: TFSelecAgrupFac
  Left = 299
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Selecci'#243'n de Facturas para la Agrupaci'#243'n'
  ClientHeight = 446
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGMain: TDBGridFind2000
    Left = 0
    Top = 52
    Width = 758
    Height = 394
    Align = alClient
    DataSource = DMAgrupacionFac.DSxSeleccionCabeceras
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGMainDblClick
    OnKeyPress = DBGMainKeyPress
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    AutoCambiarColumna = False
    AutoPostEnCheckBox = False
    AutoStartDrag = False
    AutoStartDragInterval = 0
    IndiceBitmapOrdenable = 0
    IndiceBitmapAscendente = 1
    IndiceBitmapChecked = 3
    IndiceBitmapDescendente = 2
    BuscarNums = False
    CampoAOrdenarColor = clInfoBk
    CampoAOrdenarBitmaps = DMMain.ILOrdGrid
    MensajeNoExiste = False
    SalirSiVacio = False
    SalirSiNoExiste = False
    Posicion = tpCentrado
    OrdenMultiple = True
    Filtros = []
    Entorno = DMMain.EntornoBusqueda
    Columns = <
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'EMPRESA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 36
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'EJERCICIO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 53
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'CANAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 39
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'SERIE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 68
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'RIG'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 46
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'MONEDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 45
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'FECHA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 69
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'SU_REFERENCIA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 212
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'FORMA_PAGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 36
        Visible = True
      end
      item
        Color = clInfoBk
        Expanded = False
        FieldName = 'LIQUIDO_MONEDA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ReadOnly = True
        Width = 111
        Visible = True
      end>
  end
  object TBmain: TLFToolBar
    Left = 0
    Top = 0
    Width = 758
    Height = 26
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 88
      Height = 22
      DataSource = DMAgrupacionFac.DSxSeleccionCabeceras
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object ToolButton2: TToolButton
      Left = 88
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtFiltra: TToolButton
      Left = 96
      Top = 0
      Action = AFiltrar
      ParentShowHint = False
      ShowHint = True
    end
    object TButtExit: TToolButton
      Left = 119
      Top = 0
      Action = ASalir
      ParentShowHint = False
      ShowHint = True
    end
    object TButtFiltro: TToolButton
      Left = 142
      Top = 0
      Action = AFiltroOriginal
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton1: TToolButton
      Left = 165
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PNLTBMain: TLFPanel
      Left = 173
      Top = 0
      Width = 580
      Height = 22
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LAgrupacion: TLFLabel
        Left = 15
        Top = 4
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EFAgrupacion: TFIBHYGEditFind
        Left = 86
        Top = 0
        Width = 64
        Height = 21
        TabOrder = 0
        OnChange = EFAgrupacionChange
        OnExit = EFAgrupacionExit
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'empresa=1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_AGRUPACIONES_CLIENTE'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
      end
      object DBETitAgrupacion: TLFDbedit
        Left = 151
        Top = 0
        Width = 238
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMAgrupacionFac.DSxAgrupacion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  object TBFechas: TLFToolBar
    Left = 0
    Top = 26
    Width = 758
    Height = 26
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 2
    Separators = True
    object PNLFechas: TLFPanel
      Left = 0
      Top = 0
      Width = 377
      Height = 22
      BevelOuter = bvNone
      TabOrder = 0
      object LFechaDesde: TLFLabel
        Left = 13
        Top = 5
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFechaHasta: TLFLabel
        Left = 208
        Top = 5
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DTDesde: TLFDateEdit
        Left = 95
        Top = 1
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTHasta: TLFDateEdit
        Left = 287
        Top = 1
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object ToolButton5: TToolButton
      Left = 377
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtFechas: TToolButton
      Left = 385
      Top = 0
      Action = AFechas
      ParentShowHint = False
      ShowHint = True
    end
    object PNLInfo: TLFPanel
      Left = 408
      Top = 0
      Width = 346
      Height = 22
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 108
    Top = 106
    object AFiltrar: TAction
      Caption = 'Filtrar Facturas'
      Hint = 'Filtrar Facturas'
      ImageIndex = 46
      ShortCut = 16454
      OnExecute = AFiltrarExecute
    end
    object ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
      ImageIndex = 0
      ShortCut = 16499
      OnExecute = ASalirExecute
    end
    object AFechas: TAction
      Caption = 'A'#241'adir Fechas al Filtro'
      Hint = 'A'#241'adir Fechas al Filtro'
      ImageIndex = 11
      OnExecute = AFechasExecute
    end
    object AFiltroOriginal: TAction
      Caption = 'Regenerar Filtro General'
      Hint = 'Regenerar Filtro General'
      ImageIndex = 26
      OnExecute = AFiltroOriginalExecute
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 344
    Top = 96
  end
  object CEMainPMEdit: TPopUpTeclas
    Images = DMMain.ILMain_Ac
    Teclas = DMMain.Teclas
    Left = 392
    Top = 96
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
    object CEMainMICerrar: TMenuItem
      Action = ASalir
      RadioItem = True
    end
  end
end
