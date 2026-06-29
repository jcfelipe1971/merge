inherited FMImpConEspCompras: TFMImpConEspCompras
  Left = 468
  Top = 220
  Caption = 'Importacion Condiciones Especiales de Compras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSImportacion2: TTabSheet
        inherited LProgreso: TLFLabel
          Top = 233
        end
        inherited PNLImportacion: TLFPanel
          Height = 233
          object LTipoCondicion: TLFLabel [0]
            Left = 21
            Top = 12
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Condicion'
          end
          object LProveedor: TLFLabel [1]
            Left = 43
            Top = 44
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LArticulo: TLFLabel [2]
            Left = 57
            Top = 66
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LFamilia: TLFLabel [3]
            Left = 60
            Top = 88
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LAgrupacion: TLFLabel [4]
            Left = 38
            Top = 110
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrupaci'#243'n'
          end
          object LUdsMinimas: TLFLabel [5]
            Left = 23
            Top = 133
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unid. Minimas '
          end
          object LUdsMaximas: TLFLabel [6]
            Left = 26
            Top = 155
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unid. Minimas'
          end
          object LPrecio: TLFLabel [7]
            Left = 62
            Top = 177
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LDescuentos: TLFLabel [8]
            Left = 35
            Top = 199
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuentos'
          end
          object LFechaBaja: TLFLabel [9]
            Left = 294
            Top = 153
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Baja'
          end
          object LFechaAlta: TLFLabel [10]
            Left = 297
            Top = 134
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
          end
          inherited BBorrarLog: TButton
            Top = 208
            TabOrder = 15
          end
          object CBTipoCondicion: TLFComboBox
            Left = 96
            Top = 8
            Width = 209
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'Elija Tipo de Condici'#243'n Especial:'
            OnChange = CBTipoCondicionChange
            Items.Strings = (
              'Elija Tipo de Condici'#243'n Especial:'
              'Cond. Proveedor / Art'#237'culo'
              'Cond. Proveedor / Familia'
              'Cond. Proveedor / Agrupaci'#243'n de Art'#237'culos'
              'Cond. Proveedor / Agrupaci'#243'n de Proveedores')
          end
          object BtImportar: TButton
            Left = 337
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Importar'
            TabOrder = 13
            OnClick = BtImportarClick
          end
          object CBModificar: TCheckBox
            Left = 424
            Top = 9
            Width = 145
            Height = 17
            Caption = 'Modificar si existe'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 14
          end
          object ETituloProveedor: TLFEdit
            Left = 218
            Top = 41
            Width = 386
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object EFArticulo: TLFEditFind2000
            Left = 96
            Top = 63
            Width = 121
            Height = 21
            TabOrder = 2
            OnChange = EFArticuloChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloArticulo: TLFEdit
            Left = 218
            Top = 63
            Width = 386
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object EFFamilia: TLFEditFind2000
            Left = 96
            Top = 85
            Width = 121
            Height = 21
            TabOrder = 3
            OnChange = EFFamiliaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloFamilia: TLFEdit
            Left = 218
            Top = 85
            Width = 386
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object EFAgrupacion: TLFEditFind2000
            Left = 96
            Top = 107
            Width = 121
            Height = 21
            TabOrder = 4
            OnChange = EFAgrupacionChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_AGRUPACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFAgrupacionBusqueda
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAgrupacion: TLFEdit
            Left = 218
            Top = 107
            Width = 386
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object EUdsMin: TLFEdit
            Left = 96
            Top = 129
            Width = 121
            Height = 21
            TabOrder = 5
            Text = '0'
          end
          object EUdsMax: TLFEdit
            Left = 96
            Top = 151
            Width = 121
            Height = 21
            TabOrder = 6
            Text = '1999999999'
          end
          object EPrecio: TLFEdit
            Left = 96
            Top = 173
            Width = 121
            Height = 21
            TabOrder = 9
            Text = '0'
          end
          object EDesc1: TLFEdit
            Left = 96
            Top = 195
            Width = 121
            Height = 21
            TabOrder = 10
            Text = '0'
          end
          object EDesc2: TLFEdit
            Left = 224
            Top = 195
            Width = 121
            Height = 21
            TabOrder = 11
            Text = '0'
          end
          object EDesc3: TLFEdit
            Left = 352
            Top = 195
            Width = 121
            Height = 21
            TabOrder = 12
            Text = '0'
          end
          object DEBaja: TLFDateEdit
            Left = 352
            Top = 151
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DEAlta: TLFDateEdit
            Left = 352
            Top = 129
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object EFProveedor: TLFEditFind2000
            Left = 96
            Top = 41
            Width = 121
            Height = 21
            TabOrder = 1
            OnChange = EFProveedorChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        inherited MLog: TLFMemo
          Top = 246
          Height = 250
        end
      end
    end
  end
end
