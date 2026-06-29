inherited FMImpConEspVentas: TFMImpConEspVentas
  Caption = 'Importacion Condiciones Especiales de Ventas'
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
        inherited PNLImportacion: TLFPanel
          object LFechaAlta: TLFLabel [0]
            Left = 297
            Top = 156
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
          end
          object LFechaBaja: TLFLabel [1]
            Left = 294
            Top = 175
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Baja'
          end
          object LTipoCondicion: TLFLabel [2]
            Left = 21
            Top = 12
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Condicion'
          end
          object LUdsMinimas: TLFLabel [3]
            Left = 23
            Top = 155
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unid. Minimas '
          end
          object LUdsMaximas: TLFLabel [4]
            Left = 26
            Top = 177
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unid. Minimas'
          end
          object LCliente: TLFLabel [5]
            Left = 60
            Top = 44
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LArticulo: TLFLabel [6]
            Left = 57
            Top = 66
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LFamilia: TLFLabel [7]
            Left = 60
            Top = 88
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LPrecio: TLFLabel [8]
            Left = 62
            Top = 199
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LDescuentos: TLFLabel [9]
            Left = 35
            Top = 221
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuentos'
          end
          object LFPerfil: TLFLabel [10]
            Left = 69
            Top = 110
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perfil'
          end
          object LFAgrupacion: TLFLabel [11]
            Left = 38
            Top = 132
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrupaci'#243'n'
          end
          object CBTipoCondicion: TLFComboBox [12]
            Left = 96
            Top = 8
            Width = 209
            Height = 21
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 0
            Text = 'Elija Tipo de Condici'#243'n Especial:'
            OnChange = CBTipoCondicionChange
            Items.Strings = (
              'Elija Tipo de Condici'#243'n Especial:'
              'Cond. Cliente / Art'#237'culo'
              'Cond. Agrupaci'#243'n Clientes / Art'#237'culo'
              'Cond. Perfil / Art'#237'culo'
              'Cond. Art'#237'culo'
              'Cond. Cliente / Familia'
              'Cond. Agrupaci'#243'n Clientes / Familia'
              'Cond. Perfil / Familia'
              'Cond. Familia'
              'Cond. Agrupaci'#243'n Clientes'
              'Cond. Perfil'
              'Cond. Cliente / Agrupaci'#243'n  Art'#237'culo')
          end
          object EUdsMin: TEdit [13]
            Left = 96
            Top = 151
            Width = 121
            Height = 21
            TabOrder = 6
            Text = '0'
          end
          object EUdsMax: TEdit [14]
            Left = 96
            Top = 173
            Width = 121
            Height = 21
            TabOrder = 7
            Text = '1999999999'
          end
          object ETituloCliente: TLFEdit [15]
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
            TabOrder = 17
          end
          object EFCliente: TLFEditFind2000 [16]
            Left = 96
            Top = 41
            Width = 121
            Height = 21
            TabOrder = 1
            OnChange = EFClienteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object CBModificar: TCheckBox [17]
            Left = 424
            Top = 9
            Width = 145
            Height = 17
            Caption = 'Modificar si existe'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 15
          end
          object DEAlta: TLFDateEdit [18]
            Left = 352
            Top = 151
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DEBaja: TLFDateEdit [19]
            Left = 352
            Top = 173
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
          object BtImportar: TButton [20]
            Left = 337
            Top = 6
            Width = 75
            Height = 25
            Caption = 'Importar'
            TabOrder = 14
            OnClick = BtImportarClick
          end
          inherited BBorrarLog: TButton
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
            TabOrder = 18
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
            TabOrder = 19
          end
          object EPrecio: TEdit
            Left = 96
            Top = 195
            Width = 121
            Height = 21
            TabOrder = 10
            Text = '0'
          end
          object EDesc1: TEdit
            Left = 96
            Top = 217
            Width = 121
            Height = 21
            TabOrder = 11
            Text = '0'
          end
          object EDesc2: TEdit
            Left = 224
            Top = 217
            Width = 121
            Height = 21
            TabOrder = 12
            Text = '0'
          end
          object EDesc3: TEdit
            Left = 352
            Top = 217
            Width = 121
            Height = 21
            TabOrder = 13
            Text = '0'
          end
          object EFPerfil: TLFEditFind2000
            Left = 96
            Top = 107
            Width = 121
            Height = 21
            TabOrder = 4
            OnChange = EFPerfilChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PERFIL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'SYS_PERFILES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PERFIL')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFAgrupacion: TLFEditFind2000
            Left = 96
            Top = 129
            Width = 121
            Height = 21
            TabOrder = 5
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
          object ETituloPerfil: TLFEdit
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
            TabOrder = 20
          end
          object ETituloAgrupacion: TLFEdit
            Left = 218
            Top = 129
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
            TabOrder = 21
          end
        end
        inherited PBProgreso: TProgressBar
          Smooth = True
        end
        inherited MLog: TLFMemo
          ScrollBars = ssVertical
        end
      end
    end
  end
end
