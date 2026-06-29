inherited IsoFMLstMedicion: TIsoFMLstMedicion
  Caption = 'Listado de Siguientes Revisiones Equipos de Medici'#243'n'
  ClientHeight = 268
  ClientWidth = 438
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 438
    Height = 202
    inherited TBMain: TLFToolBar
      Width = 438
    end
    inherited PCMain: TLFPageControl
      Width = 438
      Height = 166
    end
    object LFPanel1: TLFPanel
      Left = 0
      Top = 36
      Width = 438
      Height = 166
      Align = alClient
      TabOrder = 2
      object LDesdeFecha: TLFLabel
        Left = 25
        Top = 40
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LHastaFecha: TLFLabel
        Left = 28
        Top = 62
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LFDDesdeF: TLFDateEdit
        Left = 93
        Top = 36
        Width = 98
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object LFDHastaF: TLFDateEdit
        Left = 93
        Top = 58
        Width = 98
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 202
    Width = 438
    inherited LOrden: TLFLabel
      Left = 296
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 23
    end
    inherited EComentario: TLFEdit
      Width = 261
    end
    inherited CBOrden: TLFComboBox
      Left = 367
      Width = 29
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 108
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
