inherited FMGeneroTallas: TFMGeneroTallas
  Caption = 'Articulo Modelo Genero'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMGeneroTallas.DSQMGeneroTallas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_GENERO'
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 90
            Top = 37
            Width = 33
            Height = 13
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 95
            Top = 57
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object DBECodigo: TLFDbedit
            Left = 128
            Top = 32
            Width = 65
            Height = 21
            DataField = 'CODIGO'
            DataSource = DMGeneroTallas.DSQMGeneroTallas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 128
            Top = 54
            Width = 250
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGeneroTallas.DSQMGeneroTallas
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
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
