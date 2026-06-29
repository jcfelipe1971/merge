inherited FMDocInfoStocks: TFMDocInfoStocks
  Left = 346
  Top = 164
  Width = 1024
  Height = 640
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Informaci'#243'n de Stocks'
  Constraints.MinHeight = 412
  Constraints.MinWidth = 520
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1014
    Height = 587
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 1010
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButCambiaEquivalente: TToolButton
        Left = 23
        Top = 0
        Hint = 'Seleccinoar Articulo Equivalente'
        Caption = 'Seleccinoar Articulo Equivalente'
        ImageIndex = 43
        OnClick = TButCambiaEquivalenteClick
      end
      object LMargen: TLFLabel
        Left = 46
        Top = 0
        Width = 19
        Height = 22
        AutoSize = False
      end
      object LStockNegativo: TLFLabel
        Left = 65
        Top = 0
        Width = 86
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Stock Negativo'
        Color = clRed
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        Visible = False
        OnClick = LStockNegativoClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 97
      Width = 1010
      Height = 488
      ActivePage = TSStock
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSStock: TTabSheet
        Caption = 'Stock'
        object PNLStocks: TLFPanel
          Left = 0
          Top = 0
          Width = 1002
          Height = 460
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = PNLStocksResize
          object PNLExistenciasPedidos: TLFPanel
            Left = 0
            Top = 0
            Width = 297
            Height = 460
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object PNLExistencias: TLFPanel
              Left = 0
              Top = 0
              Width = 297
              Height = 271
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LTotales: TLFLabel
                Left = 9
                Top = 75
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'TOTALES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LUdsExt: TLFLabel
                Left = 23
                Top = 107
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Uds. Ext.'
              end
              object LSalida: TLFLabel
                Left = 32
                Top = 31
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Salidas'
              end
              object LReservadas: TLFLabel
                Left = 167
                Top = 107
                Width = 37
                Height = 13
                Alignment = taRightJustify
                Caption = 'Reserv.'
              end
              object LPrecioPonderado: TLFLabel
                Left = 162
                Top = 129
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pr.Pond.'
              end
              object LExistencia: TLFLabel
                Left = 1
                Top = 53
                Width = 65
                Height = 13
                Alignment = taRightJustify
                Caption = 'Existencias'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LEntrada: TLFLabel
                Left = 24
                Top = 9
                Width = 42
                Height = 13
                Alignment = taRightJustify
                Caption = 'Entradas'
              end
              object LEnProceso: TLFLabel
                Left = 11
                Top = 129
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'En Proceso'
              end
              object LMinimo: TLFLabel
                Left = 15
                Top = 232
                Width = 51
                Height = 13
                Alignment = taRightJustify
                Caption = 'St. M'#237'nimo'
                Layout = tlCenter
              end
              object LMaximo: TLFLabel
                Left = 152
                Top = 232
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'St. M'#225'ximo'
                Layout = tlCenter
              end
              object LVirtual: TLFLabel
                Left = 29
                Top = 195
                Width = 37
                Height = 13
                Hint = '= [Stock] + [Ped. a Proveedor] - [Ped. de Cliente]'
                Alignment = taRightJustify
                Caption = 'Virtual'
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
              object LPedidoProveedor: TLFLabel
                Left = 154
                Top = 150
                Width = 50
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ped. Prov.'
                Layout = tlCenter
              end
              object LPedidoCliente: TLFLabel
                Left = 27
                Top = 150
                Width = 39
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ped. Cli.'
                Layout = tlCenter
              end
              object LPreparadas: TLFLabel
                Left = 12
                Top = 173
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Preparadas'
                Layout = tlCenter
              end
              object LReal: TLFLabel
                Left = 177
                Top = 195
                Width = 27
                Height = 13
                Hint = '= [Stock] - [Ped. de Cliente]'
                Alignment = taRightJustify
                Caption = 'Real'
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
              object LInfoVirtual: TLFLabel
                Left = 0
                Top = 211
                Width = 150
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '= [Stock] + [PedProv] - [PedCli]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
              end
              object LInfoReal: TLFLabel
                Left = 168
                Top = 211
                Width = 121
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '= [Stock] - [PedCli]'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGray
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
              end
              object DBEValor_Salidas: TLFDbedit
                Left = 152
                Top = 27
                Width = 136
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'VALOR_SALIDAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 0
              end
              object DBEValor_Existencias: TLFDbedit
                Left = 152
                Top = 49
                Width = 136
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'VALOR_EXISTENCIAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object DBEValor_Entradas: TLFDbedit
                Left = 152
                Top = 5
                Width = 136
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'VALOR_ENTRADAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 2
              end
              object DBEUdsExt: TLFDbedit
                Left = 70
                Top = 103
                Width = 80
                Height = 21
                TabStop = False
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'EXISTENCIAS_EXT'
                DataSource = DMDocInfoStocks.DSxArtStocks
                ReadOnly = True
                TabOrder = 3
              end
              object DBESalidas: TLFDbedit
                Left = 70
                Top = 27
                Width = 75
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'SALIDAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 4
              end
              object DBEReservadas: TLFDbedit
                Left = 208
                Top = 103
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'RESERVADAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                ReadOnly = True
                TabOrder = 5
              end
              object DBEPrecioPonderado: TLFDbedit
                Left = 208
                Top = 125
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'PMP'
                DataSource = DMDocInfoStocks.DSxArtStocks
                ReadOnly = True
                TabOrder = 6
              end
              object DBEExistTotales: TLFDbedit
                Left = 70
                Top = 71
                Width = 218
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'TOTAL'
                DataSource = DMDocInfoStocks.DSxArtStocks
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 7
              end
              object DBEExistencias: TLFDbedit
                Left = 70
                Top = 49
                Width = 75
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'EXISTENCIAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 8
              end
              object DBEEntradas: TLFDbedit
                Left = 70
                Top = 5
                Width = 75
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'ENTRADAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 9
              end
              object DBEEnProceso: TLFDbedit
                Left = 70
                Top = 125
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'EN_PROCESO_PROD'
                DataSource = DMDocInfoStocks.DSxArtStocks
                ReadOnly = True
                TabOrder = 10
              end
              object DBEStockMaximo: TLFDbedit
                Left = 208
                Top = 228
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'STOCK_MAXIMO'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 11
              end
              object DBEStockMinimo: TLFDbedit
                Left = 70
                Top = 228
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'STOCK_MINIMO'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 12
              end
              object DBEVirtual: TLFDbedit
                Left = 70
                Top = 191
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'STOCK_VIRTUAL'
                DataSource = DMDocInfoStocks.DSxArtStocks
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 13
              end
              object DBEPedidosDeCliente: TLFDbedit
                Left = 70
                Top = 147
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'PEDIDOS_D_CLI'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 14
                OnChange = DBEResaltaValor
              end
              object DBEPedidosAProveedor: TLFDbedit
                Left = 208
                Top = 147
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'PEDIDOS_A_PRO'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 15
                OnChange = DBEResaltaValor
              end
              object DBEPreparadas: TLFDbedit
                Left = 70
                Top = 169
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'PREPARADAS'
                DataSource = DMDocInfoStocks.DSxArtStocks
                TabOrder = 16
                OnChange = DBEResaltaValor
              end
              object PNLStockTiendaVirtual: TLFPanel
                Left = 0
                Top = 251
                Width = 297
                Height = 20
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 17
                object LStockTiendaVirtual: TLFLabel
                  Left = 210
                  Top = -3
                  Width = 75
                  Height = 21
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = '0,00'
                  Color = clInfoBk
                  ParentColor = False
                  Layout = tlCenter
                end
                object LSTV: TLFLabel
                  Left = 109
                  Top = 0
                  Width = 96
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Stock Tienda Virtual'
                  Layout = tlCenter
                end
              end
              object DBEStockReal: TLFDbedit
                Left = 208
                Top = 191
                Width = 80
                Height = 21
                BevelWidth = 2
                Color = clInfoBk
                DataField = 'STOCK_REAL'
                DataSource = DMDocInfoStocks.DSxArtStocks
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 18
              end
            end
            object PNLImagen: TLFPanel
              Left = 0
              Top = 271
              Width = 297
              Height = 189
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Imagen: TImage
                Left = 0
                Top = 0
                Width = 297
                Height = 189
                Align = alClient
                AutoSize = True
                Center = True
                IncrementalDisplay = True
                Proportional = True
                Stretch = True
                OnDblClick = ImagenDblClick
              end
            end
          end
          object PNLStockAlmacenes: TLFPanel
            Left = 297
            Top = 0
            Width = 705
            Height = 460
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object Splitter1: TSplitter
              Left = 0
              Top = 349
              Width = 705
              Height = 8
              Cursor = crVSplit
              Align = alBottom
              Color = clAppWorkSpace
              ParentColor = False
              OnMoved = Splitter1Moved
            end
            object DBGFAlmacenes: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 705
              Height = 349
              Align = alClient
              Color = clInfoBk
              DataSource = DMDocInfoStocks.DSxArtStocks2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGFAlmacenesDrawColumnCell
              OnDblClick = DBGFAlmacenesDblClick
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
              IndiceBitmapAscendente = 0
              IndiceBitmapChecked = -1
              IndiceBitmapDescendente = 0
              BaseDeDatos = DMMain.DataBase
              BuscarNums = False
              CampoAOrdenarColor = clInfoBk
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
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_ALM'
                  Width = 170
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANAL'
                  Width = 35
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXISTENCIAS'
                  Title.Alignment = taRightJustify
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXISTENCIAS_REALES'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_U_LOGISTICA'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_LOGISTICAS'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXISTENCIAS_U_LOGISTICAS'
                  Width = 90
                  Visible = True
                end>
            end
            object DBGFTarifa: TDBGridFind2000
              Left = 0
              Top = 357
              Width = 705
              Height = 103
              Align = alBottom
              Color = clInfoBk
              DataSource = DMDocInfoStocks.DSxTarifa
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGFAlmacenesDrawColumnCell
              OnDblClick = DBGFAlmacenesDblClick
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
                'TARIFA'
                'TITULO')
              ColumnasCheckBoxes.Strings = (
                'BLOQUEADO'
                'ACTIVA')
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
              OrdenMultiple = True
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TARIFA'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 180
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO_VENTA'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MARGEN_PC'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MARGEN_PV'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'BLOQUEADO'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_COMPRA'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO_COMPRA'
                  Width = 67
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO_COSTE'
                  Width = 67
                  Visible = True
                end>
            end
          end
        end
      end
      object TSUbicacion: TTabSheet
        Caption = 'Ubicacion'
        ImageIndex = 1
        object DBGUbicaciones: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1002
          Height = 460
          Align = alClient
          DataSource = DMDocInfoStocks.DSQMStockUbicaciones
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Color = clYellow
              Expanded = False
              FieldName = 'EXISTENCIAS'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CALLE'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTANTERIA'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REPISA'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'POSICION'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_COMP'
              Width = 215
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMPOSICION'
              Width = 120
              Visible = True
            end>
        end
      end
      object TSLotes: TTabSheet
        Caption = 'Lotes'
        ImageIndex = 2
        object DBGLotes: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1002
          Height = 460
          Align = alClient
          DataSource = DMDocInfoStocks.DSQMNroSerieLote
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
          Transaction = DMDocInfoStocks.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clYellow
              Expanded = False
              FieldName = 'STOCK'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_LOTE'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LOTE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_UBICACION'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CALLE'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTANTERIA'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'REPISA'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'POSICION'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMPOSICION'
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Width = 215
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CLASIFICACION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'F_ENVASADO'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'F_CADUCIDAD'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'F_FABRICACION'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'AUTO_REETIQUETADO'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CODIGO'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_A_UBICACION'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VOLUMEN_MAX'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DIAMETRO_MAX'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_MAX'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'VOLUMEN_ACC'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_ACC'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DIAMETRO_ACC'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'GENERAL'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_ACC'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SECTOR'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DISPONIBLE'
              Width = 60
              Visible = True
            end>
        end
      end
      object TSNroSerieKRI: TTabSheet
        Caption = 'Nro. Serie'
        ImageIndex = 3
        object DBGNroSerieKRI: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1002
          Height = 460
          Align = alClient
          DataSource = DMDocInfoStocks.DSQMNroSerieKRI
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
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
              FieldName = 'NRO_SERIE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN_ENT'
              Width = 70
              Visible = True
            end>
        end
      end
      object TSNroSerie: TTabSheet
        Caption = 'Nro. Serie'
        object DBGNroSerie: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1002
          Height = 460
          Align = alClient
          DataSource = DMDocInfoStocks.DSQMNroSerie
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
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
              FieldName = 'NSERIE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_CADUCIDAD'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_GARANTIA_CLIENTE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_GARANTIA_PROVEEDOR'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CLIENTE_REPARACION'
              Visible = True
            end>
        end
      end
      object TSStockFuturo: TTabSheet
        Caption = 'Stock a Futuro'
        object DBGStockfuturo: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 1002
          Height = 436
          Align = alClient
          Color = clInfoBk
          DataSource = DMDocInfoStocks.DSQMStockFuturo
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGStockfuturoDrawColumnCell
          OnDblClick = DBGStockfuturoDblClick
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOCUMENTO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Width = 70
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'STOCK'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CLI_PRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA_PREV'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA_PREV_DET'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CONF'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CONF_DET'
              Width = 90
              Visible = True
            end>
        end
        object TBStockFuturo: TLFToolBar
          Left = 0
          Top = 0
          Width = 1002
          Height = 24
          AutoSize = True
          EdgeBorders = []
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavStockFuturo: THYMNavigator
            Left = 0
            Top = 2
            Width = 125
            Height = 22
            DataSource = DMDocInfoStocks.DSQMStockFuturo
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
          object ToolButton12: TToolButton
            Left = 125
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object LColorLanzada: TLFLabel
            Left = 133
            Top = 2
            Width = 70
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Lanzada'
            Color = clYellow
            ParentColor = False
            Layout = tlCenter
          end
          object LColorReservada: TLFLabel
            Left = 203
            Top = 2
            Width = 70
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Reservada'
            Color = clSkyBlue
            ParentColor = False
            Layout = tlCenter
          end
          object LColorCerradaParcialmente: TLFLabel
            Left = 273
            Top = 2
            Width = 70
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = 'Cerrada Parc.'
            Color = clMoneyGreen
            ParentColor = False
            Layout = tlCenter
          end
          object PNLSepararAlmacenes: TLFPanel
            Left = 343
            Top = 2
            Width = 154
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object CBSepararAlmacenes: TLFCheckBox
              Left = 16
              Top = 3
              Width = 121
              Height = 22
              Caption = 'Separar Almacenes'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CBSepararAlmacenesChange
            end
          end
        end
      end
      object TSMovStock: TTabSheet
        Caption = 'Movimientos'
        ImageIndex = 6
        object DBGMovStock: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 1002
          Height = 436
          Align = alClient
          Color = clInfoBk
          DataSource = DMDocInfoStocks.DSQMMovStock
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGStockfuturoDrawColumnCell
          OnDblClick = DBGMovStockDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
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
          Transaction = DMMain.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_OPER'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADAS'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALIDAS'
              Width = 60
              Visible = True
            end
            item
              Color = clYellow
              Expanded = False
              FieldName = 'STOCK'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_TIPO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_SERIE'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DOC_NUMERO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REF_PEDIDO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_CLI_PRO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CLI_PRO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PMP'
              Visible = True
            end>
        end
        object TBMovStock: TLFToolBar
          Left = 0
          Top = 0
          Width = 1002
          Height = 24
          AutoSize = True
          EdgeBorders = []
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavMovStock: THYMNavigator
            Left = 0
            Top = 2
            Width = 125
            Height = 22
            DataSource = DMDocInfoStocks.DSQMMovStock
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
            Left = 125
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object PNLStockMovimientosPMP: TLFPanel
            Left = 133
            Top = 2
            Width = 185
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object CBCalcularPMPMovimientos: TLFCheckBox
              Left = 10
              Top = 3
              Width = 175
              Height = 17
              Caption = 'Calcular PMP de Movimientos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CBCalcularPMPMovimientosChange
            end
          end
        end
      end
    end
    object PNLLimites: TLFPanel
      Left = 2
      Top = 28
      Width = 1010
      Height = 69
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object PNLDatosLimite: TLFPanel
        Left = 0
        Top = 0
        Width = 561
        Height = 69
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          561
          69)
        object LArticulo: TLFLabel
          Left = 22
          Top = 20
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art'#237'culo'
        end
        object LAlmacen: TLFLabel
          Left = 18
          Top = 42
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almac'#233'n'
        end
        object EFArticulo: TLFEditFind2000
          Left = 63
          Top = 17
          Width = 121
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnChange = EFArticuloChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
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
        object EFAlmacen: TLFEditFind2000
          Left = 63
          Top = 39
          Width = 58
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxLength = 3
          ParentFont = False
          TabOrder = 1
          OnChange = EFAlmacenChange
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
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitulo_Art: TLFDbedit
          Left = 185
          Top = 17
          Width = 371
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelWidth = 2
          Color = clInfoBk
          DataField = 'TITULO_ART'
          DataSource = DMDocInfoStocks.DSxArtStocks
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object DBETitulo_Alm: TLFDbedit
          Left = 185
          Top = 39
          Width = 371
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          BevelWidth = 2
          Color = clInfoBk
          DataField = 'TITULO_ALM'
          DataSource = DMDocInfoStocks.DSxArtStocks
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
      object PNLDatosChile: TLFPanel
        Left = 561
        Top = 0
        Width = 449
        Height = 69
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LAlfa1: TLFLabel
          Left = 7
          Top = 21
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Referencia'
        end
        object EAlfa1: TLFEdit
          Left = 66
          Top = 17
          Width = 143
          Height = 21
          Color = clInfoBk
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
  inherited TBActions: TLFToolBar
    Top = 587
    Width = 1014
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 648
    Top = 53
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 684
    Top = 53
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
    Left = 648
    Top = 88
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBCalcularPMPMovimientos.Checked'
      'CBSepararAlmacenes.Checked')
    Left = 684
    Top = 88
  end
  object RelojAviso: TTimer
    Enabled = False
    OnTimer = RelojAvisoTimer
    Left = 720
    Top = 53
  end
end
