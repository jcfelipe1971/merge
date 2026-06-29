inherited FMSincronizacionTienda: TFMSincronizacionTienda
  Left = 229
  Top = 134
  Width = 1257
  Height = 687
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion Tienda PrestaShop'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1247
    Height = 634
    inherited TBMain: TLFToolBar
      Width = 1243
      inherited NavMain: THYMNavigator
        DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 37
        DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 265
      end
      inherited TbuttComp: TToolButton
        Left = 273
        Action = ASincronizar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1243
      Height = 604
      inherited TSFicha: TTabSheet
        object SBAWeb: TSpeedButton [0]
          Left = 10
          Top = 194
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAWebDblClick
        end
        object SBAWebBackoffice: TSpeedButton [1]
          Left = 10
          Top = 194
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAWebBackofficeDblClick
        end
        inherited PEdit: TLFPanel
          Width = 673
          Height = 576
          Align = alLeft
          inherited G2KTableLoc: TG2KTBLoc
            Left = 88
            Top = 34
          end
          object PNLConfiguracion: TLFPanel
            Left = 0
            Top = 0
            Width = 681
            Height = 576
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object LWSUrl: TLFLabel
              Left = 2
              Top = 332
              Width = 82
              Height = 13
              Alignment = taRightJustify
              Caption = 'URL Webservice'
            end
            object LWSToken: TLFLabel
              Left = 52
              Top = 354
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Token'
            end
            object LWSIdioma: TLFLabel
              Left = 53
              Top = 377
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Idioma'
            end
            object LWebBackoffice: TLFLabel
              Left = 33
              Top = 47
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Backoffice'
            end
            object LWeb: TLFLabel
              Left = 61
              Top = 25
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Web'
            end
            object LVersionPrestashop: TLFLabel
              Left = 31
              Top = 398
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Version PS'
            end
            object LTienaArticulos: TLFLabel
              Left = 168
              Top = 267
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tienda Art.'
            end
            object LTarifa: TLFLabel
              Left = 57
              Top = 223
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tarifa'
            end
            object LSerie: TLFLabel
              Left = 60
              Top = 113
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LRecursos: TLFLabel
              Left = 39
              Top = 421
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Recursos'
            end
            object LPrefijoArticulo: TLFLabel
              Left = 36
              Top = 268
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'Prefijo Art.'
            end
            object LNombreFicha: TLFLabel
              Left = 47
              Top = 3
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre'
            end
            object LEmpresa: TLFLabel
              Left = 43
              Top = 69
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Empresa'
            end
            object LClienteBase: TLFLabel
              Left = 25
              Top = 135
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente Base'
            end
            object LCanal: TLFLabel
              Left = 57
              Top = 91
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Canal'
            end
            object LAlmacen: TLFLabel
              Left = 43
              Top = 179
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Almacen'
            end
            object LAgente: TLFLabel
              Left = 50
              Top = 201
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Agente'
            end
            object LCuentaCliente: TLFLabel
              Left = 15
              Top = 157
              Width = 69
              Height = 13
              Hint = 'Forzar esta cuenta contable al crear clientes nuevo.'
              Alignment = taRightJustify
              Caption = 'Cuenta Cliente'
            end
            object LDSNMySQL: TLFLabel
              Left = 22
              Top = 542
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'DSN MySQL'
            end
            object LUsuarioWarnigns: TLFLabel
              Left = 13
              Top = 310
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Usuario Alertas'
            end
            object LFamiliaPacks: TLFLabel
              Left = 19
              Top = 288
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Familia Packs'
            end
            object LArticuloDescuento: TLFLabel
              Left = 40
              Top = 245
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Art. Desc'
            end
            object ETituloTarifa: TLFEdit
              Left = 148
              Top = 220
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
              TabOrder = 18
            end
            object CBSincronizacionActiva: TLFDBCheckBox
              Left = 426
              Top = 307
              Width = 235
              Height = 17
              Caption = 'Sincronizacion Activa'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 35
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CBSincronizacionActivaChange
              DataField = 'ACTIVO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CBUtilizaModuloPaypal: TLFDBCheckBox
              Left = 426
              Top = 349
              Width = 235
              Height = 17
              Caption = 'Utiliza Modulo Paypal'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 37
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'UTILIZA_MODULO_PAYPAL'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBControlStockDesactivado: TLFDBCheckBox
              Left = 426
              Top = 370
              Width = 235
              Height = 31
              Hint = 'Importa articulos con Control de Stock **desactivado**'
              Caption = 'Importa articulos con Control de Stock **desactivado**'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 38
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ART_SIN_CONTROL_STOCK'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBMantenerDescripciones: TLFDBCheckBox
              Left = 426
              Top = 433
              Width = 235
              Height = 31
              Caption = 'Mantener descripciones de articulos aunque cambien en Prestashop'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 40
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'MANTENER_DESCRIPCIONES'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBMantenerPrecio: TLFDBCheckBox
              Left = 426
              Top = 465
              Width = 235
              Height = 31
              Caption = 'Mantener precio de articulos aunque cambien en Prestashop'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 41
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'MANTENER_PRECIO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBSoloClientesConPedido: TLFDBCheckBox
              Left = 426
              Top = 328
              Width = 235
              Height = 17
              Caption = 'Solo clientes con pedidos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 36
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'SOLO_CLIENTE_CON_PEDIDO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBUtilizaReferenciaPrestashop: TLFDBCheckBox
              Left = 426
              Top = 401
              Width = 235
              Height = 31
              Caption = 
                'Utiliza Referencia de articulo como codigo de articulo de la apl' +
                'icacion'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 39
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'UTILIZA_REF_PRESTAHOP'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBWSIdioma: TRxDBComboBox
              Left = 88
              Top = 373
              Width = 257
              Height = 21
              DataField = 'WS_LANGUAGE'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ItemHeight = 13
              TabOrder = 30
            end
            object DBEClienteBase: TLFDBEditFind2000
              Left = 88
              Top = 132
              Width = 59
              Height = 21
              DataField = 'CLIENTE_BASE'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 9
              OnChange = DBEClienteBaseChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              CampoADevolver = 'CLIENTE'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'CLIENTE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFAgente: TLFDBEditFind2000
              Left = 88
              Top = 198
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'AGENTE'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 15
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
            object DBEFAlmacen: TLFDBEditFind2000
              Left = 88
              Top = 176
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ALMACEN'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 13
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
            object DBEFCanal: TLFDBEditFind2000
              Left = 88
              Top = 88
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'CANAL'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 5
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
            object DBEFEmpresa: TLFDBEditFind2000
              Left = 88
              Top = 66
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'EMPRESA'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 3
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
            object DBEFSerie: TLFDBEditFind2000
              Left = 88
              Top = 110
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'SERIE'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
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
            object DBEFTarifa: TLFDBEditFind2000
              Left = 88
              Top = 220
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'TARIFA'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 17
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
            object DBEFTienaArticulos: TLFDBEditFind2000
              Left = 224
              Top = 264
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ID_TIENDA_ARTICULOS'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 22
              OnChange = DBEFTienaArticulosChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'SYS_CONF_PRESTASHOP'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ID'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'ID')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEPrefijoArticulo: TLFDbedit
              Left = 88
              Top = 264
              Width = 59
              Height = 21
              DataField = 'PREFIJO_ART'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 21
            end
            object DBETitulo: TLFDbedit
              Left = 88
              Top = 0
              Width = 573
              Height = 21
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 0
            end
            object DBEToken: TLFDbedit
              Left = 88
              Top = 351
              Width = 300
              Height = 21
              DataField = 'WS_KEY'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              PasswordChar = '*'
              TabOrder = 29
              OnExit = DBETokenExit
            end
            object DBEVersionPrestashop: TLFDbedit
              Left = 88
              Top = 395
              Width = 105
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'VERSION_PRESTASHOP'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              ReadOnly = True
              TabOrder = 32
            end
            object DBEWeb: TLFDbedit
              Left = 88
              Top = 22
              Width = 573
              Height = 21
              Color = clAqua
              DataField = 'WEB'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 1
            end
            object DBEWebBackoffice: TLFDbedit
              Left = 88
              Top = 44
              Width = 573
              Height = 21
              Color = clAqua
              DataField = 'WEB_BACKOFFICE'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 2
            end
            object DBEWSIdioma: TLFDbedit
              Left = 346
              Top = 373
              Width = 42
              Height = 21
              DataField = 'WS_LANGUAGE'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 31
              OnExit = DBEWSUrlExit
            end
            object DBEWSUrl: TLFDbedit
              Left = 88
              Top = 329
              Width = 300
              Height = 21
              DataField = 'WS_URL'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 28
              OnChange = DBEWSUrlChange
              OnExit = DBEWSUrlExit
            end
            object ETienaArticulos: TLFEdit
              Left = 284
              Top = 264
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
              TabOrder = 23
            end
            object ETituloAgente: TLFEdit
              Left = 148
              Top = 198
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
              TabOrder = 16
            end
            object ETituloAlmacen: TLFEdit
              Left = 148
              Top = 176
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
              TabOrder = 14
            end
            object ETituloCanal: TLFEdit
              Left = 148
              Top = 88
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
              TabOrder = 6
            end
            object ETituloClienteBase: TLFEdit
              Left = 148
              Top = 132
              Width = 513
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
            end
            object ETituloEmpresa: TLFEdit
              Left = 148
              Top = 66
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
              TabOrder = 4
            end
            object ETituloSerie: TLFEdit
              Left = 148
              Top = 110
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
              TabOrder = 8
            end
            object MRecursos: TLFMemo
              Left = 88
              Top = 417
              Width = 300
              Height = 121
              Color = clInfoBk
              Lines.Strings = (
                'Recursos')
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 33
            end
            object DBEFCuentaCliente: TLFDBEditFind2000
              Left = 88
              Top = 154
              Width = 97
              Height = 21
              DataField = 'CUENTA_CLIENTE'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 11
              OnChange = DBEClienteBaseChange
              OnKeyDown = DBEFCuentaClienteKeyDown
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'CON_CUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CUENTA'
              CampoStr = 'TITULO'
              CampoADevolver = 'CUENTA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ECuentaCliente: TLFEdit
              Left = 186
              Top = 154
              Width = 475
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 12
            end
            object DBCBImportarArticulosVarios: TLFDBCheckBox
              Left = 426
              Top = 497
              Width = 235
              Height = 31
              Caption = 'Importar articulos desconocidos como "Articulos Varios".'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 42
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'IMPORTAR_ARTICULOS_VARIOS'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEDSNMySQL: TLFDbedit
              Left = 88
              Top = 539
              Width = 300
              Height = 21
              DataField = 'DSN_MYSQL'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 34
              OnChange = DBEDSNMySQLChange
              OnExit = DBEDSNMySQLExit
            end
            object DBCBUtilizaModuloMegaproduct: TLFDBCheckBox
              Left = 426
              Top = 529
              Width = 235
              Height = 17
              Caption = 'Utiliza Modulo Megaproduct'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 43
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'UTILIZA_MODULO_MEGAPRODUCT'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object EUsuarioWarnigns: TLFEdit
              Left = 148
              Top = 307
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
              TabOrder = 27
            end
            object DBEFFamiliaPacks: TLFDBEditFind2000
              Left = 88
              Top = 285
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'FAMILIA_PACK'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 24
              OnChange = DBEFFamiliaPacksChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'FAMILIA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFFamiliaPacksBusqueda
              OrdenadoPor.Strings = (
                'FAMILIA')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFUsuarioWarnigns: TLFDBEditFind2000
              Left = 88
              Top = 307
              Width = 59
              Height = 21
              CharCase = ecUpperCase
              DataField = 'USUARIO_WARNINGS'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 26
              OnChange = DBEFUsuarioWarnignsChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'SYS_USUARIOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'USUARIO'
              CampoStr = 'NOMBRE'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'USUARIO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFamiliaPacks: TLFEdit
              Left = 148
              Top = 285
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
            object DBEFArticuloDescuento: TLFDBEditFind2000
              Left = 88
              Top = 242
              Width = 97
              Height = 21
              CharCase = ecUpperCase
              DataField = 'ARTICULO_DESCUENTO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              TabOrder = 19
              OnChange = DBEFArticuloDescuentoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = True
              Tabla_a_buscar = 'VER_ARTICULOS_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ARTICULO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFArticuloDescuentoBusqueda
              OrdenadoPor.Strings = (
                'ARTICULO')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object EArticuloDescuento: TLFEdit
              Left = 186
              Top = 242
              Width = 475
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 20
            end
          end
        end
        object PNLSincronizacion: TLFPanel
          Left = 673
          Top = 0
          Width = 562
          Height = 576
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBSincronizacion: TLFToolBar
            Left = 0
            Top = 0
            Width = 562
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
            object NavSincronizacion: THYMNavigator
              Left = 0
              Top = 0
              Width = 232
              Height = 25
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShopSinc
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
          object DBGFSincronizacion: TDBGridFind2000
            Left = 0
            Top = 25
            Width = 562
            Height = 551
            Align = alClient
            DataSource = DMSincronizacionTienda.DSQMConfPrestaShopSinc
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
            AutoPostEnCheckBox = True
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
                Width = 35
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
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN'
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 290
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1235
          Height = 545
          DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
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
      object TSClientes: TTabSheet
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
          object PNLInfoClientes: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEInfoClientesTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavCliente: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMConfPrestaShopCliente
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
            Left = 590
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
          Height = 523
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMConfPrestaShopCliente
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
      object TSDirecciones: TTabSheet
        Caption = 'Direcciones'
        ImageIndex = 3
        object DBGDireccion: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 523
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMConfPrestaShopClienteDir
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
          object PNLInfoDirecciones: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEInfoDireccionesTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavDireccion: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMConfPrestaShopClienteDir
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
            Left = 590
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
      object TSArticulos: TTabSheet
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
          object PNLInfoClientes1: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            TabOrder = 2
            object DBEInfoArticulosTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavArticulo: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMConfPrestaShopArticulo
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
            Left = 590
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
              Width = 232
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
          Height = 554
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMConfPrestaShopArticulo
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
          ColumnasCheckBoxes.Strings = (
            'IS_PACK')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
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
              FieldName = 'ID_PRODUCT_ATTRIBUTE'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_ATTRIBUTE'
              ReadOnly = True
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_ATTRIBUTES'
              ReadOnly = True
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
              Width = 122
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REFERENCIA'
              ReadOnly = True
              Width = 122
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IS_PACK'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'STOCK'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 300
              Visible = True
            end>
        end
      end
      object TSTaxRuleGroups: TTabSheet
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
          object PNLInfoReglasIVA: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEInfoReglasIVATitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavTaxRuleGroups: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMConfPrestaShopTaxRuleGroup
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
            Left = 590
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
          Height = 523
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMConfPrestaShopTaxRuleGroup
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
      object TSProductosPS: TTabSheet
        Caption = 'Productos PS'
        ImageIndex = 6
        OnShow = TSProductosPSShow
        object TBProductosPS: TLFToolBar
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
          object PNLInfoProductos: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEInfoProductosTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavProductosPS: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMProductosPS
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGProductosPS
            InsertaControl = DBGProductosPS
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLProductosPS: TLFPanel
            Left = 590
            Top = 0
            Width = 505
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFiltroProductosPS: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroProductosPS: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
              OnChange = EFiltroProductosPSChange
            end
            object CBProductosPSSoloActivos: TLFCheckBox
              Left = 279
              Top = 3
              Width = 90
              Height = 17
              Caption = 'Solo Activos'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              OnChange = EFiltroProductosPSChange
            end
            object CBProductosPSSoloNoSincronizados: TLFCheckBox
              Left = 370
              Top = 3
              Width = 135
              Height = 17
              Caption = 'Solo No Sincronizados'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              OnChange = EFiltroProductosPSChange
            end
          end
        end
        object DBGProductosPS: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 554
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMProductosPS
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
            'DATE_UPD'
            'EAN13'
            'ID_CATEGORY_DEFAULT'
            'ID_MANUFACTURER'
            'ID_PRODUCT'
            'ID_PRODUCT_ATTRIBUTE'
            'ID_SUPPLIER'
            'ID_STOCK_AVAILABLE'
            'ISBN'
            'PRICE'
            'PRODUCT_ACTIVE'
            'PRODUCT_NAME'
            'REFERENCE'
            'STOCK'
            'SUPPLIER_REFERENCE'
            'UPC'
            'WEIGHT'
            'TITULO_LARGO')
          ColumnasCheckBoxes.Strings = (
            'PRODUCT_ACTIVE'
            'IS_PACK')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
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
              FieldName = 'ARTICULO'
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_ATTRIBUTES'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT_ATTRIBUTE'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REFERENCE'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_NAME'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IS_PACK'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EAN13'
              ReadOnly = True
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UPC'
              ReadOnly = True
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ISBN'
              ReadOnly = True
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DATE_UPD'
              ReadOnly = True
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
              FieldName = 'WEIGHT'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_ACTIVE'
              ReadOnly = True
              Width = 70
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
              FieldName = 'ID_MANUFACTURER'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_SUPPLIER'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_CATEGORY_DEFAULT'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SUPPLIER_REFERENCE'
              ReadOnly = True
              Width = 150
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_TAX_RULES_GROUP'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_STOCK_AVAILABLE'
              ReadOnly = True
              Width = 70
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
      object TSCategories: TTabSheet
        Caption = 'Categorias PS'
        ImageIndex = 11
        object TBCategories: TLFToolBar
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
          object PNLInfoCategories: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEInfoCategoriasTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavCategorias: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMCategory
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGProductosPS
            InsertaControl = DBGProductosPS
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLFiltroCategorias: TLFPanel
            Left = 590
            Top = 0
            Width = 505
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFiltroCategories: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroCategoriasPS: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
              OnChange = EFiltroCategoriasPSChange
            end
            object CBCategoriasPSSoloActivos: TLFCheckBox
              Left = 279
              Top = 3
              Width = 90
              Height = 17
              Caption = 'Solo Activos'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              OnChange = EFiltroCategoriasPSChange
            end
            object CBCategoriasPSSoloNoSincronizados: TLFCheckBox
              Left = 370
              Top = 3
              Width = 135
              Height = 17
              Caption = 'Solo No Sincronizados'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              OnChange = EFiltroCategoriasPSChange
            end
          end
        end
        object DBGCategoriasPS: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 554
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMCategory
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCategoriasPSCellClick
          OnDrawColumnCell = DBGCategoriasPSDrawColumnCell
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
            'FAMILIA'
            'SUBFAMILIA')
          CamposAMostrar.Strings = (
            'FAMILIA'
            '0'
            'SUBFAMILIA'
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
            'CATEGORY_ACTIVE'
            'CATEGORY_POSITION'
            'FAMILIA'
            'ID_CATEGORY'
            'ID_PARENT'
            'ID_SHOP_DEFAULT'
            'ID_SUBFAMILIA'
            'IS_ROOT_CATEGORY'
            'NAME'
            'SUBFAMILIA'
            'TITULO_FAMILIA'
            'TITULO_SUBFAMILIA'
            'DATE_ADD'
            'DATE_UPD')
          ColumnasCheckBoxes.Strings = (
            'CATEGORY_ACTIVE'
            'IS_ROOT_CATEGORY')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'FAMILIA'
            'SUBFAMILIA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_FAMILIAS'
            'ART_SUBFAMILIAS')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGCategoriasPSBusqueda
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'FAMILIA'
            'SUBFAMILIA')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_FAMILIA'
              ReadOnly = True
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBFAMILIA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_SUBFAMILIA'
              ReadOnly = True
              Width = 150
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_CATEGORY'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PARENT'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CATEGORY_ACTIVE'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_SHOP_DEFAULT'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IS_ROOT_CATEGORY'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CATEGORY_POSITION'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DATE_ADD'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DATE_UPD'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NAME'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCRIPTION'
              ReadOnly = True
              Width = 300
              Visible = True
            end>
        end
      end
      object TSPack: TTabSheet
        Caption = 'Packs'
        ImageIndex = 10
        object TBPack: TLFToolBar
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
          object PNLPackInfo: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBEPackTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavPack: THYMNavigator
            Left = 350
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMPacks
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGPacks
            InsertaControl = DBGPacks
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGPacks: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 554
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMPacks
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
            'DATE_UPD'
            'EAN13'
            'ID_CATEGORY_DEFAULT'
            'ID_MANUFACTURER'
            'ID_PRODUCT'
            'ID_PRODUCT_ATTRIBUTE'
            'ID_SUPPLIER'
            'ID_STOCK_AVAILABLE'
            'ISBN'
            'PRICE'
            'PRODUCT_ACTIVE'
            'PRODUCT_NAME'
            'REFERENCE'
            'STOCK'
            'SUPPLIER_REFERENCE'
            'UPC'
            'WEIGHT'
            'TITULO_LARGO')
          ColumnasCheckBoxes.Strings = (
            'PRODUCT_ACTIVE'
            'IS_PACK')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
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
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ARTICULO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT_PACK'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REFERENCE_PACK'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_NAME_PACK'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT_ITEM'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT_ATTRIBUTE_ITEM'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REFERENCE_ITEM'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_NAME_ITEM'
              ReadOnly = True
              Width = 300
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'QUANTITY'
              ReadOnly = True
              Width = 70
              Visible = True
            end>
        end
      end
      object TSOrdersPS: TTabSheet
        Caption = 'Orders PS'
        ImageIndex = 7
        object TBOrdersPS: TLFToolBar
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
          object PNLInfoOrders: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEInfoOrdersTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavOrdersPS: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMOrdersPS
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGOrdersPS
            InsertaControl = DBGOrdersPS
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object LFPanel1: TLFPanel
            Left = 590
            Top = 0
            Width = 425
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFLabel1: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroOrdersPS: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
              OnChange = EFiltroOrdersPSChange
            end
            object CBOrdersSoloNoSincrinizado: TLFCheckBox
              Left = 282
              Top = 3
              Width = 135
              Height = 17
              Caption = 'Solo No Sincronizados'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              OnChange = EFiltroOrdersPSChange
            end
          end
        end
        object DBGOrdersPS: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 523
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMOrdersPS
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGOrdersPSCellClick
          OnDrawColumnCell = DBGOrdersPSDrawColumnCell
          OnDblClick = DBGOrdersPSDblClick
          OnKeyUp = DBGOrdersPSKeyUp
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
            'DATE_UPD'
            'EAN13'
            'ID_CATEGORY_DEFAULT'
            'ID_MANUFACTURER'
            'ID_PRODUCT'
            'ID_PRODUCT_ATTRIBUTE'
            'ID_SUPPLIER'
            'ID_STOCK_AVAILABLE'
            'ISBN'
            'PRICE'
            'PRODUCT_ACTIVE'
            'PRODUCT_NAME'
            'REFERENCE'
            'STOCK'
            'SUPPLIER_REFERENCE'
            'UPC'
            'WEIGHT'
            'TITULO_LARGO')
          ColumnasCheckBoxes.Strings = (
            'PRODUCT_ACTIVE'
            'ID_STOCK_AVAILABLE')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
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
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ARTICULO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_ORDER'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CURRENT_STATE'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CURRENT_STATE_DESCRIPCION'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DATE_ADD'
              ReadOnly = True
              Width = 62
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DATE_UPD'
              ReadOnly = True
              Width = 62
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'INVOICE_NUMBER'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'INVOICE_DATE'
              ReadOnly = True
              Width = 62
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DELIVERY_NUMBER'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DELIVERY_DATE'
              ReadOnly = True
              Width = 62
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REFERENCE'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_ADDRESS_DELIVERY'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_ADDRESS_INVOICE'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_CUSTOMER'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_CARRIER'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MODULE'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SHIPPING_NUMBER'
              ReadOnly = True
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PAYMENT'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_DISCOUNTS'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_PAID'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_PAID_TAX_INCL'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_PAID_TAX_EXCL'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_SHIPPING'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CARRIER_TAX_RATE'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EJERCICIO'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIG'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CLIENTE'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_BASES'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_CUOTA_IVA'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'S_CUOTA_RE'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDO'
              ReadOnly = True
              Width = 55
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTADO'
              ReadOnly = True
              Width = 38
              Visible = True
            end>
        end
      end
      object TSOrderStates: TTabSheet
        Caption = 'OrderS tates'
        ImageIndex = 8
        object DBGOrderStates: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 523
          Align = alClient
          DataSource = DMSincronizacionTienda.DSQMOrdersStatesPS
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGOrderStatesDrawColumnCell
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
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'DELETED'
            'DELIVERY'
            'HIDDEN'
            'INVOICE'
            'LOGABLE'
            'PAID'
            'PDF_DELIVERY'
            'PDF_INVOICE'
            'SEND_EMAIL'
            'SHIPPED'
            'SINCRONIZAR_FAC'
            'SINCRONIZAR_MOV'
            'SINCRONIZAR_PEC'
            'UNREMOVABLE'
            'TRASPASAR_FAC')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'PAIS'
            'TIPO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'SINCRONIZAR_PEC'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SINCRONIZAR_FAC'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SINCRONIZAR_MOV'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR_FAC'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTUALIZAR_ESTADO_PS'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID'
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNREMOVABLE'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DELETED'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'HIDDEN'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COLOR_HEX'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DELIVERY'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'INVOICE'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SHIPPED'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PAID'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LOGABLE'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SEND_EMAIL'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PDF_DELIVERY'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PDF_INVOICE'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MOD_NAME'
              Width = 100
              Visible = True
            end>
        end
        object TBOrderStates: TLFToolBar
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
          object PNLInfoOrderStates: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEInfoOrderStatesTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavOrderStates: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSQMOrdersStatesPS
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGOrderStates
            InsertaControl = DBGOrderStates
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLOrderStates: TLFPanel
            Left = 590
            Top = 0
            Width = 271
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFiltroOrderStates: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EOrderStates: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
            end
          end
        end
      end
      object TSStockAvailable: TTabSheet
        Caption = 'Stock Prestashop'
        ImageIndex = 9
        object TBStockAvailable: TLFToolBar
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
          object PNLStockAvailable: TLFPanel
            Left = 0
            Top = 0
            Width = 350
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 2
            object DBEStockAvailableTitulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
              Enabled = False
              TabOrder = 0
            end
          end
          object NavStockAvailable: THYMNavigator
            Left = 350
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMSincronizacionTienda.DSxStockAvailable
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGStockAvailable
            InsertaControl = DBGStockAvailable
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLStockAvailable1: TLFPanel
            Left = 590
            Top = 0
            Width = 505
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LFLabel2: TLFLabel
              Left = 13
              Top = 3
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Filtro'
            end
            object EFiltroStockAvailable: TLFEdit
              Left = 40
              Top = 0
              Width = 232
              Height = 21
              TabOrder = 0
              OnChange = CBSoloActivosStockAvailableChange
            end
            object CBSoloActivosStockAvailable: TLFCheckBox
              Left = 279
              Top = 3
              Width = 90
              Height = 17
              Caption = 'Solo Activos'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CBSoloActivosStockAvailableChange
            end
            object CBSoloSincronizadosStockAvailable: TLFCheckBox
              Left = 370
              Top = 3
              Width = 135
              Height = 17
              Caption = 'Solo Sincronizados'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CBSoloActivosStockAvailableChange
            end
          end
        end
        object DBGStockAvailable: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1235
          Height = 554
          Align = alClient
          DataSource = DMSincronizacionTienda.DSxStockAvailable
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGStockAvailableCellClick
          OnDrawColumnCell = DBGStockAvailableDrawColumnCell
          OnDblClick = DBGStockAvailableDblClick
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
          CamposAMostrarAnchos.Strings = (
            '0')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'EAN13'
            'ID_PRODUCT'
            'ID_PRODUCT_ATTRIBUTE'
            'LOCATION'
            'OUT_OF_STOCK'
            'QUANTITY'
            'REFERENCE'
            'ULT_SINCRONIZACION')
          ColumnasCheckBoxes.Strings = (
            'PRODUCT_ACTIVE')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ARTICULO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_STOCK_AVAILABLE'
              ReadOnly = True
              Width = 63
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_PRODUCT_ATTRIBUTE'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_ACTIVE'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REFERENCE'
              ReadOnly = True
              Width = 94
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'EAN13'
              ReadOnly = True
              Width = 94
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCT_NAME'
              ReadOnly = True
              Width = 250
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'QUANTITY'
              ReadOnly = True
              Width = 76
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'STOCK'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PEDIDOS_D_CLI'
              ReadOnly = True
              Width = 76
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'STOCK_REAL'
              ReadOnly = True
              Width = 76
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_SHOP'
              ReadOnly = True
              Width = 73
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_SHOP_GROUP'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DEPENDS_ON_STOCK'
              ReadOnly = True
              Width = 73
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'OUT_OF_STOCK'
              ReadOnly = True
              Width = 73
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LOCATION'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ULT_SINCRONIZACION'
              ReadOnly = True
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 634
    Width = 1247
  end
  inherited CEMain: TControlEdit
    DataSource = DMSincronizacionTienda.DSQMConfPrestaShop
    Left = 520
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 552
    Top = 0
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 712
    Top = 0
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
      Caption = 'Subir Articulos filtrados a Prestashop'
      Hint = 'Subir Articulos filtrados a Prestashop.'#13#10'Solo los marcados WEB.'
      ImageIndex = 86
      OnExecute = ACrearArticulosFiltradosExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 744
    Top = 0
  end
  object CEDetalle: TControlEdit
    DataSource = DMSincronizacionTienda.DSQMConfPrestaShopSinc
    Left = 600
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 632
  end
end
