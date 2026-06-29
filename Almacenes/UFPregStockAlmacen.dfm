inherited FPregStockAlmacen: TFPregStockAlmacen
  Left = 310
  Top = 176
  HelpContext = 141
  ActiveControl = EFSelAlmacen
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Stock por Almac'#233'n'
  ClientHeight = 484
  ClientWidth = 921
  Constraints.MinHeight = 374
  Constraints.MinWidth = 658
  OldCreateOrder = True
  Visible = True
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 921
    Height = 484
    inherited TBMain: TLFToolBar
      Width = 921
      ButtonWidth = 92
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      inherited TButtImprimir: TToolButton
        Left = 92
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 184
      end
      inherited TButtSalir: TToolButton
        Left = 276
      end
      object TButtConfiguracionRapida: TToolButton
        Left = 368
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtMultiSeleccion: TToolButton
        Left = 460
        Top = 0
        Action = AMultiSeleccion
        ParentShowHint = False
        ShowHint = True
      end
      object TButtMultiAgrupacion: TToolButton
        Left = 552
        Top = 0
        Caption = 'M&ulti-Agrupacion'
        ImageIndex = 4
        OnClick = TButtMultiAgrupacionClick
      end
      object TBExportar: TToolButton
        Left = 644
        Top = 0
        Action = AExportar
      end
    end
    inherited PBListado: TProgressBar
      Top = 468
      Width = 921
      TabOrder = 2
    end
    object PNLStockAlmacen: TLFPanel
      Left = 0
      Top = 36
      Width = 921
      Height = 432
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLOtros: TLFPanel
        Left = 560
        Top = 0
        Width = 361
        Height = 432
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object RBOrdenado: TRadioGroup
          Left = 0
          Top = 265
          Width = 361
          Height = 82
          Align = alTop
          Caption = 'Ordenado por'
          Columns = 4
          ItemIndex = 1
          Items.Strings = (
            'Sin Orden'
            'Art'#237'culo'
            'Familia'
            'Campo 1'
            'Campo 2'
            'Campo 3'
            'Campo 4'
            'Campo 5'
            'Campo 6'
            'Campo 7'
            'Campo 8'
            'Tallas')
          TabOrder = 2
        end
        object PNLOpciones: TLFPanel
          Left = 0
          Top = 0
          Width = 361
          Height = 121
          Align = alTop
          BevelOuter = bvNone
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          object ChkBSoloSinStock: TLFCheckBox
            Left = 9
            Top = 6
            Width = 330
            Height = 17
            Caption = 'Mostrar SOLO Art'#237'culos sin Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
          end
          object ChkBSinStock: TLFCheckBox
            Left = 9
            Top = 26
            Width = 330
            Height = 17
            Caption = 'Mostrar Art'#237'culos sin Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
          end
          object ChkBBaja: TLFCheckBox
            Left = 9
            Top = 45
            Width = 330
            Height = 17
            Caption = 'Mostrar art'#237'culos dados de BAJA'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCalcularLotesNrosSerie: TLFCheckBox
            Left = 9
            Top = 65
            Width = 330
            Height = 17
            Caption = 'Calcular Lotes y Nros. de Serie'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCalcularProveedorPrioritario: TLFCheckBox
            Left = 9
            Top = 84
            Width = 330
            Height = 17
            Caption = 'Calcular Proveedor Prioritario'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBCalcularDatosArticulos: TLFCheckBox
            Left = 9
            Top = 103
            Width = 330
            Height = 17
            Caption = 'Obtener mas datos de art'#237'culo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
          end
        end
        object GBValoracion: TGroupBox
          Left = 0
          Top = 121
          Width = 361
          Height = 144
          Align = alTop
          Caption = 'Valoraci'#243'n'
          TabOrder = 1
          object LSeleccionarFecha: TLFLabel
            Left = 26
            Top = 21
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Valoraci'#243'n'
          end
          object LBLMoneda: TLFLabel
            Left = 21
            Top = 108
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda a emplear'
          end
          object DTPFecha: TLFDateEdit
            Left = 114
            Top = 18
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object EFTarifa: TLFEditFind2000
            Left = 114
            Top = 84
            Width = 50
            Height = 21
            TabStop = False
            MaxLength = 3
            TabOrder = 4
            OnChange = EFTarifaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object ETituloTarifa: TLFEdit
            Left = 165
            Top = 84
            Width = 180
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object RBPrecioTarifa: TRadioButton
            Left = 9
            Top = 84
            Width = 81
            Height = 17
            Caption = 'Precio Tarifa'
            TabOrder = 3
          end
          object RBPCoste: TRadioButton
            Left = 9
            Top = 62
            Width = 97
            Height = 17
            Caption = 'Precio de Coste'
            TabOrder = 2
          end
          object RBPMP: TRadioButton
            Left = 9
            Top = 40
            Width = 139
            Height = 17
            Caption = 'Precio Medio Ponderado'
            Checked = True
            TabOrder = 1
            TabStop = True
          end
          object EFMoneda: TLFEditFind2000
            Left = 114
            Top = 106
            Width = 50
            Height = 21
            MaxLength = 3
            TabOrder = 5
            OnChange = EFMonedaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
            Entorno = EF2000Filtra
          end
          object ETituloMoneda: TLFEdit
            Left = 165
            Top = 106
            Width = 180
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
        end
        object RGStock: TRadioGroup
          Left = 0
          Top = 347
          Width = 361
          Height = 85
          Align = alClient
          Caption = 'Stock'
          ItemIndex = 0
          Items.Strings = (
            'Existencias'
            'Virtual (Existencias + Ped. Prov - Ped. Cli.)')
          TabOrder = 3
        end
      end
      object PNLFiltros: TLFPanel
        Left = 0
        Top = 0
        Width = 560
        Height = 432
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PSinLimite: TLFPanel
          Left = 0
          Top = 0
          Width = 560
          Height = 377
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LBLAlmacen: TLFLabel
            Left = 39
            Top = 18
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LSubFamiliaHasta: TLFLabel
            Left = 10
            Top = 111
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Subfam.'
          end
          object LSubFamiliaDesde: TLFLabel
            Left = 7
            Top = 89
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Subfam.'
          end
          object LHastaFamilia: TLFLabel
            Left = 17
            Top = 64
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Familia'
          end
          object LHastaArticulo: TLFLabel
            Left = 12
            Top = 158
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Art'#237'culo'
          end
          object LDesdeFamilia: TLFLabel
            Left = 14
            Top = 42
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Familia'
          end
          object LDesdeArticulo: TLFLabel
            Left = 9
            Top = 136
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Art'#237'culo'
          end
          object LTipoArticulo: TLFLabel
            Left = 21
            Top = 184
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Articulo'
          end
          object LTemporadaHasta: TLFLabel
            Left = 10
            Top = 230
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Tempor.'
          end
          object LTemporadaDesde: TLFLabel
            Left = 7
            Top = 208
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Tempor.'
          end
          object LGeneroHasta: TLFLabel
            Left = 14
            Top = 277
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Genero'
          end
          object LGeneroDesde: TLFLabel
            Left = 11
            Top = 255
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Genero'
          end
          object LHastaMarca: TLFLabel
            Left = 19
            Top = 324
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Marca'
          end
          object LDesdeMarca: TLFLabel
            Left = 16
            Top = 302
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Marca'
          end
          object LCliente: TLFLabel
            Left = 13
            Top = 351
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art. del cliente'
          end
          object EFSelAlmacen: TLFEditFind2000
            Left = 85
            Top = 15
            Width = 45
            Height = 21
            MaxLength = 3
            TabOrder = 0
            OnChange = EFSelAlmacenChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EAlmacenDesc: TLFEdit
            Left = 131
            Top = 15
            Width = 270
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object ETituloFamiliaHasta: TLFEdit
            Left = 194
            Top = 62
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object ETituloFamiliaDesde: TLFEdit
            Left = 194
            Top = 40
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object ETituloArticuloHasta: TLFEdit
            Left = 194
            Top = 156
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object ETituloArticuloDesde: TLFEdit
            Left = 194
            Top = 134
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object ESubFamiliaHasta: TLFEdit
            Left = 194
            Top = 109
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object ESubFamiliaDesde: TLFEdit
            Left = 194
            Top = 87
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object EFSubFamiliaHasta: TLFEditFind2000
            Left = 85
            Top = 109
            Width = 108
            Height = 21
            Hint = 'Si esta en blanco no filtra'
            MaxLength = 5
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnChange = EFSubFamiliaHastaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'SUBFAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_SUBFAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFSubFamiliaHastaBusqueda
            OrdenadoPor.Strings = (
              'SUBFAMILIA')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFSubFamiliaDesde: TLFEditFind2000
            Left = 85
            Top = 87
            Width = 108
            Height = 21
            Hint = 'Si esta en blanco no filtra'
            MaxLength = 5
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnChange = EFSubFamiliaDesdeChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'SUBFAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_SUBFAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFSubFamiliaDesdeBusqueda
            OrdenadoPor.Strings = (
              'SUBFAMILIA')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFFamiliaH: TLFEditFind2000
            Left = 85
            Top = 62
            Width = 108
            Height = 21
            MaxLength = 5
            TabOrder = 2
            OnChange = EFFamiliaHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFFamiliaHBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFFamiliaD: TLFEditFind2000
            Left = 85
            Top = 40
            Width = 108
            Height = 21
            MaxLength = 5
            TabOrder = 1
            OnChange = EFFamiliaDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFFamiliaDBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFArticulo_H: TLFEditFind2000
            Left = 85
            Top = 156
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 6
            OnChange = EFArticulo_HChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticulo_HBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFArticulo_D: TLFEditFind2000
            Left = 85
            Top = 134
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 5
            OnChange = EFArticulo_DChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFArticulo_DBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFTipoArticulo: TLFEditFind2000
            Left = 85
            Top = 181
            Width = 45
            Height = 21
            MaxLength = 3
            TabOrder = 14
            OnChange = EFTipoArticuloChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'SYS_TIPO_ARTICULO'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = EF2000Filtra
          end
          object ETipoArticulo: TLFEdit
            Left = 131
            Top = 181
            Width = 270
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object ETemporadaDesde: TLFEdit
            Left = 194
            Top = 206
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object ETemporadaHasta: TLFEdit
            Left = 194
            Top = 228
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object EFTemporadaDesde: TLFEditFind2000
            Left = 85
            Top = 206
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 16
            OnChange = EFTemporadaDesdeChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_TEMPORADA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = EF2000Filtra
          end
          object EFTemporadaHasta: TLFEditFind2000
            Left = 85
            Top = 228
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 18
            OnChange = EFTemporadaHastaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_TEMPORADA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = EF2000Filtra
          end
          object EGeneroDesde: TLFEdit
            Left = 194
            Top = 253
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object EGeneroHasta: TLFEdit
            Left = 194
            Top = 275
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
          end
          object EFGeneroDesde: TLFEditFind2000
            Left = 85
            Top = 253
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 20
            OnChange = EFGeneroDesdeChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_GENERO'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = EF2000Filtra
          end
          object EFGeneroHasta: TLFEditFind2000
            Left = 85
            Top = 275
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 22
            OnChange = EFGeneroHastaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_GENERO'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = EF2000Filtra
          end
          object EMarcaDesde: TLFEdit
            Left = 194
            Top = 302
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 25
          end
          object EMarcaHasta: TLFEdit
            Left = 194
            Top = 324
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
          end
          object EFMarcaDesde: TLFEditFind2000
            Left = 85
            Top = 302
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 24
            OnChange = EFMarcaDesdeChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'MARCA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_MARCAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'MARCA')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFMarcaHasta: TLFEditFind2000
            Left = 85
            Top = 324
            Width = 108
            Height = 21
            MaxLength = 15
            TabOrder = 26
            OnChange = EFMarcaHastaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = False
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'TITULO')
            CampoNum = 'MARCA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'ART_ARTICULOS_MOD_MARCAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'MARCA')
            Filtros = [obEmpresa]
            Entorno = EF2000Filtra
          end
          object EFCliente: TLFEditFind2000
            Left = 85
            Top = 349
            Width = 108
            Height = 21
            MaxLength = 5
            TabOrder = 28
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
            Entorno = EF2000Filtra
          end
          object ECliente: TLFEdit
            Left = 194
            Top = 349
            Width = 350
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
          end
        end
        object GBDatos: TGroupBox
          Left = 0
          Top = 377
          Width = 560
          Height = 55
          Align = alClient
          Caption = 'Datos del listado'
          TabOrder = 1
          object LBLFechaListado: TLFLabel
            Left = 20
            Top = 20
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha listado'
          end
          object LBLComentario: TLFLabel
            Left = 30
            Top = 44
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object EComentario: TLFEdit
            Left = 90
            Top = 40
            Width = 327
            Height = 21
            MaxLength = 35
            TabOrder = 1
          end
          object DTPFechaListado: TLFDateEdit
            Left = 90
            Top = 18
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 898
    Top = 8
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMultiSeleccion: TAction
      Caption = '&Multi-Selecci'#243'n'
      Hint = 'Multi-Selecci'#243'n'
      ImageIndex = 132
      OnExecute = AMultiSeleccionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'RBOrdenado.ItemIndex'
      'ChkBSinStock.Checked'
      'ChkBBaja.Checked'
      'ChkBSoloSinStock.Checked'
      'CBCalcularLotesNrosSerie.Checked'
      'CBCalcularDatosArticulos.Checked'
      'CBCalcularProveedorPrioritario.Checked')
    Left = 844
    Top = 8
  end
  object EF2000Filtra: TEntornoFind2000
    Empresa = 0
    Ejercicio = 0
    Canal = 0
    Tercero = 0
    Cliente = 0
    Pgc = 0
    Left = 871
    Top = 8
  end
end
