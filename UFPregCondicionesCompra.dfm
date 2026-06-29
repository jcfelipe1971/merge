inherited FPregCondicionesCompra: TFPregCondicionesCompra
  Left = 707
  Top = 313
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado Condiciones de Compra'
  ClientHeight = 274
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 274
    inherited TBMain: TLFToolBar
      Width = 392
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
      end
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 392
      Height = 238
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeCondProv: TLFLabel
        Left = 171
        Top = 24
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LHastaCondProv: TLFLabel
        Left = 174
        Top = 46
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Proveedor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LDesdeCondProvArt: TLFLabel
        Left = 183
        Top = 68
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LHastaCondProvAgrArt: TLFLabel
        Left = 169
        Top = 178
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Agrupaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LDesdeCondProvAgrArt: TLFLabel
        Left = 166
        Top = 156
        Width = 88
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Agrupaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LHastaCondProvFam: TLFLabel
        Left = 191
        Top = 134
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Familia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LDesdeCondProvFam: TLFLabel
        Left = 188
        Top = 112
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Familia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LHastaCondProvArt: TLFLabel
        Left = 186
        Top = 90
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EFDesdeCondProv: TLFEditFind2000
        Left = 261
        Top = 20
        Width = 105
        Height = 21
        TabOrder = 0
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
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDesdeCondProvFam: TLFEditFind2000
        Left = 261
        Top = 108
        Width = 105
        Height = 21
        TabOrder = 6
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
        OnBusqueda = EFDesdeCondProvFamBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCondProvFam: TLFEditFind2000
        Left = 261
        Top = 130
        Width = 105
        Height = 21
        TabOrder = 7
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
        OnBusqueda = EFHastaCondProvFamBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFDesdeCondProvArt: TLFEditFind2000
        Left = 261
        Top = 64
        Width = 105
        Height = 21
        TabOrder = 3
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFDesdeCondProvArtBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCondProvArt: TLFEditFind2000
        Left = 261
        Top = 86
        Width = 105
        Height = 21
        TabOrder = 4
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFHastaCondProvArtBusqueda
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCondProv: TLFEditFind2000
        Left = 261
        Top = 42
        Width = 105
        Height = 21
        TabOrder = 1
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
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object CBProvArt: TLFCheckBox
        Left = 15
        Top = 51
        Width = 73
        Height = 17
        Caption = 'Art'#237'culo'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        OnClick = CBProvArtClick
        Alignment = taLeftJustify
      end
      object EFDesdeCondProvAgrArt: TLFEditFind2000
        Left = 261
        Top = 152
        Width = 105
        Height = 21
        TabOrder = 9
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO='#39'T'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCondProvAgrArt: TLFEditFind2000
        Left = 261
        Top = 174
        Width = 105
        Height = 21
        TabOrder = 10
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO='#39'T'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object CBProvAgrArt: TLFCheckBox
        Left = 15
        Top = 139
        Width = 89
        Height = 17
        Caption = 'Agrupaci'#243'n'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 8
        TabStop = True
        OnClick = CBProvAgrArtClick
        Alignment = taLeftJustify
      end
      object CBProvFam: TLFCheckBox
        Left = 15
        Top = 95
        Width = 65
        Height = 17
        Caption = 'Familia'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        OnClick = CBProvFamClick
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 340
    Top = 14
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      HelpType = htContext
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
