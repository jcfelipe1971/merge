inherited FMPedidosPendientesProv: TFMPedidosPendientesProv
  Left = 301
  Top = 125
  Width = 1206
  Height = 637
  HelpContext = 205
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Pedidos pendientes de proveedor'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1196
    Height = 584
    object Splitter: TSplitter [0]
      Left = 2
      Top = 463
      Width = 1192
      Height = 9
      Cursor = crVSplit
      Align = alBottom
      Color = clBtnShadow
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 1192
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object PNLSeleccionSerieProveedor: TLFPanel
        Left = 23
        Top = 0
        Width = 1058
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LBLSerie: TLFLabel
          Left = 9
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object LBLProveedor: TLFLabel
          Left = 106
          Top = 4
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
          Layout = tlCenter
        end
        object LFamilia: TLFLabel
          Left = 358
          Top = 4
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Familia'
          Layout = tlCenter
        end
        object LFiltraArticulo: TLFLabel
          Left = 598
          Top = 3
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Articulo'
        end
        object LClienteRelacionado: TLFLabel
          Left = 756
          Top = 5
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object CBSeries: TLFComboBox
          Left = 37
          Top = 0
          Width = 68
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSeriesChange
        end
        object EFProveedor: TLFEditFind2000
          Left = 158
          Top = 0
          Width = 43
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
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloProveedor: TLFEdit
          Left = 202
          Top = 0
          Width = 154
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object EFFamilia: TLFEditFind2000
          Left = 393
          Top = 0
          Width = 43
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloFamilia: TLFEdit
          Left = 437
          Top = 0
          Width = 154
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
        object EArticulo: TLFEdit
          Left = 639
          Top = 0
          Width = 114
          Height = 21
          TabOrder = 5
          OnChange = EArticuloChange
        end
        object EFCliente: TLFEditFind2000
          Left = 790
          Top = 1
          Width = 43
          Height = 21
          TabOrder = 6
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_CLIENTES_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ECliente: TLFEdit
          Left = 834
          Top = 1
          Width = 154
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
        object CBPedidosCliente: TLFCheckBox
          Left = 994
          Top = 4
          Width = 65
          Height = 17
          Hint = 'Calcula Pedidos de Clientes para cada Articulo'
          Caption = 'Ped. Cli.'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBPedidosClienteChange
        end
      end
      object TButtSep1: TToolButton
        Left = 1081
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtTodos: TToolButton
        Left = 1089
        Top = 0
        Hint = 'Marcar todos los pedidos pendientes'
        Caption = 'Todos'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodosClick
      end
      object TButtDesmarcar: TToolButton
        Left = 1112
        Top = 0
        Hint = 'Desmarcar todos los pedidos pendientes'
        Caption = 'Desmarcar'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesmarcarClick
      end
      object TButtRefrescar: TToolButton
        Left = 1135
        Top = 0
        Hint = 'Refresca la informaci'#243'n en pantalla'
        Caption = 'Refrescar'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object TButtSep2: TToolButton
        Left = 1158
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMostrarFiltros: TToolButton
        Left = 1166
        Top = 0
        Hint = 'Mostrar los filtros de marcado'
        Caption = 'Mostrar Filtros'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMostrarFiltrosClick
      end
      object TButtSep3: TToolButton
        Left = 1189
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfoStock: TToolButton
        Left = 1197
        Top = 0
        Caption = 'TButtInfoStock'
        ImageIndex = 1
        OnClick = TButtInfoStockClick
      end
    end
    object PNLSeparador: TLFPanel
      Left = 2
      Top = 28
      Width = 1192
      Height = 435
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGFPedidosPendientes: TDBGridFind2000
        Left = 0
        Top = 89
        Width = 1192
        Height = 346
        Align = alClient
        DataSource = DMPedidosPendientesProv.DSPedidosPendientesProv
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGFPedidosPendientesCellClick
        OnDrawColumnCell = DBGFPedidosPendientesDrawColumnCell
        OnDblClick = DBGFPedidosPendientesDblClick
        OnTitleClick = DBGFPedidosPendientesTitleClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = False
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
          'ENTRADA_RECEPCION'
          'LINEA_SERVIDA'
          'MODIFICA_DOC')
        ColumnasChecked.Strings = (
          '1'
          '1'
          '128')
        ColumnasNoChecked.Strings = (
          '0'
          '0'
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
            FieldName = 'ARTICULO'
            ReadOnly = True
            Width = 90
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            ReadOnly = True
            Width = 150
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PROVEEDOR'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            ReadOnly = True
            Width = 150
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RIG'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA'
            Width = 72
            Visible = True
          end
          item
            Alignment = taCenter
            Color = clInfoBk
            Expanded = False
            FieldName = 'MODIFICA_DOC'
            ReadOnly = True
            Width = 25
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALMACEN'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_ORIGINALES'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_SERVIDAS'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_POR_SERVIR'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'INCR_PEDIDO'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PEDIDOS_A_PROV'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'STOCK_ALM'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'STOCK_MINIMO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'STOCK_ALM_2'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PEDIDOS_D_CLI'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA_SERVIDA'
            ReadOnly = True
            Width = 41
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'P_COSTE'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DESCUENTO'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_PRE_DET'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_REC_DET'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_CONF_KRI'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PLAZO_CONFIRM_KRI'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_ENTREGA_PREV_CLI'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'ENTRADA_RECEPCION'
            Width = 35
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID_ORDEN'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_ESTADO'
            ReadOnly = True
            Width = 150
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FAMILIA'
            ReadOnly = True
            Width = 40
            Visible = True
          end>
      end
      object TBFiltroProveedores: TLFToolBar
        Left = 0
        Top = 0
        Width = 1192
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Visible = False
        Separators = True
        object TButtAnyadirSelecProveedors: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Clientes'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecProveedorsClick
        end
        object TButtQuitarSelecProveedor: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Clientes'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecProveedorClick
        end
        object PNLClientes: TLFPanel
          Left = 46
          Top = 0
          Width = 803
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LDesdeProveedor: TLFLabel
            Left = 117
            Top = 4
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LHastaProveedor: TLFLabel
            Left = 468
            Top = 3
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LProveedor: TLFLabel
            Left = 15
            Top = 4
            Width = 59
            Height = 13
            Caption = 'Proveedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFProveedorDesde: TLFEditFind2000
            Left = 152
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFProveedorDesdeChange
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
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFProveedorHasta: TLFEditFind2000
            Left = 498
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFProveedorHastaChange
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
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloProveedorDesde: TLFEdit
            Left = 212
            Top = 0
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object ETituloProveedorHasta: TLFEdit
            Left = 558
            Top = 0
            Width = 239
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
        end
      end
      object TBFiltroFechaEntrega: TLFToolBar
        Left = 0
        Top = 25
        Width = 1192
        Height = 25
        ButtonHeight = 23
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 2
        Visible = False
        Separators = True
        object TButtAnyadirSelecFechas: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Fechas'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecFechasClick
        end
        object TButtQuitarSelecFechas: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Fechas'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecFechasClick
        end
        object PNLSeleccionFechas: TLFPanel
          Left = 46
          Top = 0
          Width = 722
          Height = 23
          BevelOuter = bvNone
          TabOrder = 0
          object LDesdeFecha: TLFLabel
            Left = 116
            Top = 4
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LHastaFecha: TLFLabel
            Left = 269
            Top = 4
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LFechaPrevista: TLFLabel
            Left = 15
            Top = 4
            Width = 87
            Height = 13
            Caption = 'Fec. Prev. Ent.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DTPDesdeFecha: TLFDateEdit
            Left = 152
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPHastaFecha: TLFDateEdit
            Left = 302
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
      object TBFiltroFechaConfirmada: TLFToolBar
        Left = 0
        Top = 50
        Width = 1192
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 3
        Visible = False
        Separators = True
        object TButtAnyadirFechaConfirmada: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Fechas'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirFechaConfirmadaClick
        end
        object TButtQuitarFechaConfirmada: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Fechas'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarFechaConfirmadaClick
        end
        object PNLFiltroFechaConfirmada: TLFPanel
          Left = 46
          Top = 0
          Width = 420
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LFechaConfirmada: TLFLabel
            Left = 15
            Top = 4
            Width = 93
            Height = 13
            Caption = 'Fec. Confirmada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LFechaConfirmadaVacia: TLFLabel
            Left = 352
            Top = 4
            Width = 118
            Height = 13
            Caption = 'Fecha Confirmada Vac'#237'a'
          end
        end
      end
      object PNLColores: TLFPanel
        Left = 0
        Top = 75
        Width = 1192
        Height = 14
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 4
        Visible = False
        object LSinStock: TLFLabel
          Left = 8
          Top = 1
          Width = 120
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Sin Stock'
          Color = clBackground
          ParentColor = False
        end
        object LPreparado: TLFLabel
          Left = 130
          Top = 1
          Width = 120
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Preparado'
          Color = clBackground
          ParentColor = False
        end
        object LStockSuficiente: TLFLabel
          Left = 252
          Top = 1
          Width = 120
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Stock Suficiente'
          Color = clBackground
          ParentColor = False
        end
        object LStockNoSuficiente: TLFLabel
          Left = 374
          Top = 1
          Width = 120
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Stock NO Suficiente'
          Color = clBackground
          ParentColor = False
        end
        object LPreparable: TLFLabel
          Left = 496
          Top = 1
          Width = 120
          Height = 13
          Alignment = taCenter
          AutoSize = False
          Caption = 'Preparable'
          Color = clBackground
          ParentColor = False
        end
      end
    end
    object PNLRelacion: TPanel
      Left = 2
      Top = 472
      Width = 1192
      Height = 110
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFRelacion: TDBGridFind2000
        Left = 0
        Top = 29
        Width = 1192
        Height = 81
        Align = alClient
        Color = clInfoBk
        DataSource = DMPedidosPendientesProv.DSxRelacion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFRelacionDrawColumnCell
        OnDblClick = DBGFRelacionDblClick
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
        CamposAOrdernar.Strings = (
          'RIG')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'EJERCICIO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANAL'
            Width = 37
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 36
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SU_REFERENCIA'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 330
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ENTREGA_PREV'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Width = 200
            Visible = True
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 1192
        Height = 29
        Caption = 'TBDetalle'
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Separators = True
        object NavRelacion: THYMNavigator
          Left = 0
          Top = 0
          Width = 120
          Height = 22
          DataSource = DMPedidosPendientesProv.DSxRelacion
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
        object TBSep1: TToolButton
          Left = 120
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object TBBorrarRelacion: TToolButton
          Left = 128
          Top = 0
          Hint = 'Borrar Relacion de Herencia'
          Caption = 'Borrar Relacion'
          ImageIndex = 20
          ParentShowHint = False
          ShowHint = True
          OnClick = TBBorrarRelacionClick
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 584
    Width = 1196
  end
  inherited CEMain: TControlEdit
    Left = 944
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 980
    Top = 4
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
    Left = 944
    Top = 40
    object ANoCalcularStock2: TAction
      Tag = 2
      Category = 'Stock2'
      Caption = 'No calcular stock'
      ImageIndex = 27
      OnExecute = AStockAlmacenExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Stock2'
      Caption = 'Stock Alm. 2'
      ImageIndex = 3
    end
    object ANoCalcularStock: TAction
      Tag = 1
      Category = 'Stock'
      Caption = 'No calcular stock'
      ImageIndex = 27
      OnExecute = AStockAlmacenExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Stock'
      Caption = 'Stock Alm. 1'
      ImageIndex = 3
    end
    object AEnviarCorreos: TAction
      Category = 'Envio'
      Caption = 'Enviar Reclamaciones'
      Hint = 'Enviar correo de reclamaci'#243'n de registros seleccionados'
      ImageIndex = 34
      OnExecute = AEnviarCorreosExecute
    end
    object AEnviarPedidos: TAction
      Category = 'Envio'
      Caption = 'Enviar Pedidos'
      Hint = 'Enviar correo de pedidos de registros seleccionados'
      ImageIndex = 34
      OnExecute = AEnviarPedidosExecute
    end
    object AConfiguracionRapida: TAction
      Category = 'Envio'
      Caption = 'Configuraci'#243'n R'#225'pida de listado'
      Hint = 'Configuracion rapida de listado'
      ImageIndex = 77
      OnExecute = AConfiguracionRapidaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Envio'
      Caption = 'Env'#237'o'
      ImageIndex = 34
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBPedidosCliente.Checked')
    Left = 980
    Top = 40
  end
end
