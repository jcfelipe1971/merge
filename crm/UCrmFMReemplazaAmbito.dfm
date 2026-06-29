object CrmFMReemplazaAmbito: TCrmFMReemplazaAmbito
  Left = 567
  Top = 414
  BorderStyle = bsDialog
  Caption = 'Reemplazar masivamente '#225'mbitos'
  ClientHeight = 183
  ClientWidth = 332
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LVAmbitos: TListView
    Left = 0
    Top = 25
    Width = 332
    Height = 133
    Align = alClient
    Checkboxes = True
    Columns = <>
    FlatScrollBars = True
    IconOptions.AutoArrange = True
    MultiSelect = True
    ParentShowHint = False
    ShowHint = False
    SortType = stText
    TabOrder = 0
    ViewStyle = vsList
  end
  object PNLTop: TLFPanel
    Left = 0
    Top = 0
    Width = 332
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    object LblReemplazarAmbitos: TLFLabel
      Left = 3
      Top = 6
      Width = 167
      Height = 13
      Caption = 'Reemplazar los siguientes '#225'mbitos: '
    end
  end
  object PNLPie: TLFPanel
    Left = 0
    Top = 158
    Width = 332
    Height = 25
    Align = alBottom
    BevelOuter = bvNone
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    object ButtInvertir: TButton
      Left = 0
      Top = 2
      Width = 88
      Height = 22
      Caption = 'Invertir &selecci'#243'n'
      TabOrder = 0
      OnClick = ButtInvertirClick
    end
    object ButtCerrar: TButton
      Left = 153
      Top = 2
      Width = 88
      Height = 22
      Caption = '&Cerrar'
      TabOrder = 1
      OnClick = ButtCerrarClick
    end
    object ButtReemplazar: TButton
      Left = 243
      Top = 2
      Width = 88
      Height = 22
      Caption = '&Reemplazar'
      TabOrder = 2
      OnClick = ButtReemplazarClick
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = False
    StoredValues = <>
    Left = 251
    Top = 61
  end
end
