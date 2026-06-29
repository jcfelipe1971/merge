object FPregComprasProveedores: TFPregComprasProveedores
  Left = 343
  Top = 375
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Compras Detalladas por Proveedor'
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
    Width = 592
    Height = 39
    ButtonHeight = 36
    ButtonWidth = 75
    Flat = True
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    Separators = True
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Action = ARecargar
    end
    object TButtImprimir: TToolButton
      Left = 75
      Top = 0
      Action = AImprimir
    end
    object TButtVisualizar: TToolButton
      Left = 150
      Top = 0
      Action = AVisualizar
    end
    object TButtSalir: TToolButton
      Left = 225
      Top = 0
      Action = ASalir
    end
    object TButtConfRapida: TToolButton
      Left = 300
      Top = 0
      Action = AConfRapida
      Caption = '&Conf. R'#225'pida'
    end
  end
  object PNLListArt: TLFPanel
    Left = 0
    Top = 39
    Width = 592
    Height = 385
    Align = alClient
    TabOrder = 1
    object GBFechas: TGroupBox
      Left = 1
      Top = 1
      Width = 590
      Height = 68
      Align = alTop
      Caption = 'Fechas'
      TabOrder = 0
      object LBLEjerDesde: TLFLabel
        Left = 32
        Top = 20
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Ejercicio'
      end
      object LBLEjerHasta: TLFLabel
        Left = 35
        Top = 43
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Ejercicio'
      end
      object LHastaCanal: TLFLabel
        Left = 224
        Top = 43
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Canal'
      end
      object LDesdeCanal: TLFLabel
        Left = 221
        Top = 20
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Canal'
      end
      object LHastaFecha: TLFLabel
        Left = 401
        Top = 43
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeFecha: TLFLabel
        Left = 398
        Top = 20
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object SEAnoD: TSpinEdit
        Left = 110
        Top = 16
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object SEAnoH: TSpinEdit
        Left = 110
        Top = 39
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object SECanalH: TSpinEdit
        Left = 286
        Top = 39
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object SECanalD: TSpinEdit
        Left = 286
        Top = 16
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object DTPFechaD: TLFDateEdit
        Left = 466
        Top = 16
        Width = 87
        Height = 22
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DTPFechaH: TLFDateEdit
        Left = 466
        Top = 39
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
    end
    object GBSerie: TGroupBox
      Left = 1
      Top = 69
      Width = 590
      Height = 62
      Align = alTop
      Caption = 'Serie'
      TabOrder = 1
      object LHastaSerie: TLFLabel
        Left = 45
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeSerie: TLFLabel
        Left = 42
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFSerieD: TLFEditFind2000
        Left = 77
        Top = 12
        Width = 75
        Height = 21
        TabOrder = 0
        OnChange = EFSerieDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFserieH: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 75
        Height = 21
        TabOrder = 1
        OnChange = EFserieHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBESerieH: TLFDbedit
        Left = 153
        Top = 34
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxSerie_Hasta
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
      object DBESerieD: TLFDbedit
        Left = 153
        Top = 12
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxSerie_Desde
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
    object GBProveedor: TGroupBox
      Left = 1
      Top = 131
      Width = 590
      Height = 62
      Align = alTop
      Caption = 'Proveedor'
      TabOrder = 2
      object LHastaProveedor: TLFLabel
        Left = 45
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeProveedor: TLFLabel
        Left = 42
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFProveedorD: TLFEditFind2000
        Left = 77
        Top = 12
        Width = 75
        Height = 21
        TabOrder = 0
        OnChange = EFProveedorDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROVEEDOR'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFProveedorH: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 75
        Height = 21
        TabOrder = 1
        OnChange = EFProveedorHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROVEEDOR'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEProveedorH: TLFDbedit
        Left = 153
        Top = 34
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxPro_Hasta
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
      object DBEProveedorD: TLFDbedit
        Left = 153
        Top = 12
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxPro_Desde
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
    object GBArticulo: TGroupBox
      Left = 1
      Top = 193
      Width = 590
      Height = 62
      Align = alTop
      Caption = 'Art'#237'culo'
      TabOrder = 3
      object LDesdeArticulo: TLFLabel
        Left = 42
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 45
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArt_Desde: TLFEditFind2000
        Left = 77
        Top = 12
        Width = 108
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
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArt_DesdeBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArt_Hasta: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 108
        Height = 21
        TabOrder = 1
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
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArt_HastaBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArticuloDesde: TLFDbedit
        Left = 186
        Top = 12
        Width = 367
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxArt_Desde
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
      object DBEArticuloHasta: TLFDbedit
        Left = 185
        Top = 34
        Width = 368
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxArt_Hasta
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
    object GBFamilia: TGroupBox
      Left = 1
      Top = 255
      Width = 590
      Height = 62
      Align = alTop
      Caption = 'Familia'
      TabOrder = 4
      object LDesdeFamilia: TLFLabel
        Left = 42
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFamilia: TLFLabel
        Left = 45
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFFamiliaD: TLFEditFind2000
        Left = 77
        Top = 12
        Width = 75
        Height = 21
        TabOrder = 0
        OnChange = EFFamiliaDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFamiliaDBusqueda
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFFamiliaH: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 75
        Height = 21
        TabOrder = 1
        OnChange = EFFamiliaHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFamiliaHBusqueda
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEFamHasta: TLFDbedit
        Left = 153
        Top = 34
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxFam_Hasta
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
      object DBEFamDesde: TLFDbedit
        Left = 153
        Top = 12
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxFam_Desde
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
    object GBOpciones: TGroupBox
      Left = 1
      Top = 317
      Width = 590
      Height = 67
      Align = alClient
      Caption = 'Opciones'
      TabOrder = 5
      object LBLMoneda: TLFLabel
        Left = 29
        Top = 16
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = ' Moneda '
        Layout = tlCenter
      end
      object CBAlbaranes: TLFCheckBox
        Left = 77
        Top = 41
        Width = 115
        Height = 17
        Caption = 'Albaranes Abiertos'
        ClicksDisabled = False
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBFacCerradas: TLFCheckBox
        Left = 226
        Top = 41
        Width = 113
        Height = 17
        Caption = 'Facturas Cerradas'
        ClicksDisabled = False
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBFacAbiertas: TLFCheckBox
        Left = 377
        Top = 41
        Width = 115
        Height = 17
        Caption = 'Facturas Abiertas'
        ClicksDisabled = False
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object EFMoneda: TLFEditFind2000
        Left = 77
        Top = 12
        Width = 75
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
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
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'MONEDA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitMoneda: TLFDbedit
        Left = 153
        Top = 12
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstComprasPro.DSxMonedas
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
  end
  object ActionList: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 410
    Top = 8
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AVisualizar: TAction
      Caption = '&Previsualizar'
      Hint = 'Visualizar'
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
      ImageIndex = 39
      OnExecute = ARecargarExecute
    end
  end
end
