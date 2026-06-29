inherited ProFMCabPlanif: TProFMCabPlanif
  Left = 234
  Top = 155
  Caption = 'Planificaci'#243'n'
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
        DataSource = ProDMCabPlanif.DSQMProCabPlanif
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEPlanif
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        ParentShowHint = False
      end
      object ToolButton1: TToolButton
        Left = 339
        Top = 0
        Hint = 'Planificar'
        Caption = 'Planificar'
        ImageIndex = 25
        OnClick = ToolButton1Click
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
            Plan.Strings = (
              'PLAN (PRO_SYS_FASES NATURAL)')
            DataSource = ProDMCabPlanif.DSQMProCabPlanif
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_CAB_PLANIF'
            CampoNum = 'ID_PLANIF'
            CampoStr = 'TITULO'
          end
          object LPlanificacion: TLFLabel
            Left = 24
            Top = 35
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Planificaci'#243'n'
          end
          object LTitulo: TLFLabel
            Left = 56
            Top = 57
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEPlanif: TLFDbedit
            Left = 88
            Top = 32
            Width = 49
            Height = 21
            DataField = 'ID_PLANIF'
            DataSource = ProDMCabPlanif.DSQMProCabPlanif
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 88
            Top = 54
            Width = 201
            Height = 21
            DataField = 'TITULO'
            DataSource = ProDMCabPlanif.DSQMProCabPlanif
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMCabPlanif.DSQMProCabPlanif
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PLANIF'
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
