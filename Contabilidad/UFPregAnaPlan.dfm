inherited FPregAnaPlan: TFPregAnaPlan
  Left = 382
  Top = 220
  HelpContext = 253
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado del Plan Contable Anal'#237'tico'
  ClientHeight = 283
  ClientWidth = 504
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 283
    inherited TBMain: TLFToolBar
      Width = 504
      TabOrder = 3
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
        ParentShowHint = False
        ShowHint = True
      end
    end
    object GBCentrosCoste: TGroupBox
      Left = 0
      Top = 36
      Width = 504
      Height = 89
      Align = alTop
      Caption = 'Centros de Coste'
      TabOrder = 0
      object LDesdeCentroCoste: TLFLabel
        Left = 24
        Top = 29
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaCentroCoste: TLFLabel
        Left = 27
        Top = 50
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFCcDesde: TLFEditFind2000
        Left = 60
        Top = 25
        Width = 104
        Height = 21
        TabOrder = 0
        OnChange = EFCcDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'CENTRO_COSTE'
          'TITULO')
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCcDesdeBusqueda
        OrdenadoPor.Strings = (
          'CENTRO_COSTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCcHasta: TLFEditFind2000
        Left = 60
        Top = 47
        Width = 104
        Height = 21
        TabOrder = 1
        OnChange = EFCcHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'CENTRO_COSTE'
          'TITULO')
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCcHastaBusqueda
        OrdenadoPor.Strings = (
          'CENTRO_COSTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBECcDesde: TLFDbedit
        Left = 165
        Top = 25
        Width = 309
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaPlan.DSxCc_Desde
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
      object DBECcHasta: TLFDbedit
        Left = 165
        Top = 47
        Width = 309
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaPlan.DSxCc_Hasta
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
    object GBOtros: TGroupBox
      Left = 0
      Top = 189
      Width = 504
      Height = 94
      Align = alBottom
      TabOrder = 1
      object LCaracterRelleno: TLFLabel
        Left = 280
        Top = 49
        Width = 79
        Height = 13
        Alignment = taRightJustify
        Caption = 'Car'#225'cter Relleno'
      end
      object LTituloListado: TLFLabel
        Left = 63
        Top = 27
        Width = 78
        Height = 13
        Alignment = taRightJustify
        Caption = 'T'#237'tulo del listado'
      end
      object LFechaListado: TLFLabel
        Left = 61
        Top = 49
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object ECharRelleno: TLFEdit
        Left = 364
        Top = 45
        Width = 19
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 2
        Text = '*'
      end
      object ETituloListado: TLFEdit
        Left = 145
        Top = 23
        Width = 238
        Height = 21
        TabOrder = 0
        Text = 'Plan Contable Anal'#237'tico'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 145
        Top = 46
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GBNiveles: TGroupBox
      Left = 0
      Top = 125
      Width = 504
      Height = 64
      Align = alClient
      Caption = 'Niveles'
      TabOrder = 2
      object LDesdeNivel: TLFLabel
        Left = 40
        Top = 24
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaNivel: TLFLabel
        Left = 185
        Top = 24
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object CBNivelDesde: TLFComboBox
        Left = 76
        Top = 20
        Width = 81
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'CBNivelDesde'
        OnChange = CBNivelDesdeChange
      end
      object CBNivelHasta: TLFComboBox
        Left = 218
        Top = 20
        Width = 81
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Text = 'CBNivelHasta'
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 412
    Top = 6
    inherited AImprimir: TAction
      Tag = 1
      OnExecute = Imprimir
    end
    inherited APrev: TAction
      OnExecute = Imprimir
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
