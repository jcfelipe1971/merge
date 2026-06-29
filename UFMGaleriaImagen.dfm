inherited FMGaleriaImagen: TFMGaleriaImagen
  Left = 483
  Top = 234
  Width = 640
  Height = 480
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Galer'#237'a de Im'#225'genes'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 630
    Height = 427
    inherited TBMain: TLFToolBar
      Width = 626
      inherited NavMain: THYMNavigator
        DataSource = DMGaleriaImagen.DSQMGaleria
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBDisminuirTamano: TToolButton
        Left = 347
        Top = 0
        Action = ADisminuirTamano
      end
      object TBAumentarTamano: TToolButton
        Left = 370
        Top = 0
        Action = AAumentarTamano
      end
      object ToolButton3: TToolButton
        Left = 393
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBAgregarImagen: TToolButton
        Left = 401
        Top = 0
        Hint = 'Agregar Im'#225'gen a la galer'#237'a'
        Action = AAgregarImagen
      end
    end
    inherited PCMain: TLFPageControl
      Width = 626
      Height = 397
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 618
          Height = 49
          Align = alTop
          object LID: TLFLabel
            Left = 43
            Top = 7
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object LTitulo: TLFLabel
            Left = 26
            Top = 29
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object DBEId: TLFDbedit
            Left = 56
            Top = 3
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'ID'
            DataSource = DMGaleriaImagen.DSQMGaleria
            Enabled = False
            TabOrder = 0
            OnChange = DBEIdChange
          end
          object DBETitulo: TLFDbedit
            Left = 56
            Top = 25
            Width = 385
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGaleriaImagen.DSQMGaleria
            TabOrder = 1
          end
        end
        object PNLGaleria: TLFPanel
          Left = 0
          Top = 49
          Width = 618
          Height = 320
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LVGaleria: TListView
            Left = 0
            Top = 0
            Width = 618
            Height = 320
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            Columns = <>
            LargeImages = DMGaleriaImagen.ILGaleria
            TabOrder = 0
            OnDblClick = LVGaleriaDblClick
            OnKeyUp = LVGaleriaKeyUp
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 618
          Height = 369
          DataSource = DMGaleriaImagen.DSQMGaleria
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 387
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 427
    Width = 630
  end
  inherited CEMain: TControlEdit
    FichaExclusiva = nil
  end
  object AL: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 368
    Top = 80
    object AAumentarTamano: TAction
      Caption = 'Aumentar Tama'#241'o'
      Hint = 'Aumentar Tama'#241'o'
      ImageIndex = 23
      OnExecute = AAumentarTamanoExecute
    end
    object ADisminuirTamano: TAction
      Caption = 'Disminuir Tama'#241'o'
      Hint = 'Disminuir Tama'#241'o'
      ImageIndex = 22
      OnExecute = ADisminuirTamanoExecute
    end
    object AAgregarImagen: TAction
      Caption = 'Agregar Imagen'
      Hint = 'Agregar Imagen a la galeria'
      ImageIndex = 28
      OnExecute = AAgregarImagenExecute
    end
  end
end
