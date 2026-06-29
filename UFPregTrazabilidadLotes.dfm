inherited FPregTrazabilidadLotes: TFPregTrazabilidadLotes
  Left = 380
  Top = 171
  Caption = 'Listado de Lotes'
  ClientHeight = 159
  ClientWidth = 441
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 441
    Height = 159
    inherited TBMain: TLFToolBar
      Width = 441
      object TButtMultiseleccion: TToolButton
        Left = 288
        Top = 0
        Action = ASeleccionaLote
        ImageIndex = 120
      end
      object TButtConfiguraListado: TToolButton
        Left = 360
        Top = 0
        Action = AConfigurar
      end
    end
    object PNMain: TLFPanel
      Left = 0
      Top = 36
      Width = 441
      Height = 123
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBSerie: TLFLabel
        Left = 239
        Top = 50
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Visible = False
      end
      object LBLote: TLFLabel
        Left = 40
        Top = 51
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = 'Lote'
      end
      object DBELote: TLFDbedit
        Left = 66
        Top = 47
        Width = 162
        Height = 21
        Color = clInfoBk
        DataField = 'LOTE'
        DataSource = DMLstTrazabilidadLotes.DSxLoteFiltrado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBESerie: TLFDbedit
        Left = 268
        Top = 46
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'SERIE'
        DataSource = DMLstTrazabilidadLotes.DSxLoteFiltrado
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Visible = False
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 179
    Top = 65535
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object ASeleccionaLote: TAction
      Caption = 'Lote'
      Hint = 'Seleccion de Lotes'
      ImageIndex = 78
      OnExecute = ASeleccionaLoteExecute
    end
  end
end
