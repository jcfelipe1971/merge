inherited FMSincronizacionTiendaWoocommerce: TFMSincronizacionTiendaWoocommerce
  Left = 333
  Top = 112
  Width = 1257
  Height = 693
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion Tienda Woocommerce'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1247
    Height = 640
    inherited TBMain: TLFToolBar
      Width = 1243
      inherited NavMain: THYMNavigator
        DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
        Hints.Strings = ()
      end
      inherited TbuttComp: TToolButton
        Action = ASincronizar
      end
      object TBPrueba: TToolButton
        Left = 339
        Top = 0
        Caption = 'TBPrueba'
        ImageIndex = 25
        OnClick = TBPruebaClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1243
      Height = 290
      inherited TSFicha: TTabSheet
        object SBAWebBackoffice: TSpeedButton [0]
          Left = 18
          Top = 202
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAWebBackofficeDblClick
        end
        object SBAWeb: TSpeedButton [1]
          Left = 10
          Top = 194
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAWebDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1235
          Height = 262
          inherited G2KTableLoc: TG2KTBLoc
            Left = 80
            Top = 35
          end
          object LNombreFicha: TLFLabel
            Left = 39
            Top = 4
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LWeb: TLFLabel
            Left = 53
            Top = 26
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Web'
          end
          object LWebBackoffice: TLFLabel
            Left = 25
            Top = 48
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Backoffice'
          end
          object LEmpresa: TLFLabel
            Left = 35
            Top = 92
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa'
          end
          object LCanal: TLFLabel
            Left = 49
            Top = 114
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LSerie: TLFLabel
            Left = 52
            Top = 136
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LPrefijoArticulo: TLFLabel
            Left = 28
            Top = 203
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prefijo Art.'
          end
          object LAlmacen: TLFLabel
            Left = 35
            Top = 158
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen'
          end
          object LAgente: TLFLabel
            Left = 42
            Top = 180
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LVersionWordPress: TLFLabel
            Left = 18
            Top = 70
            Width = 56
            Height = 13
            Hint = 'Version WordPress'
            Alignment = taRightJustify
            Caption = 'Version WP'
            ParentShowHint = False
            ShowHint = True
          end
          object LTienaArticulos: TLFLabel
            Left = 160
            Top = 202
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tienda Art.'
          end
          object LWSUrl: TLFLabel
            Left = 893
            Top = 3
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'URL'
          end
          object LWSCustomerKey: TLFLabel
            Left = 850
            Top = 67
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Customer Key'
          end
          object LRecursos: TLFLabel
            Left = 871
            Top = 111
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recursos'
          end
          object LWSCustomerSecret: TLFLabel
            Left = 836
            Top = 89
            Width = 78
            Height = 13
            Caption = 'Customer Secret'
          end
          object LVersionWoocommerce: TLFLabel
            Left = 482
            Top = 70
            Width = 56
            Height = 13
            Hint = 'Version Woocommerce'
            Alignment = taRightJustify
            Caption = 'Version WS'
            ParentShowHint = False
            ShowHint = True
          end
          object LTarifa: TLFLabel
            Left = 49
            Top = 224
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LApiGet: TLFLabel
            Left = 877
            Top = 25
            Width = 37
            Height = 13
            Caption = 'API Get'
          end
          object LApiCalc: TLFLabel
            Left = 874
            Top = 47
            Width = 41
            Height = 13
            Caption = 'API Calc'
          end
          object DBETitulo: TLFDbedit
            Left = 80
            Top = 1
            Width = 573
            Height = 21
            DataField = 'TITULO'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 0
          end
          object DBEWeb: TLFDbedit
            Left = 80
            Top = 23
            Width = 573
            Height = 21
            Color = clAqua
            DataField = 'WEB'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 1
          end
          object DBEWebBackoffice: TLFDbedit
            Left = 80
            Top = 45
            Width = 573
            Height = 21
            Color = clAqua
            DataField = 'WEB_BACKOFFICE'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 2
          end
          object DBEFEmpresa: TLFDBEditFind2000
            Left = 80
            Top = 89
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'EMPRESA'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 5
            OnChange = DBEFEmpresaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_EMPRESAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPRESA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPRESA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloEmpresa: TLFEdit
            Left = 140
            Top = 89
            Width = 513
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 21
          end
          object ETituloCanal: TLFEdit
            Left = 140
            Top = 111
            Width = 513
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 22
          end
          object DBEFCanal: TLFDBEditFind2000
            Left = 80
            Top = 111
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CANAL'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 6
            OnChange = DBEFCanalChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'GEN_CANALES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFCanalBusqueda
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 80
            Top = 133
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 7
            OnChange = DBEFSerieChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'GEN_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFSerieBusqueda
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloSerie: TLFEdit
            Left = 140
            Top = 133
            Width = 513
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 23
          end
          object CBSincronizacionActiva: TLFDBCheckBox
            Left = 666
            Top = 2
            Width = 158
            Height = 17
            Caption = 'Sincronizacion Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBSincronizacionActivaChange
            DataField = 'ACTIVO'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPrefijoArticulo: TLFDbedit
            Left = 80
            Top = 199
            Width = 59
            Height = 21
            DataField = 'PREFIJO_ART'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 10
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 80
            Top = 155
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 8
            OnChange = DBEFAlmacenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFAlmacenBusqueda
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAlmacen: TLFEdit
            Left = 140
            Top = 155
            Width = 513
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
          end
          object DBEFAgente: TLFDBEditFind2000
            Left = 80
            Top = 177
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'AGENTE'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 9
            OnChange = DBEFAgenteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFAgenteBusqueda
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAgente: TLFEdit
            Left = 140
            Top = 177
            Width = 513
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
          end
          object DBCBControlStockDesactivado: TLFDBCheckBox
            Left = 666
            Top = 63
            Width = 158
            Height = 31
            Hint = 'Importa articulos con Control de Stock **desactivado**'
            Caption = 'Importa articulos con Control de Stock **desactivado**'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ART_SIN_CONTROL_STOCK'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBUtilizaReferenciaWoocommerce: TLFDBCheckBox
            Left = 665
            Top = 94
            Width = 158
            Height = 41
            Caption = 
              'Utiliza Referencia de articulo como codigo de articulo de la apl' +
              'icacion'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'UTILIZA_REF_WOOCOMMERCE'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEVersionWordPress: TLFDbedit
            Left = 80
            Top = 67
            Width = 109
            Height = 21
            DataField = 'VERSION_WORDPRESS'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            Enabled = False
            TabOrder = 3
          end
          object DBEFTienaArticulos: TLFDBEditFind2000
            Left = 216
            Top = 199
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ID_TIENDA_ARTICULOS'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 11
            OnChange = DBEFTienaArticulosChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_CONF_PRESTASHOP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETienaArticulos: TLFEdit
            Left = 276
            Top = 199
            Width = 377
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
          end
          object DBEWSUrl: TLFDbedit
            Left = 920
            Top = 0
            Width = 300
            Height = 21
            DataField = 'WS_URL'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 16
            OnChange = DBEWSUrlChange
            OnExit = DBEWSUrlExit
          end
          object DBEWSCustomerKey: TLFDbedit
            Left = 920
            Top = 64
            Width = 300
            Height = 21
            DataField = 'WS_CONSUMER_KEY'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            PasswordChar = '*'
            TabOrder = 19
            OnExit = DBEWSCustomerKeyExit
          end
          object MRecursos: TLFMemo
            Left = 920
            Top = 108
            Width = 300
            Height = 137
            Anchors = [akLeft, akTop, akBottom]
            Color = clInfoBk
            Lines.Strings = (
              'Recursos')
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 27
          end
          object DBEWSCustomerSecret: TLFDbedit
            Left = 920
            Top = 86
            Width = 300
            Height = 21
            DataField = 'WS_CONSUMER_SECRET'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            PasswordChar = '*'
            TabOrder = 20
          end
          object DBEVersionWoocommerce: TLFDbedit
            Left = 544
            Top = 67
            Width = 109
            Height = 21
            DataField = 'WS_VERSION'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            Enabled = False
            TabOrder = 4
          end
          object DBEFTarifa: TLFDBEditFind2000
            Left = 80
            Top = 221
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TARIFA'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 12
            OnChange = DBEFTarifaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVA = 1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFTarifaBusqueda
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloTarifa: TLFEdit
            Left = 140
            Top = 221
            Width = 513
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
          end
          object DBEApiGet: TLFDbedit
            Left = 920
            Top = 22
            Width = 300
            Height = 21
            DataField = 'WS_API_GET'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 17
          end
          object DBEApiCalc: TLFDbedit
            Left = 920
            Top = 42
            Width = 300
            Height = 21
            DataField = 'WS_API_CALC'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            TabOrder = 18
          end
        end
      end
      object TSClientes: TTabSheet [1]
        Caption = 'Clientes'
        ImageIndex = 2
        object TBCliente: TLFToolBar
          Left = 0
          Top = 0
          Width = 1235
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavCliente: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceCliente
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGCliente
            InsertaControl = DBGCliente
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLFiltroIdCustomer: TLFPanel
            Left = 240
            Top = 0
            Width = 273
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFiltroCliente: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroCliente: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
              OnChange = EFiltroClienteChange
            end
          end
        end
        object DBGCliente: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 240
          Align = alClient
          DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceCliente
          TabOrder = 1
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
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'CLIENTE')
          CamposAMostrar.Strings = (
            'CLIENTE'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CLIENTE'
            'ID_CUSTOMER'
            'NOMBRE_R_SOCIAL'
            'ULT_SINCRONIZACION'
            'TERCERO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CLIENTE')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_CLIENTES_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGClienteBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CLIENTE')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_CUSTOMER'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ULT_SINCRONIZACION'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TERCERO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Width = 300
              Visible = True
            end>
        end
      end
      object TSDirecciones: TTabSheet [2]
        Caption = 'Direcciones'
        ImageIndex = 3
        object DBGDireccion: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 220
          Align = alClient
          DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceClienteDir
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
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'CLIENTE'
            'DIRECCION')
          CamposAMostrar.Strings = (
            'CLIENTE'
            '0'
            'DIRECCION'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CLIENTE'
            'DIRECCION'
            'ID_ADDRESS'
            'NOMBRE_R_SOCIAL'
            'DIR_COMPLETA_N'
            'ULT_SINCRONIZACION'
            'TERCERO')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CLIENTE'
            'DIRECCION')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_CLIENTES_EF'
            'SYS_TERCEROS_DIRECCIONES')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'DIR_COMPLETA_N')
          Posicion = tpCentrado
          OnBusqueda = DBGDireccionBusqueda
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CLIENTE'
            'DIRECCION')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ADDRESS'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ULT_SINCRONIZACION'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Width = 250
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DIR_COMPLETA_N'
              ReadOnly = True
              Width = 400
              Visible = True
            end>
        end
        object TBDireccion: TLFToolBar
          Left = 0
          Top = 0
          Width = 1235
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavDireccion: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceClienteDir
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGDireccion
            InsertaControl = DBGDireccion
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLIdAddress: TLFPanel
            Left = 240
            Top = 0
            Width = 273
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFiltroDireccion: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroDireccion: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
              OnChange = EFiltroDireccionChange
            end
          end
        end
      end
      object TSArticulos: TTabSheet [3]
        Caption = 'Articulos'
        object TBArticulo: TLFToolBar
          Left = 0
          Top = 0
          Width = 1235
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavArticulo: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceArticulo
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGArticulo
            InsertaControl = DBGArticulo
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLIdProduct: TLFPanel
            Left = 240
            Top = 0
            Width = 271
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFiltroArticulo: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroArticulo: TLFEdit
              Left = 40
              Top = 0
              Width = 229
              Height = 21
              TabOrder = 0
              OnChange = EFiltroArticuloChange
            end
          end
        end
        object DBGArticulo: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 240
          Align = alClient
          DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceArticulo
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGArticuloCellClick
          OnDrawColumnCell = DBGArticuloDrawColumnCell
          OnDblClick = DBGArticuloDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
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
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'ID_A'
            'ID_ATTRIBUTE'
            'ID_ATTRIBUTES'
            'ID_PRODUCT'
            'ID_PRODUCT_ATTRIBUTE'
            'TITULO'
            'ULT_SINCRONIZACION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGArticuloBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ARTICULO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_PRODUCT'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_VARIATION'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ULT_SINCRONIZACION'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 99
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 586
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'STOCK'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REFERENCIA'
              ReadOnly = True
              Width = 101
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              ReadOnly = True
              Width = 254
              Visible = True
            end>
        end
      end
      object TSProductosWC: TTabSheet [4]
        Caption = 'Productos WC'
        ImageIndex = 6
        object LFToolBar1: TLFToolBar
          Left = 0
          Top = 0
          Width = 1235
          Height = 29
          ButtonHeight = 21
          TabOrder = 0
          Separators = True
          object DBEInfoProductosTitulo: TLFDbedit
            Left = 0
            Top = 2
            Width = 350
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object NavProductosWC: THYMNavigator
            Left = 350
            Top = 2
            Width = 240
            Height = 21
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMProductosWC
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object LFiltroProductosWC: TLFLabel
            Left = 590
            Top = 2
            Width = 35
            Height = 21
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Filtro'
          end
          object EFiltroProductosWC: TLFEdit
            Left = 625
            Top = 2
            Width = 121
            Height = 21
            TabOrder = 2
            OnChange = EFiltroProductosWCChange
          end
          object CBProductosWCSoloActivos: TLFCheckBox
            Left = 746
            Top = 2
            Width = 95
            Height = 21
            Caption = 'Solo Activos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBProductosWCSoloActivosChange
          end
          object CBProductosWCSoloNoSincronizados: TLFCheckBox
            Left = 841
            Top = 2
            Width = 142
            Height = 21
            Caption = 'Solo No Sincronizados'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBProductosWCSoloNoSincronizadosChange
          end
        end
        object DBGridFind20001: TDBGridFind2000
          Left = 0
          Top = 29
          Width = 1235
          Height = 233
          Align = alClient
          DataSource = DMSincronizacionTiendaWoocommerce.DSQMProductosWC
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGridFind20001CellClick
          OnDrawColumnCell = DBGridFind20001DrawColumnCell
          OnDblClick = DBGridFind20001DblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
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
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGridFind20001Busqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 115
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_VARIATION'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITLE'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_TYPE'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SKU'
              ReadOnly = True
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRICE'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'STOCK_QUANTITY'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CATALOG_VISIBILITY'
              ReadOnly = True
              Width = 82
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_WEIGHT'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_LENGTH'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_WIDTH'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_HEIGHT'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_UNIT'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PARENT_ID'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DATE_MODIFIED'
              ReadOnly = True
              Width = 64
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_LARGO'
              ReadOnly = True
              Width = 300
              Visible = True
            end>
        end
      end
      object TSTaxRuleGroups: TTabSheet [5]
        Caption = 'Reglas IVA'
        ImageIndex = 5
        OnShow = TSTaxRuleGroupsShow
        object TBTaxRuleGroups: TLFToolBar
          Left = 0
          Top = 0
          Width = 1235
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavTaxRuleGroups: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceTaxRuleGroup
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGTaxRuleGroups
            InsertaControl = DBGTaxRuleGroups
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLFiltroTaxRuleGroups: TLFPanel
            Left = 240
            Top = 0
            Width = 271
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            Visible = False
            object LFiltroTaxRuleGroups: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroTaxRuleGroups: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
              OnChange = EFiltroTaxRuleGroupsChange
            end
          end
        end
        object DBGTaxRuleGroups: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 240
          Align = alClient
          DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceTaxRuleGroup
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGArticuloCellClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'PAIS'
            'TIPO')
          CamposAMostrar.Strings = (
            'PAIS'
            '0'
            'TIPO'
            '1'
            'P_IVA')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'ID_A'
            'ID_ATTRIBUTE'
            'ID_ATTRIBUTES'
            'ID_PRODUCT'
            'ID_PRODUCT_ATTRIBUTE'
            'TITULO'
            'ULT_SINCRONIZACION')
          MensajeNoExiste = False
          Numericos.Strings = (
            'PAIS'
            'TIPO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_PAISES'
            'SYS_TIPO_IVA')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGTaxRuleGroupsBusqueda
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'PAIS'
            'TIPO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCRIPCION'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAIS'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_IVA'
              ReadOnly = True
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1235
          Height = 242
          DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
          Columns = <
            item
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 271
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENTE'
              Width = 50
              Visible = True
            end>
        end
      end
    end
    object PDetalle: TLFPanel
      Left = 2
      Top = 318
      Width = 1243
      Height = 320
      Align = alBottom
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 1
        Top = 1
        Width = 1241
        Height = 25
        AutoSize = True
        ButtonHeight = 25
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 232
          Height = 25
          DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceSinc
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
        object TBSep1: TToolButton
          Left = 232
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object TBSincronizarTienda: TToolButton
          Left = 240
          Top = 0
          Action = ASincronizar
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 1
        Top = 26
        Width = 1241
        Height = 293
        Align = alClient
        DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceSinc
        TabOrder = 1
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
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'ACTIVO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIPO'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ULT_SINCRONIZACION'
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
            FieldName = 'ORDEN'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            ReadOnly = True
            Width = 400
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 640
    Width = 1247
  end
  inherited CEMain: TControlEdit
    DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerce
    Left = 520
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 560
    Top = 8
  end
  inherited ALMain: TLFActionList
    Left = 600
    Top = 8
    object ASincronizar: TAction
      Category = 'Procesos'
      Caption = 'Sincronizar esta tienda'
      Hint = 'Sincroniza con esta pagina web'
      ImageIndex = 98
      ShortCut = 49235
      OnExecute = ASincronizarExecute
    end
    object ASincronizarTodas: TAction
      Category = 'Procesos'
      Caption = 'Sincronizar todas las tiendas'
      Hint = 'Sincronizar todas las tiendas'
      ImageIndex = 98
      OnExecute = ASincronizarTodasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ACrearArticulosFiltrados: TAction
      Category = 'Procesos'
      Caption = 'Subir Articulos filtrados a Woocommerce'
      Hint = 'Subir Articulos filtrados a Woocommerce'
      ImageIndex = 86
      OnExecute = ACrearArticulosFiltradosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 640
    Top = 24
  end
  object CEDetalle: TControlEdit
    DataSource = DMSincronizacionTiendaWoocommerce.DSQMConfWoocommerceSinc
    Left = 520
    Top = 40
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 560
    Top = 40
  end
end
