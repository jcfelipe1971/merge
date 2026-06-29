inherited FPregDatosCSB34: TFPregDatosCSB34
  Left = 471
  Top = 364
  Caption = 'Datos de la Norma'
  ClientHeight = 169
  ClientWidth = 310
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 310
    Height = 145
    object LSufijo: TLFLabel [0]
      Left = 92
      Top = 87
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Sufijo'
    end
    inherited TBMain: TLFToolBar
      Width = 306
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      object TButtConfirmar: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Confirmar Datos'
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
    object ESufijo: TLFEdit
      Left = 123
      Top = 82
      Width = 62
      Height = 21
      MaxLength = 6
      TabOrder = 1
      OnKeyUp = ESufijoKeyUp
    end
  end
  inherited TBActions: TLFToolBar
    Top = 145
    Width = 310
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
