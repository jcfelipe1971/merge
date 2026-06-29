inherited FMForeignKey: TFMForeignKey
  Left = 516
  Top = 318
  Caption = 'Error al intentar grabar datos'
  ClientHeight = 326
  ClientWidth = 567
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 567
    Height = 302
    inherited TBMain: TLFToolBar
      Width = 563
      TabStop = True
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtVerDetalles: TToolButton
        Left = 33
        Top = 0
        Hint = 'Ver Detalles'
        Caption = 'Ver Detalles'
        ImageIndex = 1
        OnClick = TButtVerDetallesClick
      end
    end
    object PNLError: TLFPanel
      Left = 2
      Top = 28
      Width = 563
      Height = 61
      Align = alTop
      BevelOuter = bvNone
      BorderWidth = 10
      TabOrder = 1
      object LExplicacion: TLFLabel
        Left = 10
        Top = 10
        Width = 543
        Height = 41
        Align = alClient
        BiDiMode = bdLeftToRight
        Caption = 
          'Alg'#250'n valor introducido no tiene correspondencia en la base de d' +
          'atos o se est'#225' borrando un dato al que se hace referencia.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentBiDiMode = False
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
    end
    object PNLDetalles: TLFPanel
      Left = 2
      Top = 89
      Width = 563
      Height = 211
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object MDetalles: TLFMemo
        Left = 0
        Top = 0
        Width = 563
        Height = 211
        TabStop = False
        Align = alClient
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        Color = clInfoBk
        Lines.Strings = (
          '')
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 302
    Width = 567
  end
end
