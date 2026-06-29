inherited FMLstConsumo: TFMLstConsumo
  Left = 575
  Top = 246
  Caption = 'Listado de Consumo'
  ClientHeight = 312
  ClientWidth = 505
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 505
    Height = 312
    object LDesdeSerie: TLFLabel [0]
      Left = 31
      Top = 78
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Serie'
    end
    object LHastaCliente: TLFLabel [1]
      Left = 26
      Top = 148
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Cliente'
    end
    object LDesdeCliente: TLFLabel [2]
      Left = 23
      Top = 125
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Cliente'
    end
    object LHastaFecha: TLFLabel [3]
      Left = 223
      Top = 256
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Fecha'
    end
    object LDesdeFecha: TLFLabel [4]
      Left = 44
      Top = 256
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Fecha'
    end
    object LAgrupacion: TLFLabel [5]
      Left = 35
      Top = 211
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Agrupacion'
    end
    object LHastaSerie: TLFLabel [6]
      Left = 34
      Top = 101
      Width = 55
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Serie'
    end
    object LHastaAgente: TLFLabel [7]
      Left = 24
      Top = 192
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Agente'
    end
    object LDesdeAgente: TLFLabel [8]
      Left = 21
      Top = 169
      Width = 68
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Agente'
    end
    inherited TBMain: TLFToolBar
      Width = 505
      TabOrder = 9
      object TButtConfig: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object ETituloDesdeCliente: TLFEdit
      Left = 156
      Top = 119
      Width = 321
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object ETituloHastaCliente: TLFEdit
      Left = 156
      Top = 141
      Width = 321
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object EFClienteH: TLFEditFind2000
      Left = 92
      Top = 141
      Width = 63
      Height = 21
      TabOrder = 3
      OnChange = EFClienteHChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa]
    end
    object EFClienteD: TLFEditFind2000
      Left = 92
      Top = 119
      Width = 63
      Height = 21
      TabOrder = 2
      OnChange = EFClienteDChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa]
    end
    object DTPFechaH: TLFDateEdit
      Left = 294
      Top = 251
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 8
    end
    object DTPFechaD: TLFDateEdit
      Left = 122
      Top = 252
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 7
    end
    object ETituloAgrupacion: TLFEdit
      Left = 156
      Top = 207
      Width = 321
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
    end
    object EFAgrupacion: TLFEditFind2000
      Left = 92
      Top = 207
      Width = 63
      Height = 21
      TabOrder = 6
      OnChange = EFAgrupacionChange
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
      OrdenadoPor.Strings = (
        'AGRUPACION')
      Filtros = [obEmpresa]
    end
    object ETituloHastaSerie: TLFEdit
      Left = 156
      Top = 97
      Width = 321
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 13
    end
    object EFSerieH: TLFEditFind2000
      Left = 92
      Top = 97
      Width = 63
      Height = 21
      TabOrder = 1
      OnChange = EFSerieHChange
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
      Tabla_a_buscar = 'GEN_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = [obEmpresa]
    end
    object ETituloDesdeSerie: TLFEdit
      Left = 156
      Top = 75
      Width = 321
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 14
    end
    object EFSerieD: TLFEditFind2000
      Left = 92
      Top = 75
      Width = 63
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
      Tabla_a_buscar = 'GEN_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = [obEmpresa]
    end
    object ETituloDesdeAgente: TLFEdit
      Left = 156
      Top = 163
      Width = 321
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 15
    end
    object ETituloHastaAgente: TLFEdit
      Left = 156
      Top = 185
      Width = 321
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 16
    end
    object EFAgenteH: TLFEditFind2000
      Left = 92
      Top = 185
      Width = 63
      Height = 21
      TabOrder = 5
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
    end
    object EFAgenteD: TLFEditFind2000
      Left = 92
      Top = 163
      Width = 63
      Height = 21
      TabOrder = 4
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
