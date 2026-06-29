object FMCambiaIdioma: TFMCambiaIdioma
  Left = 327
  Top = 186
  BorderStyle = bsDialog
  Caption = 'Cambiar Idioma'
  ClientHeight = 213
  ClientWidth = 312
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
  object PnlMain: TLFPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 213
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LblIdioma: TLFLabel
      Left = 64
      Top = 58
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Idioma'
    end
    object CBIdioma: TLFComboBox
      Left = 104
      Top = 55
      Width = 111
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object ButtAplicar: TButton
      Left = 104
      Top = 83
      Width = 111
      Height = 25
      Caption = 'Aplicar'
      TabOrder = 1
      OnClick = ButtAplicarClick
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 312
      Height = 25
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 2
      Separators = True
      object TButtSalir: TToolButton
        Left = 0
        Top = 0
        Hint = 'Salir'
        Caption = 'Salir'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtSalirClick
      end
    end
  end
end
