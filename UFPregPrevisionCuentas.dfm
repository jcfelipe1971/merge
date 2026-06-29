inherited FPregPrevisionCuentas: TFPregPrevisionCuentas
  Left = 369
  Top = 261
  Caption = 'Listado de Previsiones por Cuentas'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 220
    inherited TBMain: TLFToolBar
      Width = 392
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLComentario: TLFPanel
      Left = 0
      Top = 119
      Width = 392
      Height = 45
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object Comentario: TLFLabel
        Left = 59
        Top = 17
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object EComentario: TLFEdit
        Left = 116
        Top = 14
        Width = 176
        Height = 21
        MaxLength = 28
        TabOrder = 0
      end
    end
    object Vencimiento: TGroupBox
      Left = 0
      Top = 164
      Width = 392
      Height = 52
      Align = alTop
      Caption = 'Vencimiento'
      TabOrder = 2
      object Desde: TLFLabel
        Left = 41
        Top = 23
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Hasta: TLFLabel
        Left = 193
        Top = 23
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPDesde: TLFDateEdit
        Left = 77
        Top = 19
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPHasta: TLFDateEdit
        Left = 226
        Top = 19
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 392
      Height = 83
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PNLLimites'
      TabOrder = 3
      object Fecha_del_listado: TLFLabel
        Left = 60
        Top = 35
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha del listado'
      end
      object Moneda: TLFLabel
        Left = 101
        Top = 57
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object Signo: TLFLabel
        Left = 63
        Top = 13
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Signo del listado'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 144
        Top = 31
        Width = 97
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 144
        Top = 53
        Width = 122
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = DMRPrevisionCuentas.DSxMonedas
        TabOrder = 2
      end
      object CBSigno: TLFComboBox
        Left = 144
        Top = 9
        Width = 97
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Cobros'
          'Pagos')
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 316
    Top = 38
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
