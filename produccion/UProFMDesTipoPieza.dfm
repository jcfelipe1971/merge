inherited ProFMDesTipoPieza: TProFMDesTipoPieza
  Left = 500
  Top = 171
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Tipo Pieza'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = LFDBCodigo
        InsertaControl = LFDBCodigo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          object LCodigo: TLFLabel
            Left = 38
            Top = 23
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LDescripcion: TLFLabel
            Left = 15
            Top = 46
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LAltura: TLFLabel
            Left = 44
            Top = 138
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Altura'
          end
          object LAnchura: TLFLabel
            Left = 31
            Top = 159
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Anchura'
          end
          object LProfundidad: TLFLabel
            Left = 14
            Top = 180
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Profundidad'
          end
          object LGrueso: TLFLabel
            Left = 37
            Top = 201
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grueso'
          end
          object LFormulas: TLFLabel
            Left = 7
            Top = 88
            Width = 59
            Height = 13
            Caption = 'F'#211'RMULAS'
          end
          object Bevel1: TBevel
            Left = 5
            Top = 104
            Width = 481
            Height = 2
          end
          object LFDBCodigo: TLFDbedit
            Left = 75
            Top = 21
            Width = 70
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = ProDMDesTipoPieza.DSTipoPieza
            TabOrder = 0
          end
          object LFDesc: TLFDbedit
            Left = 75
            Top = 42
            Width = 366
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMDesTipoPieza.DSTipoPieza
            TabOrder = 1
          end
          object LFDBAltura: TLFDbedit
            Left = 75
            Top = 134
            Width = 90
            Height = 21
            DataField = 'FORMULA_CALC_ALTURA'
            DataSource = ProDMDesTipoPieza.DSTipoPieza
            TabOrder = 2
          end
          object LFDBAnchura: TLFDbedit
            Left = 75
            Top = 155
            Width = 90
            Height = 21
            DataField = 'FORMULA_CALC_ANCHURA'
            DataSource = ProDMDesTipoPieza.DSTipoPieza
            TabOrder = 3
          end
          object LFDBProf: TLFDbedit
            Left = 75
            Top = 176
            Width = 90
            Height = 21
            DataField = 'FORMULA_CALC_PROF'
            DataSource = ProDMDesTipoPieza.DSTipoPieza
            TabOrder = 4
          end
          object LFDBGrueso: TLFDbedit
            Left = 75
            Top = 197
            Width = 90
            Height = 21
            DataField = 'FORMULA_CALC_GRUESO'
            DataSource = ProDMDesTipoPieza.DSTipoPieza
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = ProDMDesTipoPieza.DSTipoPieza
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 421
              Visible = True
            end>
        end
      end
    end
  end
end
