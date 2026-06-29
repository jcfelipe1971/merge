object FBarras: TFBarras
  Left = 363
  Top = 120
  Width = 285
  Height = 183
  Caption = 'C'#243'digo de barras'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object PNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 277
    Height = 156
    Align = alClient
    TabOrder = 0
    object LBInfo: TLFLabel
      Left = 13
      Top = 30
      Width = 247
      Height = 26
      Caption = 
        'El art'#237'culo origen y destino tienen c'#243'digos de barras.'#13#10#191'Que des' +
        'ea hacer?'
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 275
      Height = 22
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object TBAceptar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Aceptar'
        Caption = 'Aceptar'
        ImageIndex = 19
        OnClick = TBAceptarClick
      end
      object TBCancelar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Cancelar'
        Caption = 'Cancelar'
        ImageIndex = 0
        OnClick = TBCancelarClick
      end
    end
    object RGBarras: TRadioGroup
      Left = 9
      Top = 58
      Width = 257
      Height = 91
      ItemIndex = 0
      Items.Strings = (
        'Mantener los c'#243'digos de ambos art'#237'culos'
        'Mantener los c'#243'digos del art'#237'culo origen'
        'Mantener los c'#243'digos del art'#237'culo destino')
      TabOrder = 1
    end
  end
end
