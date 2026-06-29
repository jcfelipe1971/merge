inherited FMPedidosPendientesCli: TFMPedidosPendientesCli
  Left = 318
  Top = 123
  Width = 1380
  Height = 744
  HelpContext = 205
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Relacion Pedidos de Venta'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1370
    Height = 691
    object Splitter: TSplitter [0]
      Left = 2
      Top = 560
      Width = 1366
      Height = 8
      Cursor = crVSplit
      Align = alBottom
      Color = clBtnShadow
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 1366
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object PNLSeleccionSeriecliente: TLFPanel
        Left = 23
        Top = 0
        Width = 1010
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
        object LBLcliente: TLFLabel
          Left = 159
          Top = 4
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
          Layout = tlCenter
        end
        object LFamilia: TLFLabel
          Left = 420
          Top = 4
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Familia'
          Layout = tlCenter
        end
        object LArticulo: TLFLabel
          Left = 683
          Top = 3
          Width = 35
          Height = 13
          Caption = 'Articulo'
        end
        object CBSeries: TLFComboBox
          Left = 37
          Top = 0
          Width = 117
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSeriesChange
        end
        object EFCliente: TLFEditFind2000
          Left = 194
          Top = 0
          Width = 50
          Height = 21
          TabOrder = 1
          OnChange = EFClienteChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'cliente'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETitulocliente: TLFEdit
          Left = 245
          Top = 0
          Width = 170
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
          Left = 455
          Top = 0
          Width = 50
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
          Left = 506
          Top = 0
          Width = 170
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
        object EArticulo: TLFEditFind2000
          Left = 721
          Top = 0
          Width = 53
          Height = 21
          TabOrder = 5
          OnChange = EArticuloChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'ARTICULO'
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EArticuloTitulo: TLFEdit
          Left = 775
          Top = 0
          Width = 170
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 6
        end
        object CBPedidosProveedor: TLFCheckBox
          Left = 947
          Top = 3
          Width = 73
          Height = 17
          Hint = 'Calcula Pedidos a Proveedor para cada Articulo'
          Caption = 'Ped. Prov.'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 7
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBPedidosProveedorChange
        end
      end
      object TButtTodos: TToolButton
        Left = 1033
        Top = 0
        Hint = 'Marcar todos los pedidos pendientes'
        Caption = 'Todos'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodosClick
      end
      object TButtDesmarcar: TToolButton
        Left = 1056
        Top = 0
        Hint = 'Desmarcar todos los pedidos pendientes'
        Caption = 'Desmarcar'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesmarcarClick
      end
      object TButtRefrescar: TToolButton
        Left = 1079
        Top = 0
        Hint = 'Refresca la informaci'#243'n en pantalla'
        Caption = 'Refrescar'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRefrescarClick
      end
      object TButtSep2: TToolButton
        Left = 1102
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMostrarFiltros: TToolButton
        Left = 1110
        Top = 0
        Hint = 'Mostrar los filtros de marcado'
        Caption = 'Mostrar Filtros'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMostrarFiltrosClick
      end
      object TButtSep3: TToolButton
        Left = 1133
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfoStock: TToolButton
        Left = 1141
        Top = 0
        Hint = 'Informacion de stock de articulo'
        Caption = 'Informacion de Stock'
        ImageIndex = 1
        OnClick = TButtInfoStockClick
      end
    end
    object PNLSeparador: TLFPanel
      Left = 2
      Top = 86
      Width = 1366
      Height = 474
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object TBFiltroclientes: TLFToolBar
        Left = 0
        Top = 0
        Width = 1366
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Visible = False
        Separators = True
        object TButtAnyadirSelecClientes: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Clientes'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecClientesClick
        end
        object TButtQuitarSeleccliente: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Clientes'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecclienteClick
        end
        object PNLClientes: TLFPanel
          Left = 46
          Top = 0
          Width = 803
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LDesdecliente: TLFLabel
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
          object LHastacliente: TLFLabel
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
          object Lcliente: TLFLabel
            Left = 15
            Top = 4
            Width = 40
            Height = 13
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFclienteDesde: TLFEditFind2000
            Left = 152
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFclienteDesdeChange
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
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFclienteHasta: TLFEditFind2000
            Left = 498
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFclienteHastaChange
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
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloclienteDesde: TLFEdit
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
          object ETituloclienteHasta: TLFEdit
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
        Width = 1366
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
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
          Width = 420
          Height = 22
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
        Width = 1366
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 2
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
            Left = 152
            Top = 5
            Width = 118
            Height = 13
            Caption = 'Fecha Confirmada Vac'#237'a'
          end
        end
      end
      object DBGFPedidosPendientes: TDBGridFind2000
        Left = 0
        Top = 75
        Width = 1366
        Height = 399
        Align = alClient
        Color = clInfoBk
        DataSource = DMPedidosPendientesCli.DSPedidosPendientesCli
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 3
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
        Transaction = DMPedidosPendientesCli.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'ENTRADA_AGRUPACION'
          'SERVIDO'
          'MODIFICA_DOC'
          'MANIPULACION'
          'PREPARABLE'
          'PEDIR')
        ColumnasChecked.Strings = (
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
            Expanded = False
            FieldName = 'ARTICULO'
            ReadOnly = True
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_LINEA'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            ReadOnly = True
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NRO_PEDIDO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DIR_NOMBRE'
            ReadOnly = True
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MODIFICA_DOC'
            ReadOnly = True
            Width = 25
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALMACEN'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'U_SERVIDAS'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'U_PREPARADAS'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'U_PENDIENTES'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PREPARABLE'
            ReadOnly = True
            Width = 30
            Visible = True
          end
          item
            Color = clWindow
            Expanded = False
            FieldName = 'ENTRADA_AGRUPACION'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MANIPULACION'
            ReadOnly = True
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK_ALM'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK_MINIMO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDOS_A_PRO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERVIDO'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ENTREGA_PREV'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_CONF_DET'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_REC_DET'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_PRE_PROV'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_ORDEN'
            ReadOnly = True
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_ORD'
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_ESTADO'
            ReadOnly = True
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAMILIA'
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIR'
            ReadOnly = True
            Width = 60
            Visible = True
          end>
      end
    end
    object PNLRelacion: TPanel
      Left = 2
      Top = 568
      Width = 1366
      Height = 121
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFRelacion: TDBGridFind2000
        Left = 0
        Top = 29
        Width = 1366
        Height = 92
        Align = alClient
        Color = clInfoBk
        DataSource = DMPedidosPendientesCli.DSxRelacion
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
            ReadOnly = True
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANAL'
            ReadOnly = True
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            ReadOnly = True
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SU_REFERENCIA'
            ReadOnly = True
            Width = 143
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVEEDOR'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            ReadOnly = True
            Width = 263
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_PRE_CAB'
            ReadOnly = True
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            ReadOnly = True
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            ReadOnly = True
            Width = 300
            Visible = True
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 1366
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
          DataSource = DMPedidosPendientesCli.DSxRelacion
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
    object TBHojasPreparacion: TLFToolBar
      Left = 2
      Top = 50
      Width = 1366
      Height = 22
      AutoSize = True
      Caption = 'TBHojasPreparacion'
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 3
      Separators = True
      object PNLCabOtrosPNLPreparacion: TLFPanel
        Left = 0
        Top = 0
        Width = 945
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LAlmacenPreparacion: TLFLabel
          Left = 7
          Top = 4
          Width = 48
          Height = 13
          Hint = 'Almacen para Preparacion'
          Alignment = taRightJustify
          Caption = 'Alm. Prep.'
        end
        object LBLResponsable: TLFLabel
          Left = 273
          Top = 4
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Responsable'
          Layout = tlCenter
        end
        object LUbicacionSimple: TLFLabel
          Left = 616
          Top = 4
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ubicaci'#243'n'
          Layout = tlCenter
        end
        object CBAlmacenesPreparacion: TLFComboBox
          Left = 59
          Top = 0
          Width = 206
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object EFResponsable: TLFEditFind2000
          Left = 338
          Top = 0
          Width = 59
          Height = 21
          TabOrder = 1
          OnChange = EFResponsableChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EMPLEADO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_EMPLEADOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloResponsable: TLFEdit
          Left = 398
          Top = 0
          Width = 211
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
        object EFUbicacionSimple: TLFEditFind2000
          Left = 667
          Top = 0
          Width = 59
          Height = 21
          TabOrder = 3
          OnChange = EFUbicacionSimpleChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ID_UBICACION_SIMPLE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'EMP_UBICACION_SIMPLE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ID_UBICACION_SIMPLE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloUbicacionSimple: TLFEdit
          Left = 727
          Top = 0
          Width = 211
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
      end
      object TButtMarcarPreparables: TToolButton
        Left = 945
        Top = 0
        Hint = 'Marcar los registros totalmente preparables'
        Caption = 'Marcar los registros totalmente preparables'
        ImageIndex = 19
        OnClick = TButtMarcarPreparablesClick
      end
      object TButtMarcarSemiPreparables: TToolButton
        Left = 968
        Top = 0
        Hint = 'Marcar los registros parcialmente preparables'
        Caption = 'Marcar los registros parcialmente preparables'
        ImageIndex = 118
        OnClick = TButtMarcarSemiPreparablesClick
      end
      object TButtSep4: TToolButton
        Left = 991
        Top = 0
        Width = 8
        ImageIndex = 2
        Style = tbsSeparator
      end
      object TButtGeneraHojas: TToolButton
        Left = 999
        Top = 0
        Action = AHojaPreparacionPedido
      end
    end
    object PNLColores: TLFPanel
      Left = 2
      Top = 72
      Width = 1366
      Height = 14
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
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
        Left = 496
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
        Left = 130
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
        Left = 252
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
        Left = 374
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
    object PNLFiltroFecEntrega: TLFPanel
      Left = 2
      Top = 28
      Width = 1366
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 5
      object LDesdeFecEntrega: TLFLabel
        Left = 76
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
      object LHastaFecEntrega: TLFLabel
        Left = 213
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
      object LFiltroFechaEntrega: TLFLabel
        Left = 15
        Top = 4
        Width = 53
        Height = 13
        Caption = 'Fec. Ent.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DEDesdeFecEntrega: TLFDateEdit
        Left = 112
        Top = 0
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
        OnChange = DEDesdeFecEntregaChange
      end
      object DEHastaFecEntrega: TLFDateEdit
        Left = 246
        Top = 0
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnChange = DEHastaFecEntregaChange
      end
      object BEjercicio: TButton
        Left = 389
        Top = 0
        Width = 31
        Height = 22
        Caption = 'A'#241'o'
        TabOrder = 2
        OnClick = BEjercicioClick
      end
      object BMesSiguiente: TButton
        Left = 511
        Top = 0
        Width = 25
        Height = 22
        Caption = '>>'
        TabOrder = 3
        OnClick = BMesSiguienteClick
      end
      object BMesAnterio: TButton
        Left = 337
        Top = 0
        Width = 25
        Height = 22
        Caption = '<<'
        TabOrder = 4
        OnClick = BMesAnterioClick
      end
      object BMes: TButton
        Left = 421
        Top = 0
        Width = 31
        Height = 22
        Caption = 'Mes'
        TabOrder = 5
        OnClick = BMesClick
      end
      object BMDiaSiguiente: TButton
        Left = 485
        Top = 0
        Width = 25
        Height = 22
        Caption = '>'
        TabOrder = 6
        OnClick = BMDiaSiguienteClick
      end
      object BHoy: TButton
        Left = 453
        Top = 0
        Width = 31
        Height = 22
        Caption = 'Hoy'
        TabOrder = 7
        OnClick = BHoyClick
      end
      object BDiaAnterior: TButton
        Left = 363
        Top = 0
        Width = 25
        Height = 22
        Caption = '<'
        TabOrder = 8
        OnClick = BDiaAnteriorClick
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 691
    Width = 1370
  end
  inherited CEMain: TControlEdit
    Left = 976
    Top = 140
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 1012
    Top = 140
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
    Left = 976
    Top = 176
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Stock'
      Caption = 'Stock Alm.'
      ImageIndex = 3
    end
    object ANoCalcularStock: TAction
      Category = 'Stock'
      Caption = 'No calcular stock'
      Hint = 'No calcular stock'
      ImageIndex = 27
      OnExecute = AStockAlmacenExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Envio'
      Caption = 'Env'#237'o'
      ImageIndex = 34
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
      Caption = 'Configuraci'#243'n R'#225'pida de listado de Reclamaciones'
      Hint = 'Configuracion rapida de listado de Reclamaciones'
      ImageIndex = 77
      OnExecute = AConfiguracionRapidaExecute
    end
    object AHojaPreparacionPedido: TAction
      Category = 'HojasPreparaci'#243'n'
      Caption = 'Crear Preparaci'#243'n Pedidos'
      Hint = 'Crear Preparaci'#243'n Pedidos'
      ImageIndex = 94
      OnExecute = AHojaPreparacionPedidoExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'HojasPreparaci'#243'n'
      Caption = 'Hojas de Preparaci'#243'n'
      ImageIndex = 57
    end
    object AListado: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado'
      Hint = 'Visualizar Listado'
      ImageIndex = 14
      OnExecute = AListadoExecute
    end
    object AConfiguracionRapidaListado: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida de listado'
      Hint = 'Configuraci'#243'n R'#225'pida de listado'
      ImageIndex = 77
      OnExecute = AConfiguracionRapidaListadoExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBPedidosProveedor.Checked')
    Left = 1012
    Top = 176
  end
end
