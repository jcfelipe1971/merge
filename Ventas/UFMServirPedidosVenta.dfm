inherited FMServirPedidosVenta: TFMServirPedidosVenta
  Left = 226
  Top = 193
  Width = 1373
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Servir Pedidos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1363
    object splitter2: TSplitter [0]
      Left = 840
      Top = 153
      Width = 8
      Height = 177
      Cursor = crHSplit
      Align = alRight
      Color = clGray
      ParentColor = False
      Visible = False
    end
    inherited TBMain: TLFToolBar
      Width = 1359
      Height = 29
      ButtonHeight = 25
      ButtonWidth = 25
      Wrapable = True
      inherited NavMain: THYMNavigator
        Width = 192
        Height = 25
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
      end
      inherited TSepNav: TToolButton
        Left = 192
      end
      inherited EPMain: THYMEditPanel
        Left = 200
        Width = 25
        Height = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 225
      end
      inherited TbuttComp: TToolButton
        Left = 233
      end
      object TSep1: TToolButton
        Left = 258
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TButtMarcarTodos: TToolButton
        Left = 266
        Top = 0
        Hint = 'Marcar Todos'
        Caption = 'Marcar Todos'
        ImageIndex = 146
        OnClick = TButtMarcarTodosClick
      end
      object TButtDesmarcarTodos: TToolButton
        Left = 291
        Top = 0
        Hint = 'Desmarcar Todos'
        Caption = 'Desmarcar Todos'
        ImageIndex = 147
        OnClick = TButtDesmarcarTodosClick
      end
      object TButtRefrescar: TToolButton
        Left = 316
        Top = 0
        Hint = 'Refrescar'
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = TButtRefrescarClick
      end
      object TSep2: TToolButton
        Left = 341
        Top = 0
        Width = 8
        ImageIndex = 148
        Style = tbsSeparator
      end
      object TButtAlbaranar: TToolButton
        Left = 349
        Top = 0
        Hint = 'Albaranar. Excepto los marcados con destino diferente'
        Caption = 'Albaranar'
        ImageIndex = 60
        OnClick = TButtAlbaranarClick
      end
      object TButtFacturar: TToolButton
        Left = 374
        Top = 0
        Hint = 'Facturar. Excepto los marcados con destino diferente'
        Caption = 'Facturar'
        ImageIndex = 61
        OnClick = TButtFacturarClick
      end
      object TBSep1: TToolButton
        Left = 399
        Top = 0
        Width = 8
        ImageIndex = 62
        Style = tbsSeparator
      end
      object TButtTraspasarSegunConf: TToolButton
        Left = 407
        Top = 0
        Hint = 'Generar Albaran/Factura segun configuracion de linea'
        Caption = 'Albaranar/Facturar'
        ImageIndex = 86
        OnClick = TButtTraspasarSegunConfClick
      end
      object TBSep2: TToolButton
        Left = 432
        Top = 0
        Width = 8
        ImageIndex = 64
        Style = tbsSeparator
      end
    end
    object PNLFiltro: TLFPanel
      Tag = 1
      Left = 2
      Top = 31
      Width = 1359
      Height = 122
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        1359
        122)
      object LPedidoFiltro: TLFLabel
        Left = 36
        Top = 8
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = '&Pedido'
        FocusControl = EPedidoFiltroDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LClienteFiltro: TLFLabel
        Left = 268
        Top = 8
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = '&Cliente'
        FocusControl = EClienteFiltroDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object SBFiltrar: TSpeedButton
        Left = 8
        Top = 4
        Width = 23
        Height = 22
        Hint = 'Filtrar'
        OnClick = SBFiltrarClick
      end
      object LRuta: TLFLabel
        Left = 644
        Top = 30
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = '&Ruta'
        FocusControl = ERutaFiltro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LFechaPrev: TLFLabel
        Left = 10
        Top = 30
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = '&Fecha Prev'
        FocusControl = EPedidoFiltroDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object SBDiaAnterior: TSpeedButton
        Left = 266
        Top = 26
        Width = 22
        Height = 22
        Hint = 'Dia anterior'
        Flat = True
        NumGlyphs = 2
        OnClick = SBDiaAnteriorClick
      end
      object SBSemana: TSpeedButton
        Left = 288
        Top = 26
        Width = 22
        Height = 22
        Hint = 'Semana actual'
        Flat = True
        NumGlyphs = 2
        OnClick = SBSemanaClick
      end
      object SBDiaSiguiente: TSpeedButton
        Left = 332
        Top = 26
        Width = 22
        Height = 22
        Hint = 'Dia siguiente'
        Flat = True
        NumGlyphs = 2
        OnClick = SBDiaSiguienteClick
      end
      object SBDia: TSpeedButton
        Left = 310
        Top = 26
        Width = 22
        Height = 22
        Hint = 'Dia actual'
        Flat = True
        NumGlyphs = 2
        OnClick = SBDiaClick
      end
      object DBTDireccion: TDBText
        Left = 960
        Top = 0
        Width = 337
        Height = 17
        Color = clInfoBk
        DataField = 'DIR_COMPLETA_N'
        DataSource = DMServirPedidosVenta.DSQMDireccion
        ParentColor = False
      end
      object DBTLocalidad: TDBText
        Left = 1020
        Top = 16
        Width = 277
        Height = 17
        Color = clInfoBk
        DataField = 'LOCALIDAD'
        DataSource = DMServirPedidosVenta.DSQMDireccion
        ParentColor = False
      end
      object DBTPais: TDBText
        Left = 1136
        Top = 31
        Width = 161
        Height = 17
        Color = clInfoBk
        DataField = 'PAIS_NOMBRE'
        DataSource = DMServirPedidosVenta.DSQMDireccion
        ParentColor = False
      end
      object DBTCodigoPostal: TDBText
        Left = 960
        Top = 16
        Width = 57
        Height = 17
        Color = clInfoBk
        DataField = 'CODIGO_POSTAL'
        DataSource = DMServirPedidosVenta.DSQMDireccion
        ParentColor = False
      end
      object DBTProvincia: TDBText
        Left = 960
        Top = 31
        Width = 173
        Height = 17
        Color = clInfoBk
        DataField = 'LOCALIDAD'
        DataSource = DMServirPedidosVenta.DSQMDireccion
        ParentColor = False
      end
      object LCantidadPedidos: TLFLabel
        Left = 1
        Top = 108
        Width = 104
        Height = 13
        Caption = 'Cant. Pedidos: %d'
        FocusControl = ERutaFiltro
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LOrigenDocumento: TLabel
        Left = 360
        Top = 30
        Width = 57
        Height = 13
        Caption = 'Origen Doc.'
      end
      object LFechaDestino: TLFLabel
        Left = 9
        Top = 60
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Doc.'
        FocusControl = DEFechaDestino
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LFechaContabilizacion: TLFLabel
        Left = 6
        Top = 82
        Width = 70
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Cont.'
        FocusControl = DEFechaContabilizacion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LExpedicion: TLFLabel
        Left = 864
        Top = 51
        Width = 92
        Height = 13
        Alignment = taCenter
        AutoSize = False
        Caption = 'Expedicion'
        FocusControl = DEExpedicion
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LUltimaEtiqueta: TLFLabel
        Left = 962
        Top = 51
        Width = 168
        Height = 13
        AutoSize = False
        Caption = 'Ultima Etiqueta'
        FocusControl = EPedidoFiltroDesde
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LInfoUltimaEtiqueta: TLabel
        Left = 961
        Top = 66
        Width = 171
        Height = 31
        AutoSize = False
        Caption = 'Ultima Etiqueta'
        Color = clInfoBk
        ParentColor = False
      end
      object DBEIdDoc: TLFDbedit
        Left = 888
        Top = 24
        Width = 49
        Height = 21
        TabStop = False
        DataField = 'ID_S'
        DataSource = DMServirPedidosVenta.DSQMPedidos
        TabOrder = 22
        OnChange = DBEIdDocChange
      end
      object EPedidoFiltroHasta: TLFEdit
        Left = 173
        Top = 4
        Width = 92
        Height = 21
        TabOrder = 1
        OnKeyUp = EFiltroKeyUp
      end
      object EPedidoFiltroDesde: TLFEdit
        Left = 80
        Top = 4
        Width = 92
        Height = 21
        TabOrder = 0
        OnKeyUp = EFiltroKeyUp
      end
      object EClienteFiltroDesde: TLFEditFind2000
        Left = 312
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 2
        OnChange = EClienteFiltroDesdeChange
        OnKeyUp = EFiltroKeyUp
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
        Filtros = []
      end
      object EClienteFiltroHasta: TLFEditFind2000
        Left = 522
        Top = 4
        Width = 57
        Height = 21
        TabOrder = 4
        OnChange = EClienteFiltroHastaChange
        OnKeyUp = EFiltroKeyUp
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
        Filtros = []
      end
      object EClienteDesde: TLFEdit
        Left = 370
        Top = 4
        Width = 146
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
      object EClienteHasta: TLFEdit
        Left = 580
        Top = 4
        Width = 146
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 5
      end
      object CBSoloListoPreparar: TLFCheckBox
        Left = 730
        Top = 5
        Width = 140
        Height = 17
        Caption = 'Solo Listo Preparacion'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBSoloListoPrepararChange
      end
      object ERutaFiltro: TLFEdit
        Left = 676
        Top = 26
        Width = 50
        Height = 21
        TabOrder = 11
        OnKeyUp = EFiltroKeyUp
      end
      object CBOrdenRuta: TLFCheckBox
        Left = 730
        Top = 28
        Width = 140
        Height = 17
        Caption = 'Ordenados por Ruta'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 12
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBSoloListoPrepararChange
      end
      object DEFechaPrevDesde: TLFDateEdit
        Left = 80
        Top = 26
        Width = 92
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 7
      end
      object DEFechaPrevHasta: TLFDateEdit
        Left = 173
        Top = 26
        Width = 92
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 8
      end
      object BAlbaranYEtiqTransporte: TButton
        Left = 864
        Top = 0
        Width = 92
        Height = 49
        Hint = 'Traspasa a Albaran y genera peticion de transporte'
        Caption = 'ALB + GLS'
        TabOrder = 20
        OnClick = BAlbaranYEtiqTransporteClick
      end
      object BVisualizarEtiqGLS: TButton
        Left = 1136
        Top = 49
        Width = 76
        Height = 49
        Hint = 'Visualizar ultima etiqueta GLS'
        Caption = 'Ver'
        TabOrder = 23
        OnClick = BVisualizarEtiqGLSClick
      end
      object EFOrigenDocumento: TLFEditFind2000
        Left = 420
        Top = 26
        Width = 50
        Height = 21
        TabOrder = 9
        OnChange = EFOrigenDocumentoChange
        OnKeyUp = EFiltroKeyUp
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'TIPO'
        CampoNum = 'TIPO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_ORIGENES_DOCUMENTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TIPO')
        Filtros = []
      end
      object EOrigenDocumentoTitulo: TLFEdit
        Left = 471
        Top = 26
        Width = 154
        Height = 21
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object CBFechaEntregaPrev: TLFCheckBox
        Left = 174
        Top = 59
        Width = 100
        Height = 17
        Hint = 'Cerrar factura creada'
        Caption = 'Fec. Entr. Prev.'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 14
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBFechaEntregaPrevChange
      end
      object DEFechaDestino: TLFDateEdit
        Left = 80
        Top = 57
        Width = 92
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 13
      end
      object CBFechaPedido: TLFCheckBox
        Left = 273
        Top = 59
        Width = 71
        Height = 17
        Hint = 'Cerrar factura creada'
        Caption = 'Fec. Ped.'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 15
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBFechaPedidoChange
      end
      object CBCerrarFactura: TLFCheckBox
        Left = 174
        Top = 83
        Width = 100
        Height = 14
        Hint = 'Cerrar factura creada'
        Caption = 'Cerrar Fac.'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 19
        TabStop = True
        Alignment = taLeftJustify
      end
      object seCopiasImprimir: TSpinEdit
        Left = 480
        Top = 56
        Width = 39
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 17
        Value = 1
      end
      object DEFechaContabilizacion: TLFDateEdit
        Left = 80
        Top = 79
        Width = 92
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 18
      end
      object CBImprimirDocDestino: TLFCheckBox
        Left = 353
        Top = 59
        Width = 127
        Height = 17
        Hint = 'Cerrar factura creada'
        Caption = 'Imprimir Doc. Destino'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 16
        TabStop = True
        Alignment = taLeftJustify
      end
      object BVerDetalle: TButton
        Left = 1288
        Top = 96
        Width = 68
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Ver Det.'
        TabOrder = 25
        OnClick = BVerDetalleClick
      end
      object DEExpedicion: TLFDateEdit
        Left = 864
        Top = 66
        Width = 92
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 21
      end
      object BReimprimirEtiqGLS: TButton
        Tag = 1
        Left = 1216
        Top = 49
        Width = 76
        Height = 49
        Hint = 'Reimprimir ultima etiqueta GLS'
        Caption = 'Imprimir'
        TabOrder = 24
        OnClick = BVisualizarEtiqGLSClick
      end
    end
    object PNLDetalle: TLFPanel
      Left = 848
      Top = 153
      Width = 513
      Height = 177
      Align = alRight
      BevelOuter = bvNone
      Constraints.MinWidth = 425
      TabOrder = 2
      Visible = False
      object Splitter1: TSplitter
        Left = 0
        Top = 64
        Width = 513
        Height = 8
        Cursor = crVSplit
        Align = alBottom
        Color = clGray
        ParentColor = False
      end
      object DBGDetalle: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 513
        Height = 64
        Align = alClient
        DataSource = DMServirPedidosVenta.DSQMDetalle
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGFPedidosCellClick
        OnDrawColumnCell = DBGDetalleDrawColumnCell
        OnDblClick = DBGDetalleDblClick
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
        Transaction = DMMain.TLocal
        BuscarNums = False
        Campos.Strings = (
          'CANAL_DST_PEC'
          'SERIE_DST_PEC'
          'TIPO_DST_PEC')
        CamposAMostrar.Strings = (
          'CANAL_DST_PEC'
          '0'
          'SERIE_DST_PEC'
          '0'
          'TIPO_DST_PEC'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          ''
          ''
          '')
        CamposDesplegar.Strings = (
          '1'
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'CANAL_DST_PEC'
          'CLIENTE'
          'DOCUMENTO_DESTINO'
          'ENTRADA_AGRUPACION'
          'ESTADO'
          'FECHA'
          'NOMBRE_R_SOCIAL'
          'RIG'
          'RUTA'
          'SERIE'
          'SERIE_DST_PEC'
          'TIPO_DST_PEC'
          'FECHA_ENTREGA_PREV'
          'Z_OBSERVACION'
          'PEDIDO_CLIENTE'
          'LISTO_PARA_PREPARAR')
        ColumnasCheckBoxes.Strings = (
          'ENTRADA_AGRUPACION'
          'LISTO_PARA_PREPARAR')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'CANAL'
          'SERIE'
          'TIPO')
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tablas.Strings = (
          'VER_CANALES_ACTIVOS'
          'VER_SERIES'
          'SYS_TIPO_MOVIMIENTO')
        Acciones.Strings = (
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGFPedidosBusqueda
        Planes.Strings = (
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'CANAL'
          'SERIE'
          'TIPO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
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
            FieldName = 'ALMACEN'
            ReadOnly = True
            Width = 33
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES'
            ReadOnly = True
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LOTE_SIMPLE'
            Width = 146
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ARTICULO'
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            ReadOnly = True
            Width = 250
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PRECIO'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES_PENDIENTES'
            Width = 50
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
            FieldName = 'DIRECCION_ENTREGA'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PRO_NUM_PLANO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_1'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_2'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_3'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_4'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_5'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_6'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_7'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALFA_8'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PESO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PESO_TOTAL'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PESO_REAL'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK_ALM'
            Width = 60
            Visible = True
          end>
      end
      object PNLTrasporte: TLFPanel
        Left = 0
        Top = 72
        Width = 513
        Height = 105
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object PNLTrasportes: TLFPanel
          Left = 0
          Top = 0
          Width = 425
          Height = 105
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object LTransportista: TLFLabel
            Left = 6
            Top = 6
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object LPortes: TLFLabel
            Left = 37
            Top = 28
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object LServicio: TLFLabel
            Left = 29
            Top = 49
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Servicio'
          end
          object LBultos: TLFLabel
            Left = 38
            Top = 72
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bultos'
          end
          object LHorario: TLFLabel
            Left = 233
            Top = 47
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
          end
          object LPeso: TLFLabel
            Left = 199
            Top = 70
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso Un Bulto'
          end
          object EFTransportista: TLFEditFind2000
            Left = 71
            Top = 2
            Width = 66
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = EFTransportistaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETransportista: TLFEdit
            Left = 138
            Top = 2
            Width = 279
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
          object CBPortes: TComboBox
            Left = 71
            Top = 24
            Width = 145
            Height = 21
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Items.Strings = (
              ''
              'P - Pagados'
              'D - Debidos')
          end
          object CBServicio: TComboBox
            Left = 71
            Top = 46
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 3
            Text = '13 - Internacional Economy'
            Items.Strings = (
              '1 - 24 Horas (Courier)'
              '37 - Economy (Economy)'
              '12 - Internacional Express'
              '13 - Internacional Economy'
              '74 - Internacional'
              '96 - Bussines Parcel'
              '301 - Espa'#241'a'
              '3074 - Internacional'
              '3037 - Economy (Espa'#241'a)')
          end
          object EBultos: TLFEdit
            Left = 71
            Top = 68
            Width = 66
            Height = 21
            TabOrder = 4
            Text = '1'
          end
          object CBHorario: TComboBox
            Left = 273
            Top = 44
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 5
            Text = '18 - Economy'
            Items.Strings = (
              '2 - ASM14'
              '3 - 24 Horas (ASM24)'
              '18 - Economy'
              '19 - ParcelShop'
              '37 - 72 Horas'
              '98 - Economy'
              '99 - 24 Horas Internacional')
          end
          object EPeso: TLFEdit
            Left = 273
            Top = 66
            Width = 66
            Height = 21
            TabOrder = 6
            Text = '0'
          end
        end
        object PNLImagenArticulo: TLFPanel
          Left = 425
          Top = 0
          Width = 88
          Height = 105
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object IImagenArticulo: TImage
            Left = 0
            Top = 0
            Width = 88
            Height = 105
            Align = alClient
            Proportional = True
            Stretch = True
          end
          object DBEIdArt: TLFDbedit
            Left = 0
            Top = -1
            Width = 1
            Height = 21
            DataField = 'ID_A'
            DataSource = DMServirPedidosVenta.DSQMDetalle
            TabOrder = 0
            OnChange = DBEIdArtChange
          end
        end
      end
    end
    object PNLPedidos: TLFPanel
      Left = 2
      Top = 153
      Width = 838
      Height = 177
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinWidth = 425
      TabOrder = 3
      object splitter: TSplitter
        Left = 0
        Top = 69
        Width = 838
        Height = 8
        Cursor = crVSplit
        Align = alBottom
        Color = clGray
        ParentColor = False
      end
      object DBGFPedidos: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 838
        Height = 69
        Align = alClient
        DataSource = DMServirPedidosVenta.DSQMPedidos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
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
        Transaction = DMMain.TLocal
        BuscarNums = False
        Campos.Strings = (
          'CANAL_DST_PEC'
          'SERIE_DST_PEC'
          'TIPO_DST_PEC')
        CamposAMostrar.Strings = (
          'CANAL_DST_PEC'
          '0'
          'SERIE_DST_PEC'
          '0'
          'TIPO_DST_PEC'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          ''
          ''
          '')
        CamposDesplegar.Strings = (
          '1'
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'CANAL_DST_PEC'
          'CLIENTE'
          'DOCUMENTO_DESTINO'
          'ENTRADA_AGRUPACION'
          'ESTADO'
          'FECHA'
          'NOMBRE_R_SOCIAL'
          'RIG'
          'RUTA'
          'SERIE'
          'SERIE_DST_PEC'
          'TIPO_DST_PEC'
          'FECHA_ENTREGA_PREV'
          'Z_OBSERVACION'
          'PEDIDO_CLIENTE'
          'LISTO_PARA_PREPARAR')
        ColumnasCheckBoxes.Strings = (
          'ENTRADA_AGRUPACION'
          'LISTO_PARA_PREPARAR')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'CANAL'
          'SERIE'
          'TIPO')
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tablas.Strings = (
          'VER_CANALES_ACTIVOS'
          'VER_SERIES'
          'SYS_TIPO_MOVIMIENTO')
        Acciones.Strings = (
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGFPedidosBusqueda
        Planes.Strings = (
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'CANAL'
          'SERIE'
          'TIPO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'ENTRADA_AGRUPACION'
            Width = 30
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'EJERCICIO'
            Width = 45
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SERIE'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RIG'
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
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_ENTREGA_PREV'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ESTADO'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LIQUIDO'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TOTAL_PRESTASHOP'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SU_REFERENCIA'
            ReadOnly = True
            Width = 120
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CLIENTE'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 250
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE_COMERCIAL'
            Width = 250
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOM_CONTACTO'
            ReadOnly = True
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANAL_DST_PEC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE_DST_PEC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DST_PEC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 50
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DOCUMENTO_DESTINO'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RUTA'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RUTA_ORDEN'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PEDIDO_CLIENTE'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LISTO_PARA_PREPARAR'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TRANSPORTISTA'
            ReadOnly = True
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_TRANSPORTISTA'
            ReadOnly = True
            Width = 150
            Visible = True
          end>
      end
      object PNLAvisos: TLFPanel
        Left = 0
        Top = 77
        Width = 838
        Height = 100
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        object LAvisos: TLFLabel
          Left = 0
          Top = 0
          Width = 838
          Height = 13
          Align = alTop
          Caption = 'Avisos'
        end
        object DBMAvisos: TLFDBMemo
          Left = 0
          Top = 13
          Width = 838
          Height = 87
          Align = alClient
          BorderStyle = bsNone
          Color = clInfoBk
          DataField = 'AVISOS'
          DataSource = DMServirPedidosVenta.DSxClientes
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 1363
  end
  inherited CEMain: TControlEdit
    Left = 832
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 864
    Top = 0
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
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
    Left = 896
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBCerrarFactura.Checked'
      'CBSoloListoPreparar.Checked'
      'CBImprimirDocDestino.Checked'
      'CBOrdenRuta.Checked'
      'CBFechaEntregaPrev.Checked'
      'CBFechaPedido.Checked'
      'BVerDetalle.Tag'
      'PNLDetalle.Width'
      'EFTransportista.Text'
      'seCopiasImprimir.Value')
    Left = 928
    Top = 0
  end
  object tmrImagenArticulo: TTimer
    Enabled = False
    Interval = 250
    OnTimer = tmrImagenArticuloTimer
    Left = 1304
    Top = 272
  end
end
