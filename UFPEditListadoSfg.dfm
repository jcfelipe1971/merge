inherited FPEditListadoSfg: TFPEditListadoSfg
  Left = 331
  Top = 178
  Caption = 'Listado General'
  ClientHeight = 343
  ClientWidth = 592
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 277
    inherited TBMain: TLFToolBar
      Width = 592
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 592
      Height = 241
      Images = nil
    end
  end
  object PNLOrden: TLFPanel [1]
    Left = 0
    Top = 277
    Width = 592
    Height = 66
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object LComentario: TLFLabel
      Left = 49
      Top = 37
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Comentario'
    end
    object LOrden: TLFLabel
      Left = 37
      Top = 15
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ordenado por'
    end
    object LFechaListado: TLFLabel
      Left = 337
      Top = 15
      Width = 80
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha del listado'
    end
    object EComentario: TLFEdit
      Left = 108
      Top = 33
      Width = 401
      Height = 21
      MaxLength = 60
      TabOrder = 0
    end
    object CBOrden: TLFComboBox
      Left = 108
      Top = 11
      Width = 211
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 1
    end
    object TDPFechaListado: TLFDateEdit
      Left = 422
      Top = 11
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
    end
  end
end
