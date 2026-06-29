inherited FMZonas: TFMZonas
  Height = 260
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Zonas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 207
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMZonas.DSQMZonas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEZona
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Height = 177
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 149
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'SYS_ZONAS'
            CampoNum = 'ZONA'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'DEFECTO DESC, ZONA')
          end
          object LZona: TLFLabel
            Left = 21
            Top = 22
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Concepto'
            FocusControl = DBEZona
          end
          object LBLTitulo: TLFLabel
            Left = 39
            Top = 44
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LCalendario: TLFLabel
            Left = 17
            Top = 66
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calendario'
          end
          object DBEZona: TLFDbedit
            Left = 72
            Top = 18
            Width = 74
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ZONA'
            DataSource = DMZonas.DSQMZonas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 72
            Top = 40
            Width = 401
            Height = 21
            DataField = 'TITULO'
            DataSource = DMZonas.DSQMZonas
            TabOrder = 1
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 72
            Top = 91
            Width = 121
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMZonas.DSQMZonas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCalendario: TLFDBEditFind2000
            Left = 72
            Top = 62
            Width = 42
            Height = 21
            DataField = 'CALENDARIO'
            DataSource = DMZonas.DSQMZonas
            TabOrder = 2
            OnChange = DBEFCalendarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_CALENDARIO_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CALENDARIO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CALENDARIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECalendario: TLFEdit
            Left = 115
            Top = 62
            Width = 358
            Height = 21
            TabOrder = 3
            Text = 'ECalendario'
          end
          object DBCBAutogeneraRutaAlbaran: TLFDBCheckBox
            Left = 72
            Top = 115
            Width = 393
            Height = 17
            Caption = 'Autogenera Ruta Albaran'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMZonas.DSQMZonas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 149
          DataSource = DMZonas.DSQMZonas
          CamposAMarcar.Strings = (
            'DEFECTO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'DEFECTO'
            'TITULO'
            'ZONA')
          Columns = <
            item
              Expanded = False
              FieldName = 'ZONA'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 310
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              ReadOnly = True
              Width = 44
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 207
  end
  inherited FSMain: TLFFibFormStorage
    Top = 32
  end
end
