inherited FMTemporadaTallas: TFMTemporadaTallas
  Left = 195
  Top = 106
  Caption = 'Modelo Temporadas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 68
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 297
      end
      inherited TbuttComp: TToolButton
        Left = 305
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMTemporadaTallas.DSQMTemporadaTallas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_TEMPORADA'
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 83
            Top = 44
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 88
            Top = 65
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBECodigo: TLFDbedit
            Left = 120
            Top = 40
            Width = 73
            Height = 21
            DataField = 'CODIGO'
            DataSource = DMTemporadaTallas.DSQMTemporadaTallas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 120
            Top = 62
            Width = 225
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTemporadaTallas.DSQMTemporadaTallas
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMTemporadaTallas.DSQMTemporadaTallas
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
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
end
