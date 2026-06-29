inherited FOrdenaLineas: TFOrdenaLineas
  Left = 277
  Top = 116
  BorderIcons = [biSystemMenu]
  Caption = 'Reordenar las l'#237'neas del documento'
  ClientHeight = 452
  ClientWidth = 508
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 508
    Height = 428
    inherited TBMain: TLFToolBar
      Width = 504
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
      object TButtConfirmar: TToolButton
        Left = 25
        Top = 0
        Hint = 'Confirmar'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
      object TSep1: TToolButton
        Left = 48
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMoverInicio: TToolButton
        Left = 56
        Top = 0
        Hint = 'Mover al inicio'
        Caption = 'Mover Inicio'
        ImageIndex = 51
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMoverInicioClick
      end
      object TButtMoverArriba: TToolButton
        Left = 79
        Top = 0
        Hint = 'Mover hacia arriba'
        Caption = 'Mover Arriba'
        ImageIndex = 53
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMoverArribaClick
      end
      object TButtMoverAbajo: TToolButton
        Left = 102
        Top = 0
        Hint = 'Mover hacia abajo'
        Caption = 'Mover Abajo'
        ImageIndex = 52
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMoverAbajoClick
      end
      object TButtMoverFinal: TToolButton
        Left = 125
        Top = 0
        Hint = 'Mover al final'
        Caption = 'Mover Final'
        ImageIndex = 25
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMoverFinalClick
      end
    end
    object LVLineas: TListView
      Left = 2
      Top = 28
      Width = 504
      Height = 398
      Align = alClient
      Columns = <>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLines = True
      LargeImages = DMMain.ILMain_Ac
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      SortType = stData
      TabOrder = 1
      ViewStyle = vsReport
      OnClick = LVLineasClick
      OnColumnClick = LVLineasColumnClick
      OnCompare = LVLineasCompare
      OnDeletion = LVLineasDeletion
      OnDragDrop = LVLineasDragDrop
      OnDragOver = LVLineasDragOver
      OnMouseDown = LVLineasMouseDown
    end
  end
  inherited TBActions: TLFToolBar
    Top = 428
    Width = 508
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
