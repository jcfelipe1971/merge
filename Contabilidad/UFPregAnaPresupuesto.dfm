inherited FPregAnaPresupuesto: TFPregAnaPresupuesto
  Left = 362
  Top = 178
  HelpContext = 250
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de An'#225'lisis de Prespuesto'
  ClientHeight = 286
  ClientWidth = 519
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 519
    Height = 286
    inherited TBMain: TLFToolBar
      Width = 519
      EdgeBorders = []
      TabOrder = 4
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Hint = 'Configuraci'#243'n R'#225'pida del Listado'
        Caption = '&Configurar'
        ImageIndex = 77
        OnClick = TButtConfigurarClick
      end
      object TBMulticanal: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSeleccion
      end
    end
    object BGPlanContable: TGroupBox
      Left = 0
      Top = 36
      Width = 519
      Height = 56
      Align = alTop
      Caption = 'Plan Contable'
      TabOrder = 0
      object LPlan: TLFLabel
        Left = 22
        Top = 24
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = 'Plan'
      end
      object EFPlanContable: TLFEditFind2000
        Left = 48
        Top = 21
        Width = 112
        Height = 21
        TabOrder = 0
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
        SalirSiVacio = False
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ANA_PLAN_CONTABLE'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEPlanContable: TLFDbedit
        Left = 161
        Top = 21
        Width = 338
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaPresupuesto.DSxPlan
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
    object GBCentroCoste: TGroupBox
      Left = 0
      Top = 92
      Width = 519
      Height = 78
      Align = alTop
      Caption = 'Centros de Coste'
      TabOrder = 1
      object LDesdeCentroCoste: TLFLabel
        Left = 12
        Top = 25
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaCentroCoste: TLFLabel
        Left = 15
        Top = 46
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFCcDesde: TLFEditFind2000
        Left = 48
        Top = 21
        Width = 112
        Height = 21
        TabOrder = 0
        OnChange = EFCcDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCcDesdeBusqueda
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCcHasta: TLFEditFind2000
        Left = 48
        Top = 43
        Width = 112
        Height = 21
        TabOrder = 1
        OnChange = EFCcHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCcHastaBusqueda
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBECCDesde: TLFDbedit
        Left = 161
        Top = 21
        Width = 338
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaPresupuesto.DSxCcDesde
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
      object DBECCHasta: TLFDbedit
        Left = 161
        Top = 43
        Width = 338
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRAnaPresupuesto.DSxCcHasta
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
    object GBNiveles: TGroupBox
      Left = 328
      Top = 170
      Width = 191
      Height = 68
      Align = alRight
      Caption = 'Niveles'
      TabOrder = 2
      object LDesdeNivel: TLFLabel
        Left = 28
        Top = 17
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaNivel: TLFLabel
        Left = 31
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object CBNivelDesde: TLFComboBox
        Left = 64
        Top = 13
        Width = 77
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = CBNivelDesdeChange
      end
      object CBNivelHasta: TLFComboBox
        Left = 64
        Top = 35
        Width = 77
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBNivelDesdeChange
      end
    end
    object GBPeriodos: TGroupBox
      Left = 0
      Top = 170
      Width = 323
      Height = 68
      Align = alLeft
      Caption = 'Per'#237'odos'
      TabOrder = 3
      object LHastaPeriodo: TLFLabel
        Left = 172
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdePeriodo: TLFLabel
        Left = 169
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBPeriodo: TLFLabel
        Left = 19
        Top = 28
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo'
      end
      object CBPeriodo: TLFComboBox
        Left = 61
        Top = 25
        Width = 84
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 0
        Text = 'Anual'
        OnChange = CBPeriodoChange
        Items.Strings = (
          'Anual'
          'Meses')
      end
      object CBPDesde: TLFComboBox
        Left = 205
        Top = 14
        Width = 77
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBPDesdeChange
      end
      object CBPHasta: TLFComboBox
        Left = 205
        Top = 36
        Width = 77
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnChange = CBPDesdeChange
      end
    end
    object PNLOpciones: TLFPanel
      Left = 0
      Top = 238
      Width = 519
      Height = 48
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 5
      object CHKMeses: TLFCheckBox
        Left = 37
        Top = 9
        Width = 121
        Height = 17
        Caption = 'Desglosar por meses'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
      end
      object CHKControl: TLFCheckBox
        Left = 37
        Top = 25
        Width = 324
        Height = 17
        Caption = 'S'#243'lo Centros de coste que superen el control presupuestario'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 38
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ASalir: TAction
      Tag = 2
    end
    inherited ARecargar: TAction
      Tag = 2
      OnExecute = ARecargarExecute
    end
    object AMultiSeleccion: TAction
      Caption = '&Multi-Selec'
      Hint = 'Multi - Selecci'#243'n'
      ImageIndex = 132
      OnExecute = AMultiSeleccionExecute
    end
  end
end
