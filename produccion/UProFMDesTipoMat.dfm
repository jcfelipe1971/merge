inherited ProFMDesTipoMat: TProFMDesTipoMat
  Left = 324
  Top = 412
  Caption = 'Mantenimiento de Tipo de Material'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 158
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = ProDMDesTipoMat.DSCabTipoMat
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Height = 128
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 100
          object LTipo: TLFLabel
            Left = 43
            Top = 21
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LDescripcion: TLFLabel
            Left = 8
            Top = 41
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFDTipo: TLFDbedit
            Left = 68
            Top = 16
            Width = 77
            Height = 21
            DataField = 'TIPO'
            DataSource = ProDMDesTipoMat.DSCabTipoMat
            TabOrder = 0
          end
          object LFDesc: TLFDbedit
            Left = 68
            Top = 37
            Width = 301
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMDesTipoMat.DSCabTipoMat
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 100
          DataSource = ProDMDesTipoMat.DSCabTipoMat
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
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 158
    Height = 250
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        DataSource = ProDMDesTipoMat.DSDetTipoMat
        Hints.Strings = ()
        InsertaUltimo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Height = 228
      DataSource = ProDMDesTipoMat.DSDetTipoMat
      ColumnaInicial = 1
      Campos.Strings = (
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      ColumnasCheckBoxes.Strings = (
        'POR_DEFECTO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      CondicionBusqueda = 'Familia <> '#39'SYS'#39
      Numericos.Strings = (
        'ARTICULO')
      Tablas.Strings = (
        'ART_ARTICULOS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        '')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DescArticulo'
          Width = 230
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'POR_DEFECTO'
          Visible = True
        end>
    end
  end
end
