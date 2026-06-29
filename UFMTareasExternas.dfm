inherited FMTareasExternas: TFMTareasExternas
  Left = 389
  Top = 168
  Width = 1029
  Height = 607
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Trabajos Externos'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1019
    Height = 554
    object Splitter: TSplitter [0]
      Left = 2
      Top = 354
      Width = 1015
      Height = 5
      Cursor = crVSplit
      Align = alBottom
      Color = clBtnShadow
      ParentColor = False
    end
    inherited TBMain: TLFToolBar
      Width = 1015
      TabOrder = 2
      inherited NavMain: THYMNavigator
        Width = 180
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 180
      end
      inherited EPMain: THYMEditPanel
        Left = 188
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
        ImageIndex = 1
        Visible = True
        OnClick = TbuttCompClick
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 137
      Width = 1015
      Height = 217
      Align = alClient
      Color = clInfoBk
      DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGMainCellClick
      OnDrawColumnCell = DBGMainDrawColumnCell
      OnDblClick = DBGMainDblClick
      OnTitleClick = DBGMainTitleClick
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
      Transaction = DMTareasExternas.TLocal
      BuscarNums = False
      Campos.Strings = (
        'ALMACEN_ENTRADA'
        'ALMACEN_PREPARACION'
        'ALMACEN_TEX'
        'PROVEEDOR'
        'ARTICULO'
        'COMPUESTO_COMPONENTE')
      CamposAMostrar.Strings = (
        'ALMACEN_ENTRADA'
        '0'
        'ALMACEN_PREPARACION'
        '0'
        'ALMACEN_TEX'
        '0'
        'PROVEEDOR'
        '0'
        'ARTICULO'
        '0'
        'COMPUESTO_COMPONENTE'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'SERIE'
        'LINEA_FASE'
        'LINEA_TAREA'
        'NOMBRE_R_SOCIAL'
        'PEDIDO'
        'TITULO_LARGO'
        'SITUACION'
        'FECHA_ORD'
        'COMPUESTO'
        'RIG_OF')
      MensajeNoExiste = False
      Numericos.Strings = (
        'ALMACEN'
        'ALMACEN'
        'ALMACEN'
        'PROVEEDOR'
        'ARTICULO'
        'ARTICULO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_ALMACENES_CUENTAS'
        'VER_ALMACENES_CUENTAS'
        'VER_ALMACENES_CUENTAS'
        'VER_PROVEEDORES_CUENTAS'
        'VER_ARTICULOS_EF'
        'VER_ARTICULOS_EF')
      Acciones.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO')
      Posicion = tpCentrado
      Planes.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'ALMACEN'
        'ALMACEN'
        'ALMACEN'
        'PROVEEDOR'
        'ARTICULO'
        'ARTICULO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'EMPRESA'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'CANAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'RIG_OF'
          Title.Caption = 'Orden'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SUBORDEN'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LINEA_FASE'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_TAREA'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAREA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ORDEN'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_E_PEDIDO'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_TEX'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COMPUESTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_COMPUESTO_ORDEN'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LOTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_LOTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNI_TOTAL'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ORD'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_R_SOCIAL'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_PED'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_SITUACION'
          Width = 150
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'PROVEEDOR'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_PROVEEDOR'
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'ALMACEN_PREPARACION'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_ALM_PREPARACION'
          Width = 70
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'ALMACEN_TEX'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_ALM_TEX'
          Width = 70
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'ALMACEN_ENTRADA'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_ALM_ENTRADA'
          Width = 70
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'ARTICULO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_ARTICULO'
          Width = 200
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'COMPUESTO_COMPONENTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_COMPUESTO_COMPONENTE'
          Width = 200
          Visible = True
        end>
    end
    object PDetalle: TLFPanel
      Left = 2
      Top = 359
      Width = 1015
      Height = 193
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 1015
        Height = 171
        Align = alClient
        Color = clInfoBk
        DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex_Movs
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGFDetalleCellClick
        OnDrawColumnCell = DBGFDetalleDrawColumnCell
        OnDblClick = DBGFDetalleDblClick
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
        CamposAMostrarAnchos.Strings = (
          '0')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'ID_A'
          'FECHA'
          'ID_TEX_MOV'
          'PROVEEDOR'
          'ALMACEN_PERPARACION'
          'ALMACEN_TEX'
          'TIPO_DOC'
          'ID_DOC')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'CONCEPTO'
          '')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'FECHA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_ARTICULO'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAJAS'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROVEEDOR'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Title.Caption = 'Nombre Proveedor'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALMACEN_PERPARACION'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK_PERPARACION'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALMACEN_TEX'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK_TEX'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_OPERACION'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DOC'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE_DOC'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG_DOC'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE_ST'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG_ST'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALBARAN_PROVEEDOR'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPUESTO_COMPONENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_COMPUESTO_COMPONENTE'
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_COMPUESTO_COMPONENTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'KILOS'
            Visible = True
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 1015
        Height = 22
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
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object TBSep1: TToolButton
          Left = 120
          Top = 0
          Width = 8
          Style = tbsSeparator
        end
        object TBGrabarSalida: TToolButton
          Left = 128
          Top = 0
          Hint = 'Generar Salida'
          Caption = 'Generar Salida'
          ImageIndex = 42
          ParentShowHint = False
          ShowHint = True
          OnClick = TBGrabarSalidaClick
        end
        object TBGrabarEntrada: TToolButton
          Left = 151
          Top = 0
          Hint = 'Generar Entrada'
          Caption = 'Generar Entrada'
          ImageIndex = 43
          OnClick = TBGrabarEntradaClick
        end
        object TBSep2: TToolButton
          Left = 174
          Top = 0
          Width = 8
          ImageIndex = 44
          Style = tbsSeparator
        end
        object CBAlmacenStockVirtual: TCheckBox
          Left = 182
          Top = 0
          Width = 120
          Height = 22
          Caption = 'Ver Stock Virtual'
          TabOrder = 1
          OnClick = CBAlmacenStockVirtualClick
        end
      end
    end
    object PnlTop: TLFPanel
      Left = 2
      Top = 28
      Width = 1015
      Height = 109
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object PnlFiltro: TLFPanel
        Left = 0
        Top = 0
        Width = 617
        Height = 109
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LSerie: TLFLabel
          Left = 484
          Top = 11
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object LCliente: TLFLabel
          Left = 27
          Top = 11
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
          Color = clBtnFace
          ParentColor = False
          Layout = tlCenter
        end
        object LOrdenProduccion: TLFLabel
          Left = 477
          Top = 33
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Orden'
          Layout = tlCenter
        end
        object LFiltroArticulo: TLFLabel
          Left = 35
          Top = 33
          Width = 16
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art.'
        end
        object LProveedor: TLFLabel
          Left = 10
          Top = 55
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
        end
        object LDesdeFecEntrega: TLFLabel
          Left = 25
          Top = 77
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
          Left = 153
          Top = 77
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
        object LSituacion: TLabel
          Left = 447
          Top = 54
          Width = 62
          Height = 13
          Caption = 'Situacion OP'
        end
        object CBSeries: TLFComboBox
          Left = 513
          Top = 6
          Width = 100
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 8
          OnChange = CBSeriesChange
        end
        object ETitulocliente: TLFEdit
          Left = 145
          Top = 6
          Width = 296
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EFCliente: TLFEditFind2000
          Left = 64
          Top = 6
          Width = 80
          Height = 21
          TabOrder = 0
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
        object EFOrdenProduccion: TLFEditFind2000
          Left = 513
          Top = 28
          Width = 100
          Height = 21
          TabOrder = 9
          OnChange = CBSeriesChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'NORDEN'
          CampoStr = 'NORDEN'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ORDENES_PRODUCCION'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloArticulo: TLFEdit
          Left = 145
          Top = 28
          Width = 296
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
        object EFArticulo: TLFEditFind2000
          Left = 64
          Top = 28
          Width = 80
          Height = 21
          TabOrder = 2
          OnChange = EFArticuloChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFProveedor: TLFEditFind2000
          Left = 64
          Top = 50
          Width = 80
          Height = 21
          TabOrder = 4
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
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloProveedor: TLFEdit
          Left = 145
          Top = 50
          Width = 296
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          TabOrder = 5
        end
        object DEDesdeFec: TLFDateEdit
          Left = 64
          Top = 72
          Width = 80
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 6
          OnChange = CBSeriesChange
        end
        object DEHastaFec: TLFDateEdit
          Left = 186
          Top = 72
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 7
          OnChange = CBSeriesChange
        end
        object CBSituacion: TLFComboBox
          Left = 513
          Top = 50
          Width = 100
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 10
          Text = 'Todas'
          OnChange = CBSeriesChange
          Items.Strings = (
            'Todas'
            'Lanzada'
            'Lanzada + Reservada'
            'Cerrdas parcialmente'
            'Cerado totalmente')
        end
      end
      object PNLInfoTarea: TLFPanel
        Left = 617
        Top = 0
        Width = 398
        Height = 109
        Align = alClient
        BevelOuter = bvNone
        Constraints.MinWidth = 200
        TabOrder = 1
        object Imagen: TImage
          Left = 0
          Top = 0
          Width = 105
          Height = 109
          Align = alLeft
          Center = True
          IncrementalDisplay = True
          Proportional = True
          Stretch = True
        end
        object DBEImagen: TDBEdit
          Left = 0
          Top = 0
          Width = 1
          Height = 21
          Color = clInfoBk
          DataField = 'IMAGEN_COMPUESTO'
          DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex
          Enabled = False
          TabOrder = 1
          OnChange = DBEImagenChange
        end
        object PNLInfoTareaDerecha: TLFPanel
          Left = 105
          Top = 0
          Width = 293
          Height = 109
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBMComentario: TLFDBMemo
            Left = 0
            Top = 22
            Width = 293
            Height = 87
            TabStop = False
            Align = alBottom
            Color = clInfoBk
            DataField = 'COMENTARIO_TAREA'
            DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETarea: TLFDbedit
            Left = 0
            Top = 0
            Width = 293
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TAREA'
            DataSource = DMTareasExternas.DSQMPro_Ord_Tarea_Tex
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 554
    Width = 1019
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 456
    Top = 172
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 492
    Top = 172
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    object CEConsumoMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CEConsumoMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CEConsumoMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CEConsumoMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CEConsumoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CEConsumoMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CEConsumoMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CEConsumoMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CEConsumoMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CEConsumoMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  inherited ALMain: TLFActionList
    Left = 528
    Top = 176
    object AArticulo: TAction
      Category = 'Enlaces'
      Caption = 'Articulo'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Art'#237'culo'
      ImageIndex = 109
      OnExecute = AArticuloExecute
    end
    object AFTodos: TAction
      Category = 'Filtros'
      Caption = 'Todos'
      ImageIndex = 5
      OnExecute = AFTodosExecute
    end
    object ACompuestoComponente: TAction
      Category = 'Enlaces'
      Caption = 'Compuesto/Compoente'
      Hint = 
        'Doble click o Ctrl+Alt+T para ver los datos del Compuesto/Compon' +
        'ente'
      ImageIndex = 109
      OnExecute = ACompuestoComponenteExecute
    end
    object AFCerrados: TAction
      Category = 'Filtros'
      Caption = 'Cerrados'
      ImageIndex = 5
      OnExecute = AFCerradosExecute
    end
    object AOrdenProduccion: TAction
      Category = 'Enlaces'
      Caption = 'Orden Produccion'
      Hint = 'Orden de Producci'#243'n'
      ImageIndex = 116
      OnExecute = AOrdenProduccionExecute
    end
    object ACliente: TAction
      Category = 'Enlaces'
      Caption = 'Cliente'
      Hint = 'Clientes'
      ImageIndex = 104
      OnExecute = AClienteExecute
    end
    object AProveedor: TAction
      Category = 'Enlaces'
      Caption = 'Proveedor'
      Hint = 'Proveedor'
      ImageIndex = 64
      OnExecute = AProveedorExecute
    end
    object APedido: TAction
      Category = 'Enlaces'
      Caption = 'Pedido'
      Hint = 'Pedido Cliente'
      ImageIndex = 62
      OnExecute = APedidoExecute
    end
    object APedidoProveedor: TAction
      Category = 'Enlaces'
      Caption = 'Pedido Proveedor'
      Hint = 'Pedido Proveedor'
      ImageIndex = 62
      OnExecute = APedidoProveedorExecute
    end
    object AMovimientoStock: TAction
      Category = 'Enlaces'
      Caption = 'Movimiento Stock'
      Hint = 'Movimiento Stock'
      ImageIndex = 125
      OnExecute = AMovimientoStockExecute
    end
    object ACompuesto: TAction
      Category = 'Enlaces'
      Caption = 'Compuesto'
      ImageIndex = 109
      OnExecute = ACompuestoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Enlaces'
      Caption = 'Enlaces'
      ImageIndex = 86
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 568
    Top = 176
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 454
    Top = 208
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 488
    Top = 208
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object TmrImagen: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TmrImagenTimer
    Left = 656
    Top = 64
  end
end
