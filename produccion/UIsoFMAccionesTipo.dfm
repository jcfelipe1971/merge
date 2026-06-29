inherited IsoFMAccionesTipo: TIsoFMAccionesTipo
  Top = 182
  Caption = 'Mantenimiento del tipo de acciones'
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
        DataSource = IsoDMAccionesTipo.DSQMAccionesTipo
        Hints.Strings = ()
        EditaControl = DBETipo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBEDescripcion
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
            DataSource = IsoDMAccionesTipo.DSQMAccionesTipo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_INC_ACCIONES_TIPO'
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
          end
          object LTipo: TLFLabel
            Left = 50
            Top = 35
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBETipo
          end
          object LDescripcion: TLFLabel
            Left = 14
            Top = 57
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object DBETipo: TLFDbedit
            Left = 75
            Top = 30
            Width = 50
            Height = 21
            DataField = 'TIPO'
            DataSource = IsoDMAccionesTipo.DSQMAccionesTipo
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 75
            Top = 52
            Width = 290
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMAccionesTipo.DSQMAccionesTipo
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = IsoDMAccionesTipo.DSQMAccionesTipo
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 321
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
