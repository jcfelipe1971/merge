inherited ZFMAnulacionFacturas: TZFMAnulacionFacturas
  Left = 535
  Top = 147
  Caption = 'Anulaci'#243'n Facturas'
  ClientHeight = 183
  ClientWidth = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 441
    Height = 159
    Caption = ''
    object LMotivoAnulacion: TLFLabel [0]
      Left = 24
      Top = 44
      Width = 88
      Height = 13
      Caption = 'Motivo Anulaci'#243'n :'
    end
    inherited TBMain: TLFToolBar
      Width = 437
      ButtonWidth = 24
      TabOrder = 4
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtAnulaFactura: TToolButton
        Left = 25
        Top = 0
        Hint = 'Anular Factura'
        Action = AAnula
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
      end
      object TButtDesAnula: TToolButton
        Left = 49
        Top = 0
        Action = ADesAnula
        ParentShowHint = False
        ShowHint = True
      end
    end
    object EMotivos: TLFEdit
      Left = 140
      Top = 120
      Width = 285
      Height = 21
      MaxLength = 40
      TabOrder = 3
      OnEnter = EMotivosEnter
    end
    object RMotivo3: TRadioButton
      Left = 48
      Top = 123
      Width = 89
      Height = 17
      Caption = 'Otros motivos'
      TabOrder = 2
      OnClick = RMotivo3Click
    end
    object RMotivo2: TRadioButton
      Left = 48
      Top = 99
      Width = 189
      Height = 17
      Caption = 'Cliente no desea la mercanc'#237'a'
      TabOrder = 1
      OnClick = RMotivo2Click
    end
    object RMotivo1: TRadioButton
      Left = 48
      Top = 75
      Width = 113
      Height = 17
      Caption = 'Error de digitaci'#243'n'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = RMotivo1Click
    end
  end
  inherited TBActions: TLFToolBar
    Top = 159
    Width = 441
  end
  inherited ALMain: TLFActionList
    Left = 208
    Top = 28
    object AAnula: TAction
      Caption = 'Anula'
      Hint = 'Anula Factura'
      ImageIndex = 27
      OnExecute = AAnulaExecute
    end
    object ADesAnula: TAction
      Caption = 'Anular Anulaci'#243'n'
      Hint = 'Anula Anulacion'
      ImageIndex = 26
      OnExecute = ADesAnulaExecute
    end
  end
end
