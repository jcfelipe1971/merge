object ProFMEscCalculoFiltrado: TProFMEscCalculoFiltrado
  Left = 460
  Top = 321
  Width = 382
  Height = 258
  Caption = 'C'#225'culo escandallo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 374
    Height = 231
    Align = alClient
    TabOrder = 0
    object LBLTitulo: TLFLabel
      Left = 1
      Top = 1
      Width = 372
      Height = 22
      Align = alTop
      Alignment = taCenter
      Caption = 'C'#225'culos escandallo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ButtComenzar: TButton
      Left = 165
      Top = 186
      Width = 75
      Height = 25
      Caption = 'Comenzar'
      TabOrder = 0
      OnClick = ButtComenzarClick
    end
    object ButtSalir: TButton
      Left = 247
      Top = 186
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = ButtSalirClick
    end
    object CBFormulas: TLFCheckBox
      Left = 19
      Top = 44
      Width = 97
      Height = 17
      Caption = 'F'#243'rmulas'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBPrecios: TLFCheckBox
      Left = 19
      Top = 64
      Width = 97
      Height = 17
      Caption = 'Precios'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
    object PNLProgreso: TLFPanel
      Left = 15
      Top = 88
      Width = 339
      Height = 81
      BevelOuter = bvNone
      TabOrder = 4
      object LProcesandoRIC: TLFLabel
        Left = 15
        Top = 36
        Width = 167
        Height = 16
        Alignment = taRightJustify
        Caption = 'Procesando Escandallo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFaltan: TLFLabel
        Left = 138
        Top = 16
        Width = 44
        Height = 16
        Alignment = taRightJustify
        Caption = 'Faltan'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LBLRic: TLFLabel
        Left = 216
        Top = 38
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
      object LBLFaltan: TLFLabel
        Left = 216
        Top = 17
        Width = 6
        Height = 13
        Alignment = taRightJustify
        Caption = '0'
      end
    end
  end
end
