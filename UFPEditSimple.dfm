inherited FPEditSimple: TFPEditSimple
  Caption = 'FPEditSimple'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      object NavMain: THYMNavigator [0]
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TSepNav: TToolButton [1]
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 228
        Hints.Strings = ()
        TabOrder = 1
      end
      object TSepTerc: TToolButton
        Left = 308
        Top = 0
        Width = 8
        Style = tbsSeparator
        Visible = False
      end
      object TbuttComp: TToolButton
        Left = 316
        Top = 0
        ImageIndex = 24
        Visible = False
      end
    end
  end
end
