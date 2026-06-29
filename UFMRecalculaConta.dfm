object FMRecalculaConta: TFMRecalculaConta
  Left = 589
  Top = 380
  Width = 307
  Height = 187
  Caption = 'Recalcula Contabilidad'
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
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 299
    Height = 160
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLTitulo: TLFLabel
      Left = 0
      Top = 0
      Width = 299
      Height = 22
      Align = alTop
      Alignment = taCenter
      Caption = 'Recalculo de Saldos Contables'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LFaltan: TLFLabel
      Left = 94
      Top = 64
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
    object LBLFaltan: TLFLabel
      Left = 198
      Top = 64
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object LProcesandoRIC: TLFLabel
      Left = 26
      Top = 84
      Width = 112
      Height = 16
      Alignment = taRightJustify
      Caption = 'Procesando Ric'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LBLRic: TLFLabel
      Left = 198
      Top = 84
      Width = 6
      Height = 13
      Alignment = taRightJustify
      Caption = '0'
    end
    object ButtComenzar: TButton
      Left = 62
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Comenzar'
      TabOrder = 0
      OnClick = ButtComenzarClick
    end
    object ButtSalir: TButton
      Left = 164
      Top = 120
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = ButtSalirClick
    end
  end
end
