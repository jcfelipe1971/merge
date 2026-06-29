inherited ProFMFases: TProFMFases
  Left = 401
  Top = 217
  Caption = 'Mantenimiento de Fases'
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
        DataSource = ProDMFases.DSQMProSysFases
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEFase
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
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
            Top = 32
            DataSource = ProDMFases.DSQMProSysFases
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_FASES'
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
          end
          object Label1: TLFLabel
            Left = 33
            Top = 40
            Width = 28
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Fase'
            FocusControl = DBEFase
          end
          object Label2: TLFLabel
            Left = 33
            Top = 64
            Width = 28
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBEFase: TLFDbedit
            Left = 65
            Top = 38
            Width = 43
            Height = 21
            DataField = 'FASE'
            DataSource = ProDMFases.DSQMProSysFases
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 65
            Top = 60
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = ProDMFases.DSQMProSysFases
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMFases.DSQMProSysFases
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'FASE'
              Width = 40
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
  inherited ALMain: TLFActionList
    Left = 328
    Top = 80
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ALstFasesCodBar: TAction
      Category = 'Listados'
      Caption = 'Listado C'#243'digo Barras'
      ImageIndex = 38
      OnExecute = ALstFasesCodBarExecute
    end
  end
end
