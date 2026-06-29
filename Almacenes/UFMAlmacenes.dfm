inherited FMAlmacenes: TFMAlmacenes
  Left = 322
  Top = 258
  Width = 767
  Height = 507
  HelpContext = 77
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Almacenes'
  Constraints.MinHeight = 507
  Constraints.MinWidth = 767
  PopupMenu = PopUpStocks
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 757
    Height = 454
    inherited TBMain: TLFToolBar
      Width = 753
      inherited NavMain: THYMNavigator
        DataSource = DMAlmacenes.DSQMAlmacenes
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEAlmacen
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEAlmacen
        Busca02 = DBETitulo
        Busca03 = DBEFTercero
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Hint = 'Informaci'#243'n del Tercero'
      end
    end
    inherited PCMain: TLFPageControl
      Width = 753
      Height = 424
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBATercero: TSpeedButton [0]
          Left = 104
          Top = 70
          Width = 273
          Height = 19
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          Caption = 'Ver Datos Tercero'
          OnDblClick = AATerceroExecute
        end
        inherited PEdit: TLFPanel
          Width = 745
          Height = 396
          inherited G2KTableLoc: TG2KTBLoc
            Left = 101
            Top = 48
            DataSource = DMAlmacenes.DSQMAlmacenes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ALMACENES_CUENTAS'
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ALMACEN')
          end
          object LBLAlmacen: TLFLabel
            Left = 42
            Top = 15
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLTitulo: TLFLabel
            Left = 55
            Top = 37
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLtipo: TLFLabel
            Left = 62
            Top = 59
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBLTercero: TLFLabel
            Left = 46
            Top = 81
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLDir: TLFLabel
            Left = 38
            Top = 103
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object DBEAlmacen: TLFDbedit
            Left = 88
            Top = 11
            Width = 38
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 0
            OnChange = DBEAlmacenChange
          end
          object DBETitulo: TLFDbedit
            Left = 88
            Top = 33
            Width = 324
            Height = 21
            DataField = 'TITULO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 1
          end
          object DBETitTipoAlmacen: TLFDbedit
            Left = 142
            Top = 55
            Width = 270
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlmacenes.DSxTipoAlmacen
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 88
            Top = 77
            Width = 53
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
          end
          object DBETitTercero: TLFDbedit
            Left = 142
            Top = 77
            Width = 270
            Height = 21
            Color = clAqua
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMAlmacenes.DSxTerceros
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBETitDireccion: TLFDbedit
            Left = 142
            Top = 99
            Width = 270
            Height = 21
            Color = clInfoBk
            DataField = 'DIR_COMPLETA'
            DataSource = DMAlmacenes.DSxDirecciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 88
            Top = 99
            Width = 53
            Height = 21
            DataField = 'DIRECCION'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 6
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES       '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'DIR_COMPLETA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = [obTercero]
            Entorno = DMAlmacenes.EntornoFiltro
          end
          object DBCBAutoContiene: TLFDBCheckBox
            Left = 462
            Top = 57
            Width = 150
            Height = 17
            Caption = 'Contiene todos los Art'#237'culos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'AUTO_CONTIENE'
            DataSource = DMAlmacenes.DSQMAlmacenes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFTipoAlmacen: TLFDBEditFind2000
            Left = 88
            Top = 55
            Width = 53
            Height = 21
            DataField = 'TIPO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ALMACEN'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBCBAlmacenDeposito: TLFDBCheckBox
            Left = 462
            Top = 101
            Width = 150
            Height = 17
            Caption = 'Almac'#233'n de dep'#243'sito'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEPOSITO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBCtrolUbicacion: TLFDBCheckBox
            Left = 462
            Top = 79
            Width = 150
            Height = 17
            Caption = 'Control de Ubicaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CTROL_UBICACION'
            DataSource = DMAlmacenes.DSQMAlmacenes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBAlmacenPorDefecto: TLFDBCheckBox
            Left = 462
            Top = 13
            Width = 150
            Height = 17
            Caption = 'Almac'#233'n por defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBAlmacenInteligente: TLFDBCheckBox
            Left = 462
            Top = 123
            Width = 150
            Height = 17
            Caption = 'Almac'#233'n Inteligente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ALMACEN_INTELIGENTE'
            DataSource = DMAlmacenes.DSQMAlmacenes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBAlmacenActivo: TLFDBCheckBox
            Left = 462
            Top = 35
            Width = 150
            Height = 17
            Caption = 'Almac'#233'n Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GBInventarioPermanente: TGroupBox
            Left = 32
            Top = 272
            Width = 585
            Height = 113
            Caption = 'Inventario Permanente'
            TabOrder = 14
            object LCtaGastos: TLFLabel
              Left = 35
              Top = 76
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cta. Gastos'
            end
            object LCtaInventario: TLFLabel
              Left = 21
              Top = 32
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cta. Inventario'
            end
            object LCtaIngresos: TLFLabel
              Left = 28
              Top = 53
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cta. Ingresos'
            end
            object ECtaInventario: TLFEdit
              Left = 203
              Top = 29
              Width = 351
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ECtaIngresos: TLFEdit
              Left = 203
              Top = 51
              Width = 351
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
            object ECtaGastos: TLFEdit
              Left = 203
              Top = 73
              Width = 351
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
            end
            object DBEFCtaInventario: TLFDBEditFind2000
              Left = 95
              Top = 29
              Width = 107
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CTA_INVENTARIO'
              DataSource = DMAlmacenes.DSQMAlmacenes
              TabOrder = 0
              OnChange = DBEFCtaInventarioChange
              OnKeyDown = TeclaExpandirCta
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'VER_SUBCUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CUENTA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnVerificacion = ExpandirCadenaCta
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFCtaGastos: TLFDBEditFind2000
              Left = 95
              Top = 73
              Width = 107
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CTA_GASTOS'
              DataSource = DMAlmacenes.DSQMAlmacenes
              TabOrder = 2
              OnChange = DBEFCtaGastosChange
              OnKeyDown = TeclaExpandirCta
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'VER_SUBCUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CUENTA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnVerificacion = ExpandirCadenaCta
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFCtaIngresos: TLFDBEditFind2000
              Left = 95
              Top = 51
              Width = 107
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CTA_INGRESOS'
              DataSource = DMAlmacenes.DSQMAlmacenes
              TabOrder = 1
              OnChange = DBEFCtaIngresosChange
              OnKeyDown = TeclaExpandirCta
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'VER_SUBCUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CUENTA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnVerificacion = ExpandirCadenaCta
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
      end
      object TSArticulos: TTabSheet [1]
        Caption = '&Art'#237'culos'
        ImageIndex = -1
        OnShow = TSArticulosShow
        object PNLArticulos: TLFPanel
          Left = 0
          Top = 26
          Width = 745
          Height = 300
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGArticulos: THYTDBGrid
            Left = 0
            Top = 0
            Width = 745
            Height = 300
            Align = alClient
            Color = clInfoBk
            DataSource = DMAlmacenes.DSQMArticulosAlmacenes
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'ALMACEN'
              'ARTICULO'
              'FAMILIA'
              'P_COSTE'
              'STOCK_MAXIMO'
              'STOCK_MINIMO'
              'TITULO'
              'TITULO_FAMILIA')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 345
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'STOCK_MINIMO'
                Width = 65
                Visible = True
              end
              item
                Color = clWindow
                Expanded = False
                FieldName = 'STOCK_MAXIMO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_COSTE'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FAMILIA'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_FAMILIA'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_2'
                ReadOnly = True
                Width = 200
                Visible = True
              end>
          end
        end
        object PnlManejo: TLFPanel
          Left = 0
          Top = 326
          Width = 745
          Height = 70
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LFamilia: TLFLabel
            Left = 40
            Top = 2
            Width = 47
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Familia'
          end
          object LFHasta: TLFLabel
            Left = 6
            Top = 41
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object LDesde: TLFLabel
            Left = 3
            Top = 21
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LArticulo: TLFLabel
            Left = 194
            Top = 3
            Width = 85
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Art'#237'culo'
          end
          object LAgrupacion: TLFLabel
            Left = 387
            Top = 2
            Width = 57
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Agrupaci'#243'n'
          end
          object EFFamHasta: TLFEditFind2000
            Left = 38
            Top = 38
            Width = 51
            Height = 21
            TabOrder = 1
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
          object EFFamDesde: TLFEditFind2000
            Left = 38
            Top = 16
            Width = 51
            Height = 21
            TabOrder = 0
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
          object EFArtHasta: TLFEditFind2000
            Left = 194
            Top = 38
            Width = 85
            Height = 21
            TabOrder = 5
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
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFArtDesde: TLFEditFind2000
            Left = 194
            Top = 16
            Width = 85
            Height = 21
            TabOrder = 4
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
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFAgrupHasta: TLFEditFind2000
            Left = 384
            Top = 38
            Width = 63
            Height = 21
            TabOrder = 9
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
            Tabla_a_buscar = 'VER_AGRUPACIONES_ART'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = [obEmpresa]
          end
          object EFAgrupDesde: TLFEditFind2000
            Left = 384
            Top = 16
            Width = 63
            Height = 21
            TabOrder = 8
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
            Tabla_a_buscar = 'VER_AGRUPACIONES_ART'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = [obEmpresa]
          end
          object BInsertarFamilia: TBitBtn
            Left = 91
            Top = 16
            Width = 85
            Height = 22
            Caption = 'A'#241'adir'
            TabOrder = 2
            OnClick = BInsertarFamiliaClick
          end
          object BEliminarFamilia: TBitBtn
            Left = 91
            Top = 38
            Width = 85
            Height = 22
            Caption = 'Eliminar'
            TabOrder = 3
            OnClick = BEliminarFamiliaClick
          end
          object BInsertarArticulo: TBitBtn
            Left = 281
            Top = 16
            Width = 85
            Height = 22
            Caption = 'A'#241'adir'
            TabOrder = 6
            OnClick = BInsertarArticuloClick
          end
          object BEliminarArticulo: TBitBtn
            Left = 281
            Top = 38
            Width = 85
            Height = 22
            Caption = 'Eliminar'
            TabOrder = 7
            OnClick = BEliminarArticuloClick
          end
          object BInsertarAgrupacion: TBitBtn
            Left = 449
            Top = 16
            Width = 85
            Height = 22
            Caption = 'A'#241'adir'
            TabOrder = 10
            OnClick = BInsertarAgrupacionClick
          end
          object BEliminarAgrupacion: TBitBtn
            Left = 449
            Top = 38
            Width = 85
            Height = 22
            Caption = 'Eliminar'
            TabOrder = 11
            OnClick = BEliminarAgrupacionClick
          end
        end
        object TBArticulos: TLFToolBar
          Left = 0
          Top = 0
          Width = 745
          Height = 26
          AutoSize = True
          BorderWidth = 1
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 2
          Separators = True
          object LAlmacen: TLFLabel
            Left = 0
            Top = 0
            Width = 49
            Height = 22
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBEAlmacenArticulo: TLFDbedit
            Left = 49
            Top = 0
            Width = 56
            Height = 22
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETituloAlmacenArticulo: TLFDbedit
            Left = 105
            Top = 0
            Width = 288
            Height = 22
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object ToolButton1: TToolButton
            Left = 393
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavArticulos: THYMNavigator
            Left = 401
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMAlmacenes.DSQMArticulosAlmacenes
            ParentShowHint = False
            PopupMenu = PopUpArticulos
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGArticulos
            Exclusivo = True
            ControlEdit = CEArticulos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSStocks: TTabSheet [2]
        Caption = '&Stocks'
        ImageIndex = 6
        OnShow = TSStocksShow
        object TBStocks: TLFToolBar
          Left = 0
          Top = 0
          Width = 745
          Height = 26
          AutoSize = True
          BorderWidth = 1
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object LAlmacenStock: TLFLabel
            Left = 0
            Top = 0
            Width = 49
            Height = 22
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBEAlmacenStocks: TLFDbedit
            Left = 49
            Top = 0
            Width = 56
            Height = 22
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETituloAlmacenStocks: TLFDbedit
            Left = 105
            Top = 0
            Width = 288
            Height = 22
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object ToolButton8: TToolButton
            Left = 393
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavStocks: THYMNavigator
            Left = 401
            Top = 0
            Width = 110
            Height = 22
            DataSource = DMAlmacenes.DSxStocks
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            ParentShowHint = False
            PopupMenu = PopUpStocks
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEStocks
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton9: TToolButton
            Left = 511
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TBAcumula: TToolButton
            Left = 519
            Top = 0
            Action = AAcumulaStocks
          end
        end
        object PDetalleStock: TLFPanel
          Left = 0
          Top = 81
          Width = 745
          Height = 315
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGStock: THYTDBGrid
            Left = 0
            Top = 0
            Width = 745
            Height = 315
            Align = alClient
            Color = clInfoBk
            DataSource = DMAlmacenes.DSxStocks
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGStockDrawColumnCell
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'ALFA_2'
              'ARTICULO'
              'BARRAS'
              'ENTRADA'
              'EXISTENCIAS'
              'FABRICANTE'
              'FAMILIA'
              'P_COSTE'
              'PEDIDOS_D_CLIENTE'
              'PEDIDOS_D_PROVEEDOR'
              'PMP'
              'RESERVADAS'
              'STOCK_MAXIMO'
              'STOCK_MINIMO'
              'TITULO_ART'
              'TITULO_FABRICANTE'
              'TITULO_FAM')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_ART'
                Width = 236
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FAMILIA'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_FAM'
                Width = 190
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STOCK_MINIMO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'STOCK_MAXIMO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EXISTENCIAS'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PEDIDOS_D_CLIENTE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PEDIDOS_D_PROVEEDOR'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RESERVADAS'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'P_COSTE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PMP'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FABRICANTE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_FABRICANTE'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BARRAS'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_1'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_2'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_3'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_4'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_5'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_6'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_7'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALFA_8'
                Width = 200
                Visible = True
              end>
          end
        end
        object PnlCabeceraStocks: TLFPanel
          Left = 0
          Top = 26
          Width = 745
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LFLArticuloD: TLFLabel
            Left = 20
            Top = 7
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo Desde'
          end
          object LFLArticuloH: TLFLabel
            Left = 23
            Top = 30
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo Hasta'
          end
          object LFLFamiliaD: TLFLabel
            Left = 210
            Top = 7
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia Desde'
          end
          object LFLCanal: TLFLabel
            Left = 376
            Top = 8
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LFLFamiliaH: TLFLabel
            Left = 213
            Top = 30
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia Hasta'
          end
          object DBEArticuloDStocks: TLFEditFind2000
            Left = 94
            Top = 4
            Width = 99
            Height = 21
            TabOrder = 0
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
          object DBEArticuloHStocks: TLFEditFind2000
            Left = 94
            Top = 26
            Width = 99
            Height = 21
            TabOrder = 1
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
          object DBEFamiliaDStocks: TLFEditFind2000
            Left = 279
            Top = 4
            Width = 65
            Height = 21
            TabOrder = 2
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoADevolver = 'FAMILIA'
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECanalStocks: TLFEditFind2000
            Left = 406
            Top = 4
            Width = 63
            Height = 21
            TabOrder = 4
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GEN_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa]
          end
          object DBEFamiliaHStocks: TLFEditFind2000
            Left = 279
            Top = 26
            Width = 65
            Height = 21
            TabOrder = 3
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoADevolver = 'FAMILIA'
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSMovimientos: TTabSheet [3]
        Caption = '&Movimientos'
        ImageIndex = 3
        OnShow = TSMovimientosShow
        object PnlCabeceraFiltro: TLFPanel
          Left = 0
          Top = 26
          Width = 745
          Height = 55
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object ArtDesde: TLFLabel
            Left = 4
            Top = 7
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo Desde'
          end
          object ArtHasta: TLFLabel
            Left = 7
            Top = 30
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo Hasta'
          end
          object LTipoMov: TLFLabel
            Left = 500
            Top = 30
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Mov'
          end
          object LbEjercicio: TLFLabel
            Left = 186
            Top = 7
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio Desde'
          end
          object LCanal: TLFLabel
            Left = 660
            Top = 7
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LHastaEjercicio: TLFLabel
            Left = 189
            Top = 30
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio Hasta'
          end
          object LFFechaDesde: TLFLabel
            Left = 325
            Top = 7
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Desde'
          end
          object LFFechaHasta: TLFLabel
            Left = 328
            Top = 30
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Hasta'
          end
          object LOrigen: TLFLabel
            Left = 514
            Top = 7
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Origen'
          end
          object EFArtDesdeMovimiento: TLFEditFind2000
            Left = 78
            Top = 4
            Width = 99
            Height = 21
            TabOrder = 0
            OnChange = ParametrosChange
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
          object EFArtHastaMovimiento: TLFEditFind2000
            Left = 78
            Top = 26
            Width = 99
            Height = 21
            TabOrder = 1
            OnChange = ParametrosChange
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
          object CBTipoMov: TLFComboBox
            Left = 548
            Top = 26
            Width = 101
            Height = 21
            DropDownCount = 7
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 7
            Text = 'Todos'
            OnChange = ParametrosChange
            Items.Strings = (
              'Todos'
              'Entrada'
              'Salida'
              'Origen'
              'Destino'
              'Tipo Entrada (E, D)'
              'Tipo Salida (S, O)')
          end
          object EFEjerDesdeMovimiento: TLFEditFind2000
            Left = 263
            Top = 4
            Width = 58
            Height = 21
            TabOrder = 2
            OnChange = ParametrosChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EJERCICIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_EJERCICIOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EJERCICIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFCanal: TLFEditFind2000
            Left = 690
            Top = 4
            Width = 39
            Height = 21
            TabOrder = 8
            OnChange = ParametrosChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'GEN_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa]
          end
          object EFEjerHastaMovimiento: TLFEditFind2000
            Left = 263
            Top = 26
            Width = 58
            Height = 21
            TabOrder = 3
            OnChange = ParametrosChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EJERCICIO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_EJERCICIOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'EJERCICIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DEFechaDesdeMovimientos: TLFDateEdit
            Left = 392
            Top = 4
            Width = 97
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
            Text = '01/01/2000'
            OnChange = ParametrosChange
          end
          object DEFechaHastaMovimientos: TLFDateEdit
            Left = 392
            Top = 26
            Width = 97
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
            OnChange = ParametrosChange
          end
          object CBOrigenMovimientos: TLFComboBox
            Left = 548
            Top = 4
            Width = 101
            Height = 21
            DropDownCount = 7
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 6
            Text = 'Todos'
            OnChange = ParametrosChange
            Items.Strings = (
              'Todos'
              'ALB'
              'ALP'
              'FAC'
              'FAP'
              'MAN'
              'OPR')
          end
        end
        object PnlGridFiltro: TLFPanel
          Left = 0
          Top = 81
          Width = 745
          Height = 315
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGMovimientos: THYTDBGrid
            Left = 0
            Top = 0
            Width = 745
            Height = 315
            Align = alClient
            Color = clInfoBk
            DataSource = DMAlmacenes.DSxMovStockAlmacen
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'ARTICULO'
              'DOC_NUMERO'
              'DOC_SERIE'
              'EJERCICIO'
              'ENTRADA'
              'FECHA'
              'ID_MOV_STOCKS'
              'IMPORTE'
              'N_MOV_STOCK'
              'ORIGEN'
              'PERIODO'
              'PRECIO'
              'PRECIO_SIN_DTO'
              'TIPO_OPER'
              'UNIDADES'
              'UNIDADES_EXT')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'PERIODO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_OPER'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMENTARIO'
                Width = 150
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORIGEN'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'IMPORTE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOC_NUMERO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOC_SERIE'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENTRADA'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ACTIVO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_EXT'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_SIN_DTO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MOV_VIRTUAL'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_A'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_MOV_STOCKS'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEFINITIVO'
                Width = 50
                Visible = True
              end>
          end
        end
        object TBMovimientos: TLFToolBar
          Left = 0
          Top = 0
          Width = 745
          Height = 26
          AutoSize = True
          BorderWidth = 1
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 2
          Separators = True
          object LAlmacenMovimientos: TLFLabel
            Left = 0
            Top = 0
            Width = 49
            Height = 22
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBEAlmacenMovimientos: TLFDbedit
            Left = 49
            Top = 0
            Width = 56
            Height = 22
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETituloAlmacenMovimientos: TLFDbedit
            Left = 105
            Top = 0
            Width = 288
            Height = 22
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object ToolButton2: TToolButton
            Left = 393
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavMovimientos: THYMNavigator
            Left = 401
            Top = 0
            Width = 110
            Height = 22
            DataSource = DMAlmacenes.DSxMovStockAlmacen
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            ParentShowHint = False
            PopupMenu = PopUpMovimientos
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEMovimientos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSUbicaciones: TTabSheet [4]
        Caption = '&Ubicaciones'
        OnShow = TSUbicacionesShow
        object Splitter1: TSplitter
          Left = 0
          Top = 170
          Width = 745
          Height = 4
          Cursor = crVSplit
          Align = alBottom
        end
        object PNLUbicaciones: TLFPanel
          Left = 0
          Top = 26
          Width = 745
          Height = 144
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGUbicaciones: THYTDBGrid
            Left = 0
            Top = 0
            Width = 745
            Height = 144
            Align = alClient
            Color = clInfoBk
            DataSource = DMAlmacenes.DSxUbicaciones
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAMarcar.Strings = (
              'DISPONIBLE')
            CamposChecked.Strings = (
              '1')
            CamposNoChecked.Strings = (
              '0')
            CamposAOrdenar.Strings = (
              'CALLE'
              'COMPOSICION'
              'ESTANTERIA'
              'ID_UBICACION'
              'POSICION'
              'REPISA'
              'SECTOR'
              'TIPO'
              'TITULO')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_UBICACION'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Width = 166
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CALLE'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESTANTERIA'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REPISA'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'POSICION'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SECTOR'
                Width = 52
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DISPONIBLE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VOLUMEN_MAX'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIAMETRO_MAX'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO_MAX'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VOLUMEN_ACC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PESO_ACC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIAMETRO_ACC'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPOSICION'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GENERAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES_ACC'
                Width = 65
                Visible = True
              end>
          end
        end
        object TBUbicaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 745
          Height = 26
          AutoSize = True
          BorderWidth = 1
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object LAlmacenUbicacion: TLFLabel
            Left = 0
            Top = 0
            Width = 49
            Height = 22
            Caption = 'Almac'#233'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBEAlmacenUbicaion: TLFDbedit
            Left = 49
            Top = 0
            Width = 56
            Height = 22
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETituloAlmacen: TLFDbedit
            Left = 105
            Top = 0
            Width = 288
            Height = 22
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object ToolButton4: TToolButton
            Left = 393
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavUbicaciones: THYMNavigator
            Left = 401
            Top = 0
            Width = 100
            Height = 22
            DataSource = DMAlmacenes.DSxUbicaciones
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton5: TToolButton
            Left = 501
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object LUbicacion: TLFLabel
            Left = 509
            Top = 0
            Width = 81
            Height = 22
            Alignment = taRightJustify
            Caption = 'Ir a Ubicaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFUbicacion: TLFEditFind2000
            Left = 590
            Top = 0
            Width = 50
            Height = 22
            TabOrder = 3
            OnChange = EFUbicacionChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ID_UBICACION'
            CampoStr = 'COMPOSICION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ALMACENES_UBICACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFUbicacionBusqueda
            OrdenadoPor.Strings = (
              'COMPOSICION')
            Filtros = []
          end
        end
        object PNLDetalleUbicacion: TLFPanel
          Left = 0
          Top = 174
          Width = 745
          Height = 222
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object Splitter2: TSplitter
            Left = 368
            Top = 26
            Width = 4
            Height = 196
            Cursor = crHSplit
          end
          object PNLArticulo: TLFPanel
            Left = 0
            Top = 26
            Width = 368
            Height = 196
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object DBGArticulo: THYTDBGrid
              Left = 0
              Top = 0
              Width = 368
              Height = 196
              Align = alClient
              Color = clInfoBk
              DataSource = DMAlmacenes.DSxArticulos
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'ARTICULO'
                'COMPOSICION'
                'ENTRADAS'
                'EXISTENCIAS'
                'FAMILIA'
                'SALIDAS'
                'TITULO_ARTIC')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Width = 77
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_ARTIC'
                  Width = 110
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADAS'
                  Width = 54
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SALIDAS'
                  Width = 53
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXISTENCIAS'
                  Width = 54
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FAMILIA'
                  Visible = True
                end>
            end
          end
          object PNLLote: TLFPanel
            Left = 372
            Top = 26
            Width = 373
            Height = 196
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBGLotes: THYTDBGrid
              Left = 0
              Top = 0
              Width = 373
              Height = 196
              Align = alClient
              Color = clInfoBk
              DataSource = DMAlmacenes.DSxArticuloLote
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'ARTICULO'
                'AUTO_REETIQUETADO'
                'CLASIFICACION'
                'CODIGO'
                'F_CADUCIDAD'
                'F_ENVASADO'
                'F_FABRICACION'
                'ID_LOTE'
                'LOTE'
                'PROVEEDOR'
                'SERIE'
                'STOCK')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID_LOTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STOCK'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_ENVASADO'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_CADUCIDAD'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_FABRICACION'
                  Width = 65
                  Visible = True
                end>
            end
          end
          object TBUbicacionesArticulos: TLFToolBar
            Left = 0
            Top = 0
            Width = 745
            Height = 26
            AutoSize = True
            BorderWidth = 1
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            Images = DMMain.ILMain_Ac
            TabOrder = 2
            Separators = True
            object NavUbicacionesArticulo: THYMNavigator
              Left = 0
              Top = 0
              Width = 96
              Height = 22
              DataSource = DMAlmacenes.DSxArticulos
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton6: TToolButton
              Left = 96
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object LArticuloUbicaciones: TLFLabel
              Left = 104
              Top = 0
              Width = 69
              Height = 22
              Alignment = taRightJustify
              Caption = 'Ir a Art'#237'culo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object EFArticuloUbicaciones: TLFEditFind2000
              Left = 173
              Top = 0
              Width = 102
              Height = 22
              TabOrder = 1
              OnChange = EFArticuloUbicacionesChange
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
            object ToolButton7: TToolButton
              Left = 275
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object cbSoloElementosConStock: TLFCheckBox
              Left = 283
              Top = 0
              Width = 180
              Height = 22
              Caption = 'Solo art'#237'culos con Stock'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              Layout = checkboxRight
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              OnChange = cbSoloElementosConStockChange
            end
          end
        end
      end
      object TSAlmacenInteligenteMECALUX: TTabSheet [5]
        Caption = 'Almac'#233'n &Inteligente MECALUX'
        OnShow = TSAlmacenInteligenteMECALUXShow
        DesignSize = (
          745
          396)
        object LMaestroProcesado: TLFLabel
          Left = 359
          Top = 174
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Anchors = [akLeft, akTop, akRight]
          Caption = 'Maestro Porcesado :'
          Layout = tlCenter
        end
        object DBTMaestroProcesado: TDBText
          Left = 464
          Top = 174
          Width = 111
          Height = 13
          AutoSize = True
          DataField = 'ARTICULO'
          DataSource = DMAlmacenes.DSQMArticulosAlmacenes
        end
        object TBAlmacenInteligente: TLFToolBar
          Left = 0
          Top = 0
          Width = 745
          Height = 26
          AutoSize = True
          BorderWidth = 1
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object LAlmacenAlmInteligente: TLFLabel
            Left = 0
            Top = 0
            Width = 49
            Height = 22
            Caption = 'Almac'#233'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBEAlmacenAlmInteligente: TLFDbedit
            Left = 49
            Top = 0
            Width = 56
            Height = 22
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETituloAlmacenAlmInteligente: TLFDbedit
            Left = 105
            Top = 0
            Width = 288
            Height = 22
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object ToolButton3: TToolButton
            Left = 393
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAlmacenInteligente: THYMNavigator
            Left = 401
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMAlmacenes.DSQMAlmacenes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            ParentShowHint = False
            PopupMenu = PopUpAlmacenInteligenteMECALUX
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBECarpetaImportacion
            Exclusivo = True
            ControlEdit = CEAlmacenInteligenteMECALUX
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object BMaestroDeProductos: TBitBtn
          Left = 24
          Top = 168
          Width = 233
          Height = 25
          Caption = 'Generar maestro de productos'
          TabOrder = 1
          OnClick = BMaestroDeProductosClick
        end
        object BLeerMovimientos: TBitBtn
          Left = 24
          Top = 226
          Width = 233
          Height = 25
          Caption = 'Leer movimientos'
          TabOrder = 2
          OnClick = BLeerMovimientosClick
        end
        object BBorrarMarcasMaestroProductos: TBitBtn
          Left = 24
          Top = 197
          Width = 233
          Height = 25
          Caption = 'Borrar marcas'
          TabOrder = 3
          OnClick = BBorrarMarcasMaestroProductosClick
        end
        object PNLAlmacenInteligenteMECALUX: TLFPanel
          Left = 0
          Top = 26
          Width = 745
          Height = 124
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 4
          DesignSize = (
            745
            124)
          object LCarpetaImportacion: TLFLabel
            Left = 21
            Top = 11
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carpeta Importaci'#243'n'
          end
          object LCarpetaExportacion: TLFLabel
            Left = 21
            Top = 33
            Width = 96
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carpeta Exportaci'#243'n'
          end
          object LAlmacenOrigen: TLFLabel
            Left = 42
            Top = 55
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Origen'
          end
          object LAlmacenDestino: TLFLabel
            Left = 37
            Top = 77
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Destino'
          end
          object LSerieMovimiento: TLFLabel
            Left = 31
            Top = 99
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie Movimientos'
          end
          object DBECarpetaImportacion: TLFDbedit
            Left = 120
            Top = 7
            Width = 620
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CARPETA_IMPORTACION'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 0
          end
          object DBECarpetaExportacion: TLFDbedit
            Left = 120
            Top = 29
            Width = 620
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'CARPETA_EXPORTACION'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 1
          end
          object DBEAlmacenOrigen: TLFDBEditFind2000
            Left = 120
            Top = 51
            Width = 57
            Height = 21
            DataField = 'ALMACEN_ORIGEN'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 2
            OnChange = DBEAlmacenOrigenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EAlmacenOrigen: TLFEdit
            Left = 178
            Top = 51
            Width = 562
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
          end
          object DBEAlmacenDestino: TLFDBEditFind2000
            Left = 120
            Top = 73
            Width = 57
            Height = 21
            DataField = 'ALMACEN_DESTINO'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 4
            OnChange = DBEAlmacenDestinoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EAlmacenDestino: TLFEdit
            Left = 178
            Top = 73
            Width = 562
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 5
          end
          object EFSerieMovimiento: TLFDBEditFind2000
            Left = 120
            Top = 95
            Width = 57
            Height = 21
            DataField = 'SERIE_MOVIMIENTOS'
            DataSource = DMAlmacenes.DSQMAlmacenes
            TabOrder = 6
            OnChange = EFSerieMovimientoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ESerieMovimiento: TLFEdit
            Left = 178
            Top = 95
            Width = 562
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 745
          Height = 396
          DataSource = DMAlmacenes.DSQMAlmacenes
          CamposAOrdenar.Strings = (
            'ALMACEN'
            'TITULO'
            'TIPO'
            'TERCERO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 240
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 63
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 454
    Width = 757
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEArticulos
    Left = 42
    Top = 292
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 42
    Top = 256
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 78
    Top = 220
    object AListadoDeStock: TAction
      Category = 'Listados'
      Caption = 'Listado de Stock'
      Hint = 'Listado de Stock de los articulos filtrados'
      ImageIndex = 14
      OnExecute = AListadoDeStockExecute
    end
    object AInfoTercero: TAction
      Category = 'Otros'
      Caption = 'Informaci'#243'n del Tercero'
      Hint = 'Muestra la informaci'#243'n del Tercero asociado'
      ImageIndex = 54
      OnExecute = AInfoTerceroExecute
    end
    object AConfigAlmacen: TAction
      Category = 'Procesos'
      Caption = 'Configuraci'#243'n del Almac'#233'n'
      Hint = 'Configuraci'#243'n del almac'#233'n'
      ImageIndex = 2
      OnExecute = AConfigAlmacenExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfListadoDeStock: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Stock'
      Hint = 'Listado de Stock de los articulos filtrados'
      ImageIndex = 77
      OnExecute = AConfListadoDeStockExecute
    end
    object ARecalcularPrecios: TAction
      Category = 'Procesos'
      Caption = 'Recalcular Precios'
      Hint = 'Recalcula Precios de Coste, PMP, LIFO y FIFO'
      ImageIndex = 2
      OnExecute = ARecalcularPreciosExecute
    end
    object APonderaArticulos: TAction
      Category = 'Procesos'
      Caption = 'Recalcula Precio de Coste de Lineas de Venta'
      Hint = 'Recalcula Precio de Coste de Lineas de Venta'
      ImageIndex = 2
      OnExecute = APonderaArticulosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 42
    Top = 220
  end
  object ALAlmacenes: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 114
    Top = 220
    object AListado: TAction
      Caption = 'AListado'
      OnExecute = AListadoExecute
    end
    object AATercero: TAction
      Caption = 'Ver Datos Tercero'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
      ShortCut = 49236
      OnExecute = AATerceroExecute
    end
    object AAcumulaStocks: TAction
      Caption = 'C'#225'lculo Stocks'
      Hint = 'Muestra la informaci'#243'n de stocks del almac'#233'n'
      ImageIndex = 3
      OnExecute = AAcumulaStocksExecute
    end
  end
  object CEAlmacenInteligenteMECALUX: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSAlmacenInteligenteMECALUX
    PanelEdicion = PNLAlmacenInteligenteMECALUX
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = PopUpAlmacenInteligenteMECALUX
    Teclas = DMMain.Teclas
    Left = 114
    Top = 292
  end
  object PopUpAlmacenInteligenteMECALUX: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 114
    Top = 256
    object MenuItem1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem11: TMenuItem
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
      Visible = False
    end
    object MenuItem13: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object MenuItem14: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object MenuItem15: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
      Visible = False
    end
    object MenuItem16: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object MenuItem17: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object MenuItem18: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object MenuItem19: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem20: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object MenuItem21: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
  end
  object CEArticulos: TControlEdit
    EnlazadoA = CEMovimientos
    FichaEdicion = TSArticulos
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = PopUpArticulos
    Teclas = DMMain.Teclas
    Left = 78
    Top = 292
  end
  object PopUpArticulos: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 78
    Top = 256
    object MenuItem22: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem23: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem24: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem25: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem26: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem27: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem28: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem29: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem30: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem31: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem32: TMenuItem
      Caption = '-'
    end
    object MenuItem33: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem34: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem35: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem36: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem37: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object MenuItem38: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object MenuItem39: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object MenuItem40: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem41: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object MenuItem42: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
  end
  object CEMovimientos: TControlEdit
    EnlazadoA = CEAlmacenInteligenteMECALUX
    FichaEdicion = TSMovimientos
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = PopUpMovimientos
    Teclas = DMMain.Teclas
    Left = 150
    Top = 292
  end
  object PopUpMovimientos: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 150
    Top = 256
    object MenuItem43: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem44: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem45: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem46: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem47: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem48: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem49: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem50: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem51: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem52: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem53: TMenuItem
      Caption = '-'
    end
    object MenuItem54: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem55: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem56: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem57: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem58: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object MenuItem59: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object MenuItem60: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
      Visible = False
    end
    object MenuItem61: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object MenuItem62: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
      Visible = False
    end
    object MenuItem63: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
    object CEMovimientosMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CEMovimientosMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CEMovimientosMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CEMovimientosMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CEMovimientosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CEMovimientosMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CEMovimientosMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CEMovimientosMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CEMovimientosMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CEMovimientosMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CEStocks: TControlEdit
    FichaEdicion = TSStocks
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = PopUpStocks
    Teclas = DMMain.Teclas
    Left = 186
    Top = 292
  end
  object PopUpStocks: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 186
    Top = 256
    object MenuItem64: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem65: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem66: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem67: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem68: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem69: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem70: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem71: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem72: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem73: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem74: TMenuItem
      Caption = '-'
    end
    object MenuItem75: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem76: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem77: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem78: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem79: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object MenuItem80: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object MenuItem81: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
      Visible = False
    end
    object MenuItem82: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object MenuItem83: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
      Visible = False
    end
    object MenuItem84: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
  end
end
