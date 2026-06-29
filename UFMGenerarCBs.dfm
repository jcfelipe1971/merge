inherited FMGenerarCBs: TFMGenerarCBs
  Caption = 'Generar autom'#225't. C'#243'digos de Barras'
  ClientHeight = 191
  ClientWidth = 321
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 321
    Height = 167
    inherited TBMain: TLFToolBar
      Width = 317
      TabOrder = 2
      object TBGenerarCBs: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Generar C'#243'digos de Barras'
        Caption = 'Generar C'#243'digos'
        ImageIndex = 38
        ParentShowHint = False
        ShowHint = True
        OnClick = TBGenerarCBsClick
      end
      object TBSep1: TToolButton [1]
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object RGTipoCB: TRadioGroup
      Left = 14
      Top = 41
      Width = 284
      Height = 89
      BiDiMode = bdLeftToRight
      Caption = 'Tipo C'#243'digo de Barras'
      ItemIndex = 0
      Items.Strings = (
        'INDEFINIDO ( Codigo del Art'#237'culo )'
        'EAN13')
      ParentBiDiMode = False
      TabOrder = 0
    end
    object CBStock: TLFCheckBox
      Left = 60
      Top = 144
      Width = 195
      Height = 17
      Caption = 'S'#243'lo Art'#237'culos que controlen el stock'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited TBActions: TLFToolBar
    Top = 167
    Width = 321
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
  inherited ALMain: TLFActionList
    Left = 266
    Top = 15
  end
end
