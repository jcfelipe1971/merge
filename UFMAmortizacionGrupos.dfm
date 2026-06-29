object FMAmortizacionGrupos: TFMAmortizacionGrupos
  Left = 332
  Top = 153
  HelpContext = 1903
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Grupos de Inmovilizado'
  ClientHeight = 549
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGGrupos: TDBGrid
    Left = 0
    Top = 22
    Width = 543
    Height = 527
    Align = alLeft
    DataSource = DMAmortizacion.DSxGruposAmortizacion
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGGruposDblClick
    OnKeyDown = DBGGruposKeyDown
    Columns = <
      item
        Expanded = False
        FieldName = 'GRUPO'
        Width = 34
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Width = 347
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PORCENTAJE_MAX'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PERIODO_MAX_ANYOS'
        Visible = True
      end>
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 758
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_In
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object DBLCBGrupos: TDBLookupComboBox
      Left = 0
      Top = 0
      Width = 700
      Height = 21
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      DropDownRows = 11
      KeyField = 'GRUPO'
      ListField = 'TITULO'
      ListSource = DMAmortizacion.DSxGrupos
      TabOrder = 0
    end
    object TButtSep1: TToolButton
      Left = 700
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtAceptar: TToolButton
      Left = 708
      Top = 0
      Hint = 'Aceptar'
      Caption = 'Aceptar'
      ImageIndex = 19
      OnClick = TButtAceptarClick
    end
    object HYMEPGrupos: THYMEditPanel
      Left = 731
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
    end
  end
  object TreeView1: TTreeView
    Left = 543
    Top = 22
    Width = 215
    Height = 527
    Align = alRight
    BevelEdges = []
    Images = DMMain.ILMain_Ac
    Indent = 19
    TabOrder = 2
    Items.Data = {
      010000002F0000006E00000000000000FFFFFFFFFFFFFFFF0000000000000000
      16475255504F5320444520414D4F5254495A414349D34E}
  end
end
