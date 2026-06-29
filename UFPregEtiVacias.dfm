object FPregEtiVacias: TFPregEtiVacias
  Left = 507
  Top = 332
  Width = 312
  Height = 171
  Caption = ' Seleccionar ...'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LFPNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 304
    Height = 144
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLEtiVacias: TLFLabel
      Left = 20
      Top = 46
      Width = 94
      Height = 13
      Caption = 'N'#186' etiquetas vac'#237'as'
    end
    object PNLBotones: TLFPanel
      Left = 0
      Top = 96
      Width = 304
      Height = 48
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object BBAceptar: TBitBtn
        Left = 65
        Top = 4
        Width = 80
        Height = 30
        Caption = '&Aceptar'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ModalResult = 1
        ParentFont = False
        TabOrder = 0
      end
      object BBCancelar: TBitBtn
        Left = 161
        Top = 4
        Width = 80
        Height = 30
        Cancel = True
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 1
      end
    end
    object EEtiquetas: TLFEdit
      Left = 119
      Top = 43
      Width = 87
      Height = 21
      TabOrder = 0
    end
  end
end
