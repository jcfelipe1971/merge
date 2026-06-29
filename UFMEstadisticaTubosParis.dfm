inherited FMEstadisticaTubosParis: TFMEstadisticaTubosParis
  Caption = 'Estadistica Tubos Paris'
  ClientHeight = 237
  ClientWidth = 441
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 441
    Height = 237
    object LFechaDesde: TLFLabel [0]
      Left = 126
      Top = 48
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LFechaHasta: TLFLabel [1]
      Left = 129
      Top = 72
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    inherited TBMain: TLFToolBar
      Width = 441
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object TButtExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
    end
    inherited PBListado: TProgressBar
      Top = 208
      Width = 441
      TabOrder = 12
    end
    inherited PCMain: TLFPageControl
      Top = 224
      Width = 441
      Height = 13
      Align = alBottom
      Visible = False
    end
    object DEFechaDesde: TLFDateEdit
      Left = 164
      Top = 44
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
    end
    object DEFechaHasta: TLFDateEdit
      Left = 164
      Top = 68
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
    end
    object CBEstFamAgeCliArt: TCheckBox
      Left = 88
      Top = 90
      Width = 150
      Height = 17
      Caption = 'Fam-Age-Cli-Art'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object CBEstAgeCliFam: TCheckBox
      Left = 88
      Top = 112
      Width = 150
      Height = 17
      Caption = 'Age-Cli-Fam'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object CBEstAgeFamCli: TCheckBox
      Left = 88
      Top = 134
      Width = 150
      Height = 17
      Caption = 'Age-Fam-Cli'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object CBEstAgeCli: TCheckBox
      Left = 88
      Top = 156
      Width = 150
      Height = 17
      Caption = 'Age-Cli'
      Checked = True
      State = cbChecked
      TabOrder = 7
    end
    object CBEstCli: TCheckBox
      Left = 88
      Top = 178
      Width = 150
      Height = 17
      Caption = 'Cli'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    object CBxEstFam: TCheckBox
      Left = 88
      Top = 200
      Width = 150
      Height = 17
      Caption = 'Fam'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
    object CBEstFamArt: TCheckBox
      Left = 256
      Top = 90
      Width = 150
      Height = 17
      Caption = 'Fam-Art'
      Checked = True
      State = cbChecked
      TabOrder = 10
    end
    object CBAgentes: TCheckBox
      Left = 256
      Top = 112
      Width = 150
      Height = 17
      Caption = 'Agentes'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
  end
  inherited ALMain: TLFActionList
    Left = 404
    Top = 40
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBAgentes.Checked'
      'CBEstAgeCli.Checked'
      'CBEstAgeFamCli.Checked'
      'CBEstAgeCliFam.Checked'
      'CBEstCli.Checked'
      'CBEstFamAgeCliArt.Checked'
      'CBEstFamArt.Checked'
      'CBxEstFam.Checked')
    Left = 372
    Top = 40
  end
end
