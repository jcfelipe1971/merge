inherited FMFechaVenceRecibos: TFMFechaVenceRecibos
  Left = 528
  Top = 291
  Caption = 'Vencer vencimientos'
  ClientHeight = 171
  ClientWidth = 312
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 312
    Height = 147
    object LBLFecha: TLFLabel [0]
      Left = 22
      Top = 64
      Width = 157
      Height = 43
      AutoSize = False
      Caption = 
        'Vence los vencimientos pendientes de contabilizar cuya fecha val' +
        'or sea anterior a:'
      WordWrap = True
    end
    inherited TBMain: TLFToolBar
      Width = 308
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
      object TButtAceptar: TToolButton
        Left = 25
        Top = 0
        Hint = 'Aceptar'
        Caption = 'Aceptar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtAceptarClick
      end
    end
    object DTPFecha: TLFDateEdit
      Left = 187
      Top = 77
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
      OnKeyPress = DTPFechaKeyPress
    end
    object LFCForzar: TLFCheckBox
      Left = 24
      Top = 112
      Width = 249
      Height = 17
      Hint = 'Tener en cuenta la fecha valor'
      Caption = 'Forzar fecha valor'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 2
      TabStop = True
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
