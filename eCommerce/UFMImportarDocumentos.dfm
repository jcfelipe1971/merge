inherited FMImportarDocumentos: TFMImportarDocumentos
  Left = 308
  Top = 229
  Width = 900
  Height = 571
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importar Documentos Excel'
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 890
    Height = 518
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 886
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 33
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBRefrescarDatos: TToolButton
        Left = 41
        Top = 0
        Action = ARefrescarDatos
        ImageIndex = 26
      end
      object TBSep1: TToolButton
        Left = 64
        Top = 0
        Width = 8
        ImageIndex = 27
        Style = tbsSeparator
      end
      object PBProgreso: TProgressBar
        Left = 72
        Top = 0
        Width = 150
        Height = 22
        Min = 0
        Max = 100
        TabOrder = 1
        Visible = False
      end
    end
    object PNLImportacion: TLFPanel
      Left = 2
      Top = 28
      Width = 886
      Height = 488
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLDirectorioImportar: TLFPanel
        Left = 0
        Top = 0
        Width = 886
        Height = 45
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          886
          45)
        object LDirectorioImportar: TLFLabel
          Left = 15
          Top = 14
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Directorio'
        end
        object DSDirectorioImportar: TDirectoryEdit
          Left = 64
          Top = 11
          Width = 813
          Height = 21
          NumGlyphs = 1
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          OnChange = DSDirectorioImportarChange
        end
      end
      object PNLArchivos: TLFPanel
        Left = 0
        Top = 45
        Width = 176
        Height = 443
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object LElijaArchivos: TLFLabel
          Left = 0
          Top = 0
          Width = 176
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Elija los archivos a importar'
          Layout = tlCenter
        end
        object LBArchivosAImportar: TListBox
          Left = 0
          Top = 13
          Width = 176
          Height = 430
          Align = alClient
          ItemHeight = 13
          PopupMenu = pmLBArchivosAImportar
          Sorted = True
          TabOrder = 0
          OnDblClick = LBArchivosAImportarDblClick
        end
      end
      object PCTipoImportacion: TLFPageControl
        Left = 176
        Top = 45
        Width = 710
        Height = 443
        ActivePage = TSNTV
        Align = alClient
        OwnerDraw = True
        TabIndex = 5
        TabOrder = 2
        OnChange = PCTipoImportacionChange
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSImportacionExcel: TTabSheet
          Caption = 'Importacion Excel'
          object PNLDatosImportacion: TLFPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 415
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object PNLDatosCliente: TLFPanel
              Left = 0
              Top = 0
              Width = 702
              Height = 52
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LCliente: TLFLabel
                Left = 35
                Top = 7
                Width = 32
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cliente'
              end
              object LFechaPedido: TLFLabel
                Left = 37
                Top = 29
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object EFCliente: TLFEditFind2000
                Left = 72
                Top = 3
                Width = 87
                Height = 21
                TabOrder = 0
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
                SalirSiNoExiste = False
                Tabla_a_buscar = 'VER_CLIENTES_EF'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'CLIENTE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object DEFechaPedido: TLFDateEdit
                Left = 72
                Top = 25
                Width = 87
                Height = 21
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 1
              end
              object ETituloCliente: TLFEdit
                Left = 160
                Top = 3
                Width = 434
                Height = 21
                Color = clInfoBk
                Enabled = False
                ReadOnly = True
                TabOrder = 2
              end
              object ENotas: TLFEdit
                Left = 160
                Top = 25
                Width = 434
                Height = 21
                TabOrder = 3
              end
            end
            object SGDatosAImportar: TStringGrid
              Left = 0
              Top = 52
              Width = 702
              Height = 334
              Align = alClient
              Color = clInfoBk
              ColCount = 6
              DefaultRowHeight = 21
              FixedCols = 0
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
              TabOrder = 1
              OnDblClick = SGDatosAImportarDblClick
              OnDrawCell = SGDatosAImportarDrawCell
              OnSelectCell = SGDatosAImportarSelectCell
              ColWidths = (
                100
                48
                256
                60
                59
                56)
            end
            object PNLTotalImportacion: TLFPanel
              Left = 0
              Top = 386
              Width = 702
              Height = 29
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 2
              object LTotalPedido: TLFLabel
                Left = 411
                Top = 1
                Width = 188
                Height = 27
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Total Pedido 0,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
            end
          end
        end
        object TSImportacionPresident: TTabSheet
          Caption = 'Importacion President'
          ImageIndex = 1
          object PNLImportacionPresident: TLFPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 415
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object PNLAccionPresident: TLFPanel
              Left = 0
              Top = 0
              Width = 702
              Height = 94
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LFichero: TLFLabel
                Left = 33
                Top = 7
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fichero'
              end
              object LSerie: TLFLabel
                Left = 44
                Top = 29
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie'
              end
              object LSerieAbono: TLFLabel
                Left = 10
                Top = 49
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie Abono'
              end
              object LProveedor: TLFLabel
                Left = 19
                Top = 71
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'Proveedor'
              end
              object EFichero: TLFEdit
                Left = 72
                Top = 3
                Width = 390
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 0
              end
              object BImportarComprasPresident: TButton
                Left = 496
                Top = 42
                Width = 75
                Height = 25
                Action = AImportarComprasPresident
                TabOrder = 1
              end
              object BImportarVentasPresident: TButton
                Left = 496
                Top = 16
                Width = 75
                Height = 25
                Action = AImportarVentasPresident
                TabOrder = 2
              end
              object EFSerie: TLFEditFind2000
                Left = 72
                Top = 25
                Width = 121
                Height = 21
                TabOrder = 3
                Text = 'EFSerie'
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
                Tabla_a_buscar = 'VER_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EFSerieAbono: TLFEditFind2000
                Left = 72
                Top = 47
                Width = 121
                Height = 21
                TabOrder = 4
                Text = 'EFSerieAbono'
                OnChange = EFSerieAbonoChange
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
                Tabla_a_buscar = 'VER_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EFProveedor: TLFEditFind2000
                Left = 72
                Top = 69
                Width = 121
                Height = 21
                TabOrder = 5
                Text = 'EFProveedor'
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
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object ESerie: TLFEdit
                Left = 194
                Top = 25
                Width = 268
                Height = 21
                Color = clInfoBk
                TabOrder = 6
              end
              object ESerieAbono: TLFEdit
                Left = 194
                Top = 47
                Width = 268
                Height = 21
                Color = clInfoBk
                TabOrder = 7
              end
              object EProveedor: TLFEdit
                Left = 194
                Top = 69
                Width = 268
                Height = 21
                Color = clInfoBk
                TabOrder = 8
              end
            end
            object MFichero: TLFMemo
              Left = 0
              Top = 94
              Width = 702
              Height = 321
              Align = alClient
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
            end
          end
        end
        object TSImportacionSellforge: TTabSheet
          Caption = 'Importacion Sellforge'
          ImageIndex = 2
          object PNLDatosDetalleSellforge: TPanel
            Left = 0
            Top = 161
            Width = 702
            Height = 254
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            OnResize = PNLDatosDetalleSellforgeResize
            object SGDatosImportarSellforge: TStringGrid
              Left = 0
              Top = 0
              Width = 702
              Height = 119
              Align = alClient
              Color = clInfoBk
              DefaultRowHeight = 18
              FixedCols = 0
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goEditing]
              TabOrder = 0
              OnDblClick = SGDatosImportarSellforgeDblClick
              OnDrawCell = SGDatosImportarSellforgeDrawCell
              OnSelectCell = SGDatosAImportarSelectCell
              ColWidths = (
                117
                335
                61
                63
                59)
            end
            object MFicheroSellforge: TLFMemo
              Left = 0
              Top = 119
              Width = 702
              Height = 135
              Align = alBottom
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
            end
          end
          object PCImportacionSellforge: TLFPageControl
            Left = 0
            Top = 0
            Width = 702
            Height = 161
            ActivePage = TSSellforgeImportar
            Align = alTop
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 1
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSSellforgeImportar: TTabSheet
              Caption = 'Importacion'
              object PNLDatosPedido: TLFPanel
                Left = 0
                Top = 0
                Width = 694
                Height = 133
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object LClienteSellforge: TLFLabel
                  Left = 35
                  Top = 48
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cliente'
                end
                object LFechaPedidoSellforge: TLFLabel
                  Left = 37
                  Top = 26
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fecha'
                end
                object LNroPedidoSellforge: TLFLabel
                  Left = 11
                  Top = 4
                  Width = 56
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Nro. Pedido'
                end
                object LAgenteSellforge: TLFLabel
                  Left = 33
                  Top = 70
                  Width = 34
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Agente'
                end
                object LNotasSellforge: TLFLabel
                  Left = 40
                  Top = 91
                  Width = 28
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Notas'
                end
                object LNIFCliente: TLFLabel
                  Left = 600
                  Top = 48
                  Width = 21
                  Height = 13
                  Caption = 'NIF'
                  Color = clRed
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Visible = False
                end
                object LFicheroPedidoSellforge: TLFLabel
                  Left = 251
                  Top = 4
                  Width = 35
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fichero'
                end
                object LPortesSellforge: TLFLabel
                  Left = 38
                  Top = 114
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Portes'
                end
                object LPedidoImportado: TLFLabel
                  Left = 291
                  Top = 22
                  Width = 305
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Color = clRed
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Visible = False
                end
                object EFClienteSellforge: TLFEditFind2000
                  Left = 72
                  Top = 44
                  Width = 87
                  Height = 21
                  TabOrder = 2
                  OnChange = EFClienteSellforgeChange
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
                object DEFechaPedidoSellforge: TLFDateEdit
                  Left = 72
                  Top = 22
                  Width = 87
                  Height = 21
                  CheckOnExit = True
                  NumGlyphs = 2
                  TabOrder = 1
                end
                object ETituloClienteSellforge: TLFEdit
                  Left = 160
                  Top = 44
                  Width = 436
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 3
                  OnChange = ETituloClienteSellforgeChange
                end
                object ENotasPedidoSellforge: TLFEdit
                  Left = 72
                  Top = 88
                  Width = 524
                  Height = 21
                  TabOrder = 6
                end
                object ENroPedidoSellforge: TLFEdit
                  Left = 72
                  Top = 0
                  Width = 120
                  Height = 21
                  TabOrder = 0
                end
                object EFAgenteSellforge: TLFEditFind2000
                  Left = 72
                  Top = 66
                  Width = 87
                  Height = 21
                  TabOrder = 4
                  OnChange = EFAgenteSellforgeChange
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
                object ETituloAgenteSellforge: TLFEdit
                  Left = 160
                  Top = 66
                  Width = 436
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 5
                  OnChange = ETituloAgenteSellforgeChange
                end
                object EFicheroPedidoSellforge: TLFEdit
                  Left = 291
                  Top = 0
                  Width = 305
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 8
                  OnChange = EFicheroPedidoSellforgeChange
                end
                object BSellforgeImportarPedido: TButton
                  Left = 600
                  Top = 24
                  Width = 94
                  Height = 23
                  Action = ASellforgeImportarPedido
                  TabOrder = 10
                end
                object EPortesSellforge: TLFEdit
                  Left = 72
                  Top = 110
                  Width = 87
                  Height = 21
                  TabOrder = 7
                end
                object BSellforgeVerFichero: TButton
                  Left = 600
                  Top = 108
                  Width = 94
                  Height = 25
                  Hint = 'Ver contenido de fichero CSV'
                  Caption = 'Ver Fichero'
                  TabOrder = 11
                  OnClick = BSellforgeVerFicheroClick
                end
                object BSellforgeDescargarFTP: TButton
                  Left = 600
                  Top = 0
                  Width = 94
                  Height = 23
                  Action = ASellforgeDescargarFTP
                  TabOrder = 9
                end
              end
            end
            object TSSellforgeExportacion: TTabSheet
              Caption = 'Exportacion'
              ImageIndex = 2
              object LSellforgeExpAlmacen: TLFLabel
                Left = 187
                Top = 80
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'Almacen'
              end
              object BSellforgeExpClientes: TButton
                Left = 16
                Top = 8
                Width = 150
                Height = 25
                Caption = 'Clientes'
                TabOrder = 0
                OnClick = BSellforgeExpClientesClick
              end
              object BSellforgeExpDirecciones: TButton
                Left = 16
                Top = 40
                Width = 150
                Height = 25
                Caption = 'Direcciones'
                TabOrder = 1
                OnClick = BSellforgeExpDireccionesClick
              end
              object BSellforgeExpArticulos: TButton
                Left = 16
                Top = 72
                Width = 150
                Height = 25
                Caption = 'Articulos'
                TabOrder = 2
                OnClick = BSellforgeExpArticulosClick
              end
              object BSellforgeExpFamilias: TButton
                Left = 16
                Top = 104
                Width = 150
                Height = 25
                Caption = 'Familias'
                TabOrder = 4
                OnClick = BSellforgeExpFamiliasClick
              end
              object EFSellforgeExpAlmacen: TLFEditFind2000
                Left = 232
                Top = 76
                Width = 57
                Height = 21
                TabOrder = 3
                OnChange = EFClienteSellforgeChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'ALMACEN'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'ACTIVO=1'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = True
                Tabla_a_buscar = 'ART_ALMACENES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'ALMACEN')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object BSellforgeExpTodo: TButton
                Left = 536
                Top = 8
                Width = 150
                Height = 25
                Caption = 'Exportar Todo'
                TabOrder = 5
                OnClick = BSellforgeExpTodoClick
              end
            end
            object TSSellforgeConfiguracion: TTabSheet
              Caption = 'Configuracion'
              ImageIndex = 1
              object PNLConfiguracion: TLFPanel
                Left = 0
                Top = 0
                Width = 694
                Height = 133
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                DesignSize = (
                  694
                  133)
                object LHost: TLFLabel
                  Left = 46
                  Top = 4
                  Width = 22
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Host'
                end
                object LPort: TLFLabel
                  Left = 49
                  Top = 26
                  Width = 19
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Port'
                end
                object LUser: TLFLabel
                  Left = 46
                  Top = 49
                  Width = 22
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'User'
                end
                object LPassword: TLFLabel
                  Left = 22
                  Top = 72
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Password'
                end
                object LRutaFTP: TLFLabel
                  Left = 22
                  Top = 92
                  Width = 46
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Ruta FTP'
                end
                object EHost: TLFEdit
                  Left = 72
                  Top = 0
                  Width = 524
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                end
                object EPort: TLFEdit
                  Left = 72
                  Top = 22
                  Width = 121
                  Height = 21
                  TabOrder = 1
                end
                object EUser: TLFEdit
                  Left = 72
                  Top = 44
                  Width = 121
                  Height = 21
                  TabOrder = 2
                end
                object EPassword: TLFEdit
                  Left = 72
                  Top = 66
                  Width = 121
                  Height = 21
                  PasswordChar = '*'
                  TabOrder = 3
                end
                object ERutaFTP: TLFEdit
                  Left = 72
                  Top = 88
                  Width = 524
                  Height = 21
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 4
                end
                object BGuardarConfiguracionSellforge: TButton
                  Left = 601
                  Top = 0
                  Width = 85
                  Height = 25
                  Anchors = [akTop, akRight]
                  Caption = 'Guardar'
                  TabOrder = 5
                  OnClick = BGuardarConfiguracionSellforgeClick
                end
              end
            end
          end
        end
        object TSImportacionAnverCompras: TTabSheet
          Caption = 'Compras'
          ImageIndex = 3
          object PNLImportacionAnverCompras: TLFPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 415
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object PNLImportacionAnverComprasCab: TLFPanel
              Left = 0
              Top = 0
              Width = 702
              Height = 57
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LFLabel1: TLFLabel
                Left = 33
                Top = 7
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fichero'
              end
              object LFLabel2: TLFLabel
                Left = 44
                Top = 29
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie'
              end
              object EFicheroComprasAnver: TLFEdit
                Left = 72
                Top = 3
                Width = 390
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 0
              end
              object BImportarComprasAnver: TButton
                Left = 496
                Top = 16
                Width = 75
                Height = 25
                Caption = 'Importar'
                TabOrder = 1
                OnClick = BImportarComprasAnverClick
              end
              object EFSerieComprasAnver: TLFEditFind2000
                Left = 72
                Top = 25
                Width = 121
                Height = 21
                TabOrder = 2
                OnChange = EFSerieComprasAnverChange
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
                Tabla_a_buscar = 'VER_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object ESerieComprasAnver: TLFEdit
                Left = 194
                Top = 25
                Width = 268
                Height = 21
                Color = clInfoBk
                TabOrder = 3
              end
            end
            object MFicheroCompraAnver: TLFMemo
              Left = 0
              Top = 57
              Width = 702
              Height = 160
              Align = alTop
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
            end
            object REFicheroCompraAnver: TRichEdit
              Left = 0
              Top = 217
              Width = 702
              Height = 198
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              Lines.Strings = (
                'REFicheroVentaAnver')
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 2
              WordWrap = False
            end
          end
        end
        object TSImportacionAnverVentas: TTabSheet
          Caption = 'Ventas'
          ImageIndex = 4
          object PNLImportacionAnverVentas: TLFPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 415
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LFPanel1: TLFPanel
              Left = 0
              Top = 0
              Width = 702
              Height = 57
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LFLabel3: TLFLabel
                Left = 33
                Top = 7
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fichero'
              end
              object LFLabel4: TLFLabel
                Left = 44
                Top = 29
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Serie'
              end
              object EFicheroVentasAnver: TLFEdit
                Left = 72
                Top = 3
                Width = 390
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 0
              end
              object BImportarVentasAnver: TButton
                Left = 496
                Top = 16
                Width = 75
                Height = 25
                Caption = 'Importar'
                TabOrder = 1
                OnClick = BImportarVentasAnverClick
              end
              object EFSerieVentasAnver: TLFEditFind2000
                Left = 72
                Top = 25
                Width = 121
                Height = 21
                TabOrder = 2
                OnChange = EFSerieVentasAnverChange
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
                Tabla_a_buscar = 'VER_SERIES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'SERIE')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object ESerieVentasAnver: TLFEdit
                Left = 194
                Top = 25
                Width = 268
                Height = 21
                Color = clInfoBk
                TabOrder = 3
              end
            end
            object MFicheroVentaAnver: TLFMemo
              Left = 0
              Top = 57
              Width = 702
              Height = 160
              Align = alTop
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
            end
            object REFicheroVentaAnver: TRichEdit
              Left = 0
              Top = 217
              Width = 702
              Height = 198
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              Lines.Strings = (
                'REFicheroVentaAnver')
              ParentFont = False
              ScrollBars = ssBoth
              TabOrder = 2
              WordWrap = False
            end
          end
        end
        object TSNTV: TTabSheet
          Caption = 'NTV'
          ImageIndex = 5
          object Panel1: TPanel
            Left = 0
            Top = 161
            Width = 702
            Height = 254
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            OnResize = PNLDatosDetalleSellforgeResize
            object SGNTV: TStringGrid
              Left = 0
              Top = 0
              Width = 702
              Height = 119
              Align = alClient
              Color = clInfoBk
              ColCount = 10
              DefaultRowHeight = 18
              FixedCols = 0
              RowCount = 2
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goEditing]
              TabOrder = 0
              OnDblClick = SGNTVDblClick
              OnDrawCell = SGNTVDrawCell
              OnSelectCell = SGDatosAImportarSelectCell
              ColWidths = (
                40
                40
                40
                40
                120
                70
                70
                70
                70
                70)
            end
            object MFicheroNTV: TLFMemo
              Left = 0
              Top = 119
              Width = 702
              Height = 135
              Align = alBottom
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              ScrollBars = ssBoth
              TabOrder = 1
            end
          end
          object PNLNTVCabecera: TLFPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 161
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object PCImportacionNTV: TLFPageControl
              Left = 0
              Top = 0
              Width = 702
              Height = 161
              ActivePage = TSNTVImportar
              Align = alClient
              OwnerDraw = True
              TabIndex = 0
              TabOrder = 0
              TabActiveColor = clWhite
              TabInactiveColor = 14936298
              object TSNTVImportar: TTabSheet
                Caption = 'Importar'
                object LPortesNTV: TLFLabel
                  Left = 38
                  Top = 114
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Portes'
                end
                object LAgenteNTV: TLFLabel
                  Left = 33
                  Top = 70
                  Width = 34
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Agente'
                end
                object LAgenteNTVImportacion: TLFLabel
                  Left = 601
                  Top = 72
                  Width = 8
                  Height = 13
                  Caption = '0'
                  Color = clRed
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Visible = False
                end
                object LClienteNTV: TLFLabel
                  Left = 35
                  Top = 48
                  Width = 32
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cliente'
                end
                object LDtoCialNTV: TLFLabel
                  Left = 201
                  Top = 114
                  Width = 43
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Dto. Cial.'
                end
                object LDtoPPNTV: TLFLabel
                  Left = 391
                  Top = 114
                  Width = 37
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Dto. PP'
                end
                object LFechaNTV: TLFLabel
                  Left = 37
                  Top = 26
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fecha'
                end
                object LFicheroNTV: TLFLabel
                  Left = 251
                  Top = 4
                  Width = 35
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fichero'
                end
                object LNIFClienteNTV: TLFLabel
                  Left = 601
                  Top = 48
                  Width = 21
                  Height = 13
                  Caption = 'NIF'
                  Color = clRed
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Visible = False
                end
                object LNotasNTV: TLFLabel
                  Left = 40
                  Top = 91
                  Width = 28
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Notas'
                end
                object LNroPedidoNTV: TLFLabel
                  Left = 11
                  Top = 4
                  Width = 56
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Nro. Pedido'
                end
                object LPedidoImportadoNTV: TLFLabel
                  Left = 291
                  Top = 22
                  Width = 305
                  Height = 13
                  Alignment = taCenter
                  AutoSize = False
                  Color = clRed
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                  Visible = False
                end
                object BImportarPedidoNTV: TButton
                  Left = 601
                  Top = 0
                  Width = 85
                  Height = 25
                  Hint = 'Importar Pedido'
                  Caption = 'Importar Pedido'
                  TabOrder = 11
                  OnClick = BImportarPedidoNTVClick
                end
                object BVerFicheroNTV: TButton
                  Left = 601
                  Top = 92
                  Width = 85
                  Height = 25
                  Hint = 'Ver contenido de fichero CSV'
                  Caption = 'Ver Fichero'
                  TabOrder = 12
                  OnClick = BVerFicheroNTVClick
                end
                object DEFechaPedidoNTV: TLFDateEdit
                  Left = 72
                  Top = 22
                  Width = 87
                  Height = 21
                  CheckOnExit = True
                  NumGlyphs = 2
                  TabOrder = 1
                end
                object EDtoCialNTV: TLFEdit
                  Left = 248
                  Top = 110
                  Width = 87
                  Height = 21
                  TabOrder = 8
                end
                object EDtoPPNTV: TLFEdit
                  Left = 432
                  Top = 110
                  Width = 87
                  Height = 21
                  Color = clInactiveCaption
                  Enabled = False
                  TabOrder = 9
                end
                object EFAgenteNTV: TLFEditFind2000
                  Left = 72
                  Top = 66
                  Width = 87
                  Height = 21
                  TabOrder = 4
                  OnChange = EFAgenteNTVChange
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
                object EFClienteNTV: TLFEditFind2000
                  Left = 72
                  Top = 44
                  Width = 87
                  Height = 21
                  TabOrder = 2
                  OnChange = EFClienteNTVChange
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
                object EFicheroPedidoNTV: TLFEdit
                  Left = 291
                  Top = 0
                  Width = 305
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  TabOrder = 10
                  OnChange = EFicheroPedidoNTVChange
                end
                object ENotasPedidoNTV: TLFEdit
                  Left = 72
                  Top = 88
                  Width = 524
                  Height = 21
                  TabOrder = 6
                end
                object ENroPedidoNTV: TLFEdit
                  Left = 72
                  Top = 0
                  Width = 120
                  Height = 21
                  TabOrder = 0
                end
                object EPortesNTV: TLFEdit
                  Left = 72
                  Top = 110
                  Width = 87
                  Height = 21
                  TabOrder = 7
                end
                object ETituloAgenteNTV: TLFEdit
                  Left = 160
                  Top = 66
                  Width = 436
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 5
                  OnChange = ETituloAgenteNTVChange
                end
                object ETituloClienteNTV: TLFEdit
                  Left = 160
                  Top = 44
                  Width = 436
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 3
                  OnChange = ETituloClienteNTVChange
                end
              end
              object TSNTVExportacion: TTabSheet
                Caption = 'Exportacion'
                ImageIndex = 1
                object LNTVExpAlmacen: TLFLabel
                  Left = 179
                  Top = 80
                  Width = 41
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Almacen'
                end
                object BNTVExpClientes: TButton
                  Left = 16
                  Top = 8
                  Width = 150
                  Height = 25
                  Caption = 'Clientes'
                  TabOrder = 0
                  OnClick = BNTVExpClientesClick
                end
                object BNTVExpDirecciones: TButton
                  Left = 16
                  Top = 40
                  Width = 150
                  Height = 25
                  Caption = 'Direcciones'
                  TabOrder = 1
                  OnClick = BNTVExpDireccionesClick
                end
                object BNTVExpArticulos: TButton
                  Left = 16
                  Top = 72
                  Width = 150
                  Height = 25
                  Caption = 'Articulos'
                  TabOrder = 2
                  OnClick = BNTVExpArticulosClick
                end
                object BNTVExpFamilias: TButton
                  Left = 16
                  Top = 104
                  Width = 150
                  Height = 25
                  Caption = 'Familias'
                  TabOrder = 3
                  OnClick = BNTVExpFamiliasClick
                end
                object EFNTVExpAlmacen: TLFEditFind2000
                  Left = 224
                  Top = 76
                  Width = 57
                  Height = 21
                  TabOrder = 4
                  OnChange = EFClienteSellforgeChange
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'ALMACEN'
                  CampoStr = 'TITULO'
                  CondicionBusqueda = 'ACTIVO=1'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = True
                  Tabla_a_buscar = 'ART_ALMACENES'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'ALMACEN')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object BNTVExpExportarTodo: TButton
                  Left = 536
                  Top = 8
                  Width = 150
                  Height = 25
                  Caption = 'Exportar Todo'
                  TabOrder = 9
                  OnClick = BNTVExpExportarTodoClick
                end
                object BNTVExpAgentes: TButton
                  Left = 304
                  Top = 8
                  Width = 150
                  Height = 25
                  Caption = 'Agentes'
                  TabOrder = 5
                  OnClick = BNTVExpAgentesClick
                end
                object BNTVExpFormaPago: TButton
                  Left = 304
                  Top = 40
                  Width = 150
                  Height = 25
                  Caption = 'Forma Pago'
                  TabOrder = 6
                  OnClick = BNTVExpFormaPagoClick
                end
                object BNTVExpZonas: TButton
                  Left = 304
                  Top = 72
                  Width = 150
                  Height = 25
                  Caption = 'Zonas'
                  TabOrder = 7
                  OnClick = BNTVExpZonasClick
                end
                object BNTVExpPortes: TButton
                  Left = 304
                  Top = 104
                  Width = 150
                  Height = 25
                  Caption = 'Portes'
                  TabOrder = 8
                  OnClick = BNTVExpPortesClick
                end
              end
              object TSNTVConfiguracion: TTabSheet
                Caption = 'Configuracion'
                ImageIndex = 2
                DesignSize = (
                  694
                  133)
                object LNTVRutaExp: TLFLabel
                  Left = 21
                  Top = 4
                  Width = 47
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Ruta Exp.'
                end
                object BGuardarConfiguracionNTV: TButton
                  Left = 601
                  Top = 0
                  Width = 85
                  Height = 25
                  Anchors = [akTop, akRight]
                  Caption = 'Guardar'
                  TabOrder = 1
                  OnClick = BGuardarConfiguracionNTVClick
                end
                object DENTVRutaExp: TDirectoryEdit
                  Left = 73
                  Top = 0
                  Width = 524
                  Height = 21
                  NumGlyphs = 1
                  Anchors = [akLeft, akTop, akRight]
                  TabOrder = 0
                  OnChange = DSDirectorioImportarChange
                end
              end
            end
          end
        end
        object TSLabex: TTabSheet
          Caption = 'Labex'
          ImageIndex = 6
          object SGLabex: TStringGrid
            Left = 0
            Top = 81
            Width = 702
            Height = 334
            Align = alClient
            Color = clInfoBk
            ColCount = 16
            DefaultRowHeight = 21
            FixedCols = 0
            RowCount = 2
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goEditing]
            TabOrder = 0
            OnDrawCell = SGLabexDrawCell
            OnSelectCell = SGDatosAImportarSelectCell
            ColWidths = (
              100
              90
              122
              120
              177
              82
              64
              64
              64
              64
              64
              64
              64
              64
              64
              64)
          end
          object PNLLabex: TLFPanel
            Left = 0
            Top = 0
            Width = 702
            Height = 81
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LFicheroLabex: TLFLabel
              Left = 33
              Top = 7
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fichero'
            end
            object LSerieLabex: TLFLabel
              Left = 44
              Top = 29
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LLineasIgnorarLabex: TLFLabel
              Left = 476
              Top = 6
              Width = 67
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lineas Ignorar'
            end
            object LSerieAbonoLabex: TLFLabel
              Left = 10
              Top = 51
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie Abono'
            end
            object EFicheroLabex: TLFEdit
              Left = 72
              Top = 3
              Width = 390
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
            end
            object BImportarLabex: TButton
              Left = 552
              Top = 25
              Width = 75
              Height = 25
              Caption = 'Importar'
              TabOrder = 0
              OnClick = BImportarLabexClick
            end
            object EFSerieVentasLabex: TLFEditFind2000
              Left = 72
              Top = 25
              Width = 121
              Height = 21
              TabOrder = 2
              OnChange = EFSerieVentasLabexChange
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
              Tabla_a_buscar = 'VER_SERIES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'SERIE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ESerieVentasLabex: TLFEdit
              Left = 194
              Top = 25
              Width = 268
              Height = 21
              Color = clInfoBk
              TabOrder = 3
            end
            object ELineasIgnorarLabex: TLFEdit
              Left = 547
              Top = 3
              Width = 87
              Height = 21
              TabOrder = 6
              Text = '1'
              OnChange = ELineasIgnorarLabexChange
            end
            object EFSerieAbonoLabex: TLFEditFind2000
              Left = 72
              Top = 47
              Width = 121
              Height = 21
              TabOrder = 4
              OnChange = EFSerieAbonoLabexChange
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
              Tabla_a_buscar = 'VER_SERIES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'SERIE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ESerieAbonoLabex: TLFEdit
              Left = 194
              Top = 47
              Width = 268
              Height = 21
              Color = clInfoBk
              TabOrder = 5
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 518
    Width = 890
    TabOrder = 0
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
    object ARefrescarDatos: TAction
      Category = 'Procesos'
      Caption = '&Refrescar Datos'
      Hint = 'Refresca los datos a importar'
      ImageIndex = 39
      OnExecute = ARefrescarDatosExecute
    end
    object AimportarArchivosOferta: TAction
      Category = 'Procesos'
      Caption = 'Importar Archivos de Ofertas'
      ImageIndex = 72
      OnExecute = AimportarArchivosOfertaExecute
    end
    object AImportarArchivosPedido: TAction
      Category = 'Procesos'
      Caption = '&Importar Archivo Pedido'
      Hint = 'Importa el archivos seleccionado'
      ImageIndex = 62
      OnExecute = AImportarArchivosPedidoExecute
    end
    object AImportarArchivosAlbaran: TAction
      Category = 'Procesos'
      Caption = 'Importar Albaran'
      ImageIndex = 60
      OnExecute = AImportarArchivosAlbaranExecute
    end
    object AImportarArchivosFactura: TAction
      Category = 'Procesos'
      Caption = 'Importar Facturas'
      ImageIndex = 61
      OnExecute = AImportarArchivosFacturaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AImportarComprasPresident: TAction
      Category = 'Procesos'
      Caption = 'Compras'
      ImageIndex = 141
      OnExecute = AImportarComprasPresidentExecute
    end
    object AImportarVentasPresident: TAction
      Category = 'Procesos'
      Caption = 'Ventas'
      ImageIndex = 143
      OnExecute = AImportarVentasPresidentExecute
    end
    object ASellforgeImportarPedido: TAction
      Category = 'Procesos'
      Caption = 'Importar Pedido'
      Hint = 'Importar Pedido'
      ImageIndex = 62
      OnExecute = ASellforgeImportarPedidoExecute
    end
    object ASellforgeDescargarFTP: TAction
      Category = 'Procesos'
      Caption = 'Descargar Pedidos'
      Hint = 'Descargar datos de FTP'
      ImageIndex = 49
      OnExecute = ASellforgeDescargarFTPExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFSellforgeExpAlmacen.Text'
      'EFNTVExpAlmacen.Text')
  end
  object pmLBArchivosAImportar: TPopupMenu
    Left = 200
    Top = 64
    object MIBorrarArchivo: TMenuItem
      Caption = 'Eliminar Archivo'
      Hint = 'Elimina el archivo'
      OnClick = MIBorrarArchivoClick
    end
  end
end
