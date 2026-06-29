inherited ProFMRecursos: TProFMRecursos
  Left = 332
  Top = 193
  Caption = 'Matenimiento de Recursos'
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
        DataSource = ProDMRecursos.DSQMProRecursos
        Hints.Strings = ()
        EditaControl = DBERecurso
        InsertaControl = DBERecurso
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBERecurso
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
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
            Top = 11
            Plan.Strings = (
              'PLAN (PRO_SYS_RECURSOS NATURAL)')
            DataSource = ProDMRecursos.DSQMProRecursos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_RECURSOS'
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'RECURSO')
          end
          object LRecurso: TLFLabel
            Left = 20
            Top = 44
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recurso'
            FocusControl = DBERecurso
          end
          object LTitulo: TLFLabel
            Left = 32
            Top = 66
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBERecurso: TLFDbedit
            Left = 63
            Top = 41
            Width = 43
            Height = 21
            DataField = 'RECURSO'
            DataSource = ProDMRecursos.DSQMProRecursos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 63
            Top = 63
            Width = 300
            Height = 21
            DataField = 'TITULO'
            DataSource = ProDMRecursos.DSQMProRecursos
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMRecursos.DSQMProRecursos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'RECURSO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
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
end
