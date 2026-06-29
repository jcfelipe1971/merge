inherited FPregVentasCliente: TFPregVentasCliente
  Left = 317
  Top = 174
  ActiveControl = CBFacCerradas
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ' Ventas Detalladas por Cliente'
  ClientHeight = 532
  ClientWidth = 606
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 606
    Height = 532
    inherited TBMain: TLFToolBar
      Width = 606
      EdgeBorders = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 516
      Width = 606
      TabOrder = 9
    end
    object GBFamilia: TGroupBox
      Left = 0
      Top = 355
      Width = 606
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
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFamDesde: TLFEdit
        Left = 153
        Top = 12
        Width = 400
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
      object EFamHasta: TLFEdit
        Left = 153
        Top = 34
        Width = 400
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
      object EFFamiliaH: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 75
        Height = 21
        TabOrder = 3
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
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBArticulo: TGroupBox
      Left = 0
      Top = 293
      Width = 606
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
        SalirSiNoExiste = False
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArt_HastaBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EArticuloHasta: TLFEdit
        Left = 186
        Top = 34
        Width = 367
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
      object EArticuloDesde: TLFEdit
        Left = 186
        Top = 12
        Width = 367
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
    object GBCliente: TGroupBox
      Left = 0
      Top = 166
      Width = 606
      Height = 62
      Align = alTop
      Caption = 'Cliente'
      TabOrder = 2
      object LDesdeCliente: TLFLabel
        Left = 42
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaCliente: TLFLabel
        Left = 45
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFClienteD: TLFEditFind2000
        Left = 77
        Top = 12
        Width = 75
        Height = 21
        TabOrder = 0
        OnChange = EFClienteDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'NOMBRE_COMERCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EClienteD: TLFEdit
        Left = 153
        Top = 12
        Width = 400
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
      object EClienteH: TLFEdit
        Left = 153
        Top = 34
        Width = 400
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
      object EFClienteH: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 75
        Height = 21
        TabOrder = 3
        OnChange = EFClienteHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CLIENTE'
        CampoStr = 'NOMBRE_COMERCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBSerie: TGroupBox
      Left = 0
      Top = 104
      Width = 606
      Height = 62
      Align = alTop
      Caption = 'Serie'
      TabOrder = 1
      object LDesdeSerie: TLFLabel
        Left = 42
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaSerie: TLFLabel
        Left = 45
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
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
      object ESerieD: TLFEdit
        Left = 153
        Top = 12
        Width = 400
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
      object ESerieH: TLFEdit
        Left = 153
        Top = 34
        Width = 400
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
      object EFserieH: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 75
        Height = 21
        TabOrder = 3
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
    end
    object GBFechas: TGroupBox
      Left = 0
      Top = 36
      Width = 606
      Height = 68
      Align = alTop
      Caption = 'Fechas'
      TabOrder = 0
      object LDesdeEjercicio: TLFLabel
        Left = 32
        Top = 20
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Ejercicio'
      end
      object LHastaEjercicio: TLFLabel
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
        Left = 402
        Top = 43
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeFecha: TLFLabel
        Left = 399
        Top = 21
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
      object SECanalD: TSpinEdit
        Left = 286
        Top = 16
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
      object SECanalH: TSpinEdit
        Left = 286
        Top = 39
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
      end
      object DTPFechaD: TLFDateEdit
        Left = 467
        Top = 17
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DTPFechaH: TLFDateEdit
        Left = 467
        Top = 39
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
    end
    object GBOpciones: TGroupBox
      Left = 0
      Top = 417
      Width = 606
      Height = 66
      Align = alTop
      Caption = 'Opciones'
      TabOrder = 5
      object LMoneda: TLFLabel
        Left = 28
        Top = 16
        Width = 45
        Height = 13
        Caption = ' Moneda '
        Layout = tlCenter
      end
      object CBAlbaranes: TLFCheckBox
        Left = 8
        Top = 38
        Width = 109
        Height = 17
        Caption = 'Albaranes Abiertos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBFacCerradas: TLFCheckBox
        Left = 121
        Top = 38
        Width = 107
        Height = 17
        Caption = 'Facturas Cerradas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBFacAbiertas: TLFCheckBox
        Left = 237
        Top = 38
        Width = 106
        Height = 17
        Caption = 'Facturas Abiertas'
        ClicksDisabled = False
        ColorCheck = 57088
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
        DataSource = DMLstVentasCliente.DSxMonedas
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
      object ChkBMostrarInfoLotes: TLFCheckBox
        Left = 349
        Top = 38
        Width = 122
        Height = 17
        Caption = 'Info. de Lotes/Series'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBAgente: TLFCheckBox
        Left = 477
        Top = 38
        Width = 116
        Height = 17
        Caption = 'Agrupar por Agente'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object GBAgente: TGroupBox
      Left = 0
      Top = 228
      Width = 606
      Height = 65
      Align = alTop
      Caption = 'Agente'
      TabOrder = 6
      object LDesdeAgente: TLFLabel
        Left = 42
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaAgente: TLFLabel
        Left = 45
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFAgenteD: TLFEditFind2000
        Left = 77
        Top = 12
        Width = 75
        Height = 21
        TabOrder = 0
        OnChange = EFAgenteDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFAgenteDBusqueda
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EAgenteD: TLFEdit
        Left = 153
        Top = 12
        Width = 400
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
      object EAgenteH: TLFEdit
        Left = 153
        Top = 34
        Width = 400
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
      object EFAgenteH: TLFEditFind2000
        Left = 77
        Top = 34
        Width = 75
        Height = 21
        TabOrder = 3
        OnChange = EFAgenteHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_AGENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFAgenteHBusqueda
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object RGOrdenKri: TRadioGroup
      Left = 0
      Top = 483
      Width = 606
      Height = 33
      Align = alClient
      Caption = 'Orden'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Documento'
        'Art'#237'culo')
      TabOrder = 7
    end
  end
  inherited ALMain: TLFActionList
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
