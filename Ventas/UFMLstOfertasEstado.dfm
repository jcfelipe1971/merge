inherited FMLstOfertasEstado: TFMLstOfertasEstado
  Left = 498
  Top = 188
  Caption = 'Listado de Ofertas'
  ClientHeight = 362
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 362
    inherited TBMain: TLFToolBar
      Width = 592
      object ToolButton1: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLFiltro: TLFPanel
      Left = 0
      Top = 109
      Width = 592
      Height = 253
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LHastaFecha: TLFLabel
        Left = 279
        Top = 158
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LHastaSerie: TLFLabel
        Left = 57
        Top = 55
        Width = 55
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Serie'
      end
      object LHastaAgrupacion: TLFLabel
        Left = 62
        Top = 117
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Agr.'
      end
      object LDesdeSerie: TLFLabel
        Left = 54
        Top = 32
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Serie'
      end
      object LDesdeFecha: TLFLabel
        Left = 100
        Top = 158
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LDesdeAgrupacion: TLFLabel
        Left = 59
        Top = 94
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Agr.'
      end
      object EDesdeSerie: TLFEdit
        Left = 179
        Top = 29
        Width = 317
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
      end
      object EHastaSerie: TLFEdit
        Left = 179
        Top = 51
        Width = 317
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object EHastaAgrupacion: TLFEdit
        Left = 179
        Top = 113
        Width = 317
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object EFSerieH: TLFEditFind2000
        Left = 116
        Top = 51
        Width = 62
        Height = 21
        TabOrder = 2
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
        Tabla_a_buscar = 'VER_CANALES_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSerieD: TLFEditFind2000
        Left = 116
        Top = 29
        Width = 62
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
        Tabla_a_buscar = 'VER_CANALES_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFAgrH: TLFEditFind2000
        Left = 116
        Top = 113
        Width = 62
        Height = 21
        TabOrder = 6
        OnChange = EFAgrHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO='#39'C'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
        Filtros = []
      end
      object EFAgrD: TLFEditFind2000
        Left = 116
        Top = 91
        Width = 62
        Height = 21
        TabOrder = 4
        OnChange = EFAgrDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO='#39'C'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_AGRUPACIONES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
        Filtros = []
      end
      object EDesdeAgrupacion: TLFEdit
        Left = 179
        Top = 91
        Width = 317
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DTPFechaH: TLFDateEdit
        Left = 346
        Top = 154
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 9
      end
      object DTPFechaD: TLFDateEdit
        Left = 171
        Top = 154
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 8
      end
    end
    object GBTipo: TGroupBox
      Left = 0
      Top = 36
      Width = 592
      Height = 73
      Align = alTop
      TabOrder = 1
      object RBAceptadas: TRadioButton
        Left = 170
        Top = 16
        Width = 89
        Height = 41
        Caption = 'Aceptadas'
        TabOrder = 1
      end
      object RBAnuladas: TRadioButton
        Left = 317
        Top = 16
        Width = 89
        Height = 41
        Caption = 'Anuladas'
        TabOrder = 2
      end
      object RBTodas: TRadioButton
        Left = 464
        Top = 16
        Width = 89
        Height = 41
        Caption = 'Todas'
        TabOrder = 3
      end
      object RBPendiente: TRadioButton
        Left = 24
        Top = 16
        Width = 89
        Height = 41
        Caption = 'Pte. Aceptar'
        Checked = True
        TabOrder = 0
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
