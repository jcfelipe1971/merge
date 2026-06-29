inherited FPregCodCSB: TFPregCodCSB
  Left = 640
  Top = 210
  Caption = 'C'#243'digo CSB'
  ClientHeight = 171
  ClientWidth = 312
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 312
    Height = 147
    object LBLCodCSB: TLFLabel [0]
      Left = 63
      Top = 65
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'C'#243'digo CSB'
    end
    inherited TBMain: TLFToolBar
      Width = 308
      TabOrder = 2
      object TButtConfirmar: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Confirmar Codigo Ordenante'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
      inherited EPMain: THYMEditPanel
        Left = 23
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object ECodigoCSB: TLFEdit
      Left = 126
      Top = 62
      Width = 57
      Height = 21
      MaxLength = 3
      TabOrder = 0
      Text = '000'
      OnKeyUp = ECodigoCSBKeyUp
    end
    object CBRef: TLFCheckBox
      Left = 63
      Top = 86
      Width = 179
      Height = 17
      Caption = 'Usar referencia para descripci'#243'n'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 1
      TabStop = True
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Alignment = taLeftJustify
    end
  end
  inherited TBActions: TLFToolBar
    Top = 147
    Width = 312
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
