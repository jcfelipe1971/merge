inherited FMostrarImagen: TFMostrarImagen
  Left = 364
  Top = 173
  Width = 800
  Height = 600
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Imagen'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 547
    inherited TBMain: TLFToolBar
      Width = 786
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      object TButSep1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object ChkBAlign: TLFCheckBox
        Left = 41
        Top = 0
        Width = 150
        Height = 22
        Caption = 'Ajustar en Ventana'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = ChkBAlignClick
        Alignment = taLeftJustify
      end
      object ChkBMantenerAspecto: TLFCheckBox
        Left = 191
        Top = 0
        Width = 150
        Height = 22
        Caption = 'Mantener Aspecto'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        OnClick = ChkBMantenerAspectoClick
        Alignment = taLeftJustify
      end
    end
    object ScrBImagen: TScrollBox
      Left = 2
      Top = 28
      Width = 786
      Height = 517
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      TabOrder = 0
      object Imagen: TImage
        Left = 0
        Top = 0
        Width = 786
        Height = 517
        Align = alClient
        AutoSize = True
        Center = True
        IncrementalDisplay = True
        Proportional = True
        Stretch = True
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 790
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'ChkBAlign.Checked'
      'ChkBMantenerAspecto.Checked')
  end
end
