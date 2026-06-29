object FPregArtFamilias: TFPregArtFamilias
  Left = 386
  Top = 442
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Listado de Movimientos de Art'#237'culos por Familias'
  ClientHeight = 370
  ClientWidth = 533
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
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 533
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 72
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Separators = True
    object TButtRecargar: TToolButton
      Left = 0
      Top = 0
      Action = ARecargar
    end
    object TButtImprimir: TToolButton
      Left = 72
      Top = 0
      Action = AImprimir
    end
    object TButtVisualizar: TToolButton
      Left = 144
      Top = 0
      Action = AVisualizar
    end
    object TButtSalir: TToolButton
      Left = 216
      Top = 0
      Action = ASalir
    end
    object TButtConfRapida: TToolButton
      Left = 288
      Top = 0
      Action = AConfRapida
    end
  end
  object GBFamilia: TGroupBox
    Left = 0
    Top = 41
    Width = 533
    Height = 68
    Align = alTop
    Caption = 'Seleccionar Familia'
    TabOrder = 1
    object EFFam: TLFEditFind2000
      Left = 46
      Top = 25
      Width = 49
      Height = 21
      TabOrder = 0
      OnChange = EFFamChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        '')
      CampoNum = 'FAMILIA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_FAMILIAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFFamBusqueda
      OrdenadoPor.Strings = (
        'FAMILIA')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEFamilia: TLFDbedit
      Left = 96
      Top = 25
      Width = 270
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstFamilias.DSxFamilia
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
  object GBArticulos: TGroupBox
    Left = 0
    Top = 109
    Width = 533
    Height = 100
    Caption = 'Art'#237'culos'
    TabOrder = 2
    object LDesdeArticulo: TLFLabel
      Left = 11
      Top = 38
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LHastaArticulo: TLFLabel
      Left = 14
      Top = 60
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object EFArt_Desde: TLFEditFind2000
      Left = 46
      Top = 34
      Width = 104
      Height = 21
      TabOrder = 0
      OnChange = EFArt_DesdeChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = True
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArt_DesdeBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DBEArticuloDesde: TLFDbedit
      Left = 151
      Top = 34
      Width = 352
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstFamilias.DSxArtDesde
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
    object DBEArticuloHasta: TLFDbedit
      Left = 151
      Top = 56
      Width = 352
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstFamilias.DSxArtHasta
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
    object EFArt_Hasta: TLFEditFind2000
      Left = 46
      Top = 56
      Width = 104
      Height = 21
      TabOrder = 3
      OnChange = EFArt_HastaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArt_HastaBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  object GBMoneda: TGroupBox
    Left = 0
    Top = 297
    Width = 533
    Height = 73
    Align = alBottom
    Caption = 'Moneda a emplear'
    TabOrder = 4
    object EFMoneda: TLFEditFind2000
      Left = 46
      Top = 27
      Width = 66
      Height = 21
      TabOrder = 1
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
    object DBEMoneda: TLFDbedit
      Left = 113
      Top = 27
      Width = 272
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstFamilias.DSxMonedas
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
  object GBSeleccion: TGroupBox
    Left = 0
    Top = 209
    Width = 533
    Height = 88
    TabOrder = 3
    object LBFechaD: TLFLabel
      Left = 143
      Top = 56
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object LBFechaH: TLFLabel
      Left = 303
      Top = 56
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object EFPeriodo: TLFEditFind2000
      Left = 121
      Top = 17
      Width = 77
      Height = 21
      MaxLength = 2
      TabOrder = 2
      OnChange = EFPeriodoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PERIODO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'tipo <> 5'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'EMP_PERIODOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFPeriodoBusqueda
      OrdenadoPor.Strings = (
        'PERIODO')
      Filtros = [obEmpresa, obEjercicio]
    end
    object DBETitPeriodo: TLFDbedit
      Left = 200
      Top = 17
      Width = 215
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstFamilias.DSxPeriodos
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object DTPFechaH: TLFDateEdit
      Left = 335
      Top = 51
      Width = 86
      Height = 22
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 5
    end
    object DTPFechaD: TLFDateEdit
      Left = 178
      Top = 51
      Width = 87
      Height = 22
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
    object RBPeriodos: TRadioButton
      Left = 24
      Top = 19
      Width = 84
      Height = 17
      Caption = 'Por Periodos'
      TabOrder = 1
      TabStop = True
      OnClick = RBPeriodosClick
    end
    object RBFechas: TRadioButton
      Left = 24
      Top = 56
      Width = 87
      Height = 17
      Caption = 'Entre Fechas'
      TabOrder = 3
      TabStop = True
      OnClick = RBFechasClick
    end
  end
  object ActionList: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 400
    Top = 22
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AVisualizar: TAction
      Caption = '&Previsualizar'
      Hint = 'Previsualizar'
      ImageIndex = 19
      OnExecute = AVisualizarExecute
    end
    object AImprimir: TAction
      Caption = '&Imprimir'
      Hint = 'Imprimir'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
    object ARecargar: TAction
      Caption = '&Recargar'
      Hint = 'Recargar rango de listado'
      ImageIndex = 39
      OnExecute = ARecargarExecute
    end
  end
end
