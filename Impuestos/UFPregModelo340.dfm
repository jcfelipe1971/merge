inherited FPregModelo340: TFPregModelo340
  Left = 541
  Top = 374
  Caption = 'Modelo 340 - Declaraci'#243'n de Facturas'
  ClientHeight = 210
  ClientWidth = 437
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 437
    Height = 210
    inherited TBMain: TLFToolBar
      Width = 437
      object TBExportacion340: TToolButton
        Left = 288
        Top = 0
        Action = AExportarModelo340
      end
      object TButtConfRapida: TToolButton
        Left = 360
        Top = 0
        Action = AConfigurar
      end
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 437
      Height = 174
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LTipoDeclaracion: TLFLabel
        Left = 29
        Top = 119
        Width = 96
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo de Declaracion'
      end
      object LDeclaracionAnterior: TLFLabel
        Left = 249
        Top = 119
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Decl. Anterior'
        Visible = False
      end
      object LDesdeRegistro: TLFLabel
        Left = 52
        Top = 48
        Width = 73
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Registro'
      end
      object LEjercicio: TLFLabel
        Left = 85
        Top = 26
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
      end
      object LHastaRegistro: TLFLabel
        Left = 55
        Top = 70
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Registro'
      end
      object LModoPresentacion: TLFLabel
        Left = 18
        Top = 141
        Width = 107
        Height = 13
        Alignment = taRightJustify
        Caption = 'Modo de Presentaci'#243'n'
      end
      object LPeriodo: TLFLabel
        Left = 277
        Top = 26
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object LSecuencia: TLFLabel
        Left = 74
        Top = 97
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Secuencia'
      end
      object CBEjercicio: TLFComboBox
        Left = 129
        Top = 22
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object CBModoPresentacion: TLFComboBox
        Left = 129
        Top = 136
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 1
        Text = 'Telem'#225'tica'
        OnChange = CBTipoDeclaracionChange
        Items.Strings = (
          'Telem'#225'tica'
          'DVD')
      end
      object CBPeriodo: TLFComboBox
        Left = 317
        Top = 22
        Width = 97
        Height = 21
        Style = csDropDownList
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 2
        Items.Strings = (
          '1'#186' Trimestre'
          '2'#186' Trimestre'
          '3'#186' Trimestre'
          '4'#186' Trimestre'
          'Enero'
          'Febrero'
          'Marzo'
          'Abril'
          'Mayo'
          'Junio'
          'Julio'
          'Agosto'
          'Septiembre'
          'Octubre'
          'Noviembre'
          'Diciembre')
      end
      object CBTipoDeclaracion: TLFComboBox
        Left = 129
        Top = 115
        Width = 100
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = 'Normal'
        OnChange = CBTipoDeclaracionChange
        Items.Strings = (
          'Normal'
          'Complementaria'
          'Sustitutiva')
      end
      object EDeclaracionAnterior: TLFEdit
        Left = 317
        Top = 115
        Width = 97
        Height = 21
        TabOrder = 4
        Text = '340EEEEPPSSSS'
        Visible = False
      end
      object EDesdeRegistro: TLFEdit
        Left = 129
        Top = 44
        Width = 73
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 5
        Text = '1'
      end
      object EHastaRegistro: TLFEdit
        Left = 129
        Top = 66
        Width = 73
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 6
        Text = '1'
      end
      object ESecuencia: TLFEdit
        Left = 129
        Top = 93
        Width = 73
        Height = 21
        TabOrder = 7
        Text = '1'
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 4
    Top = 78
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AExportarModelo340: TAction
      Caption = '&Exportar'
      Hint = 'Exportaci'#243'n para presentaci'#243'n telem'#225'tica'
      ImageIndex = 36
      OnExecute = AExportarModelo340Execute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 4
  end
end
