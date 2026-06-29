object FVerSaldosTer: TFVerSaldosTer
  Left = 590
  Top = 285
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Ver Saldos de Terceros'
  ClientHeight = 466
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 26
    AutoSize = True
    Caption = ''
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    object LFPanel1: TLFPanel
      Left = 0
      Top = 0
      Width = 451
      Height = 22
      AutoSize = True
      BevelOuter = bvNone
      TabOrder = 0
      object LBLPeriodo: TLFLabel
        Left = 0
        Top = 0
        Width = 54
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = '&Periodo'
        FocusControl = DBLCBPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DBLCBPeriodo: TDBLookupComboBox
        Left = 54
        Top = 0
        Width = 45
        Height = 21
        DropDownRows = 12
        DropDownWidth = 450
        KeyField = 'PERIODO'
        ListField = 'PERIODO;TITULO;DESDE;HASTA'
        ListSource = DMTercerosCuentas.DSxPeriodos
        TabOrder = 0
      end
      object DBEPer_Tit: TLFDbedit
        Left = 100
        Top = 0
        Width = 209
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMTercerosCuentas.DSxPeriodos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEPer_desde: TLFDbedit
        Left = 310
        Top = 0
        Width = 70
        Height = 21
        Color = clInfoBk
        DataField = 'DESDE'
        DataSource = DMTercerosCuentas.DSxPeriodos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEPer_hasta: TLFDbedit
        Left = 381
        Top = 0
        Width = 70
        Height = 21
        Color = clInfoBk
        DataField = 'HASTA'
        DataSource = DMTercerosCuentas.DSxPeriodos
        Enabled = False
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
      Left = 451
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 459
      Top = 0
      Hint = 'Salir de esta ventana'
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TButtSalirClick
    end
  end
  object DBGMain: THYTDBGrid
    Left = 0
    Top = 26
    Width = 792
    Height = 440
    Align = alClient
    DataSource = DMTercerosCuentas.DSxVerSaldos
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
    CampoAOrdenarColor = clInfoBk
    OrdenMultiple = True
    Columns = <
      item
        Expanded = False
        FieldName = 'EMPRESA'
        Title.Alignment = taRightJustify
        Width = 33
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CANAL'
        Title.Alignment = taRightJustify
        Width = 36
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CUENTA'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Width = 288
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DEBE'
        Title.Alignment = taRightJustify
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'HABER'
        Title.Alignment = taRightJustify
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SALDO'
        Title.Alignment = taRightJustify
        Width = 90
        Visible = True
      end>
  end
end
