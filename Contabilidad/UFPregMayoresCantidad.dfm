inherited FPregMayoresCantidad: TFPregMayoresCantidad
  Left = 778
  Top = 250
  HelpContext = 251
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Mayores de Cantidad '
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    inherited TBMain: TLFToolBar
      Width = 392
      TabOrder = 2
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 114
      Width = 392
      TabOrder = 3
    end
    object GBFecha: TGroupBox
      Left = 0
      Top = 130
      Width = 392
      Height = 90
      Align = alBottom
      TabOrder = 1
      object LblFecha: TLFLabel
        Left = 28
        Top = 42
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Listado'
      end
      object LBLCantidad: TLFLabel
        Left = 52
        Top = 20
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cantidad'
      end
      object LblOrden: TLFLabel
        Left = 30
        Top = 64
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ordenado por'
      end
      object DTPFecha: TLFDateEdit
        Left = 100
        Top = 38
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object EDTCantidad: TLFEdit
        Left = 100
        Top = 16
        Width = 87
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object CB347: TLFCheckBox
        Left = 261
        Top = 38
        Width = 87
        Height = 17
        Caption = 'Modelo 347'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBOrden: TLFComboBox
        Left = 100
        Top = 60
        Width = 135
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 3
        Text = 'CIF'
        Items.Strings = (
          'CIF'
          'Nombres'
          'Importes'
          'Cuenta')
      end
    end
    object GBFechas: TGroupBox
      Left = 0
      Top = 36
      Width = 392
      Height = 90
      Align = alTop
      Caption = 'Fecha'
      TabOrder = 0
      object LBLDesde: TLFLabel
        Left = 64
        Top = 43
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLHasta: TLFLabel
        Left = 211
        Top = 43
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPDesde: TLFDateEdit
        Left = 100
        Top = 39
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPHasta: TLFDateEdit
        Left = 245
        Top = 39
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 332
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
