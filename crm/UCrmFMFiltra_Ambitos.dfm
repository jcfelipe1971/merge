object CrmFMFiltraAmbitos: TCrmFMFiltraAmbitos
  Left = 443
  Top = 248
  ActiveControl = EFAmbitos
  BorderStyle = bsSingle
  Caption = 'Filtrado de Contactos por '#193'mbitos'
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
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 0
      Separators = True
      object ToolButton1: TToolButton
        Left = 0
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object HYMEditPanel1: THYMEditPanel
        Left = 8
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
      object LBLAmbito: TLFLabel
        Left = 20
        Top = 50
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = #193'mbito'
      end
      object EFAmbitos: TLFEditFind2000
        Left = 56
        Top = 46
        Width = 53
        Height = 21
        TabOrder = 0
        OnChange = EFAmbitosChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AMBITO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CRM_SYS_AMBITOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitulo: TLFDbedit
        Left = 110
        Top = 46
        Width = 262
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = CrmDMContactos.DSxTituloAmb
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object CHKAnd: TLFCheckBox
        Left = 84
        Top = 18
        Width = 49
        Height = 17
        Caption = 'Y'
        ClicksDisabled = False
        TabOrder = 2
        TabStop = True
        Visible = False
        OnClick = CHKAndClick
        Alignment = taLeftJustify
      end
      object CHKor: TLFCheckBox
        Left = 11
        Top = 18
        Width = 49
        Height = 17
        Caption = 'O'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        Enabled = False
        TabOrder = 3
        TabStop = True
        OnClick = CHKorClick
        Alignment = taLeftJustify
      end
    end
    object PNLCondicion: TLFPanel
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
          Caption = 'A'#241'adir Condici'#243'n'
          Flat = True
          OnClick = SBAnadeClick
        end
        object SBBorraCond: TSpeedButton
          Left = 12
          Top = 48
          Width = 120
          Height = 30
          Caption = 'Borrar Condici'#243'n'
          Flat = True
          OnClick = SBBorraCondClick
        end
        object SBAceptar: TSpeedButton
          Left = 12
          Top = 88
          Width = 120
          Height = 30
          Caption = '&Aceptar'
          Flat = True
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
