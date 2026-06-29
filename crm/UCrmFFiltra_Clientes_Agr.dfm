object CrmFFiltra_clientes_agr: TCrmFFiltra_clientes_agr
  Left = 443
  Top = 248
  ActiveControl = EFAgrupacion
  BorderStyle = bsSingle
  Caption = 'Filtrado de Contactos por Agrupaci'#243'n'
  ClientHeight = 274
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 274
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBFiltrado: TLFToolBar
      Left = 0
      Top = 0
      Width = 392
      Height = 29
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 0
      Separators = True
      object HYMEditPanel1: THYMEditPanel
        Left = 0
        Top = 2
        Width = 23
        Height = 22
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 0
        Flat = True
        Exclusivo = True
      end
    end
    object GBCondicion: TGroupBox
      Left = 0
      Top = 29
      Width = 392
      Height = 74
      Align = alTop
      Caption = 'Condici'#243'n'
      TabOrder = 1
      object LBLAgrupacion: TLFLabel
        Left = 12
        Top = 47
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupaci'#243'n'
      end
      object EFAgrupacion: TLFEditFind2000
        Left = 70
        Top = 43
        Width = 50
        Height = 21
        TabOrder = 2
        OnChange = EFAgrupacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'tipo='#39'C'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ver_agrupaciones'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitulo: TLFDbedit
        Left = 121
        Top = 43
        Width = 255
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = CrmDMContactos.DSxTituloAgr
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object CHKAnd: TLFCheckBox
        Left = 84
        Top = 16
        Width = 49
        Height = 17
        Caption = 'Y'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        OnClick = CHKAndClick
        Alignment = taLeftJustify
      end
      object CHKor: TLFCheckBox
        Left = 11
        Top = 16
        Width = 49
        Height = 17
        Caption = 'O'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = CHKorClick
        Alignment = taLeftJustify
      end
    end
    object PNLFiltros: TLFPanel
      Left = 0
      Top = 103
      Width = 392
      Height = 171
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object PNLBotones: TLFPanel
        Left = 251
        Top = 0
        Width = 141
        Height = 171
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 0
        object SBAnade: TSpeedButton
          Left = 12
          Top = 9
          Width = 120
          Height = 30
          Caption = 'A'#241'adir &Condici'#243'n'
          Flat = True
          OnClick = SBAnadeClick
        end
        object SBBorraCond: TSpeedButton
          Left = 12
          Top = 48
          Width = 120
          Height = 30
          Caption = '&Borrar Condici'#243'n'
          Flat = True
          OnClick = SBBorraCondClick
        end
        object SBAceptar: TSpeedButton
          Left = 12
          Top = 89
          Width = 120
          Height = 30
          Caption = '&Aceptar'
          Flat = True
          NumGlyphs = 2
          OnClick = SBAceptarClick
        end
      end
      object SGCondiciones: TStringGrid
        Left = 0
        Top = 0
        Width = 251
        Height = 171
        Align = alClient
        Color = clInfoBk
        ColCount = 2
        DefaultRowHeight = 21
        FixedColor = clSilver
        FixedCols = 0
        RowCount = 2
        TabOrder = 1
        ColWidths = (
          64
          163)
      end
    end
  end
end
