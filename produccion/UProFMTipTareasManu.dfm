inherited ProFMTipTareasManu: TProFMTipTareasManu
  Left = 269
  Top = 208
  Caption = 'Tipos de Tareas Manuales'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = ProDMTipTareasManu.DSQMProTipTareasManu
        Hints.Strings = ()
        EditaControl = DBETipo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBETipo
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TbuttComp: TToolButton
        Visible = False
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
            Plan.Strings = (
              'PLAN (PRO_SYS_FASES NATURAL)')
            DataSource = ProDMTipTareasManu.DSQMProTipTareasManu
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_TIPOS_TAREAS_MANU'
            CampoNum = 'ID_TIPO_TAREA_MANU'
            CampoStr = 'TITULO'
          end
          object Label1: TLFLabel
            Left = 33
            Top = 48
            Width = 28
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Tipo'
            FocusControl = DBETipo
          end
          object Label2: TLFLabel
            Left = 33
            Top = 72
            Width = 28
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBETipo: TLFDbedit
            Left = 65
            Top = 46
            Width = 43
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ID_TIPO_TAREA_MANU'
            DataSource = ProDMTipTareasManu.DSQMProTipTareasManu
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 65
            Top = 68
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = ProDMTipTareasManu.DSQMProTipTareasManu
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_TIPO_TAREA_MANU'
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
    EdgeOuter = esNone
  end
end
