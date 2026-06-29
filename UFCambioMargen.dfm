inherited FCambioMargen: TFCambioMargen
  Left = 609
  Top = 414
  Caption = 'Cambiar precios y/o margen'
  ClientHeight = 171
  ClientWidth = 312
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 312
    Height = 147
    inherited TBMain: TLFToolBar
      Width = 308
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 2
      object TButtConfirmar: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Confirmar cambio de m'#225'rgen'
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
    object edtMargen: TLabeledEdit
      Left = 160
      Top = 112
      Width = 65
      Height = 21
      EditLabel.Width = 111
      EditLabel.Height = 13
      EditLabel.Caption = 'Margen / Incremento %'
      LabelPosition = lpLeft
      LabelSpacing = 6
      TabOrder = 1
    end
    object RGModo: TRadioGroup
      Left = 44
      Top = 48
      Width = 217
      Height = 57
      Caption = 'Modo'
      ItemIndex = 0
      Items.Strings = (
        'Inc. / Dec. del precio (bloqueados)'
        'Cambiar margen (todos)')
      TabOrder = 0
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
