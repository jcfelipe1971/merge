inherited FPregTesoreria: TFPregTesoreria
  Left = 401
  Top = 221
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Tesorer'#237'a'
  ClientHeight = 274
  ClientWidth = 392
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 274
    inherited TBMain: TLFToolBar
      Width = 392
      inherited TButtImprimir: TToolButton
        Tag = 1
      end
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLComentarios: TLFPanel
      Left = 0
      Top = 163
      Width = 392
      Height = 111
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LComentario: TLFLabel
        Left = 43
        Top = 70
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LBLComP: TLFLabel
        Left = 10
        Top = 26
        Width = 86
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario Pagos'
      end
      object LBLComC: TLFLabel
        Left = 7
        Top = 48
        Width = 89
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario Cobros'
      end
      object EComentario: TLFEdit
        Left = 102
        Top = 66
        Width = 265
        Height = 21
        MaxLength = 28
        TabOrder = 0
      end
      object EComPagos: TLFEdit
        Left = 102
        Top = 22
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 1
      end
      object EComCobros: TLFEdit
        Left = 102
        Top = 44
        Width = 121
        Height = 21
        MaxLength = 20
        TabOrder = 2
      end
      object CBTitCuen: TLFCheckBox
        Left = 239
        Top = 46
        Width = 130
        Height = 17
        Caption = 'Mostrar T'#237'tulo Cuenta'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBNumDoc: TLFCheckBox
        Left = 239
        Top = 24
        Width = 133
        Height = 17
        Caption = 'Mostrar N'#186' Documento'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object PNLTesoreria: TLFPanel
      Left = 0
      Top = 95
      Width = 392
      Height = 68
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object LFecha: TLFLabel
        Left = 86
        Top = 16
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object LMoneda: TLFLabel
        Left = 77
        Top = 38
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object DTPFechaListado: TLFDateEdit
        Left = 122
        Top = 12
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 122
        Top = 34
        Width = 122
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = DMRTesoreria.DSxMonedas
        TabOrder = 1
      end
    end
    object Vencimiento: TGroupBox
      Left = 0
      Top = 36
      Width = 392
      Height = 59
      Align = alTop
      Caption = 'Vencimiento'
      TabOrder = 2
      object LDesde: TLFLabel
        Left = 40
        Top = 23
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHasta: TLFLabel
        Left = 194
        Top = 23
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPHasta: TLFDateEdit
        Left = 228
        Top = 19
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
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
    end
  end
  inherited ALMain: TLFActionList
    Left = 300
    Top = 58
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
