inherited ProFMTipoMaquinas: TProFMTipoMaquinas
  Left = 325
  Top = 243
  Caption = 'Mantenimiento Tipos de M'#225'quinas'
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
        EditaControl = DBETipo
        InsertaControl = DBETipo
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
            Top = 24
            Tabla_a_buscar = 'PRO_TIPO_MAQUINAS'
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
          end
          object LTipo: TLFLabel
            Left = 47
            Top = 36
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBETipo
          end
          object LDescripcion: TLFLabel
            Left = 12
            Top = 57
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object DBETipo: TLFDbedit
            Left = 74
            Top = 30
            Width = 64
            Height = 21
            TabStop = False
            DataField = 'TIPO'
            DataSource = ProDMTipoMaquinas.DSQMTipos
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 74
            Top = 52
            Width = 292
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMTipoMaquinas.DSQMTipos
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
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
  inherited FSMain: TLFFibFormStorage
    Left = 230
  end
end
