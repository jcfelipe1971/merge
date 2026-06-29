inherited FPregModelo115: TFPregModelo115
  Left = 504
  Top = 444
  HelpContext = 260
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Modelo 115. Arrendamientos'
  ClientHeight = 171
  ClientWidth = 520
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 520
    Height = 171
    inherited TBMain: TLFToolBar
      Width = 520
      ButtonWidth = 74
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
        Visible = False
      end
      inherited TButtImprimir: TToolButton
        Left = 74
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 148
      end
      inherited TButtSalir: TToolButton
        Left = 222
      end
      object TButtConfigurar: TToolButton
        Left = 296
        Top = 0
        Action = AConfigurar
      end
      object TButtModeloOficial: TToolButton
        Left = 370
        Top = 0
        Action = AModeloOficial
      end
      object TButtInstrucciones: TToolButton
        Left = 444
        Top = 0
        Action = AIntrucciones
      end
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 520
      Height = 135
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LPeriodo: TLFLabel
        Left = 216
        Top = 59
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object LEjercicio: TLFLabel
        Left = 80
        Top = 59
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
      end
      object CBPeriodo: TLFComboBox
        Left = 259
        Top = 55
        Width = 126
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
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
          'Diciembre'
          'Ejercicio Completo')
      end
      object CBEjercicio: TLFComboBox
        Left = 127
        Top = 55
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 220
    Top = 28
    object AModeloOficial: TAction
      Caption = 'Modelo Oficial'
      Hint = 'Modelo Oficial'
      ImageIndex = 136
      OnExecute = AModeloOficialExecute
    end
    object AIntrucciones: TAction
      Caption = 'Intrucciones'
      Hint = 'Instrucciones'
      ImageIndex = 1
      OnExecute = AIntruccionesExecute
    end
  end
end
