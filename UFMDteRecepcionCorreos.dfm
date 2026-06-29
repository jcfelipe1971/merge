inherited FMDteRecepcionCorreos: TFMDteRecepcionCorreos
  Left = 494
  Top = 178
  Caption = 'Recepci'#243'n de correos'
  ClientHeight = 444
  ClientWidth = 598
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 598
    Height = 420
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 594
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PNLLog: TLFPanel
      Left = 2
      Top = 28
      Width = 594
      Height = 390
      Align = alClient
      TabOrder = 1
      object MLog: TMemo
        Left = 1
        Top = 1
        Width = 592
        Height = 388
        Align = alClient
        Lines.Strings = (
          'MLog')
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 420
    Width = 598
    TabOrder = 0
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
