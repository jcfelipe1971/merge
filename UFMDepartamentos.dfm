inherited FMDepartamentos: TFMDepartamentos
  Left = 625
  Top = 204
  Caption = 'Departamentos'
  ClientHeight = 267
  ClientWidth = 441
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 441
    Height = 243
    inherited TBMain: TLFToolBar
      Width = 437
      inherited NavMain: THYMNavigator
        DataSource = DMDepartamentos.DSQMDepartamentos
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEDepartamento
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 437
      Height = 213
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 429
          Height = 185
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMDepartamentos.DSQMDepartamentos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_DEPARTAMENTOS'
            CampoNum = 'DEPARTAMENTO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'DEPARTAMENTO')
          end
          object LDepartamento: TLFLabel
            Left = 22
            Top = 65
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Departamento'
          end
          object LTitulo: TLFLabel
            Left = 57
            Top = 87
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEDepartamento: TLFDbedit
            Left = 93
            Top = 61
            Width = 52
            Height = 21
            DataField = 'DEPARTAMENTO'
            DataSource = DMDepartamentos.DSQMDepartamentos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 93
            Top = 83
            Width = 331
            Height = 21
            DataField = 'TITULO'
            DataSource = DMDepartamentos.DSQMDepartamentos
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 429
          Height = 185
          DataSource = DMDepartamentos.DSQMDepartamentos
          Columns = <
            item
              Expanded = False
              FieldName = 'DEPARTAMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 316
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 243
    Width = 441
    EdgeOuter = esNone
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 400
    Top = 16
  end
end
