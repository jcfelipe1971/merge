object ZFMPunteoAsientos: TZFMPunteoAsientos
  Left = 331
  Top = 153
  Width = 1237
  Height = 427
  HelpContext = 247
  Caption = 'Punteo de Asientos'
  Color = clBtnFace
  Constraints.MinHeight = 400
  Constraints.MinWidth = 800
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEPunteoPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 1229
    Height = 25
    AutoSize = True
    ButtonHeight = 25
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 110
      Height = 25
      DataSource = ZDMPunteoAsientos.DSQMPunteos
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
      Flat = True
      ParentShowHint = False
      PopupMenu = CEPunteoPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      ControlEdit = CEPunteo
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TButtSep1: TToolButton
      Left = 110
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PNLTBMain: TLFPanel
      Left = 118
      Top = 0
      Width = 229
      Height = 25
      BevelOuter = bvNone
      TabOrder = 1
      object LDigiteCuenta: TLFLabel
        Left = 8
        Top = 4
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Digite la Cuenta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFCuenta: TLFEditFind2000
        Left = 106
        Top = 1
        Width = 122
        Height = 21
        TabOrder = 0
        OnExit = EFCuentaExit
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'Nivel >= 5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object TButtSep3: TToolButton
      Left = 347
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPPunteo: THYMEditPanel
      Left = 355
      Top = 0
      Width = 46
      Height = 25
      VisibleButtons = [neImprime, neSalir]
      ParentShowHint = False
      PopupMenu = CEPunteoPMEdit
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 2
      Flat = True
      Exclusivo = True
      ControlEdit = CEPunteo
      OnClickImprime = EPPunteoClickImprime
    end
    object TButtDisenarListado: TToolButton
      Left = 401
      Top = 0
      Action = ADisenarListado
    end
    object TButtSep2: TToolButton
      Left = 424
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PFiltroFechas: TLFPanel
      Left = 432
      Top = 0
      Width = 235
      Height = 25
      BevelOuter = bvNone
      TabOrder = 3
      object LFEntreFechaKri: TLFLabel
        Left = 4
        Top = 4
        Width = 33
        Height = 13
        Alignment = taCenter
        Caption = 'Fecha '
        Layout = tlCenter
      end
      object LFDEDesdeFecha: TLFDateEdit
        Left = 39
        Top = 1
        Width = 98
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object LFDEHastaFecha: TLFDateEdit
        Left = 136
        Top = 1
        Width = 97
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object PNLSeleccionTraPro: TLFPanel
      Left = 667
      Top = 0
      Width = 79
      Height = 25
      BevelOuter = bvNone
      TabOrder = 4
      object chkTransitos: TLFCheckBox
        Left = 2
        Top = 4
        Width = 36
        Height = 16
        Hint = 'Transitos'
        Caption = 'T'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
      end
      object chkPunteados: TLFCheckBox
        Left = 40
        Top = 4
        Width = 36
        Height = 16
        Hint = 'Punteados'
        Caption = 'P'
        ClicksDisabled = False
        ColorCheck = 57088
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object ToolButton1: TToolButton
      Left = 746
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PNLActualizaDatos: TLFPanel
      Left = 754
      Top = 0
      Width = 238
      Height = 25
      BevelOuter = bvNone
      TabOrder = 5
      object LBalanceSBanco: TLFLabel
        Left = 4
        Top = 5
        Width = 85
        Height = 13
        Alignment = taRightJustify
        Caption = 'Balance S/Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
      end
      object EBalanceSBanco: TLFEdit
        Left = 92
        Top = 2
        Width = 117
        Height = 21
        TabStop = False
        Color = clHighlightText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnChange = EBalanceSBancoChange
      end
      object BFiltra: TButton
        Left = 213
        Top = 0
        Width = 23
        Height = 25
        Hint = 'Conciliar'
        Caption = '?'
        TabOrder = 1
        OnClick = BFiltraClick
      end
    end
  end
  object PNLMain: TLFPanel
    Left = 0
    Top = 25
    Width = 774
    Height = 375
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    Constraints.MinWidth = 700
    TabOrder = 1
    object DBGFPunteo: TDBGridFind2000
      Left = 0
      Top = 91
      Width = 774
      Height = 284
      Align = alClient
      BiDiMode = bdLeftToRight
      BorderStyle = bsNone
      DataSource = ZDMPunteoAsientos.DSQMPunteos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGFPunteoDrawColumnCell
      OnDblClick = DBGFPunteoDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CamposAOrdernar.Strings = (
        'IMPORTE'
        'PUNTEO'
        'SIGNO'
        'TEXTO'
        'ASIENTO'
        'FECHA'
        'FECHA_PUNTEO')
      ColumnasCheckBoxes.Strings = (
        'PUNTEO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ASIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 110
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TEXTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 330
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SIGNO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPORTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PUNTEO'
          ImeMode = imKata
          Width = 27
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_PUNTEO'
          ReadOnly = True
          Visible = True
        end>
    end
    object TBPunteo: TLFToolBar
      Left = 0
      Top = 0
      Width = 774
      Height = 91
      AutoSize = True
      ButtonHeight = 91
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 1
      Separators = True
      object PNLTB2: TLFPanel
        Left = 0
        Top = 0
        Width = 766
        Height = 91
        Align = alClient
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object LCuenta: TLFLabel
          Left = 63
          Top = 4
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cuenta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LSaldo: TLFLabel
          Left = 612
          Top = 4
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Saldo Anterior'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LSaldoPunteado: TLFLabel
          Left = 402
          Top = 26
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Neto Punteado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LTotalCreditoPost: TLFLabel
          Left = 204
          Top = 26
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Cr'#233'dito Punt.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LTotalDebitoPost: TLFLabel
          Left = 6
          Top = 26
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total D'#233'bitos Punt.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LNetoEnTransito: TLFLabel
          Left = 395
          Top = 48
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Neto en Tr'#225'nsito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LDebitoEnTranisto: TLFLabel
          Left = 5
          Top = 48
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'D'#233'bitos en Transito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LCreditoEnTransito: TLFLabel
          Left = 203
          Top = 48
          Width = 89
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cr'#233'dito en Tr'#225'nsito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LDiferencia: TLFLabel
          Left = 630
          Top = 48
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Diferencia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LBalanceSLibro: TLFLabel
          Left = 605
          Top = 26
          Width = 73
          Height = 13
          Alignment = taRightJustify
          Caption = 'Balance S/Bco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LBalanceLibro: TLFLabel
          Left = 601
          Top = 70
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'Balance S/Libro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LTotalDebito: TLFLabel
          Left = 34
          Top = 68
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total D'#233'bitos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object LTotalCredito: TLFLabel
          Left = 227
          Top = 68
          Width = 65
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total Cr'#233'ditos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object ESaldoAnterior: TLFEdit
          Left = 683
          Top = 0
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object ESaldoPunteado: TLFEdit
          Left = 479
          Top = 22
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          OnChange = ESaldoPunteadoN43Change
        end
        object ECuenta: TLFEdit
          Left = 102
          Top = 0
          Width = 120
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          OnChange = ESaldoPunteadoN43Change
        end
        object ETituloCuenta: TLFEdit
          Left = 223
          Top = 0
          Width = 334
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          OnChange = ESaldoPunteadoN43Change
        end
        object ETotalCreditoPunteado: TLFEdit
          Left = 297
          Top = 22
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
        end
        object ETotalDebitoPunteado: TLFEdit
          Left = 102
          Top = 22
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
        object ESaldoTransito: TLFEdit
          Left = 479
          Top = 44
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
          OnChange = ESaldoPunteadoN43Change
        end
        object ETotalDebitoTransito: TLFEdit
          Left = 102
          Top = 44
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 7
          OnChange = ESaldoPunteadoN43Change
        end
        object ETotalCrebitoTransito: TLFEdit
          Left = 297
          Top = 44
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 8
          OnChange = ESaldoPunteadoN43Change
        end
        object EDiferencia: TLFEdit
          Left = 683
          Top = 44
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 9
        end
        object EBalanceSegunLibro: TLFEdit
          Left = 683
          Top = 22
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 10
        end
        object EBalanceLibro: TLFEdit
          Left = 683
          Top = 66
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 11
        end
        object ETotalDebito: TLFEdit
          Left = 102
          Top = 66
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 12
          OnChange = ESaldoPunteadoN43Change
        end
        object ETotalCredito: TLFEdit
          Left = 297
          Top = 66
          Width = 78
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 13
          OnChange = ESaldoPunteadoN43Change
        end
      end
    end
  end
  object PNLNorma43: TLFPanel
    Left = 774
    Top = 25
    Width = 455
    Height = 375
    Align = alRight
    AutoSize = True
    BevelOuter = bvNone
    Constraints.MinWidth = 455
    TabOrder = 2
    Visible = False
    object Splitter1: TSplitter
      Left = 449
      Top = 30
      Width = 5
      Height = 150
      Cursor = crHSplit
      Align = alCustom
      Visible = False
    end
    object TBN43: TLFToolBar
      Left = 0
      Top = 0
      Width = 455
      Height = 29
      EdgeInner = esNone
      EdgeOuter = esNone
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object TButtPunteoN43: TToolButton
        Left = 0
        Top = 2
        Hint = 'Visualiza solo cuentas punteadas'
        Caption = 'Cuentas Punteadas'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
      end
      object TButtNoPunteoN43: TToolButton
        Left = 23
        Top = 2
        Hint = 'Visualiza solo cuentas no punteadas'
        Caption = 'Cuentas NO Punteadas'
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
      end
      object LBanco: TLFLabel
        Left = 46
        Top = 2
        Width = 43
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Banco'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFBanco: TLFEditFind2000
        Left = 89
        Top = 2
        Width = 16
        Height = 22
        TabOrder = 0
        Text = '0'
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ENTIDAD'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_CUENTAS_GES_BAN'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'entidad')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ToolButton4: TToolButton
        Left = 105
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object LEntidad: TLFLabel
        Left = 113
        Top = 2
        Width = 44
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Entidad'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFEntidad: TLFEditFind2000
        Left = 157
        Top = 2
        Width = 31
        Height = 22
        TabOrder = 1
        Text = '0000'
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ENTIDAD'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_BANCOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'entidad')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ToolButton3: TToolButton
        Left = 188
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object TButtVincularN43: TToolButton
        Left = 196
        Top = 2
        Action = AVincularN43
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 219
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object LSaldoPunteadoN43: TLFLabel
        Left = 227
        Top = 2
        Width = 31
        Height = 22
        Alignment = taRightJustify
        Caption = 'Punt.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ESaldoPunteadoN43: TLFEdit
        Left = 258
        Top = 2
        Width = 78
        Height = 22
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnChange = ESaldoPunteadoN43Change
      end
      object ToolButton5: TToolButton
        Left = 336
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object TBGeneraAsiento: TToolButton
        Left = 344
        Top = 2
        Action = AGeneraAsiento
        ImageIndex = 94
        ParentShowHint = False
        ShowHint = True
      end
      object LApuntesKri: TLFLabel
        Left = 367
        Top = 2
        Width = 27
        Height = 22
        Alignment = taRightJustify
        Caption = 'Apu.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object ToolButton6: TToolButton
        Left = 394
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object TBTesoreria: TToolButton
        Left = 402
        Top = 2
        Action = ATesoreria
        ParentShowHint = False
        ShowHint = True
      end
      object LRecibos: TLFLabel
        Left = 425
        Top = 2
        Width = 28
        Height = 22
        Alignment = taRightJustify
        Caption = 'Rec.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
    object PNLDetalleNorma43: TLFPanel
      Left = 0
      Top = 187
      Width = 455
      Height = 188
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        455
        188)
      object DBImporte: TDBText
        Left = 304
        Top = 1
        Width = 106
        Height = 17
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Color = clInfoBk
        DataField = 'IMPORTE'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBTTitConceptoComun: TDBText
        Left = 34
        Top = 18
        Width = 376
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        DataField = 'TIT_CONC_COMUN'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBConcComun: TDBText
        Left = 2
        Top = 18
        Width = 32
        Height = 16
        Color = clWhite
        DataField = 'CONCEPTO_COMUN'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBConcPropio: TDBText
        Left = 2
        Top = 32
        Width = 32
        Height = 16
        Color = clInfoBk
        DataField = 'CONCEPTO_PROPIO'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBTTitConceptoPropio: TDBText
        Left = 34
        Top = 32
        Width = 376
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        Color = clInfoBk
        DataField = 'TIT_CONC_PROPIO'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBFecOperacion: TDBText
        Left = 114
        Top = 48
        Width = 103
        Height = 16
        Color = clWhite
        DataField = 'FECHA_OPERACION'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBFecValor: TDBText
        Left = 2
        Top = 48
        Width = 111
        Height = 16
        Color = clWhite
        DataField = 'FECHA_VALOR'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBReferencia1: TDBText
        Left = 2
        Top = 64
        Width = 408
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        Color = clInfoBk
        DataField = 'REFERENCIA1'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object DBReferencia2: TDBText
        Left = 2
        Top = 80
        Width = 408
        Height = 16
        Anchors = [akLeft, akTop, akRight]
        Color = clWhite
        DataField = 'REFERENCIA2'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ParentColor = False
      end
      object LNorma43Det: TLFLabel
        Left = 1
        Top = 96
        Width = 409
        Height = 91
        Anchors = [akLeft, akTop, akRight]
        AutoSize = False
        Caption = 'Concepto'
        Color = clInfoBk
        ParentColor = False
      end
      object LFDBCBPunteoN43: TLFDBCheckBox
        Left = 2
        Top = 1
        Width = 111
        Height = 17
        Caption = 'Punteo'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'PUNTEO'
        DataSource = DMPunteoAsientos.DSQMNorma43
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object DBGFNorma43: TDBGridFind2000
      Left = 0
      Top = 29
      Width = 455
      Height = 158
      Align = alClient
      BorderStyle = bsNone
      DataSource = DMPunteoAsientos.DSQMNorma43
      DefaultDrawing = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Microsoft Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'FECHA_VALOR'
        'FECHA_OPERACION'
        'IMPORTE'
        'CONCEPTO_PROPIO')
      ColumnasCheckBoxes.Strings = (
        'PUNTEO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'PUNTEO'
          Width = 22
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_OPERACION'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGNO'
          Width = 17
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONCEPTO_PROPIO'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIT_CONC_PROPIO'
          Width = 181
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_VALOR'
          Width = 55
          Visible = True
        end>
    end
  end
  object CEPunteo: TControlEdit
    PopUpMenu = CEPunteoPMEdit
    Left = 288
    Top = 160
  end
  object CEPunteoPMEdit: TPopUpTeclas
    Left = 328
    Top = 160
    object CEPunteoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPunteoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPunteoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPunteoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPunteoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEPunteoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEPunteoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEPunteoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEPunteoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEPunteoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEPunteoMiSep: TMenuItem
      Caption = '-'
    end
    object CEPunteoMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEPunteoMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEPunteoMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEPunteoMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
    end
    object CEPunteoMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object CEPunteoMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEPunteoMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEPunteoMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEPunteoMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEPunteoMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object ActionList1: TActionList
    Left = 400
    Top = 160
    object AVincularN43: TAction
      Caption = 'Vincular N43'
      Hint = 'Vincula registros de la norma 43 importada con apuntes'
      ImageIndex = 21
      ShortCut = 86
      OnExecute = AVincularN43Execute
    end
    object AGeneraAsiento: TAction
      Caption = 'Genera Asiento'
      Hint = 'Genera Asiento seg'#250'n plantilla asociada'
      ImageIndex = 30
      OnExecute = AGeneraAsientoExecute
    end
    object ATesoreria: TAction
      Caption = 'Tesoreria'
      Hint = 'Busca recibos de este importe en tesoreria'
      ImageIndex = 46
      OnExecute = ATesoreriaExecute
    end
    object ADisenarListado: TAction
      Caption = 'Dise'#241'ar Listado'
      Hint = 'Dise'#241'ar Listado'
      ImageIndex = 77
      OnExecute = ADisenarListadoExecute
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'DBGFPunteo.Columns')
    StoredValues = <>
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 370
    Top = 160
  end
end
