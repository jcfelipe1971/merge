object FCAnaMayor: TFCAnaMayor
  Left = 267
  Top = 121
  HelpContext = 239
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Mayor Contabilidad Anal'#237'tica'
  ClientHeight = 466
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PCMain: TLFPageControl
    Left = 0
    Top = 22
    Width = 792
    Height = 420
    ActivePage = TSFicha
    Align = alClient
    OwnerDraw = True
    TabIndex = 0
    TabOrder = 1
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSFicha: TTabSheet
      Caption = '&Ficha'
      ImageIndex = -1
      OnShow = TSFichaShow
      object PNL_Cta_2: TLFPanel
        Left = 0
        Top = 22
        Width = 784
        Height = 21
        Align = alTop
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object DBECentroCoste: TLFDbedit
          Left = 0
          Top = 0
          Width = 129
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'CENTRO_COSTE'
          DataSource = DMAnaMayor.DSxCentrosCoste
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBETitulo: TLFDbedit
          Left = 130
          Top = 0
          Width = 330
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAnaMayor.DSxCentrosCoste
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
        object DBEDebe: TLFDbedit
          Left = 461
          Top = 0
          Width = 97
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'DEBE'
          DataSource = DMAnaMayor.DSxSaldos
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
        object DBEHaber: TLFDbedit
          Left = 559
          Top = 0
          Width = 101
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'HABER'
          DataSource = DMAnaMayor.DSxSaldos
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
        object DBESaldo: TLFDbedit
          Left = 661
          Top = 0
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'SALDO_RNG'
          DataSource = DMAnaMayor.DSxSaldos
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
      end
      object PNL_Cta_1: TLFPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 22
        Align = alTop
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 1
        object LBLSaldoAnt: TLFLabel
          Left = 375
          Top = 4
          Width = 80
          Height = 13
          Alignment = taRightJustify
          Caption = 'Saldo anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DBEAntD: TLFDbedit
          Left = 461
          Top = 0
          Width = 97
          Height = 21
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'DEBE_A'
          DataSource = DMAnaMayor.DSxSaldos
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBEAntH: TLFDbedit
          Left = 559
          Top = 0
          Width = 101
          Height = 21
          AutoSize = False
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'HABER_A'
          DataSource = DMAnaMayor.DSxSaldos
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
        object DBESaldoAnt: TLFDbedit
          Left = 661
          Top = 0
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'SALDO_A'
          DataSource = DMAnaMayor.DSxSaldos
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
      end
      object PNL_Cta_3: TLFPanel
        Left = 0
        Top = 43
        Width = 784
        Height = 23
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object LBLSaldoAct: TLFLabel
          Left = 582
          Top = 5
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Saldo Actual'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object PNL_Cta_4: TLFPanel
          Left = 2
          Top = 1
          Width = 559
          Height = 21
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            559
            21)
          object LBLDesde: TLFLabel
            Left = 0
            Top = 4
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LBLHasta: TLFLabel
            Left = 133
            Top = 4
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LBLMonedaFicha: TLFLabel
            Left = 261
            Top = 4
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Moneda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DTPDesde: TLFDateEdit
            Left = 41
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPHasta: TLFDateEdit
            Left = 171
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object EFMoneda: TLFEditFind2000
            Left = 311
            Top = 0
            Width = 49
            Height = 21
            TabOrder = 2
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
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
          end
          object DBETitMoneda: TLFDbedit
            Left = 361
            Top = 0
            Width = 195
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAnaMayor.DSxMonedas
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
        object DBESaldoAct: TLFDbedit
          Left = 661
          Top = 1
          Width = 121
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'SALDO'
          DataSource = DMAnaMayor.DSxSaldos
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
      object DBGConsulta: THYTDBGrid
        Left = 0
        Top = 66
        Width = 784
        Height = 326
        Align = alClient
        Color = clInfoBk
        DataSource = DMAnaMayor.DSxMayor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGConsultaDrawColumnCell
        OnDblClick = DBGConsultaDblClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        TabFicha = TSFicha
        PermutaPaneles = True
        CamposAOrdenar.Strings = (
          'ASIENTO'
          'D_FECHA'
          'D_NUMERO'
          'D_SERIE'
          'DEBE'
          'FECHA'
          'HABER'
          'LINEA'
          'RIC'
          'SALDO'
          'TEXTO'
          'TIPO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'CANAL'
            Title.Alignment = taRightJustify
            Width = 29
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 63
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CENTRO_COSTE'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_CC'
            Width = 308
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ASIENTO'
            Width = 46
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CUENTA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TEXTO'
            Width = 279
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBE'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HABER'
            Width = 92
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_CUENTA'
            Visible = True
          end>
      end
    end
    object TSMovPeriodos: TTabSheet
      Caption = '&Periodos'
      ImageIndex = 2
      OnShow = TSMovPeriodosShow
      object PNL_Per_1: TLFPanel
        Left = 0
        Top = 0
        Width = 784
        Height = 21
        Align = alTop
        AutoSize = True
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object LBLMoneda: TLFLabel
          Left = 444
          Top = 4
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moneda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DBEpCentroCoste: TLFDbedit
          Left = 0
          Top = 0
          Width = 115
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'CENTRO_COSTE'
          DataSource = DMAnaMayor.DSxCentrosCoste
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBEpTitulo: TLFDbedit
          Left = 116
          Top = 0
          Width = 320
          Height = 21
          BevelInner = bvNone
          BevelOuter = bvNone
          BevelKind = bkFlat
          BevelWidth = 2
          BorderStyle = bsNone
          CharCase = ecUpperCase
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAnaMayor.DSxCentrosCoste
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EMoneda: TLFEdit
          Left = 494
          Top = 0
          Width = 54
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
      end
      object DBGPeriodos: THYTDBGrid
        Left = 0
        Top = 21
        Width = 784
        Height = 369
        Align = alClient
        Color = clInfoBk
        DataSource = DMAnaMayor.DSxmayor_cc_periodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'PERIODO'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIT_PER'
            Width = 357
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEBE'
            Title.Alignment = taRightJustify
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HABER'
            Title.Alignment = taRightJustify
            Width = 105
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SALDO'
            Title.Alignment = taRightJustify
            Width = 105
            Visible = True
          end>
      end
    end
    object TSTabla: TTabSheet
      Caption = '&Tabla'
      ImageIndex = 1
      OnShow = TSTablaShow
      object DBGMain: THYTDBGrid
        Left = 0
        Top = 0
        Width = 784
        Height = 390
        Align = alClient
        Color = clInfoBk
        DataSource = DMAnaMayor.DSxCentrosCoste
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        TabFicha = TSFicha
        PermutaPaneles = True
        CamposAOrdenar.Strings = (
          'CUENTA'
          'TIPO'
          'TITULO')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'CENTRO_COSTE'
            Width = 141
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Width = 605
            Visible = True
          end>
      end
    end
  end
  object TBNav: TLFToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 22
    AutoSize = True
    EdgeBorders = [ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    Separators = True
    object NavMayor: THYMNavigator
      Left = 0
      Top = 0
      Width = 88
      Height = 22
      DataSource = DMMayor.DSxCuentas
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 1
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TButtSeparador1: TToolButton
      Left = 88
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPMain: THYMEditPanel
      Left = 96
      Top = 0
      Width = 46
      Height = 22
      DataSource = DMMayor.DSxCuentas
      VisibleButtons = [neRango, neSalir]
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
      ControlEdit = CEMain
      OnClickRango = EPMainClickRango
    end
    object TButtSeparador3: TToolButton
      Left = 142
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtEdita: TToolButton
      Left = 150
      Top = 0
      Action = ARefrescaMayor
    end
    object TButtFiltra: TToolButton
      Left = 173
      Top = 0
      Action = AFiltraFechas
    end
    object TButtMoneda: TToolButton
      Left = 196
      Top = 0
      Action = AFiltraMoneda
    end
    object TButtSeparador2: TToolButton
      Left = 219
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PNLCuenta: TLFPanel
      Left = 227
      Top = 0
      Width = 565
      Height = 22
      BevelOuter = bvNone
      TabOrder = 2
      object LCentroCoste: TLFLabel
        Left = 222
        Top = 3
        Width = 92
        Height = 13
        Hint = 'Digitar (F6)'
        Alignment = taRightJustify
        Caption = '&Centro de Coste'
        FocusControl = EFCentroCoste
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LPlan: TLFLabel
        Left = 5
        Top = 4
        Width = 26
        Height = 13
        Hint = 'Digitar (F6)'
        Alignment = taRightJustify
        Caption = 'Plan'
        FocusControl = EFCentroCoste
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFCentroCoste: TLFEditFind2000
        Left = 317
        Top = 0
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = EFCentroCosteExit
        OnKeyDown = EFCentroCosteKeyDown
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
        OnBusqueda = EFCentroCosteBusqueda
        OrdenadoPor.Strings = (
          'CENTRO_COSTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object CBCanales: TLFComboBox
        Left = 439
        Top = 0
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = CBCanalesChange
        Items.Strings = (
          'Todos los canales')
      end
      object CBPlanesContables: TLFComboBox
        Left = 34
        Top = 0
        Width = 183
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        OnSelect = CBPlanesContablesSelect
      end
    end
  end
  object TBActions: TLFToolBar
    Left = 0
    Top = 442
    Width = 792
    Height = 24
    Align = alBottom
    ButtonHeight = 21
    ButtonWidth = 51
    Color = clBtnFace
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    List = True
    ParentColor = False
    ShowCaptions = True
    TabOrder = 0
    ActionList = ALMain
    Separators = True
  end
  object CEMain: TControlEdit
    FichaEdicion = TSFicha
    SubComplementario = ALMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 544
    Top = 166
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 576
    Top = 168
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
    object CEMainMiSep: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEMainMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 218
    Top = 118
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 298
    Top = 116
    object AVisualizarListado: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Filtrado'
      Hint = 'Visualizar Listado Filtrado'
      ImageIndex = 14
      OnExecute = AVisualizarListadoExecute
    end
    object AVisualizaMayor: TAction
      Category = 'Listados'
      Caption = 'Visualiza Mayor'
      Hint = 'Visualiza Mayor'
      ImageIndex = 14
      OnExecute = AVisualizaMayorExecute
    end
    object Asep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AConfRapidaListadoMayor: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida del Listado del Mayor'
      Hint = 'Configuraci'#243'n R'#225'pida del Listado del Mayor'
      ImageIndex = 77
      OnExecute = AConfRapidaListadoMayorExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ARefrescaMayor: TAction
      Category = 'Procesos'
      Caption = 'Refresca Mayor'
      Hint = 'Refresca Mayor'
      ImageIndex = 39
      OnExecute = ARefrescaMayorExecute
    end
    object AMoficarImputacion: TAction
      Category = 'Procesos'
      Caption = 'Modificar la imputaci'#243'n'
      Hint = 'Modificar la imputaci'#243'n'
      ImageIndex = 25
      OnExecute = AMoficarImputacionExecute
    end
    object AFiltraFechas: TAction
      Category = 'Procesos'
      Caption = 'Filtra entre fechas seleccionadas'
      Hint = 'Filtra entre fechas seleccionadas'
      ImageIndex = 22
      ShortCut = 49222
      OnExecute = AFiltraFechasExecute
    end
    object AFiltraMoneda: TAction
      Category = 'Procesos'
      Caption = 'Filtra con la moneda seleccionada'
      Hint = 'Filtra con la moneda seleccionada'
      ImageIndex = 56
      ShortCut = 49229
      OnExecute = AFiltraMonedaExecute
    end
    object AEliminaImputacion: TAction
      Category = 'Procesos'
      Caption = 'Elimina la imputaci'#243'n'
      Hint = 'Elimina la imputaci'#243'n'
      ImageIndex = 27
      OnExecute = AEliminaImputacionExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AConfRapidaListadoMayorOrdCC: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida del Listado del Mayor Ord. Centro de Coste'
      Hint = 'Configuraci'#243'n R'#225'pida del Listado del Mayor Ord. Centro de Coste'
      ImageIndex = 77
      OnExecute = AConfRapidaListadoMayorOrdCCExecute
    end
  end
end
