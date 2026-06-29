inherited ZFMVentasPedidosLineal: TZFMVentasPedidosLineal
  Left = 440
  Top = 252
  Caption = 'Ventas de Pedidos por Lineal'
  ClientHeight = 212
  ClientWidth = 383
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 383
    Height = 212
    inherited TBMain: TLFToolBar
      Width = 383
      inherited TButtRecargar: TToolButton
        Visible = False
      end
      object ToolButton1: TToolButton
        Left = 288
        Top = 0
        Caption = 'Configurar'
        ImageIndex = 1
        OnClick = ToolButton1Click
      end
    end
    object PNLLimites: TPanel
      Left = 0
      Top = 36
      Width = 383
      Height = 176
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LbHasta: TLFLabel
        Left = 112
        Top = 75
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LbDesde: TLFLabel
        Left = 108
        Top = 48
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LfHasta: TLFDateEdit
        Left = 146
        Top = 73
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object LfDesde: TLFDateEdit
        Left = 146
        Top = 44
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
  end
end
