inherited FMEtiColor: TFMEtiColor
  Left = 452
  Top = 275
  HelpContext = 290
  Caption = 'Etiquetas Color'
  ClientHeight = 218
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMEtiColor.DSQMEtiColor
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 72
            Top = 34
            DataSource = DMEtiColor.DSQMEtiColor
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ETI_COLOR'
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 41
            Top = 40
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 46
            Top = 62
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LColor: TLFLabel
            Left = 50
            Top = 84
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Color'
          end
          object DBECodigo: TLFDbedit
            Left = 78
            Top = 36
            Width = 65
            Height = 21
            Hint = 'C'#243'digo'
            DataField = 'CODIGO'
            DataSource = DMEtiColor.DSQMEtiColor
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 78
            Top = 58
            Width = 291
            Height = 21
            Hint = 'Titulo'
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TITULO'
            DataSource = DMEtiColor.DSQMEtiColor
            TabOrder = 1
          end
          object EColor: TLFEdit
            Left = 78
            Top = 81
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 2
            Text = '             ...'
            OnClick = EColorClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMEtiColor.DSQMEtiColor
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CLASS'
            'NAME')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 218
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COLOR_DECIMAL'
              Width = 75
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 84
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 84
  end
end
