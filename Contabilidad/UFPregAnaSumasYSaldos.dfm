inherited FPregAnaSumasYSaldos: TFPregAnaSumasYSaldos
  Left = 310
  Top = 175
  HelpContext = 250
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Sumas y Saldos Contabilidad Anal'#237'tica'
  ClientHeight = 390
  ClientWidth = 592
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 390
    inherited TBMain: TLFToolBar
      Width = 592
      EdgeBorders = []
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
    object PCentrosCoste: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 206
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object GBCentroCoste: TGroupBox
        Left = 0
        Top = 62
        Width = 592
        Height = 78
        Align = alBottom
        Caption = 'Centros de Coste'
        TabOrder = 0
        object LDesdeCentroCoste: TLFLabel
          Left = 13
          Top = 25
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaCentroCoste: TLFLabel
          Left = 16
          Top = 47
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesde: TLFEditFind2000
          Left = 48
          Top = 21
          Width = 121
          Height = 21
          TabOrder = 0
          OnChange = EFDesdeChange
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
          OnBusqueda = EFDesdeBusqueda
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHasta: TLFEditFind2000
          Left = 48
          Top = 43
          Width = 121
          Height = 21
          TabOrder = 1
          OnChange = EFHastaChange
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
          OnBusqueda = EFHastaBusqueda
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBECCDesde: TLFDbedit
          Left = 170
          Top = 21
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRAnaSumasySaldos.DSxCC_Desde
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
          Left = 170
          Top = 43
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRAnaSumasySaldos.DSxCC_Hasta
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
      object GBSeccion: TGroupBox
        Left = 0
        Top = 140
        Width = 592
        Height = 66
        Align = alBottom
        Caption = 'Filtros'
        TabOrder = 1
        object LHastaSeccion: TLFLabel
          Left = 162
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LDesdeSeccion: TLFLabel
          Left = 159
          Top = 18
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LBNivel: TLFLabel
          Left = 23
          Top = 28
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nivel'
        end
        object ESeccionD: TLFEdit
          Left = 195
          Top = 14
          Width = 81
          Height = 21
          MaxLength = 11
          TabOrder = 1
        end
        object ESeccionH: TLFEdit
          Left = 195
          Top = 36
          Width = 81
          Height = 21
          MaxLength = 11
          TabOrder = 2
          OnChange = ESeccionHChange
        end
        object CBNivelFiltro: TLFComboBox
          Left = 52
          Top = 24
          Width = 77
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
      end
      object BGPlanContable: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 56
        Align = alTop
        Caption = 'Plan Contable'
        TabOrder = 2
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
          Width = 121
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
          Left = 170
          Top = 21
          Width = 402
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRAnaSumasySaldos.DSxPlan
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
    end
    object PMonedas: TLFPanel
      Left = 0
      Top = 337
      Width = 592
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LMoneda: TLFLabel
        Left = 87
        Top = 22
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
        Layout = tlCenter
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 130
        Top = 19
        Width = 122
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = DMRAnaSumasySaldos.DSxMonedas
        TabOrder = 0
      end
    end
    object PNivFecha: TLFPanel
      Left = 0
      Top = 242
      Width = 592
      Height = 95
      Align = alTop
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 3
      object GBNiveles: TGroupBox
        Left = 0
        Top = 0
        Width = 164
        Height = 95
        Align = alLeft
        Caption = 'Niveles'
        TabOrder = 0
        object LDesdeNivel: TLFLabel
          Left = 28
          Top = 37
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaNivel: TLFLabel
          Left = 32
          Top = 58
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object CBDesde: TLFComboBox
          Left = 64
          Top = 33
          Width = 77
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBDesdeChange
        end
        object CBHasta: TLFComboBox
          Left = 64
          Top = 55
          Width = 77
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = CBDesdeChange
        end
      end
      object GBFechas: TGroupBox
        Left = 164
        Top = 0
        Width = 174
        Height = 95
        Align = alLeft
        Caption = 'Fechas'
        TabOrder = 1
        object LDesdeFecha: TLFLabel
          Left = 26
          Top = 38
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaFecha: TLFLabel
          Left = 29
          Top = 60
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object DTPDesde: TLFDateEdit
          Left = 62
          Top = 34
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DTPHasta: TLFDateEdit
          Left = 62
          Top = 56
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnExit = DTPHastaExit
        end
      end
      object CheckSaldoCero: TLFCheckBox
        Left = 367
        Top = 8
        Width = 147
        Height = 17
        Caption = 'Centro de Coste con Saldo Cero'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 528
    Top = 6
    inherited AImprimir: TAction
      Tag = 1
      OnExecute = AImprimirExecute
    end
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
