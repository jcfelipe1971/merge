inherited FPregModelo349: TFPregModelo349
  Left = 404
  Top = 318
  HelpContext = 260
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Modelo 349. Operaciones Intracomunitarias'
  ClientHeight = 215
  ClientWidth = 512
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 512
    Height = 215
    inherited TBMain: TLFToolBar
      Width = 512
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
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
      object TButtInstrucciones: TToolButton
        Left = 432
        Top = 0
        Action = AInstrucciones
      end
    end
    inherited PBListado: TProgressBar
      Top = 199
      Width = 512
      TabOrder = 2
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 512
      Height = 163
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LTipoSoporte: TLFLabel
        Left = 104
        Top = 66
        Width = 76
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo de Soporte'
      end
      object LEjercicio: TLFLabel
        Left = 140
        Top = 22
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
      end
      object LNumeroDeclaracion: TLFLabel
        Left = 85
        Top = 90
        Width = 95
        Height = 13
        Alignment = taRightJustify
        Caption = 'Nro. de Declaracion'
      end
      object LPeriodo: TLFLabel
        Left = 144
        Top = 45
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object CBDeclaracionSustitutiva: TLFCheckBox
        Left = 24
        Top = 109
        Width = 175
        Height = 17
        Caption = 'Declaracion Sustitutiva'
        ClicksDisabled = False
        ColorCheck = 57088
        Layout = checkboxRight
        TabOrder = 0
        TabStop = True
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        Alignment = taLeftJustify
        OnChange = CBDeclaracionSustitutivaChange
      end
      object CBEjercicio: TLFComboBox
        Left = 186
        Top = 19
        Width = 110
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
      object CBPeriodo: TLFComboBox
        Left = 186
        Top = 41
        Width = 110
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          '1'#186' Trimestre'
          '2'#186' Trimestre'
          '3'#186' Trimestre'
          '4'#186' Trimestre'
          'Ejercicio completo')
      end
      object CBTipoSoporte: TLFComboBox
        Left = 186
        Top = 63
        Width = 110
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 1
        TabOrder = 3
        Text = 'T - Telematica'
        Items.Strings = (
          'C - En soporte'
          'T - Telematica')
      end
      object ENroDeclaracion: TLFEdit
        Left = 186
        Top = 85
        Width = 110
        Height = 21
        TabOrder = 4
        Text = '0'
      end
      object ENroDeclaracionSustituir: TLFEdit
        Left = 203
        Top = 107
        Width = 93
        Height = 21
        TabOrder = 5
        Text = '0'
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 286
    Top = 60
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    object AInstrucciones: TAction
      Caption = 'Instrucciones'
      Hint = 'Instrucciones'
      ImageIndex = 1
      OnExecute = AInstruccionesExecute
    end
  end
end
