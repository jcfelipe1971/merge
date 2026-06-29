inherited FPregVentasClienteAge: TFPregVentasClienteAge
  Left = 400
  Top = 318
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ' Ventas por Agente - Cliente - Mes'
  ClientHeight = 550
  ClientWidth = 636
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 636
    Height = 550
    inherited TBMain: TLFToolBar
      Width = 636
      EdgeBorders = []
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      object ToolButton1: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object GBEjercicio: TGroupBox
      Left = 0
      Top = 36
      Width = 636
      Height = 49
      Align = alTop
      TabOrder = 0
      object LEjercicio: TLFLabel
        Left = 73
        Top = 20
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
      end
      object LDesdeCanal: TLFLabel
        Left = 223
        Top = 20
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Canal'
      end
      object LHastaCanal: TLFLabel
        Left = 419
        Top = 20
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Canal'
      end
      object SEEjercicioD: TSpinEdit
        Left = 120
        Top = 16
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
      object SECanalD: TSpinEdit
        Left = 293
        Top = 16
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
      object SECanalH: TSpinEdit
        Left = 485
        Top = 16
        Width = 75
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 2
        Value = 0
      end
    end
    object GBSerie: TGroupBox
      Left = 0
      Top = 85
      Width = 636
      Height = 72
      Align = alTop
      Caption = 'Serie'
      TabOrder = 1
      object LHastaSerie: TLFLabel
        Left = 85
        Top = 43
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeSerie: TLFLabel
        Left = 82
        Top = 21
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFSerieD: TLFEditFind2000
        Left = 120
        Top = 18
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
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFserieH: TLFEditFind2000
        Left = 120
        Top = 40
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
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBESerieH: TLFDbedit
        Left = 196
        Top = 40
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxSerie_Hasta
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
        Left = 196
        Top = 18
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxSerie_Desde
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
    object GBAgente: TGroupBox
      Left = 0
      Top = 157
      Width = 636
      Height = 72
      Align = alTop
      Caption = 'Agente'
      TabOrder = 2
      object LDesdeAgente: TLFLabel
        Left = 82
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaAgente: TLFLabel
        Left = 85
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFAgenteH: TLFEditFind2000
        Left = 120
        Top = 39
        Width = 75
        Height = 21
        TabOrder = 1
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
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFAgenteD: TLFEditFind2000
        Left = 120
        Top = 17
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
        OrdenadoPor.Strings = (
          'AGENTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEAgenteDesde: TLFDbedit
        Left = 196
        Top = 17
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxAgente_Desde
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
      object DBEAgenteHasta: TLFDbedit
        Left = 196
        Top = 39
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxAgente_Hasta
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
      Top = 229
      Width = 636
      Height = 72
      Align = alTop
      Caption = 'Cliente'
      TabOrder = 3
      object LHastaCliente: TLFLabel
        Left = 85
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeCliente: TLFLabel
        Left = 82
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFClienteD: TLFEditFind2000
        Left = 120
        Top = 15
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
      object EFClienteH: TLFEditFind2000
        Left = 120
        Top = 37
        Width = 75
        Height = 21
        TabOrder = 1
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
      object DBECLienteH: TLFDbedit
        Left = 196
        Top = 37
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxCli_Hasta
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
      object DBEClienteD: TLFDbedit
        Left = 196
        Top = 15
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxCli_Desde
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
      Left = 0
      Top = 301
      Width = 636
      Height = 72
      Align = alTop
      Caption = 'Art'#237'culo'
      TabOrder = 4
      object LDesdeArticulo: TLFLabel
        Left = 82
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 85
        Top = 42
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFArt_Desde: TLFEditFind2000
        Left = 120
        Top = 16
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
        Left = 120
        Top = 38
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
      object DBEArticuloDesde: TLFDbedit
        Left = 229
        Top = 16
        Width = 367
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxArt_Desde
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
        Left = 229
        Top = 38
        Width = 367
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxArt_Hasta
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
      Left = 0
      Top = 373
      Width = 636
      Height = 72
      Align = alTop
      Caption = 'Familia'
      TabOrder = 5
      object LDesdeFamilia: TLFLabel
        Left = 82
        Top = 21
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFamilia: TLFLabel
        Left = 85
        Top = 45
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFFamiliaD: TLFEditFind2000
        Left = 120
        Top = 18
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
        Left = 120
        Top = 40
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
        Left = 196
        Top = 40
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxFam_Hasta
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
        Left = 196
        Top = 18
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxFam_Desde
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
      Left = 0
      Top = 445
      Width = 636
      Height = 105
      Align = alClient
      Caption = 'Opciones'
      TabOrder = 6
      object LMoneda: TLFLabel
        Left = 71
        Top = 18
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = ' Moneda '
        Layout = tlCenter
      end
      object CBUnificaClientes: TLFCheckBox
        Left = 120
        Top = 40
        Width = 113
        Height = 17
        Caption = 'Unificar Clientes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBUnificaAgentes: TLFCheckBox
        Left = 120
        Top = 62
        Width = 133
        Height = 17
        Caption = 'Unificar Agentes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object EFMoneda: TLFEditFind2000
        Left = 120
        Top = 14
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
        Left = 196
        Top = 14
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMLstVentasCliAge.DSxMonedas
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
      object RGDocumentos: TRadioGroup
        Left = 329
        Top = 42
        Width = 267
        Height = 45
        Caption = ' Documentos '
        TabOrder = 4
      end
      object RFacturas: TRadioButton
        Left = 495
        Top = 58
        Width = 75
        Height = 17
        Caption = 'Facturas'
        TabOrder = 5
      end
      object RAlbaranes: TRadioButton
        Left = 356
        Top = 58
        Width = 76
        Height = 17
        Caption = 'Albaranes'
        Checked = True
        TabOrder = 6
        TabStop = True
      end
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
