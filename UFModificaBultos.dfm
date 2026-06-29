object FModificaBultos: TFModificaBultos
  Left = 347
  Top = 202
  Width = 419
  Height = 200
  Caption = 'Modifica bultos del documento'
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
    Width = 411
    Height = 173
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBBultos: TLFLabel
      Left = 40
      Top = 69
      Width = 29
      Height = 13
      Caption = 'Bultos'
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 411
      Height = 24
      EdgeBorders = []
      Flat = True
      TabOrder = 0
      Separators = True
      object TButtAceptar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Aceptar'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
      object TButtCancelar: TToolButton
        Left = 23
        Top = 0
        Hint = 'Cancelar'
        Caption = 'Cancelar'
        ImageIndex = 27
        OnClick = TButtCancelarClick
      end
    end
    object EBultos: TLFEdit
      Left = 80
      Top = 64
      Width = 73
      Height = 21
      TabOrder = 1
    end
  end
end
