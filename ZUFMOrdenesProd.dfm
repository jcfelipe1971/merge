inherited ZFMOrdenesProd: TZFMOrdenesProd
  Left = 348
  Top = 236
  AutoSize = True
  Caption = 'Ordenes de Producci'#243'n'
  ClientHeight = 463
  ClientWidth = 756
  DockSite = True
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 433
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = ZDMOrdenesProd.DSQMOrdProd
        Hints.Strings = ()
        EditaControl = DBESuReferencia
        InsertaControl = DBEFPedido
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object ToolButton2: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
        Visible = False
      end
      object PNLSerie: TLFPanel
        Left = 347
        Top = 0
        Width = 245
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 0
          Top = 0
          Width = 50
          Height = 22
          Align = alLeft
          Alignment = taCenter
          AutoSize = False
          Caption = 'Serie'
          Layout = tlCenter
        end
        object EFSerie: TLFEditFind2000
          Left = 49
          Top = 0
          Width = 48
          Height = 21
          TabOrder = 0
          OnChange = EFSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitSerie: TLFDbedit
          Left = 98
          Top = 0
          Width = 144
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ZDMOrdenesProd.DSxSeries
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 403
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 744
          Height = 272
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_GES_ORDPROD_C'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO='#39'ZOF'#39
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LblRIG: TLFLabel
            Left = 79
            Top = 33
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' O.F.'
            FocusControl = DBERig
          end
          object LblEstado: TLFLabel
            Left = 81
            Top = 54
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
            FocusControl = EFEstado
          end
          object LblCliente: TLFLabel
            Left = 82
            Top = 108
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
            FocusControl = EFCliente
          end
          object LblDireccionEntrega: TLFLabel
            Left = 46
            Top = 130
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direc. Entrega'
            FocusControl = EFDirCliente
          end
          object LblMaquina: TLFLabel
            Left = 73
            Top = 86
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
            FocusControl = EFMaquina
          end
          object LblArticulo: TLFLabel
            Left = 77
            Top = 162
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            FocusControl = EFArticulo
          end
          object LblFechaEmision: TLFLabel
            Left = 493
            Top = 32
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Emisi'#243'n'
          end
          object LblFechaEntrega: TLFLabel
            Left = 492
            Top = 54
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Entrega'
          end
          object LblfechaFabricacion: TLFLabel
            Left = 508
            Top = 75
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Fab.'
          end
          object LCantidad: TLFLabel
            Left = 377
            Top = 184
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
            FocusControl = DBECantidad
          end
          object LPrecio: TLFLabel
            Left = 523
            Top = 185
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
            FocusControl = DBEPrecio
          end
          object LblGastosIniciales: TLFLabel
            Left = 470
            Top = 238
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Iniciales'
            FocusControl = DBEGastosIniciales
          end
          object LblSuReferencia: TLFLabel
            Left = 191
            Top = 31
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Referencia'
            FocusControl = DBESuReferencia
          end
          object LblZ_codigo_cliente: TLFLabel
            Left = 38
            Top = 184
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. Art. Cliente'
            FocusControl = DBEz_codigo_cliente
          end
          object LblCantGastEspeciales: TLFLabel
            Left = 31
            Top = 238
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cant. Gastos Esp'
            FocusControl = DBECantGastEspeciales
          end
          object LPedido: TLFLabel
            Left = 81
            Top = 9
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
          end
          object LLinea: TLFLabel
            Left = 232
            Top = 10
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea'
          end
          object LLineaGastosIni: TLFLabel
            Left = 38
            Top = 215
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea Gastos Ini'
          end
          object LPrecioGastosIni: TLFLabel
            Left = 251
            Top = 238
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio Gastos Ini.'
          end
          object DBERig: TLFDbedit
            Left = 118
            Top = 28
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBETitCliente: TLFDbedit
            Left = 209
            Top = 104
            Width = 277
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescCliente'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
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
          object DBETitDirec: TLFDbedit
            Left = 150
            Top = 126
            Width = 509
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescDireccionCliente'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBETitArticulo: TLFDbedit
            Left = 209
            Top = 158
            Width = 450
            Height = 21
            Color = clHighlightText
            DataField = 'TITULO'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 13
          end
          object DBETitEstado: TLFDbedit
            Left = 154
            Top = 50
            Width = 332
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescEstado'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
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
          object DBETitMaquina: TLFDbedit
            Left = 209
            Top = 82
            Width = 277
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescMaquina'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object EFCliente: TLFDBEditFind2000
            Left = 118
            Top = 104
            Width = 90
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CLIENTE'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDirCliente: TLFDBEditFind2000
            Left = 118
            Top = 126
            Width = 31
            Height = 21
            DataField = 'DIREC_ENTR'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 11
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = EFDirClienteBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFArticulo: TLFDBEditFind2000
            Left = 118
            Top = 158
            Width = 90
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFEstado: TLFDBEditFind2000
            Left = 118
            Top = 50
            Width = 35
            Height = 21
            DataField = 'ESTADO'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 4
            OnChange = EFEstadoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_ESTADO_ORDF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ESTADO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFMaquina: TLFDBEditFind2000
            Left = 118
            Top = 82
            Width = 90
            Height = 21
            DataField = 'MAQUINA'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_EMP_MAQUINAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MAQUINA'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECantidad: TLFDbedit
            Left = 422
            Top = 180
            Width = 92
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 14
          end
          object DBEPrecio: TLFDbedit
            Left = 557
            Top = 180
            Width = 102
            Height = 21
            DataField = 'PRECIO'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 15
          end
          object DBEGastosIniciales: TLFDbedit
            Left = 548
            Top = 234
            Width = 111
            Height = 21
            DataField = 'GTOS_INICIALES'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 20
          end
          object DBESuReferencia: TLFDbedit
            Left = 263
            Top = 28
            Width = 223
            Height = 21
            DataField = 'S_REFERENCIA'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 2
          end
          object DBEz_codigo_cliente: TLFDbedit
            Left = 118
            Top = 180
            Width = 254
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'z_codigo_cliente'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
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
          object DBCBPublicarWeb: TLFDBCheckBox
            Left = 562
            Top = 7
            Width = 97
            Height = 17
            Caption = 'Publicar en Web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PUBLICAR_WEB'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBECantGastEspeciales: TLFDbedit
            Left = 118
            Top = 234
            Width = 111
            Height = 21
            DataField = 'CANTIDAD_GAST_ESPECIALES'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 18
          end
          object DBEFPedido: TLFDBEditFind2000
            Left = 118
            Top = 6
            Width = 68
            Height = 21
            DataField = 'PEDIDO'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CABECERAS_PEDIDO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            CampoADevolver = 'RIG'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal, obSerie]
            Entorno = ZDMOrdenesProd.EFFiltro
          end
          object DBEFLinea: TLFDBEditFind2000
            Left = 263
            Top = 6
            Width = 70
            Height = 21
            DataField = 'LINEA'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DETALLE_PEDIDO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CampoADevolver = 'LINEA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = LineaBusqueda
            Filtros = [obEmpresa, obEjercicio, obCanal, obSerie]
            Entorno = ZDMOrdenesProd.EFFiltro
          end
          object DBEFLineaGastosIni: TLFDBEditFind2000
            Left = 118
            Top = 212
            Width = 70
            Height = 21
            DataField = 'LINEA_GTOS_INI'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 16
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DETALLE_PEDIDO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CampoADevolver = 'LINEA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = LineaGastosIniBusqueda
            Filtros = [obEmpresa, obEjercicio, obCanal, obSerie]
            Entorno = ZDMOrdenesProd.EFFiltro
          end
          object DBEFArticuloGtosIni: TLFDBEditFind2000
            Left = 189
            Top = 212
            Width = 89
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ARTICULO_GTOS_INI'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitArticuloGtosIni: TLFDbedit
            Left = 279
            Top = 212
            Width = 380
            Height = 21
            Color = clHighlightText
            DataField = 'TITULO_GTOS_INI'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 17
          end
          object DBEPrecioGtosIni: TLFDbedit
            Left = 337
            Top = 234
            Width = 111
            Height = 21
            DataField = 'PRECIO_GTOS_INI'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 19
          end
          object DBDEFechaEntrega: TLFDBDateEdit
            Left = 566
            Top = 50
            Width = 93
            Height = 21
            DataField = 'FECHA_ENTREGA'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBDEFechaFabricacion: TLFDBDateEdit
            Left = 566
            Top = 72
            Width = 93
            Height = 21
            DataField = 'FECHA_FABRICA'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DBDEFechaEmision: TLFDBDateEdit
            Left = 566
            Top = 28
            Width = 93
            Height = 21
            DataField = 'FECHA_EMISION'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
        end
        object GBDatosExpedicion: TGroupBox
          Left = 0
          Top = 272
          Width = 744
          Height = 103
          Align = alClient
          Caption = 'Datos Expedici'#243'n'
          Color = clBtnFace
          Ctl3D = True
          ParentColor = False
          ParentCtl3D = False
          TabOrder = 1
          object LblTransportista: TLFLabel
            Left = 51
            Top = 49
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
            FocusControl = EFTransportista
          end
          object LblFechaEnvio: TLFLabel
            Left = 52
            Top = 28
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Envio'
          end
          object LNumExpedicion: TLFLabel
            Left = 224
            Top = 27
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. Expedici'#243'n'
            FocusControl = DBENumExpedicion
          end
          object EFTransportista: TLFDBEditFind2000
            Left = 116
            Top = 46
            Width = 92
            Height = 21
            DataField = 'TRANSPORTISTA'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 2
            OnChange = EFTransportistaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitTransportista: TLFDbedit
            Left = 209
            Top = 46
            Width = 379
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescTransportista'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBENumExpedicion: TLFDbedit
            Left = 308
            Top = 24
            Width = 280
            Height = 21
            DataField = 'Z_NUM_EXPED'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 1
          end
          object DBDEFechaEnvio: TLFDBDateEdit
            Left = 116
            Top = 24
            Width = 93
            Height = 21
            DataField = 'FECHA_ENVIO'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 744
          Height = 353
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBMemoNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 744
            Height = 353
            Align = alClient
            DataField = 'NOTAS'
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            TabOrder = 0
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 744
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 392
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object DBRigNotas: TLFDbedit
              Left = 1
              Top = 0
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = ZDMOrdenesProd.DSQMOrdProd
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBArtDescNotas: TLFDbedit
              Left = 123
              Top = 0
              Width = 265
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = ZDMOrdenesProd.DSQMOrdProd
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 392
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 400
            Top = 0
            Width = 80
            Height = 22
            DataSource = ZDMOrdenesProd.DSQMOrdProd
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 375
          DataSource = ZDMOrdenesProd.DSQMOrdProd
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'ARTICULO_GTOS_INI'
            'CANTIDAD'
            'CANTIDAD_GAST_ESPECIALES'
            'CLIENTE'
            'DESC_GTOS_INI'
            'DIREC_ENTR'
            'ESTADO'
            'FECHA_EMISION'
            'FECHA_ENTREGA'
            'FECHA_ENVIO'
            'FECHA_FABRICA'
            'GTOS_INICIALES'
            'LINEA'
            'LINEA_GTOS_INI'
            'MAQUINA'
            'PEDIDO'
            'PRECIO'
            'PRECIO_GTOS_INI'
            'PUBLICAR_WEB'
            'RIG'
            'S_REFERENCIA'
            'TERCERO'
            'TIPO'
            'TIPODOC'
            'TITULO'
            'TITULO_GTOS_INI'
            'TRANSPORTISTA'
            'Z_NUM_EXPED')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIREC_ENTR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'S_REFERENCIA'
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
              FieldName = 'TITULO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_EMISION'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FABRICA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GTOS_INICIALES'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_GTOS_INI'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENVIO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Z_NUM_EXPED'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRANSPORTISTA'
              Width = 65
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 439
    Width = 756
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 340
    Top = 104
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 404
    Top = 100
  end
  inherited ALMain: TLFActionList
    Top = 64
    object AListados: TAction
      Category = 'Listados'
      Caption = 'Listado Orden'
      ImageIndex = 14
      OnExecute = AListadosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNotas
    Complementario = TBMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 317
    Top = 90
  end
  object CENotasPMEdit: TPopUpTeclas
    Left = 620
    Top = 48
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ActionList1: TActionList
    Left = 512
    Top = 92
  end
end
