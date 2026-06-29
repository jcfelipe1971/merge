object FMLstEntreFechasArt: TFMLstEntreFechasArt
  Left = 430
  Top = 294
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Listados'
  ClientHeight = 343
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 592
    Height = 40
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 72
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    ShowCaptions = True
    TabOrder = 0
    Separators = True
    object TButtImprimir2: TToolButton
      Left = 0
      Top = 0
      Hint = 'Imprimir'
      Caption = '&Imprimir'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtImprimir2Click
    end
    object TButtPrevisualizar2: TToolButton
      Left = 72
      Top = 0
      Hint = 'Previsualizar'
      Caption = '&Previsualizar'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtPrevisualizar2Click
    end
    object TButtSalir2: TToolButton
      Left = 144
      Top = 0
      Hint = 'Salir'
      Caption = '&Salir'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtSalir2Click
    end
    object TButtConfRapida: TToolButton
      Left = 216
      Top = 0
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      Caption = 'Conf. R'#225'pida'
      ImageIndex = 77
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtConfRapidaClick
    end
    object TButtExportar: TToolButton
      Left = 288
      Top = 0
      Hint = 'Exportar datos'
      Caption = '&Exportar'
      ImageIndex = 36
      OnClick = TButtExportarClick
    end
  end
  object GBFechas: TGroupBox
    Left = 0
    Top = 40
    Width = 592
    Height = 75
    Align = alTop
    Caption = 'Fechas'
    TabOrder = 1
    object LDesdeFecha: TLFLabel
      Left = 54
      Top = 22
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LHastaFEcha: TLFLabel
      Left = 57
      Top = 42
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object DTPDesde: TLFDateEdit
      Left = 90
      Top = 18
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object DTPHasta: TLFDateEdit
      Left = 90
      Top = 40
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
  end
  object GBEstado: TGroupBox
    Left = 0
    Top = 115
    Width = 592
    Height = 75
    Align = alTop
    Caption = 'Estado'
    TabOrder = 2
    object EFEstado: TLFEditFind2000
      Left = 90
      Top = 37
      Width = 66
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnChange = EFEstadoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'ESTADO'
      CampoNum = 'ESTADO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'SYS_GES_ESTADOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'ESTADO')
      Filtros = []
    end
    object CHBTodas: TLFCheckBox
      Left = 90
      Top = 19
      Width = 69
      Height = 17
      Caption = '&Todas'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 0
      TabStop = True
      OnClick = CHBTodasClick
      Alignment = taLeftJustify
    end
    object DBEEstado: TLFDbedit
      Left = 157
      Top = 37
      Width = 270
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstEntreFechasArt.DSxEstados
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
  end
  object GBArticulo: TGroupBox
    Left = 0
    Top = 190
    Width = 592
    Height = 78
    Align = alTop
    Caption = 'Art'#237'culo'
    TabOrder = 3
    object LDesdeArticulo: TLFLabel
      Left = 13
      Top = 25
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LHastaARticulo: TLFLabel
      Left = 16
      Top = 47
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object EFArtDesde: TLFEditFind2000
      Left = 48
      Top = 21
      Width = 108
      Height = 21
      TabOrder = 0
      OnChange = EFArtDesdeChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'TITULO')
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArtDesdeBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EArticuloDesde: TLFEdit
      Left = 157
      Top = 21
      Width = 402
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object EFArtHasta: TLFEditFind2000
      Left = 48
      Top = 43
      Width = 108
      Height = 21
      TabOrder = 1
      OnChange = EFArtHastaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'TITULO')
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArtHastaBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EArticuloHasta: TLFEdit
      Left = 157
      Top = 43
      Width = 402
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
  end
  object GBMoneda: TGroupBox
    Left = 0
    Top = 268
    Width = 592
    Height = 75
    Align = alClient
    Caption = 'Moneda a Emplear'
    TabOrder = 4
    object EFMoneda: TLFEditFind2000
      Left = 90
      Top = 29
      Width = 66
      Height = 21
      TabOrder = 0
      OnChange = EFMonedaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'MONEDA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_MONEDAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'MONEDA')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object EMoneda: TLFEdit
      Left = 157
      Top = 29
      Width = 380
      Height = 21
      Color = clInfoBk
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
