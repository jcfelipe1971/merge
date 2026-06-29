inherited OpeFMCategoria: TOpeFMCategoria
  Left = 223
  Top = 185
  Caption = 'Mantenimiento de Categorias'
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
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBECategoria
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
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
            Top = 32
          end
          object LCategoria: TLFLabel
            Left = 25
            Top = 41
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Categoria'
            FocusControl = DBECategoria
          end
          object LDescripcion: TLFLabel
            Left = 14
            Top = 63
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object DBECategoria: TLFDbedit
            Left = 75
            Top = 37
            Width = 49
            Height = 21
            DataField = 'CATEGORIA'
            DataSource = OpeDMCategoria.DSQMCategoria
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 75
            Top = 59
            Width = 289
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMCategoria.DSQMCategoria
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          CamposAOrdenar.Strings = (
            'CATEGORIA'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'CATEGORIA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 294
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
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 216
    Top = 40
  end
end
