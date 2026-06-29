inherited FMNecesidadMateraPrima: TFMNecesidadMateraPrima
  Width = 1130
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Necesidad Matera Prima'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1120
    Height = 447
    inherited TBMain: TLFToolBar
      Width = 1116
      inherited EPMain: THYMEditPanel
        Width = 22
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object PNLAlmacenStock: TLFPanel
        Left = 22
        Top = 0
        Width = 123
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LAlmacenStock: TLFLabel
          Left = 6
          Top = 4
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Alm. Stock'
        end
        object EFAlmacenStock: TLFEditFind2000
          Left = 61
          Top = 0
          Width = 58
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = []
        end
      end
      object PNLFiltroArticulo: TLFPanel
        Left = 145
        Top = 0
        Width = 123
        Height = 22
        BevelOuter = bvNone
        TabOrder = 4
        object LArticulo: TLFLabel
          Left = 22
          Top = 4
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Articulo'
        end
        object EFArticulo: TLFEditFind2000
          Left = 61
          Top = 0
          Width = 58
          Height = 21
          TabOrder = 0
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
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object PNLFiltroFamilia: TLFPanel
        Left = 268
        Top = 0
        Width = 140
        Height = 22
        BevelOuter = bvNone
        TabOrder = 5
        object LFamilia: TLFLabel
          Left = 25
          Top = 4
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Familia'
        end
        object EFFamilia: TLFEditFind2000
          Left = 61
          Top = 0
          Width = 58
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
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
          OnBusqueda = EFFamiliaBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object BFiltrarFamilia: TButton
          Left = 122
          Top = 0
          Width = 18
          Height = 21
          Hint = 'Filtrar Familia'
          Caption = 'F'
          TabOrder = 1
          OnClick = BFiltrarFamiliaClick
        end
      end
      object ButtSep1: TToolButton
        Left = 408
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfStocks: TToolButton
        Left = 416
        Top = 0
        Action = AInfStocks
      end
      object CBComprasDeNecesidades: TLFCheckBox
        Left = 439
        Top = 0
        Width = 184
        Height = 22
        Caption = 'Solo Compras de Necesidades'
        ClicksDisabled = False
        ColorCheck = 57088
        Layout = checkboxRight
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object ButtSep2: TToolButton
        Left = 623
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object ProgressBar: TProgressBar
        Left = 631
        Top = 0
        Width = 150
        Height = 22
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 1
        Visible = False
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1116
      Height = 417
      ActivePage = TSSimulacionPedidosCompra
      Align = alClient
      OwnerDraw = True
      TabIndex = 5
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSSeleccionPedidos: TTabSheet
        Caption = 'Selec. Pedidos'
        object TBSeleccionPedido: TLFToolBar
          Left = 0
          Top = 0
          Width = 1108
          Height = 29
          ButtonHeight = 25
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavSeleccionPedido: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 25
            DataSource = DMNecesidadMateraPrima.DSxPedidos
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
          object TButtSep1: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtMarcarTodosPedidos: TToolButton
            Left = 248
            Top = 0
            Caption = 'Marcar Todos Pedidos'
            ImageIndex = 146
            OnClick = TButtMarcarTodosPedidosClick
          end
          object TButtDesmarcarTodosPedidos: TToolButton
            Left = 271
            Top = 0
            Caption = 'Desmarcar Todos Pedidos'
            ImageIndex = 147
            OnClick = TButtDesmarcarTodosPedidosClick
          end
          object TButtSep2: TToolButton
            Left = 294
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtMostrarFiltros: TToolButton
            Left = 302
            Top = 0
            Hint = 'Mostrar los filtros de marcado'
            Caption = 'Mostrar Filtros'
            ImageIndex = 5
            OnClick = TButtMostrarFiltrosClick
          end
          object CBTodosLosPedidos: TLFCheckBox
            Left = 325
            Top = 0
            Width = 121
            Height = 25
            Caption = 'Todos los Pedidos'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBTodosLosPedidosChange
          end
        end
        object PNLSeleccionPedidos: TLFPanel
          Left = 0
          Top = 29
          Width = 1108
          Height = 360
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBFiltroFechaEntrega: TLFToolBar
            Left = 0
            Top = 0
            Width = 1108
            Height = 25
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Visible = False
            Separators = True
            object TButtAnyadirSelecFechas: TToolButton
              Left = 0
              Top = 0
              Hint = 'A'#241'adir la selecci'#243'n por Fechas'
              ImageIndex = 71
              ParentShowHint = False
              ShowHint = True
              OnClick = TButtAnyadirSelecFechasClick
            end
            object TButtQuitarSelecFechas: TToolButton
              Left = 23
              Top = 0
              Hint = 'Quitar la selecci'#243'n por Fechas'
              ImageIndex = 70
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
          object TBFiltroProveedores: TLFToolBar
            Left = 0
            Top = 25
            Width = 1108
            Height = 25
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Visible = False
            Separators = True
            object TButtAnyadirSelecClientes: TToolButton
              Left = 0
              Top = 0
              Hint = 'A'#241'adir la selecci'#243'n por Clientes'
              ImageIndex = 71
              ParentShowHint = False
              ShowHint = True
              OnClick = TButtAnyadirSelecClientesClick
            end
            object TButtQuitarSelecClientes: TToolButton
              Left = 23
              Top = 0
              Hint = 'Quitar la selecci'#243'n por Clientes'
              ImageIndex = 70
              ParentShowHint = False
              ShowHint = True
              OnClick = TButtQuitarSelecClientesClick
            end
            object PNLClientes: TLFPanel
              Left = 46
              Top = 0
              Width = 803
              Height = 22
              BevelOuter = bvNone
              TabOrder = 0
              object LDesdeCliente: TLFLabel
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
              object LHastaCliente: TLFLabel
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
              object LCliente: TLFLabel
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
              object EFClienteDesde: TLFEditFind2000
                Left = 152
                Top = 0
                Width = 59
                Height = 21
                TabOrder = 0
                OnChange = EFClienteDesdeChange
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
              object EFClienteHasta: TLFEditFind2000
                Left = 498
                Top = 0
                Width = 59
                Height = 21
                TabOrder = 1
                OnChange = EFClienteHastaChange
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
              object ETituloClienteDesde: TLFEdit
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
              object ETituloClienteHasta: TLFEdit
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
          object DBGSeleccionPedido: TDBGridFind2000
            Left = 0
            Top = 50
            Width = 1108
            Height = 310
            Align = alClient
            DataSource = DMNecesidadMateraPrima.DSxPedidos
            TabOrder = 2
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGSeleccionPedidoDblClick
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
            CamposAOrdernar.Strings = (
              'ARTICULO'
              'CANAL'
              'CLIENTE'
              'EJERCICIO'
              'EMPRESA'
              'ID_DETALLES_S'
              'ID_S'
              'LINEA'
              'NOMBRE_R_SOCIAL'
              'RIG'
              'SERIE'
              'TIPO'
              'TITULO'
              'U_PENDIENTES'
              'U_SERVIDAS'
              'UNIDADES'
              'FECHA_ENTREGA_PREV'
              'FAMILIA'
              'SUBFAMILIA'
              'ENTRADA_AGRUPACION'
              'FECHA')
            ColumnasCheckBoxes.Strings = (
              'ENTRADA_AGRUPACION')
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
                Width = 36
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 41
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
                ReadOnly = True
                Width = 31
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
                FieldName = 'CLIENTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE_R_SOCIAL'
                ReadOnly = True
                Width = 241
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
                Width = 309
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENTRADA_AGRUPACION'
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'U_PENDIENTES'
                ReadOnly = True
                Width = 87
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'U_SERVIDAS'
                ReadOnly = True
                Width = 72
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
                FieldName = 'FAMILIA'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SUBFAMILIA'
                ReadOnly = True
                Width = 65
                Visible = True
              end>
          end
        end
      end
      object TSPedidosVenta: TTabSheet
        Caption = 'Pedidos Venta'
        object sgPedidosVenta: TStringGrid
          Left = 0
          Top = 0
          Width = 1108
          Height = 389
          Align = alClient
          ColCount = 9
          DefaultRowHeight = 18
          FixedCols = 8
          FixedRows = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDblClick = sgPedidosVentaDblClick
          OnDrawCell = sgDrawCell
          OnSelectCell = SGSelectCell
          RowHeights = (
            18
            18
            18
            18
            18)
        end
      end
      object TSPedidosCompra: TTabSheet
        Caption = 'Pedidos Compra'
        ImageIndex = 1
        object sgPedidosCompra: TStringGrid
          Left = 0
          Top = 0
          Width = 1108
          Height = 389
          Align = alClient
          ColCount = 9
          DefaultRowHeight = 18
          FixedCols = 8
          FixedRows = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDblClick = sgPedidosCompraDblClick
          OnDrawCell = sgDrawCell
          OnSelectCell = SGSelectCell
          RowHeights = (
            18
            18
            18
            18
            19)
        end
      end
      object TSNecesidades: TTabSheet
        Caption = 'Necesidades'
        ImageIndex = 1
        object sgNecesidades: TStringGrid
          Left = 0
          Top = 0
          Width = 1108
          Height = 389
          Align = alClient
          ColCount = 9
          DefaultRowHeight = 18
          FixedCols = 8
          FixedRows = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDrawCell = sgDrawCell
          OnSelectCell = SGSelectCell
          RowHeights = (
            18
            18
            18
            18
            18)
        end
      end
      object TSStockFuturo: TTabSheet
        Caption = 'Stock Futuro'
        ImageIndex = 3
        object sgStockFuturo: TStringGrid
          Left = 0
          Top = 0
          Width = 1108
          Height = 389
          Align = alClient
          ColCount = 9
          DefaultRowHeight = 18
          FixedCols = 8
          FixedRows = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDrawCell = sgDrawCell
          OnSelectCell = SGSelectCell
          RowHeights = (
            18
            18
            18
            18
            18)
        end
      end
      object TSSimulacionPedidosCompra: TTabSheet
        Caption = 'Simulaci'#243'n'
        object SGSimulacion: TStringGrid
          Left = 0
          Top = 0
          Width = 1108
          Height = 320
          Align = alClient
          ColCount = 9
          DefaultRowHeight = 18
          FixedCols = 8
          FixedRows = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDblClick = SGSimulacionDblClick
          OnDrawCell = sgDrawCell
          OnSelectCell = SGSelectCell
          RowHeights = (
            18
            18
            18
            18
            18)
        end
        object PNLDatosPropuesta: TLFPanel
          Left = 0
          Top = 320
          Width = 1108
          Height = 69
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object LPrueba: TLFLabel
            Left = 1080
            Top = 0
            Width = 28
            Height = 69
            Align = alRight
            Caption = 'Datos'
          end
          object DBGProveedoresArticulo: TNsDBGrid
            Left = 513
            Top = 0
            Width = 567
            Height = 69
            Align = alClient
            DataSource = DMNecesidadMateraPrima.DSxProveedoresArticulos
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = DBGProveedoresArticuloDblClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PROVEEDOR'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRIORIDAD'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PEDIDO_MINIMO'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PEDIDO_OPTIMO'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'INCR_PEDIDO'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DIAS_ENTREGA'
                ReadOnly = True
                Width = 55
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE_R_SOCIAL'
                ReadOnly = True
                Width = 200
                Visible = True
              end>
          end
          object PNLDatosParaPropuesta: TLFPanel
            Left = 0
            Top = 0
            Width = 513
            Height = 69
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object LUnidades: TLFLabel
              Left = 15
              Top = 29
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unidades'
            end
            object LSerie: TLFLabel
              Left = 36
              Top = 51
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LProveedor: TLFLabel
              Left = 11
              Top = 8
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Proveedor'
            end
            object LFechaEntrega: TLFLabel
              Left = 209
              Top = 27
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'FechaEntrega'
            end
            object LAlmacen: TLFLabel
              Left = 234
              Top = 49
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Almacen'
            end
            object EUnidades: TLFEdit
              Left = 64
              Top = 26
              Width = 105
              Height = 21
              TabOrder = 0
            end
            object EProveedor: TLFEdit
              Left = 170
              Top = 4
              Width = 239
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
              Text = 'EProveedor'
            end
            object EFSerie: TLFEditFind2000
              Left = 64
              Top = 48
              Width = 105
              Height = 21
              TabOrder = 2
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
            object EFProveedor: TLFEditFind2000
              Left = 64
              Top = 4
              Width = 105
              Height = 21
              TabOrder = 3
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
              Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'PROVEEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFAlmacen: TLFEditFind2000
              Left = 279
              Top = 46
              Width = 105
              Height = 21
              TabOrder = 4
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'ALMACEN'
              CampoStr = 'AL_TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_ALMACENES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ALMACEN')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DEFechaEntrega: TLFDateEdit
              Left = 280
              Top = 24
              Width = 129
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 5
            end
            object BOk: TButton
              Left = 427
              Top = 6
              Width = 75
              Height = 25
              Caption = 'Aceptar'
              TabOrder = 6
              OnClick = BOkClick
            end
            object BCancel: TButton
              Left = 427
              Top = 32
              Width = 75
              Height = 25
              Caption = 'Cancelar'
              TabOrder = 7
            end
          end
        end
      end
      object TSRecursos: TTabSheet
        Caption = 'Recursos'
        ImageIndex = 6
        object SGRegursos: TStringGrid
          Left = 0
          Top = 0
          Width = 1108
          Height = 389
          Align = alClient
          ColCount = 9
          DefaultRowHeight = 18
          FixedCols = 8
          FixedRows = 3
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing]
          TabOrder = 0
          OnDrawCell = sgDrawCell
          OnSelectCell = SGSelectCell
          RowHeights = (
            18
            18
            18
            18
            18)
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 1120
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
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Calculos'
      Caption = 'C'#225'lculos'
      ImageIndex = 3
    end
    object ARecalcularPedidosVenta: TAction
      Category = 'Calculos'
      Caption = 'Reclacular Pedidos de Venta'
      ImageIndex = 62
      OnExecute = ARecalcularPedidosVentaExecute
    end
    object ARecalcularPedidosCompra: TAction
      Category = 'Calculos'
      Caption = 'Recalcular Pedidos de Compra'
      ImageIndex = 62
      OnExecute = ARecalcularPedidosCompraExecute
    end
    object ARecalcularNecesidades: TAction
      Category = 'Calculos'
      Caption = 'Recalcular Necesidades'
      ImageIndex = 56
      OnExecute = ARecalcularNecesidadesExecute
    end
    object ARecalcularStockFuturo: TAction
      Category = 'Calculos'
      Caption = 'Recalcular Stock Futuro'
      ImageIndex = 128
      OnExecute = ARecalcularStockFuturoExecute
    end
    object ARecalcularSimulacion: TAction
      Category = 'Calculos'
      Caption = 'Recalcular Simulacion'
      ImageIndex = 45
      OnExecute = ARecalcularSimulacionExecute
    end
    object ARecalcularRecursos: TAction
      Category = 'Calculos'
      Caption = 'Recalcular Recursos'
      ImageIndex = 10
      OnExecute = ARecalcularRecursosExecute
    end
    object ARecalcularTodo: TAction
      Category = 'Calculos'
      Caption = 'Recalcular Todo'
      ImageIndex = 3
      OnExecute = ARecalcularTodoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Exportacion'
      Caption = 'Exportaciones'
      ImageIndex = 36
    end
    object AExportacionExcel: TAction
      Category = 'Exportacion'
      Caption = 'Exportacion a Excel'
      ImageIndex = 42
      OnExecute = AExportacionExcelExecute
    end
    object AOtros: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AInfStocks: TAction
      Category = 'Otros'
      Caption = 'Info. Stocks'
      Hint = 'Informaci'#243'n de Stocks '
      ImageIndex = 1
      OnExecute = AInfStocksExecute
    end
  end
end
