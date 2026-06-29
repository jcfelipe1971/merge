object FCCambioDivisas: TFCCambioDivisas
  Left = 481
  Top = 314
  BorderStyle = bsToolWindow
  Caption = 'Hist'#243'rico de cambios de divisas'
  ClientHeight = 289
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 504
    Height = 23
    Caption = ''
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    object PNLMain: TLFPanel
      Left = 0
      Top = 0
      Width = 463
      Height = 22
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object LBLOrigen: TLFLabel
        Left = 0
        Top = 1
        Width = 42
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Origen'
        Layout = tlCenter
      end
      object LBLDestino: TLFLabel
        Left = 230
        Top = 1
        Width = 47
        Height = 19
        Alignment = taCenter
        AutoSize = False
        Caption = 'Destino'
        Layout = tlCenter
      end
      object DBEOrigen: TLFDbedit
        Left = 41
        Top = 1
        Width = 35
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BevelWidth = 2
        BorderStyle = bsNone
        Color = clInfoBk
        DataField = 'ORIGEN'
        DataSource = DMCambioDivisas.DSxCambios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBETOrigen: TLFDbedit
        Left = 77
        Top = 1
        Width = 150
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BevelWidth = 2
        BorderStyle = bsNone
        Color = clInfoBk
        DataField = 'T_ORIGEN'
        DataSource = DMCambioDivisas.DSxCambios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEDestino: TLFDbedit
        Left = 276
        Top = 1
        Width = 35
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BevelWidth = 2
        BorderStyle = bsNone
        Color = clInfoBk
        DataField = 'DESTINO'
        DataSource = DMCambioDivisas.DSxCambios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBETDestino: TLFDbedit
        Left = 312
        Top = 1
        Width = 150
        Height = 21
        BevelInner = bvNone
        BevelOuter = bvNone
        BevelKind = bkFlat
        BevelWidth = 2
        BorderStyle = bsNone
        Color = clInfoBk
        DataField = 'T_DESTINO'
        DataSource = DMCambioDivisas.DSxCambios
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object ToolButton1: TToolButton
      Left = 463
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 471
      Top = 0
      Hint = 'Cerrar la ventana'
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
  end
  object HYTDBGMain: THYTDBGrid
    Left = 0
    Top = 23
    Width = 504
    Height = 266
    TabStop = False
    Align = alClient
    Color = clInfoBk
    DataSource = DMCambioDivisas.DSxCambiosAnt
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    AutoDeseleccionar = True
    PermutaPaneles = False
    CamposAOrdenar.Strings = (
      'CAMBIO'
      'F_ALTA'
      'F_BAJA'
      'FACTOR')
    CamposAOrdenarImgs = DMMain.ILOrdGrid
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Expanded = False
        FieldName = 'F_ALTA'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'F_BAJA'
        Width = 125
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CAMBIO'
        Title.Alignment = taRightJustify
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FACTOR'
        Title.Alignment = taRightJustify
        Width = 103
        Visible = True
      end>
  end
end
