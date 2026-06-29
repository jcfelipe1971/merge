inherited FMControl_Lotes: TFMControl_Lotes
  Left = 314
  Top = 170
  Width = 1077
  Height = 641
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Control de Lotes'
  PopupMenu = nil
  Position = poScreenCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1067
    Height = 289
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 1063
      ParentShowHint = True
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMControl_Lotes.DSQMArticulos_Lotes
        Hints.Strings = ()
        EditaControl = DBEProveedor
        InsertaControl = DBEFArticulo
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Imprime'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 254
      end
      inherited TbuttComp: TToolButton
        Left = 262
      end
      object ToolButton3: TToolButton
        Left = 285
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LFiltraArticulo: TLFLabel
        Left = 293
        Top = 0
        Width = 46
        Height = 22
        Alignment = taRightJustify
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFFiltraArticulo: TLFEditFind2000
        Left = 339
        Top = 0
        Width = 97
        Height = 22
        TabOrder = 2
        OnChange = EFFiltraChange
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object ToolButton2: TToolButton
        Left = 436
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LFiltraLote: TLFLabel
        Left = 444
        Top = 0
        Width = 26
        Height = 22
        Alignment = taRightJustify
        Caption = 'Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFFiltraLote: TLFEditFind2000
        Left = 470
        Top = 0
        Width = 97
        Height = 22
        TabOrder = 3
        OnChange = EFFiltraChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'LOTE'
        CampoStr = 'ARTICULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_LOTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'LOTE')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object ToolButton1: TToolButton
        Left = 567
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LFiltraClasificacion: TLFLabel
        Left = 575
        Top = 0
        Width = 73
        Height = 22
        Alignment = taRightJustify
        Caption = 'Clasificaci'#243'n'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFFiltraClasificacion: TLFEditFind2000
        Left = 648
        Top = 0
        Width = 121
        Height = 22
        TabOrder = 4
        OnChange = EFFiltraChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'ARTICULO')
        CampoNum = 'CLASIFICACION'
        CampoStr = 'CLASIFICACION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS_LOTES'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1063
      Height = 259
      TabStop = False
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBAArticulo: TSpeedButton [0]
          Left = 112
          Top = 91
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAArticuloDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1055
          Height = 231
          inherited G2KTableLoc: TG2KTBLoc
            Left = 56
            Top = 64
          end
          object LBLLote: TLFLabel
            Left = 51
            Top = 31
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
            FocusControl = DBELote
          end
          object LBLFFAbricacion: TLFLabel
            Left = 5
            Top = 75
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Fabricaci'#243'n'
          end
          object LBLFENvasado: TLFLabel
            Left = 174
            Top = 75
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Envasado'
          end
          object LBLFCaducidad: TLFLabel
            Left = 332
            Top = 75
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Caducidad'
          end
          object LClasificacion: TLFLabel
            Left = 13
            Top = 97
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clasificaci'#243'n'
            FocusControl = DBEClasificacion
          end
          object LProveedor: TLFLabel
            Left = 23
            Top = 52
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LBLArticulo: TLFLabel
            Left = 35
            Top = 9
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            Layout = tlCenter
          end
          object LNotas: TLFLabel
            Left = 44
            Top = 117
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LblMedida1: TLFLabel
            Left = 514
            Top = 32
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 1'
            FocusControl = DBEMedida1
          end
          object LblMedida2: TLFLabel
            Left = 638
            Top = 31
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 2'
            FocusControl = DBEMedida2
          end
          object LblMedida3: TLFLabel
            Left = 514
            Top = 52
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 3'
            FocusControl = DBEMedida3
          end
          object LMedida4: TLFLabel
            Left = 638
            Top = 51
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 4'
            FocusControl = DBEMedida4
          end
          object LPrecio: TLFLabel
            Left = 528
            Top = 9
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
            FocusControl = LFDBPrecio
          end
          object DBELote: TLFDbedit
            Left = 76
            Top = 27
            Width = 140
            Height = 21
            DataField = 'LOTE'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 1
            OnChange = DBELoteChange
          end
          object DTPFFAbricacion: TLFDBDateEdit
            Left = 76
            Top = 71
            Width = 87
            Height = 21
            DataField = 'F_FABRICACION'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DTPFEnvasado: TLFDBDateEdit
            Left = 237
            Top = 71
            Width = 87
            Height = 21
            DataField = 'F_ENVASADO'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DTPFCaducidad: TLFDBDateEdit
            Left = 398
            Top = 71
            Width = 87
            Height = 21
            DataField = 'F_CADUCIDAD'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBEClasificacion: TLFDbedit
            Left = 76
            Top = 93
            Width = 409
            Height = 21
            DataField = 'CLASIFICACION'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 6
          end
          object DBEProveedor: TLFDBEditFind2000
            Left = 76
            Top = 49
            Width = 87
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 2
            OnChange = DBEProveedorChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            CampoADevolver = 'PROVEEDOR'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescProveedor: TLFEdit
            Left = 164
            Top = 49
            Width = 321
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object ETituloArticulo: TLFEdit
            Left = 198
            Top = 5
            Width = 287
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            OnDblClick = SBAArticuloDblClick
          end
          object DBEFArticulo: TLFFibDBEditFind
            Left = 76
            Top = 5
            Width = 121
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 0
            OnChange = DBEFArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object DBMNotas: TLFDBMemo
            Left = 76
            Top = 115
            Width = 409
            Height = 114
            DataField = 'NOTAS'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 9
          end
          object PNLCodigoBarras: TLFPanel
            Left = 515
            Top = 80
            Width = 238
            Height = 135
            BevelOuter = bvNone
            TabOrder = 10
            object ImgCodBarras: TImage
              Left = 0
              Top = 0
              Width = 238
              Height = 135
              Align = alClient
              AutoSize = True
              Center = True
              DragMode = dmAutomatic
              Proportional = True
              Stretch = True
            end
          end
          object DBEMedida1: TLFDbedit
            Left = 562
            Top = 27
            Width = 63
            Height = 21
            DataField = 'MEDIDA_1'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 12
          end
          object DBEMedida2: TLFDbedit
            Left = 687
            Top = 26
            Width = 63
            Height = 21
            DataField = 'MEDIDA_2'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 13
          end
          object DBEMedida3: TLFDbedit
            Left = 562
            Top = 49
            Width = 63
            Height = 21
            DataField = 'MEDIDA_3'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 14
          end
          object DBEMedida4: TLFDbedit
            Left = 687
            Top = 48
            Width = 63
            Height = 21
            DataField = 'MEDIDA_4'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 15
          end
          object LFDBPrecio: TLFDbedit
            Left = 562
            Top = 5
            Width = 63
            Height = 21
            DataField = 'PRECIO'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            TabOrder = 11
          end
        end
      end
      object TSStock: TTabSheet [1]
        Caption = '&Stocks'
        OnShow = TSStockShow
        object PNLStocks: TLFPanel
          Left = 0
          Top = 25
          Width = 1055
          Height = 206
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PNLStockArticulo: TLFPanel
            Left = 624
            Top = 0
            Width = 431
            Height = 206
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 0
            object LStockArticulo: TLFLabel
              Left = 0
              Top = 0
              Width = 431
              Height = 13
              Align = alTop
              Caption = 'Stock del articulo'
            end
            object DBGFStockArticulo: TDBGridFind2000
              Left = 0
              Top = 13
              Width = 431
              Height = 193
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSxArtStocks2
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
              IniStorage = DMMain.FSLookAndFeel
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
                  FieldName = 'CANAL'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO_ALM'
                  Width = 176
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EXISTENCIAS'
                  Width = 59
                  Visible = True
                end>
            end
          end
          object PNLStockLote: TLFPanel
            Left = 0
            Top = 0
            Width = 624
            Height = 206
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LStockLote: TLFLabel
              Left = 0
              Top = 0
              Width = 624
              Height = 13
              Align = alTop
              Caption = 'Stock del Lote'
            end
            object splStock: TSplitter
              Left = 616
              Top = 13
              Width = 8
              Height = 193
              Cursor = crHSplit
              Align = alRight
              Color = clBtnShadow
              ParentColor = False
            end
            object DBGStockLote: THYTDBGrid
              Left = 0
              Top = 13
              Width = 616
              Height = 193
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMSof_ArticulosLotes
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
              AutoDeseleccionar = True
              ControlEdit = CEMain
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'ALMACEN'
                'ARTICULO'
                'CANAL'
                'CLASIFICACION'
                'EMPRESA'
                'F_CADUCIDAD'
                'F_ENVASADO'
                'LOTE'
                'SERIE'
                'STOCK')
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PROVEEDOR'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 36
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'STOCK'
                  Width = 55
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNI_EN_FAB'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA1'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA2'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA3'
                  Width = 47
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MEDIDA4'
                  Width = 47
                  Visible = True
                end>
            end
          end
        end
        object PNLStockInfo: TLFPanel
          Left = 0
          Top = 0
          Width = 1055
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LStocksLote: TLFLabel
            Left = 12
            Top = 5
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
            FocusControl = DBEStocksLote
          end
          object LStocksArticulo: TLFLabel
            Left = 293
            Top = 6
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            Layout = tlCenter
          end
          object DBEStocksLote: TLFDbedit
            Left = 36
            Top = 2
            Width = 249
            Height = 21
            Color = clInfoBk
            DataField = 'LOTE'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object EStockTituloArticulo: TLFEdit
            Left = 434
            Top = 2
            Width = 317
            Height = 21
            AutoSize = False
            Color = clInfoBk
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
          object DBEStockArticulo: TLFDbedit
            Left = 332
            Top = 2
            Width = 101
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = DMControl_Lotes.DSQMArticulos_Lotes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object TSComposicion: TTabSheet [2]
        Caption = 'Composici'#243'n'
        ImageIndex = 3
        object DBGComposicionCompuesto: THYTDBGrid
          Left = 0
          Top = 0
          Width = 1055
          Height = 231
          Align = alClient
          Color = clInfoBk
          DataSource = DMControl_Lotes.DSComposicionCompuesto
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'COMPONENTE')
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'COMPONENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_COMPONENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPOSICION'
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1055
          Height = 231
          DataSource = DMControl_Lotes.DSQMArticulos_Lotes
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ALMACEN'
            'ARTICULO'
            'CANAL'
            'CLASIFICACION'
            'EMPRESA'
            'F_CADUCIDAD'
            'F_ENVASADO'
            'ID_LOTE'
            'LOTE'
            'SERIE')
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_LARGO'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLASIFICACION'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_FABRICACION'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_ENVASADO'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_CADUCIDAD'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTO_REETIQUETADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_4'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_5'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_6'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_7'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALFA_8'
              Visible = True
            end>
        end
      end
      object TSMovimientosStock: TTabSheet
        Caption = '&Movimientos'
        ImageIndex = -1
        OnShow = TSMovimientosStockShow
        object PNLlimites: TLFPanel
          Left = 0
          Top = 0
          Width = 1055
          Height = 57
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LArtHasta: TLFLabel
            Left = 249
            Top = 30
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo Hasta'
          end
          object LArtDesde: TLFLabel
            Left = 246
            Top = 7
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo Desde'
          end
          object LLoteDesde: TLFLabel
            Left = 424
            Top = 7
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote Desde'
          end
          object LLoteHasta: TLFLabel
            Left = 427
            Top = 30
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote Hasta'
          end
          object LFechaHasta: TLFLabel
            Left = 589
            Top = 30
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Hasta'
          end
          object LFechaDesde: TLFLabel
            Left = 586
            Top = 7
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Desde'
          end
          object LAlmacenDesde: TLFLabel
            Left = -1
            Top = 7
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Desde'
          end
          object LAlmacenHasta: TLFLabel
            Left = 2
            Top = 30
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Hasta'
          end
          object LFamtDesde: TLFLabel
            Left = 123
            Top = 7
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia Desde'
          end
          object LFamHasta: TLFLabel
            Left = 126
            Top = 30
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia Hasta'
          end
          object EFArtDesdeMovimiento: TLFEditFind2000
            Left = 320
            Top = 4
            Width = 96
            Height = 21
            MaxLength = 15
            TabOrder = 4
            OnChange = ChangeFiltro
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
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFArtHastaMovimiento: TLFEditFind2000
            Left = 320
            Top = 26
            Width = 96
            Height = 21
            MaxLength = 15
            TabOrder = 5
            OnChange = ChangeFiltro
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
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DEFechaHastaMovimientos: TLFDateEdit
            Left = 654
            Top = 26
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
            OnChange = ChangeFiltro
          end
          object DEFechaDesdeMovimientos: TLFDateEdit
            Left = 654
            Top = 4
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
            OnChange = ChangeFiltro
          end
          object EFAlmacenDesde: TLFEditFind2000
            Left = 77
            Top = 4
            Width = 36
            Height = 21
            MaxLength = 3
            TabOrder = 0
            OnChange = ChangeFiltro
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFAlmacenHasta: TLFEditFind2000
            Left = 77
            Top = 26
            Width = 36
            Height = 21
            MaxLength = 3
            TabOrder = 1
            OnChange = ChangeFiltro
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ELoteDesde: TLFEdit
            Left = 482
            Top = 4
            Width = 96
            Height = 21
            MaxLength = 35
            TabOrder = 6
            OnChange = ChangeFiltro
          end
          object ELoteHasta: TLFEdit
            Left = 482
            Top = 26
            Width = 96
            Height = 21
            MaxLength = 35
            TabOrder = 7
            OnChange = ChangeFiltro
          end
          object EFFamDesdeMovimiento: TLFEditFind2000
            Left = 192
            Top = 4
            Width = 49
            Height = 21
            MaxLength = 15
            TabOrder = 2
            OnChange = ChangeFiltro
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
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = FamiliaFiltro
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFFamHastaMovimiento: TLFEditFind2000
            Left = 192
            Top = 26
            Width = 49
            Height = 21
            MaxLength = 15
            TabOrder = 3
            OnChange = ChangeFiltro
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
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_FAMILIAS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = FamiliaFiltro
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object PNLDetalleMovimientos: TLFPanel
          Left = 0
          Top = 57
          Width = 1055
          Height = 174
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGMovimientos: THYTDBGrid
            Left = 0
            Top = 0
            Width = 1055
            Height = 174
            Align = alClient
            Color = clInfoBk
            DataSource = DMControl_Lotes.DSQMMovimientosStock
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGMovimientosCellClick
            OnDrawColumnCell = DBGMovimientosDrawColumnCell
            OnDblClick = DBGMovimientosDblClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'ALMACEN'
              'ARTICULO'
              'COD_CLI_PRO'
              'DOC_NUMERO'
              'DOC_SERIE'
              'DOC_TIPO'
              'FECHA'
              'LOTE'
              'REF_PEDIDO'
              'TIPO_OPER'
              'TITULO_CLI_PRO')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ALMACEN'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FAMILIA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LOTE'
                Width = 95
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ENTRADAS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SALIDAS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOC_NUMERO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOC_SERIE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DOC_TIPO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_OPER'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_MOV_STOCK'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COD_CLI_PRO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_CLI_PRO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REF_PEDIDO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_DOC_PEDIDO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_SIN_DTO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMENTARIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_ARTICULO'
                Width = 361
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 588
    Width = 1067
  end
  object PNLDetalle: TLFPanel [2]
    Left = 0
    Top = 289
    Width = 1067
    Height = 299
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCAsignados: TLFPageControl
      Left = 0
      Top = 0
      Width = 1067
      Height = 299
      ActivePage = TSAsignados
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSAsignados: TTabSheet
        Caption = 'Asignados'
        object PCAsignadosAsignados: TLFPageControl
          Left = 0
          Top = 0
          Width = 1059
          Height = 271
          ActivePage = TSAsignadosCompras
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSAsignadosCompras: TTabSheet
            Caption = 'Compras'
            object DBGAsignadosCompras: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1051
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMDetCompras
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGAsignadosComprasDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'EJERCICIO'
                'LINEA'
                'RIG'
                'SERIE'
                'TIPO')
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
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
                  FieldName = 'LINEA'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 55
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANTIDAD'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PROVEEDOR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE_R_SOCIAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end>
            end
          end
          object TSAsignadosVentas: TTabSheet
            Caption = 'Ventas'
            ImageIndex = 1
            object DBGAsignadosVentas: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1051
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMDetVentas
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGAsignadosVentasDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'CANTIDAD'
                'EJERCICIO'
                'LINEA'
                'RIG'
                'SERIE'
                'TIPO')
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 55
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANTIDAD'
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
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end>
            end
          end
          object TSAsignadosMovMan: TTabSheet
            Caption = 'Movimientos Stock'
            ImageIndex = 2
            object DBGAsignadosMovManuales: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1051
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMMovMan
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGAsignadosMovManualesDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'CANTIDAD'
                'COMENTARIO'
                'EJERCICIO'
                'FECHA'
                'LINEA'
                'RIG'
                'SERIE')
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_OPERACION'
                  Width = 55
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORIGEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANTIDAD'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMENTARIO'
                  Width = 405
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN_ORI'
                  Width = 52
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN_DST'
                  Visible = True
                end>
            end
          end
          object TSAsignadosProduccion: TTabSheet
            Caption = 'Produccion'
            ImageIndex = 3
            TabVisible = False
            object DBGAsignadosProduccion: THYTDBGrid
              Left = 0
              Top = 0
              Width = 774
              Height = 178
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSProduccion
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGAsignadosProduccionDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
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
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NORDEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_FABRICACION'
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_ENVASADO'
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'F_CADUCIDAD'
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANTIDAD'
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end>
            end
          end
          object TSAsignadosMovUbi: TTabSheet
            Caption = 'Movimientos Ubicaciones'
            object DBGAsignadosMovUbicaciones: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1051
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMDetMovUbi
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGAsignadosMovManualesDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CamposAOrdenar.Strings = (
                'CANTIDAD'
                'COMENTARIO'
                'EJERCICIO'
                'FECHA'
                'LINEA'
                'RIG'
                'SERIE')
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'N_MOV_UBICACION'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'O_ID_UBICACION'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'D_ID_UBICACION'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'O_COMPOSICION'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'D_COMPOSICION'
                  Width = 65
                  Visible = True
                end>
            end
          end
          object TSOrdenesProduccion: TTabSheet
            Caption = 'Ordenes de Produccion'
            object DBGOrdenesProduccion: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1051
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSOrdenesProduccion
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGOrdenesProduccionCellClick
              OnDblClick = DBGOrdenesProduccionDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID_ORDEN'
                  Width = 87
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESCANDALLO'
                  Width = 89
                  Visible = True
                end>
            end
          end
        end
      end
      object TSSinAsignar: TTabSheet
        Caption = 'Sin Asignar'
        ImageIndex = 1
        object PCSinAsignarSinAsignar: TLFPageControl
          Left = 0
          Top = 0
          Width = 1059
          Height = 271
          ActivePage = TSSinAsignarCompras
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSSinAsignarCompras: TTabSheet
            Caption = 'Compras'
            object DBGSinAsignarCom: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1051
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMComSinAsignar
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGSinAsignarComDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 55
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
                  Width = 309
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end>
            end
          end
          object TSSinAsignarVentas: TTabSheet
            Caption = 'Ventas'
            ImageIndex = 1
            object DBGSinAsignarVen: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1047
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMVentSinAsignar
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGSinAsignarVenDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 55
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
                  Width = 304
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end>
            end
          end
          object TSSinAsignarMan: TTabSheet
            Caption = 'Produccion (Compuesto)'
            ImageIndex = 2
            object DBGSinAsignarMan: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1047
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMProCompSinAsignar
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGSinAsignarManDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'COMPUESTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 300
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNI_TOTAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_ORDEN'
                  Visible = True
                end>
            end
          end
          object TSSinAsignarPro: TTabSheet
            Caption = 'Produccion (Componente)'
            ImageIndex = 3
            object DBGSinAsignarProd: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1047
              Height = 243
              Align = alClient
              Color = clInfoBk
              DataSource = DMControl_Lotes.DSQMProSinAsignar
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = DBGSinAsignarProdDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'RIG_OF'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA_MAT'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_STOCK'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMPONENTE'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA_FASE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ID_ORDEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTADO'
                  Visible = True
                end>
            end
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 690
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 744
    Top = 10
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 648
    Top = 16
    object AImprimeEtiquetas: TAction
      Tag = 1
      Category = 'Listados'
      Caption = 'Imprime Etiquetas de Lotes'
      Hint = 'Imprime Etiquetas de Lotes'
      ImageIndex = 95
      OnExecute = AImprimeEtiquetasExecute
    end
    object AImprimeEtiquetas2: TAction
      Tag = 2
      Category = 'Listados'
      Caption = 'Imprime Etiquetas de Lotes 2'
      Hint = 'Imprime Etiquetas de Lotes'
      ImageIndex = 95
      OnExecute = AImprimeEtiquetasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AInventarioPorLotes: TAction
      Category = 'Listados'
      Caption = 'Listado de Inventario por Lotes'
      Hint = 'Listado de Inventario por Lotes'
      ImageIndex = 14
      OnExecute = AInventarioPorLotesExecute
    end
    object AListadoLotesParaCompras: TAction
      Category = 'Listados'
      Caption = 'Listado de Lotes para Entradas'
      Hint = 'Listado de Lotes para Entradas'
      ImageIndex = 14
      OnExecute = AListadoLotesParaComprasExecute
    end
    object AListadoLotesParaVentas: TAction
      Category = 'Listados'
      Caption = 'Listado de Lotes para Salidas'
      Hint = 'Listado de Lotes para Salidas'
      ImageIndex = 14
      OnExecute = AListadoLotesParaVentasExecute
    end
    object AListadoLotesParaMovimientos: TAction
      Category = 'Listados'
      Caption = 'Listado de Movimientos de Lotes'
      Hint = 'Listado de Movimientos de Lotes'
      ImageIndex = 14
      OnExecute = AListadoLotesParaMovimientosExecute
    end
    object ATrazabilidadLotes: TAction
      Category = 'Listados'
      Caption = 'Trazabilidad de Lotes'
      Hint = 'Trazabilidad de Lotes'
      ImageIndex = 14
      OnExecute = ATrazabilidadLotesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 722
    Top = 20
  end
  object CodBarras: TCodeBar
    Alto = 80
    OrigenY = 15
    OrigenX = 5
    Modulo = 1
    Ratio = 2
    Tipo = cb128
    ChequearDigito = True
    TipoChequeo = csmModulo10
    Porcentaje = 0
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 612
    Top = 20
  end
end
