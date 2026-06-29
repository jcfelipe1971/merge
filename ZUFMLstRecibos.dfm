inherited ZFMLstRecibos: TZFMLstRecibos
  Left = 366
  Top = 334
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Recibos Ingresos'
  ClientHeight = 204
  ClientWidth = 444
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 444
    Height = 204
    inherited TBMain: TLFToolBar
      Width = 444
      AutoSize = False
      Customizable = True
      inherited TButtImprimir: TToolButton
        Tag = 1
        AllowAllUp = True
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 188
      Width = 444
      TabOrder = 2
    end
    object PNLTesoreria: TLFPanel
      Left = 0
      Top = 36
      Width = 444
      Height = 152
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LHastaFecha: TLFLabel
        Left = 199
        Top = 33
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LDesdeFecha: TLFLabel
        Left = 32
        Top = 32
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeCliente: TLFLabel
        Left = 28
        Top = 69
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente Desde'
      end
      object LHastaCliente: TLFLabel
        Left = 28
        Top = 89
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Cliente'
      end
      object DTPFechaDesde: TLFDateEdit
        Left = 99
        Top = 29
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
      object ETituloClienteDesde: TLFEdit
        Left = 165
        Top = 66
        Width = 232
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object LFClienteDesde: TLFEditFind2000
        Left = 99
        Top = 66
        Width = 65
        Height = 21
        TabOrder = 4
        OnChange = LFClienteDesdeChange
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
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DTPFechaHasta: TLFDateEdit
        Left = 267
        Top = 29
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object ETituloClienteHasta: TLFEdit
        Left = 165
        Top = 88
        Width = 232
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object LFClienteHasta: TLFEditFind2000
        Left = 99
        Top = 88
        Width = 65
        Height = 21
        TabOrder = 5
        OnChange = LFClienteHastaChange
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
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 404
    Top = 38
    inherited AImprimir: TAction
      OnExecute = AImprimir
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction [2]
      OnExecute = ARecargarExecute
    end
    inherited ASalir: TAction [3]
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
