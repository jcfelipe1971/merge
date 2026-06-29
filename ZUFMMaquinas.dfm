inherited ZFMMaquinas: TZFMMaquinas
  Left = 295
  Top = 177
  Hint = 'Mantenimiento del maestro de m'#225'quinas'
  Caption = 'Mantenimiento de M'#225'quinas'
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
        DataSource = ZDMMaquinas.DSQMMaquinas
        Hints.Strings = ()
        EditaControl = DBEMaquina
        InsertaControl = DBEMaquina
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
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
            DataSource = ZDMMaquinas.DSQMMaquinas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_EMP_MAQUINAS'
            CampoNum = 'MAQUINA'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'MAQUINA')
          end
          object LblMaquina: TLFLabel
            Left = 26
            Top = 35
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
            FocusControl = DBEMaquina
          end
          object LblDescripcion: TLFLabel
            Left = 11
            Top = 57
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object DBEMaquina: TLFDbedit
            Left = 70
            Top = 30
            Width = 49
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MAQUINA'
            DataSource = ZDMMaquinas.DSQMMaquinas
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 70
            Top = 52
            Width = 298
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMMaquinas.DSQMMaquinas
            TabOrder = 1
          end
          object DBCheckActivo: TLFDBCheckBox
            Left = 70
            Top = 76
            Width = 57
            Height = 17
            Caption = 'Activa'
            ClicksDisabled = False
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = ZDMMaquinas.DSQMMaquinas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBTipoMaquina: TDBComboBox
            Left = 173
            Top = 74
            Width = 41
            Height = 21
            DataField = 'TIPO_MAQUINA'
            DataSource = ZDMMaquinas.DSQMMaquinas
            ItemHeight = 13
            Items.Strings = (
              'N'
              'R'
              'E'
              'V')
            TabOrder = 3
          end
          object DBEDescTipoMaquina: TLFDbedit
            Left = 215
            Top = 74
            Width = 153
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESC_TIPO_MAQUINA'
            DataSource = ZDMMaquinas.DSQMMaquinas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ZDMMaquinas.DSQMMaquinas
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'DESCRIPCION'
            'MAQUINA')
          Columns = <
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 258
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
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
  inherited CEMain: TControlEdit
    Left = 316
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 288
    Top = 56
  end
end
