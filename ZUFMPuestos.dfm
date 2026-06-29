inherited ZFMPuestos: TZFMPuestos
  Caption = 'Mantenimiento de Puestos'
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
        DataSource = ZDMPuestos.DSQMPuestos
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Visible = False
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
            Left = 50
            Top = 15
          end
          object LblPuesto: TLFLabel
            Left = 78
            Top = 26
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Puesto'
          end
          object LblDescripcion: TLFLabel
            Left = 55
            Top = 49
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFLabel1: TLFLabel
            Left = 82
            Top = 71
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarea'
          end
          object DBEPuesto: TLFDbedit
            Left = 114
            Top = 23
            Width = 62
            Height = 21
            DataField = 'PUESTO'
            DataSource = ZDMPuestos.DSQMPuestos
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 114
            Top = 45
            Width = 179
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMPuestos.DSQMPuestos
            TabOrder = 1
          end
          object DBEFTarea: TLFDBEditFind2000
            Left = 114
            Top = 67
            Width = 61
            Height = 21
            DataField = 'TAREA'
            DataSource = ZDMPuestos.DSQMPuestos
            TabOrder = 2
            OnChange = DBEFTareaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TAREA'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object LFDBCheckBox1: TLFDBCheckBox
            Left = 34
            Top = 91
            Width = 93
            Height = 17
            Caption = 'Desprecia DC'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DESPRECIA_DC'
            DataSource = ZDMPuestos.DSQMPuestos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DescTarea: TLFHYDBDescription
            Left = 176
            Top = 67
            Width = 117
            Height = 21
            Color = clInfoBk
            DataSource = ZDMPuestos.DSQMPuestos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Tabla_a_buscar = 'Z_SYS_TAREAS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TAREA')
            CamposWhereTabla.Strings = (
              'TAREA')
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ZDMPuestos.DSQMPuestos
          Columns = <
            item
              Expanded = False
              FieldName = 'PUESTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESPRECIA_DC'
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
    Left = 184
  end
  inherited FSMain: TLFFibFormStorage
    Left = 224
  end
end
