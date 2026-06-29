inherited FPregAnaMayor: TFPregAnaMayor
  Left = 362
  Top = 216
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Mayor Contabilidad Anal'#237'tica'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfRapida
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLLstMayor: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 307
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLFLabel
        Left = 4
        Top = 95
        Width = 95
        Height = 13
        Caption = 'Centro Coste Desde'
      end
      object Label2: TLFLabel
        Left = 7
        Top = 117
        Width = 92
        Height = 13
        Caption = 'Centro Coste Hasta'
      end
      object LBLDesde: TLFLabel
        Left = 68
        Top = 139
        Width = 31
        Height = 13
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LBLHasta: TLFLabel
        Left = 71
        Top = 161
        Width = 28
        Height = 13
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLFLabel
        Left = 228
        Top = 161
        Width = 39
        Height = 13
        Caption = 'Alcance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLFLabel
        Left = 228
        Top = 139
        Width = 39
        Height = 13
        Caption = 'Moneda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LFLabel1: TLFLabel
        Left = 33
        Top = 72
        Width = 66
        Height = 13
        Caption = 'Plan Contable'
      end
      object EFCentroCosteDesde: TLFEditFind2000
        Left = 103
        Top = 91
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 0
        OnChange = EFCentroCosteDesdeChange
        OnExit = EFCentroCosteDesdeExit
        OnKeyDown = EFCentroCosteDesdeKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCentroCosteDesdeBusqueda
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCentroCosteHasta: TLFEditFind2000
        Left = 103
        Top = 113
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 1
        OnChange = EFCentroCosteHastaChange
        OnExit = EFCentroCosteHastaExit
        OnKeyDown = EFCentroCosteHastaKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCentroCosteHastaBusqueda
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETituloCDesde: TLFDbedit
        Left = 225
        Top = 91
        Width = 330
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaMayor.DSxCCDesde
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
      object DBETituloCHasta: TLFDbedit
        Left = 225
        Top = 113
        Width = 330
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaMayor.DSxCCHasta
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
      object CBCanales: TLFComboBox
        Left = 273
        Top = 157
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 8
        OnChange = CBCanalesChange
        Items.Strings = (
          'Todos los canales')
      end
      object DTPDesde: TLFDateEdit
        Left = 103
        Top = 135
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DTPHasta: TLFDateEdit
        Left = 103
        Top = 157
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
      object EFMoneda: TLFEditFind2000
        Left = 273
        Top = 135
        Width = 49
        Height = 21
        TabOrder = 6
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
        Tabla_a_buscar = 'SYS_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
      end
      object DBETitMoneda: TLFDbedit
        Left = 323
        Top = 135
        Width = 232
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaMayor.DSxMonedas
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object EFPlanContable: TLFEditFind2000
        Left = 103
        Top = 69
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 9
        OnChange = EFPlanContableChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PLAN_CONTABLE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ANA_PLAN_CONTABLE'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DEBTituloPlanContable: TLFDbedit
        Left = 225
        Top = 69
        Width = 330
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaMayor.DSxPlan
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
      end
      object CHKOrdenarCC: TLFCheckBox
        Left = 104
        Top = 179
        Width = 177
        Height = 17
        Caption = 'Ordenado por Centro de Coste'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 11
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 428
    Top = 22
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
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
