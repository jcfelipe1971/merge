inherited CrmFMArticulos: TCrmFMArticulos
  Left = 245
  Top = 232
  Caption = 'Mantenimiento Articulos CRM'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = CrmDmArticulos.DSQMArticulo
        Hints.Strings = ()
        EditaControl = LFDBCodigo
        InsertaControl = LFDBCodigo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Top = 3
            DataSource = CrmDmArticulos.DSQMArticulo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CRM_ARTICULO'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LFCodigo: TLFLabel
            Left = 39
            Top = 35
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LFLabel1: TLFLabel
            Left = 16
            Top = 55
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFCantidad: TLFLabel
            Left = 30
            Top = 77
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
          end
          object LFDBCodigo: TLFDbedit
            Left = 75
            Top = 32
            Width = 106
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = CrmDmArticulos.DSQMArticulo
            TabOrder = 0
          end
          object LFDBDesc: TLFDbedit
            Left = 75
            Top = 54
            Width = 282
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = CrmDmArticulos.DSQMArticulo
            TabOrder = 1
          end
          object LFDBCantidad: TLFDbedit
            Left = 75
            Top = 76
            Width = 62
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = CrmDmArticulos.DSQMArticulo
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = CrmDmArticulos.DSQMArticulo
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    EdgeOuter = esNone
  end
end
