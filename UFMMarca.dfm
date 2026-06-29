inherited FMMarca: TFMMarca
  Left = 367
  Top = 203
  Caption = 'Marcas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMMarca.DSQMMarca
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEMarca
        InsertaControl = DBEMarca
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
            Left = 40
            Top = 62
            DataSource = DMMarca.DSQMMarca
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_MARCAS'
            CampoNum = 'MARCA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ID_MARCA > 0'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'MARCA')
          end
          object LId: TLFLabel
            Left = 59
            Top = 14
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
            FocusControl = DBEIdMarca
          end
          object LTitulo: TLFLabel
            Left = 40
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LImagen: TLFLabel
            Left = 33
            Top = 79
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LGaleria: TLFLabel
            Left = 35
            Top = 101
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Galeria'
            FocusControl = DBEGaleria
          end
          object LNotas: TLFLabel
            Left = 40
            Top = 125
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
            FocusControl = DBEGaleria
          end
          object Imagen: TImage
            Left = 352
            Top = 4
            Width = 129
            Height = 113
            Center = True
            IncrementalDisplay = True
            Proportional = True
            Stretch = True
          end
          object LMarca: TLFLabel
            Left = 38
            Top = 36
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Marca'
            FocusControl = DBEMarca
          end
          object DBEIdMarca: TLFDbedit
            Left = 72
            Top = 10
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'ID_MARCA'
            DataSource = DMMarca.DSQMMarca
            Enabled = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 72
            Top = 54
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = DMMarca.DSQMMarca
            TabOrder = 2
          end
          object DBEGaleria: TLFDbedit
            Left = 72
            Top = 98
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ID_GALERIA'
            DataSource = DMMarca.DSQMMarca
            TabOrder = 6
          end
          object DBMNotas: TLFDBMemo
            Left = 72
            Top = 120
            Width = 409
            Height = 143
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'NOTAS'
            DataSource = DMMarca.DSQMMarca
            TabOrder = 7
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 72
            Top = 76
            Width = 51
            Height = 21
            DataField = 'IMAGEN'
            DataSource = DMMarca.DSQMMarca
            TabOrder = 3
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloImagen: TLFEdit
            Left = 124
            Top = 76
            Width = 228
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object BCargarImagen: TButton
            Left = 304
            Top = 77
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 5
            Visible = False
            OnClick = BCargarImagenClick
          end
          object DBEMarca: TLFDbedit
            Left = 72
            Top = 32
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'MARCA'
            DataSource = DMMarca.DSQMMarca
            TabOrder = 1
          end
          object BClipboard: TButton
            Left = 327
            Top = 77
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 8
            Visible = False
            OnClick = BClipboardClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMMarca.DSQMMarca
          ReadOnly = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_MARCA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARCA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 300
              Visible = True
            end>
        end
      end
    end
  end
end
