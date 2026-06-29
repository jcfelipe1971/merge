inherited ZFMMarcManDirecto: TZFMMarcManDirecto
  Left = 479
  Top = 249
  Caption = 'Marcajes Manuales Directos'
  ClientHeight = 181
  ClientWidth = 330
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 330
    Height = 157
    object LbCodBarras: TLFLabel [0]
      Left = 10
      Top = 76
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'C. Barras (P)'
    end
    object LbTipo: TLFLabel [1]
      Left = 32
      Top = 99
      Width = 37
      Height = 13
      Alignment = taRightJustify
      Caption = 'Tipo (T)'
    end
    object LbOperario: TLFLabel [2]
      Left = 13
      Top = 122
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Operario (O)'
    end
    object LbCadenaMarcaje: TLFLabel [3]
      Left = 32
      Top = 44
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Marcaje'
    end
    inherited TBMain: TLFToolBar
      Width = 326
      TabOrder = 2
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object BProcesa: TToolButton
        Left = 25
        Top = 0
        Hint = 'Procesa'
        Caption = 'BProcesa'
        ImageIndex = 16
        OnClick = BProcesaClick
      end
      object BBorraMarcaje: TToolButton
        Left = 48
        Top = 0
        Caption = 'BBorraMarcaje'
        ImageIndex = 20
        OnClick = BBorraMarcajeClick
      end
    end
    object LFDescTipo: TLFEdit
      Left = 136
      Top = 95
      Width = 182
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 0
    end
    object LFDescOperario: TLFEdit
      Left = 136
      Top = 117
      Width = 182
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 1
    end
    object LFTipo: TLFEdit
      Left = 76
      Top = 95
      Width = 59
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 3
    end
    object LFBarras: TLFEdit
      Left = 76
      Top = 73
      Width = 59
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 4
    end
    object LFOperario: TLFEdit
      Left = 76
      Top = 117
      Width = 59
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 5
    end
    object LFMarcaje: TLFEdit
      Left = 76
      Top = 41
      Width = 242
      Height = 21
      TabOrder = 6
      OnKeyPress = LFMarcajeKeyPress
    end
    object LFError: TLFEdit
      Left = 76
      Top = 145
      Width = 242
      Height = 24
      TabStop = False
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      Visible = False
    end
    object LFDescCliente: TLFEdit
      Left = 136
      Top = 73
      Width = 182
      Height = 21
      TabStop = False
      Color = clInfoBk
      ReadOnly = True
      TabOrder = 8
    end
  end
  inherited TBActions: TLFToolBar
    Top = 157
    Width = 330
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
