inherited FMLstMatPeligrosas: TFMLstMatPeligrosas
  Left = 334
  Top = 140
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Materias Peligrosas'
  ClientHeight = 196
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 196
    inherited TBMain: TLFToolBar
      object TButtConfiguracionRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    object LFPanel1: TLFPanel
      Left = 0
      Top = 36
      Width = 369
      Height = 160
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeFecha: TLFLabel
        Left = 21
        Top = 41
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Desde'
      end
      object LHastaFecha: TLFLabel
        Left = 24
        Top = 63
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Hasta'
      end
      object LComentario: TLFLabel
        Left = 32
        Top = 132
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LFDateDesde: TLFDateEdit
        Left = 91
        Top = 36
        Width = 92
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object LFDateHasta: TLFDateEdit
        Left = 91
        Top = 57
        Width = 92
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object LFEComentari: TLFEdit
        Left = 91
        Top = 129
        Width = 256
        Height = 21
        TabOrder = 2
      end
      object ChkTodos: TLFCheckBox
        Left = 91
        Top = 97
        Width = 146
        Height = 17
        Caption = 'Mostrar todos los art'#237'culos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 252
    Top = 70
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
  end
end
