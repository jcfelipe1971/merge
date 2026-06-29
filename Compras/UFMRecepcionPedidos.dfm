inherited FMRecepcionPedidos: TFMRecepcionPedidos
  Left = 224
  Top = 154
  Width = 1502
  Height = 537
  HelpContext = 177
  ActiveControl = EFSerie
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recepci'#243'n de Pedidos de Proveedores'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1492
    Height = 484
    inherited TBMain: TLFToolBar
      Width = 1488
      TabOrder = 2
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      object TButtSep5: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRegenera: TToolButton
        Left = 33
        Top = 0
        Hint = 'Genera o Regenera la tabla de Recepci'#243'n de Pedidos'
        Caption = 'Regenera'
        ImageIndex = 26
        OnClick = TButtRegeneraClick
      end
      object TButtLineasServidas: TToolButton
        Left = 56
        Top = 0
        Hint = 'Muestra todas las l'#237'neas de pedidos'
        ImageIndex = 23
        OnClick = TButtLineasServidasClick
      end
      object TButtLineasNoServidas: TToolButton
        Left = 79
        Top = 0
        Hint = 'Muestra las l'#237'neas no servidas de pedidos'
        ImageIndex = 22
        OnClick = TButtLineasNoServidasClick
      end
      object TButtServir: TToolButton
        Left = 102
        Top = 0
        Hint = 'Servir los pedidos marcados'
        ImageIndex = 42
        OnClick = TButtServirClick
      end
      object TButtMarcarTodas: TToolButton
        Left = 125
        Top = 0
        Hint = 'Marcar como servidas todas las l'#237'neas'
        ImageIndex = 118
        OnClick = TButtMarcarTodasClick
      end
      object TButtRecibirTodasunidadeslinea: TToolButton
        Left = 148
        Top = 0
        Hint = 'Recibir todas las unidades de la l'#237'nea'
        ImageIndex = 43
        OnClick = TButtRecibirTodasunidadeslineaClick
      end
      object TButtRecibirTodasunidadesTodos: TToolButton
        Left = 171
        Top = 0
        Hint = 'Recibir todas las unidades de todas las l'#237'neas'
        ImageIndex = 51
        OnClick = TButtRecibirTodasunidadesTodosClick
      end
      object TButtInicializarTodas: TToolButton
        Left = 194
        Top = 0
        Hint = 'Inicializar todas las unidades a recibir en todas las l'#237'neas'
        Caption = 'Inicializar Todas'
        ImageIndex = 39
        OnClick = TButtInicializarTodasClick
      end
      object TButtMarcarTodasProc: TToolButton
        Left = 217
        Top = 0
        Hint = 'Marcar como procesadas todas las l'#237'neas'
        ImageIndex = 94
        OnClick = TButtMarcarTodasProcClick
      end
      object ToolButton3: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImportarCSV: TToolButton
        Left = 248
        Top = 0
        Hint = 'Importar fichero CSV'
        Caption = 'Importar CSV'
        ImageIndex = 49
        OnClick = TButtImportarCSVClick
      end
      object TButtSep1: TToolButton
        Left = 271
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCerrarYMarcarPedido: TToolButton
        Left = 279
        Top = 0
        Hint = 'Generar Albar'#225'n'
        ImageIndex = 60
        OnClick = TButtCerrarYMarcarPedidoClick
      end
      object TButtGenerarFactura: TToolButton
        Left = 302
        Top = 0
        Hint = 'Generar Factura'
        ImageIndex = 61
        OnClick = TButtGenerarFacturaClick
      end
      object TButtMultiLotes: TToolButton
        Left = 325
        Top = 0
        Hint = 'Configurar lotes a traspasar'
        ImageIndex = 120
        OnClick = TButtMultiLotesClick
      end
      object TButtSep6: TToolButton
        Left = 348
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtAsignacionCodigoBarra: TToolButton
        Left = 356
        Top = 0
        Action = AAsignacionCodigoBarra
      end
      object TB1: TToolButton
        Left = 379
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImportarExcel: TToolButton
        Left = 387
        Top = 0
        Action = AImportarExcel
        DropdownMenu = pmImportar
        Style = tbsDropDown
      end
      object PNLLineasProc: TLFPanel
        Left = 423
        Top = 0
        Width = 141
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LLineasProc: TLFLabel
          Left = 5
          Top = 3
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = '&L'#237'neas a proc.'
          FocusControl = EFProveedor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EdLineasAProc: TLFEdit
          Left = 93
          Top = 0
          Width = 44
          Height = 21
          TabOrder = 0
          OnChange = EdLineasAProcChange
        end
      end
      object PNLMarcarServido: TLFPanel
        Left = 564
        Top = 0
        Width = 145
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object CBMarcarServido: TLFCheckBox
          Left = 9
          Top = 2
          Width = 136
          Height = 17
          Hint = 'Marcar Servido la parte que queda pendiente del pedido'
          Caption = '&Marcar Servido'
          ClicksDisabled = False
          ColorCheck = 57088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object PNLSepararPedidos: TLFPanel
        Left = 709
        Top = 0
        Width = 160
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object CBSeparaPedidos: TLFCheckBox
          Left = 9
          Top = 2
          Width = 144
          Height = 17
          Caption = '&Separar pedidos'
          ClicksDisabled = False
          ColorCheck = 57088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 28
      Width = 1488
      Height = 113
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object SBAProveedor: TSpeedButton
        Left = 150
        Top = 25
        Width = 240
        Height = 21
        GroupIndex = -1
        Flat = True
        OnDblClick = SBAProveedorDblClick
      end
      object LSerie: TLFLabel
        Left = 35
        Top = 5
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = '&Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LProveedor: TLFLabel
        Left = 7
        Top = 27
        Width = 59
        Height = 13
        Alignment = taRightJustify
        Caption = '&Proveedor'
        FocusControl = EFProveedor
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LFechaRecepcion: TLFLabel
        Left = 394
        Top = 71
        Width = 101
        Height = 13
        Hint = 
          'Fecha de recepci'#243'n del pedido.'#13#10'Esta fecha se pasar'#225' a la cada l' +
          #237'nea del documento generado'
        Alignment = taRightJustify
        Caption = '&Fecha Recepci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
      end
      object LBLFechaContabilidad: TLFLabel
        Left = 411
        Top = 49
        Width = 84
        Height = 13
        Hint = 
          'Fecha de contabilizaci'#243'n que se utilizar'#225' si el documento destin' +
          'o es una factura.'
        Alignment = taRightJustify
        Caption = 'Fecha Contab.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
      end
      object LCanalDestino: TLFLabel
        Left = 435
        Top = 5
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Canal Dst.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LNumPedido: TLFLabel
        Left = 162
        Top = 49
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pedido'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LFechaDocumento: TLFLabel
        Left = 428
        Top = 93
        Width = 67
        Height = 13
        Hint = 
          'Fecha del documento (Albar'#225'n/Factura)'#13#10'Es la fecha que se utiliz' +
          'ar'#225' para hacer el movimiento de stock'
        Alignment = taRightJustify
        Caption = 'Fecha Doc.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        Layout = tlCenter
      end
      object LBPortes: TLFLabel
        Left = 35
        Top = 70
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Portes'
      end
      object LBPorPortes: TLFLabel
        Left = 82
        Top = 92
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = '% Portes'
      end
      object LBIPortes: TLFLabel
        Left = 206
        Top = 92
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'I. Portes'
      end
      object LDocDestino: TLFLabel
        Left = 444
        Top = 27
        Width = 51
        Height = 13
        Alignment = taRightJustify
        Caption = 'Doc Dst.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LEjercicio: TLFLabel
        Left = 14
        Top = 49
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EFProveedor: TLFEditFind2000
        Left = 69
        Top = 23
        Width = 80
        Height = 21
        AutoSize = False
        TabOrder = 2
        OnChange = EFProveedorExiste
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROVEEDOR'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_PROVEEDORES_RECEPCION'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFProveedorBusqueda
        OrdenadoPor.Strings = (
          'PROVEEDOR')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ETitSerie: TLFEdit
        Left = 150
        Top = 1
        Width = 240
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 1
      end
      object ETitProveedor: TLFEdit
        Left = 150
        Top = 23
        Width = 240
        Height = 21
        Color = clAqua
        Enabled = False
        TabOrder = 3
      end
      object EFSerie: TLFEditFind2000
        Left = 69
        Top = 1
        Width = 80
        Height = 21
        AutoSize = False
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
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DTPFechaContabilizacion: TLFDateEdit
        Left = 498
        Top = 45
        Width = 102
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 14
      end
      object DTPHoraContabilizacion: TDateTimePicker
        Left = 600
        Top = 45
        Width = 76
        Height = 21
        CalAlignment = dtaLeft
        Date = 37573.5516964468
        Time = 37573.5516964468
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkTime
        ParseInput = False
        TabOrder = 15
      end
      object DTPFechaRecepcion: TLFDateEdit
        Left = 498
        Top = 67
        Width = 102
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 16
      end
      object EFCanalDest: TLFEditFind2000
        Left = 498
        Top = 1
        Width = 80
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 10
        OnChange = EFCanalDestChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CANAL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CANAL')
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETitCanalDest: TLFEdit
        Left = 579
        Top = 1
        Width = 234
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object EFNumPedido: TLFEditFind2000
        Left = 206
        Top = 45
        Width = 80
        Height = 21
        TabOrder = 5
        OnChange = EFNumPedidoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'FECHA'
          'PROVEEDOR'
          'TITULO')
        CampoNum = 'RIG'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_PEDIDOS_RECEPCION'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFNumPedidoBusqueda
        OrdenadoPor.Strings = (
          'RIG')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFEjercicioPedido: TLFEditFind2000
        Left = 69
        Top = 45
        Width = 80
        Height = 21
        TabOrder = 4
        OnChange = EFEjercicioPedidoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'EJERCICIO'
        CampoStr = 'APERTURA'
        CondicionBusqueda = 'ACTIVO=1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'EMP_EJERCICIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'EJERCICIO DESC')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DTPFechaDocumento: TLFDateEdit
        Left = 498
        Top = 89
        Width = 102
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 18
      end
      object DTPHoraDocumento: TDateTimePicker
        Left = 600
        Top = 89
        Width = 76
        Height = 21
        CalAlignment = dtaLeft
        Date = 37573.5516964468
        Time = 37573.5516964468
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkTime
        ParseInput = False
        TabOrder = 19
      end
      object DTPHoraRecepcion: TDateTimePicker
        Left = 600
        Top = 67
        Width = 76
        Height = 21
        CalAlignment = dtaLeft
        Date = 37573.5516964468
        Time = 37573.5516964468
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkTime
        ParseInput = False
        TabOrder = 17
      end
      object EFPortes: TLFEditFind2000
        Left = 69
        Top = 67
        Width = 57
        Height = 21
        TabOrder = 6
        OnChange = EFPortesChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'TIPO<=4'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CON_CUENTAS_GES_PORTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloPortes: TLFEdit
        Left = 127
        Top = 67
        Width = 258
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 7
      end
      object EPorPortes: TLFEdit
        Left = 127
        Top = 89
        Width = 65
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object EIPortes: TLFEdit
        Left = 249
        Top = 89
        Width = 64
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object EFDocDestino: TLFEditFind2000
        Left = 498
        Top = 23
        Width = 80
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
        OnChange = EFDocDestinoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'SERIE'
          'NUM_DOCUMENTO'
          'EJERCICIO'
          'CANAL')
        CampoNum = 'ID_E'
        CampoStr = 'RIG'
        CondicionBusqueda = 'TIPO IN ('#39'ALP'#39', '#39'FAP'#39') AND ESTADO = 0'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_DOCUMENTOS_PROVEEDOR'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFDocDestinoBusqueda
        OrdenadoPor.Strings = (
          'EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDocDestino: TLFEdit
        Left = 579
        Top = 23
        Width = 234
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
      object CBPedidosCliente: TLFCheckBox
        Left = 850
        Top = 4
        Width = 103
        Height = 17
        Hint = 'Calcula Pedidos de Clientes para cada Articulo'
        Caption = 'Calcula Ped. Cli.'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 20
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBPedidosClienteChange
      end
      object CBCalculaStock: TLFCheckBox
        Left = 850
        Top = 27
        Width = 103
        Height = 17
        Hint = 'Calcula Pedidos de Clientes para cada Articulo'
        Caption = 'Calcula Stock'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 21
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBCalculaStockChange
      end
      object EFAlmacenStock: TLFEditFind2000
        Left = 952
        Top = 25
        Width = 65
        Height = 21
        TabOrder = 22
        OnChange = CBCalculaStockChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ALMACEN'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'ACTIVO = 1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ALMACENES_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'DEFECTO DESC, ALMACEN')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object PNLPie: TLFPanel
      Left = 2
      Top = 408
      Width = 1488
      Height = 74
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object PNLNotas: TLFPanel
        Left = 0
        Top = 0
        Width = 1303
        Height = 74
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        OnResize = PNLNotasResize
        object PNLNotasCompraPedido: TLFPanel
          Left = 0
          Top = 0
          Width = 993
          Height = 74
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LNotasCompraPedido: TLFLabel
            Left = 0
            Top = 0
            Width = 993
            Height = 13
            Align = alTop
            Caption = 'Notas de Pedido'
          end
          object MNOtasCompraPedido: TLFDBMemo
            Left = 0
            Top = 13
            Width = 993
            Height = 61
            Hint = 'Notas de Pedido'
            Align = alClient
            Color = clInfoBk
            DataField = 'NOTAS'
            DataSource = DMRecepcionPedidos.DSDetalleNota
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
          end
        end
        object PNLNotasCompraArticulo: TLFPanel
          Left = 993
          Top = 0
          Width = 310
          Height = 74
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object LNotasCompraArticulo: TLFLabel
            Left = 0
            Top = 0
            Width = 310
            Height = 13
            Align = alTop
            Caption = 'Notas Articulo'
          end
          object MNotasCompraArticulo: TLFDBMemo
            Left = 0
            Top = 13
            Width = 310
            Height = 61
            Hint = 'Notas de Articulo'
            Align = alClient
            Color = clInfoBk
            DataField = 'NOTAS_COMPRAS'
            DataSource = DMRecepcionPedidos.DSxArticulo
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 0
          end
        end
      end
      object PNLImagen: TLFPanel
        Left = 1303
        Top = 0
        Width = 185
        Height = 74
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        OnResize = PNLImagenResize
        DesignSize = (
          185
          74)
        object ImgArticulo: TImage
          Left = 0
          Top = 0
          Width = 185
          Height = 74
          Hint = 'Click para maximizar'
          Align = alClient
          AutoSize = True
          Center = True
          ParentShowHint = False
          Proportional = True
          ShowHint = True
          Stretch = True
          OnClick = ImgArticuloClick
        end
        object BMostrarImagen: TBitBtn
          Left = 160
          Top = 0
          Width = 25
          Height = 25
          Anchors = [akTop, akRight]
          TabOrder = 0
          OnClick = BMostrarImagenClick
        end
        object CBImagen: TLFCheckBox
          Left = 3
          Top = 0
          Width = 110
          Height = 17
          Caption = 'Mostrar Imagen'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          Color = clWhite
          ColorCheck = 57088
          ParentColor = False
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBImagenChange
        end
      end
    end
    object PNLLineasPedidos: TLFPanel
      Left = 2
      Top = 141
      Width = 1488
      Height = 267
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      OnResize = PNLLineasPedidosResize
      object DBGPedidosRelacionados: TDBGridFind2000
        Left = 0
        Top = 180
        Width = 1488
        Height = 87
        Align = alBottom
        DataSource = DMRecepcionPedidos.DSxRelacion
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGPedidosRelacionadosCellClick
        OnDrawColumnCell = DBGPedidosRelacionadosDrawColumnCell
        OnDblClick = DBGPedidosRelacionadosDblClick
        IniStorage = FSMain
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
          'MANIPULACION')
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
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'EJERCICIO'
            ReadOnly = True
            Width = 30
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CANAL'
            ReadOnly = True
            Width = 30
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
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            Width = 30
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ARTICULO'
            ReadOnly = True
            Width = 85
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
            FieldName = 'UNIDADES'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'U_PREPARADAS'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_ENTREGA_PREV'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'U_PENDIENTES'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIRECCION_ENTREGA'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALMACEN'
            ReadOnly = True
            Width = 30
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CLIENTE'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SU_REFERENCIA'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DIRECCION'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE_COMERCIAL'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'AGENTE'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_AGENTE'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'MANIPULACION'
            ReadOnly = True
            Visible = True
          end>
      end
      object DBGFPedidos: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 1488
        Height = 180
        Align = alClient
        DataSource = DMRecepcionPedidos.DSQMDetalle
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGFPedidosCellClick
        OnDrawColumnCell = DBGFPedidosDrawColumnCell
        OnDblClick = DBGFPedidosDblClick
        IniStorage = FSMain
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
        Transaction = DMRecepcionPedidos.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'ARTICULO'
          'RIG'
          'TITULO'
          'SU_REFERENCIA'
          'BARRAS'
          'CODIGO_PROVEEDOR'
          'ALMACEN'
          'RESERVA'
          'REF_PROVEEDOR'
          'ALFA_6'
          'ALFA_1'
          'ALFA_2'
          'ALFA_3'
          'ALFA_4'
          'ALFA_5'
          'ALFA_7'
          'ALFA_8'
          'ORDEN')
        CamposNoAccesibles.Strings = (
          'UNIDADES_ORIGINALES'
          'UNIDADES_SERVIDAS'
          'TITULO'
          'MONEDA'
          'BARRAS')
        ColumnasCheckBoxes.Strings = (
          'ENTRADA_RECEPCION'
          'SERVIR_LINEA')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OnRowChange = DBGFPedidosRowChange
        OrdenMultiple = True
        Filtros = []
        Columns = <
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
            FieldName = 'RIG'
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ORDEN'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ARTICULO'
            Width = 85
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'REF_PROVEEDOR'
            ReadOnly = True
            Width = 85
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'BARRAS'
            Width = 85
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_ORIGINALES'
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_SERVIDAS'
            ReadOnly = True
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_RECEPCION'
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'P_COSTE'
            Title.Alignment = taRightJustify
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO_2'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO_3'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'MONEDA'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERVIR_LINEA'
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ENTRADA_RECEPCION'
            Width = 25
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SU_REFERENCIA'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_REC_DET'
            Width = 75
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CODIGO_PROVEEDOR'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_6'
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LOTE'
            ReadOnly = True
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDOS_D_CLI'
            ReadOnly = True
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 484
    Width = 1492
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBImagen.Checked'
      'CBMarcarServido.Checked'
      'CBSeparaPedidos.Checked'
      'CBCalculaStock.Checked'
      'EFAlmacenStock.Text'
      'CBPedidosCliente.Checked')
    Left = 672
    Top = 32
  end
  object ALRecepcion: TActionList
    Images = DMMain.ILMain_Ac
    Left = 616
    Top = 52
    object AProveedor: TAction
      Caption = 'Proveedor'
      OnExecute = AProveedorExecute
    end
    object AAsignacionCodigoBarra: TAction
      Caption = 'Asignacion de Codigos de Barra'
      Hint = 'Asignacion de Codigos de Barra'
      ImageIndex = 38
      OnExecute = AAsignacionCodigoBarraExecute
    end
    object AImportarExcel: TAction
      Caption = 'Importar Excel ( Recibir )'
      Hint = 'Importar Excel ( Recibir )'
      ImageIndex = 49
      OnExecute = AImportarExcelExecute
    end
    object AImportarEropastry: TAction
      Caption = 'Importar Eropastry'
      Hint = 'Importar Lotes Eropastry'
      ImageIndex = 49
      OnExecute = AImportarEropastryExecute
    end
    object AImportarEropastryExpedicion: TAction
      Caption = 'Importar Eropastry Expedicion'
      Hint = 'Importar Lotes Eropastry (Expedicion)'
      ImageIndex = 49
      OnExecute = AImportarEropastryExpedicionExecute
    end
  end
  object tmrImgArticulo: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrImgArticuloTimer
    Left = 832
    Top = 16
  end
  object pmImportar: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 400
    Top = 24
    object MIImportarExcel: TMenuItem
      Action = AImportarExcel
    end
    object MIImportarEropastry: TMenuItem
      Action = AImportarEropastry
    end
    object MIImportarEropastryExpedicion: TMenuItem
      Action = AImportarEropastryExpedicion
    end
  end
end
