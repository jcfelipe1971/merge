inherited FMRegInventario: TFMRegInventario
  Left = 600
  Top = 202
  Width = 825
  Height = 474
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Regularizaci'#243'n de Stock'
  Constraints.MinWidth = 825
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 815
    Height = 173
    inherited TBMain: TLFToolBar
      Width = 811
      inherited NavMain: THYMNavigator
        DataSource = DMRegInventario.DSQMCabecera
        Hints.Strings = ()
        EditaControl = DBEFSerie
        InsertaControl = DBEFAlmacen
      end
      inherited EPMain: THYMEditPanel
        Width = 80
        VisibleButtons = [neBuscar, neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 308
      end
      inherited TbuttComp: TToolButton
        Left = 316
      end
    end
    inherited PCMain: TLFPageControl
      Width = 811
      Height = 143
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 803
          Height = 115
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'ART_REG_INVENTARIO'
            CampoNum = 'RIG'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LNumero: TLFLabel
            Left = 38
            Top = 18
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero'
          end
          object LAlmacen: TLFLabel
            Left = 34
            Top = 40
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LSerie: TLFLabel
            Left = 51
            Top = 61
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LEjercicio: TLFLabel
            Left = 157
            Top = 17
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LUsuario: TLFLabel
            Left = 383
            Top = 18
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LFechaRegistro: TLFLabel
            Left = 573
            Top = 18
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Reg.'
          end
          object LFechaMovimiento: TLFLabel
            Left = 572
            Top = 40
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Mov.'
          end
          object LTipoPrecio: TLFLabel
            Left = 376
            Top = 62
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Precio'
          end
          object LTipoInventario: TLFLabel
            Left = 388
            Top = 40
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Inv.'
          end
          object LDescripcion: TLFLabel
            Left = 19
            Top = 83
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LEstado: TLFLabel
            Left = 386
            Top = 84
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object DBENumero: TLFDbedit
            Left = 79
            Top = 14
            Width = 73
            Height = 21
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMRegInventario.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBENumeroChange
          end
          object ETitAlmacen: TLFEdit
            Left = 153
            Top = 36
            Width = 214
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object EUsuario: TLFEdit
            Left = 423
            Top = 14
            Width = 138
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object ETitSerie: TLFEdit
            Left = 153
            Top = 58
            Width = 214
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 36
            Width = 73
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMRegInventario.DSQMCabecera
            TabOrder = 1
            OnChange = DBEFAlmacenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 79
            Top = 58
            Width = 73
            Height = 21
            DataField = 'SERIE_MOV'
            DataSource = DMRegInventario.DSQMCabecera
            TabOrder = 3
            OnChange = DBEFSerieChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEEjercicio: TLFDbedit
            Left = 201
            Top = 14
            Width = 166
            Height = 21
            Color = clInfoBk
            DataField = 'EJERCICIO_MOV'
            DataSource = DMRegInventario.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBDTPFechaMov: TLFDBDateEdit
            Left = 633
            Top = 36
            Width = 87
            Height = 21
            DataField = 'FECHA_MOV'
            DataSource = DMRegInventario.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBDTPFechaEntrada: TLFDBDateEdit
            Left = 633
            Top = 14
            Width = 87
            Height = 21
            DataField = 'FECHA_MOV'
            DataSource = DMRegInventario.DSQMCabecera
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 13
          end
          object DBCBVTipoInventario: TDBComboBoxValue
            Left = 423
            Top = 36
            Width = 138
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_INV'
            DataSource = DMRegInventario.DSQMCabecera
            ItemHeight = 13
            Items.Strings = (
              'Absoluto'
              'Relativo'
              'Barrera'
              'Barrera (Apertura)')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3')
            TabOrder = 5
            OnChange = DBCBVTipoInventarioChange
          end
          object DBCBVTipoPrecio: TDBComboBoxValue
            Left = 423
            Top = 58
            Width = 138
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO'
            DataSource = DMRegInventario.DSQMCabecera
            ItemHeight = 13
            Items.Strings = (
              'Precio PMP'
              'Precio Configuraci'#243'n'
              'Precio Coste'
              'Precio Coste Ficha')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3')
            TabOrder = 6
          end
          object DBEDescripcion: TLFDbedit
            Left = 79
            Top = 80
            Width = 288
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMRegInventario.DSQMCabecera
            TabOrder = 10
          end
          object DBCBEstado: TDBComboBoxValue
            Left = 423
            Top = 80
            Width = 138
            Height = 21
            Style = csDropDownList
            Color = clInfoBk
            DataField = 'ESTADO'
            DataSource = DMRegInventario.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ItemHeight = 13
            Items.Strings = (
              'Abierto'
              'Cerrado'
              'En Proceso')
            Values.Strings = (
              '0'
              '5'
              '3')
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object LFCBStockFecha: TLFDBCheckBox
            Left = 573
            Top = 60
            Width = 196
            Height = 17
            Hint = 
              'Si est'#225' marcado calcula el stock a fecha de movimiento.'#13#10'Si est'#225 +
              ' desmarcado calcula el stock total en el almac'#233'n, sin tener en c' +
              'uenta la fecha.'
            Caption = 'Stock a Fecha Reg.'
            ClicksDisabled = False
            ColorCheck = 57088
            ShowHint = True
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'STOCK_FECHA'
            DataSource = DMRegInventario.DSQMCabecera
            ParentShowHint = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPHoraFechaMov: TDBDateTimePicker
            Left = 721
            Top = 35
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 45373.3871174653
            Time = 45373.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 8
            DataField = 'FECHA_MOV'
            DataSource = DMRegInventario.DSQMCabecera
          end
          object PNLProgreso: TPanel
            Left = 0
            Top = 104
            Width = 803
            Height = 11
            Align = alBottom
            BevelOuter = bvLowered
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
            Visible = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 803
          Height = 115
          DataSource = DMRegInventario.DSQMCabecera
          CamposAOrdenar.Strings = (
            'ALMACEN'
            'DESCRIPCION'
            'ESTADO'
            'FECHA_MOV'
            'RIG'
            'SERIE_MOV')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 41
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_MOV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO_MOV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE_MOV'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 331
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 173
    Width = 815
    Height = 248
    inherited TBDetalle: TLFToolBar
      Width = 815
      Height = 24
      AutoSize = False
      ParentShowHint = False
      ShowHint = True
      inherited NavDetalle: THYMNavigator
        DataSource = DMRegInventario.DSQMDetalle
        Hints.Strings = ()
        Exclusivo = True
      end
      object ToolButton5: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfStocks: TToolButton
        Left = 228
        Top = 0
        Action = AInfoStock
      end
      object ToolButton3: TToolButton
        Left = 251
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfoLotes: TToolButton
        Left = 259
        Top = 0
        Hint = 'Informaci'#243'n de Lotes'
        Caption = 'Lotes'
        ImageIndex = 120
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtInfoLotesClick
      end
      object TButSerializacion: TToolButton
        Left = 282
        Top = 0
        Hint = 'Genera n'#250'meros de serializaci'#243'n'
        Caption = 'Serializacion'
        ImageIndex = 115
        ParentShowHint = False
        ShowHint = True
        OnClick = TButSerializacionClick
      end
      object TButHistSerie: TToolButton
        Left = 305
        Top = 0
        Hint = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
        Caption = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
        ImageIndex = 11
        ParentShowHint = False
        ShowHint = True
        OnClick = TButHistSerieClick
      end
      object ToolButton2: TToolButton
        Left = 328
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBUnidadesACero: TToolButton
        Left = 336
        Top = 0
        Hint = 'Poner todas las unidades a 0'
        Caption = 'Unidades a 0'
        ImageIndex = 44
        ParentShowHint = False
        ShowHint = True
        OnClick = TBUnidadesACeroClick
      end
      object ToolButton4: TToolButton
        Left = 359
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBDescargaLectorKri: TToolButton
        Left = 367
        Top = 0
        Hint = 'Descarga los datos desde el lector de c'#243'digo de barras.'
        Caption = 'Descarga Lector'
        ImageIndex = 52
        ParentShowHint = False
        ShowHint = True
        OnClick = TBDescargaLectorKriClick
      end
      object TBDescargaExcel: TToolButton
        Left = 390
        Top = 0
        Hint = 
          'Descarga los datos desde un archivo Excel'#13#10'Columna A Articulo'#13#10'C' +
          'olumna B Stock'#13#10'Columna C Precio'#13#10'Columna D Lote'
        Caption = 'Descarga Excel'
        ImageIndex = 94
        ParentShowHint = False
        ShowHint = True
        OnClick = TBDescargaExcelClick
      end
      object TBDescargaStockTiendaVirtual: TToolButton
        Left = 413
        Top = 0
        Hint = 'Descarga Stock Tienda Virtual'
        Caption = 'Descarga Stock Tienda Virtual'
        ImageIndex = 49
        ParentShowHint = False
        ShowHint = True
        OnClick = TBDescargaStockTiendaVirtualClick
      end
      object TBDescargaVentur: TToolButton
        Left = 436
        Top = 0
        Hint = 'Descarga desde fichero Tarifa Ventur'
        Caption = 'Descarga Ventur'
        ImageIndex = 49
        OnClick = TBDescargaVenturClick
      end
      object TButtPruebas: TToolButton
        Left = 459
        Top = 0
        Hint = 'Pruebas'
        Caption = 'Pruebas'
        ImageIndex = 119
        OnClick = TButtPruebasClick
      end
      object TBAsignaLote: TToolButton
        Left = 482
        Top = 0
        Action = AAsignaLoteAuto
      end
      object TBEtiquetas: TToolButton
        Left = 505
        Top = 0
        Action = AEtiquetaArticulosTodos
      end
      object TSep1: TToolButton
        Left = 528
        Top = 0
        Width = 8
        ImageIndex = 96
        Style = tbsSeparator
      end
      object TBInsertarModelo: TToolButton
        Left = 536
        Top = 0
        Action = AInsertarModelo
      end
      object PNLFiltroDetalle: TLFPanel
        Left = 559
        Top = 0
        Width = 194
        Height = 22
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LFiltroArticulo: TLFLabel
          Left = 14
          Top = 5
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Articulo'
        end
        object EFFiltroArticulo: TLFEditFind2000
          Left = 54
          Top = 1
          Width = 137
          Height = 21
          TabOrder = 0
          OnChange = EFFiltroArticuloChange
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
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Top = 24
      Width = 815
      Height = 224
      DataSource = DMRegInventario.DSQMDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      IniStorage = FSMain
      ColumnaInicial = 1
      AutoCambiarColumna = True
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO'
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'ARTICULO'
        '0'
        'ARTICULO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        'ARTICULO'
        ''
        'ARTICULO')
      CamposDesplegar.Strings = (
        '0'
        '1'
        '0')
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'TITULO'
        'ALFA_6'
        'FECHA_CREACION'
        'ID_LOTE'
        'STOCK'
        'LOTE'
        'FAMILIA'
        'CLASIFICACION')
      Numericos.Strings = (
        'BARRAS'
        'ARTICULO'
        'NSERIE')
      Tablas.Strings = (
        'VER_ARTICULOS_CON_BARRAS'
        'VER_ARTICULOS_EF'
        'ART_ARTICULOS_SERIALIZACION')
      Acciones.Strings = (
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO'
        'ARTICULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        'BARRAS'
        'ARTICULO'
        'NSERIE')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 96
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CODIGO_PROVEEDOR'
          ReadOnly = True
          Width = 130
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 330
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 58
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
          Expanded = False
          FieldName = 'PRECIO'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FAMILIA'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_FAMILIA'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SUBFAMILIA'
          ReadOnly = True
          Width = 43
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_6'
          ReadOnly = True
          Width = 130
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROVEEDOR'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LOTE'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROVEEDOR_LOTE'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_CREACION'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLASIFICACION'
          Width = 130
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_2'
          ReadOnly = True
          Width = 130
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALTO'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ANCHO'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FONDO'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDAD'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_ARTICULO'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PESO'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VOLUMEN_UNIT'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIAMETRO_UNIT'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LITROS_POR_UNIDAD'
          ReadOnly = True
          Width = 55
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 421
    Width = 815
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 596
    Top = 276
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 632
    Top = 272
    inherited CEMainMireport: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    Left = 336
    Top = 28
    object AVisualizacionRegularizacionStock: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado'
      ImageIndex = 14
      OnExecute = AVisualizacionRegularizacionStockExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object ATraspasoMovimientoStock: TAction
      Category = 'Otros'
      Caption = 'Traspaso a Movimiento Stock de Entrada'
      Hint = 'Traspaso a Movimiento Stock de Entrada'
      ImageIndex = 125
      OnExecute = ATraspasoMovimientoStockExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AInsertarVarios: TAction
      Category = 'Procesos;"Inserci'#243'n de Art'#237'culos Masiva"'
      Caption = 'Inserci'#243'n de Art'#237'culos Masiva'
      Hint = 'Inserci'#243'n de Art'#237'culos Masiva'
      ImageIndex = 109
      OnExecute = AInsertarVariosExecute
    end
    object AEliminaCero: TAction
      Category = 'Procesos'
      Caption = 'Elimina los detalles con unidades 0'
      Hint = 'Elimina los detalles con unidades 0'
      ImageIndex = 22
      OnExecute = AEliminaCeroExecute
    end
    object ARefrescaStock: TAction
      Category = 'Procesos'
      Caption = 'Refresca el Stock de todas las l'#237'neas'
      Hint = 'Refresca el Stock de todas las l'#237'neas'
      ImageIndex = 21
      OnExecute = ARefrescaStockExecute
    end
    object ARefrescaPrecio: TAction
      Category = 'Procesos'
      Caption = 'Refresca Precio de todas las lineas'
      Hint = 'Refresca Precio de todas las lineas'
      ImageIndex = 21
      OnExecute = ARefrescaPrecioExecute
    end
    object AMovimientos: TAction
      Category = 'Procesos'
      Caption = 'Muestra los movimientos asociados'
      Hint = 'Muestra los movimientos asociados'
      ImageIndex = 18
      OnExecute = AMovimientosExecute
    end
    object AInsertarArticulosMovimientos: TAction
      Tag = 4
      Category = 'Procesos;"Inserci'#243'n de Art'#237'culos Masiva"'
      Caption = 'Inserci'#243'n de Art'#237'culos con movimientos en el Almacen'
      Hint = 'Inserci'#243'n de Art'#237'culos con movimientos en el Almacen'
      ImageIndex = 109
      OnExecute = AInsertarArticulosMovimientosExecute
    end
    object ACierra: TAction
      Category = 'Procesos'
      Caption = 'Cierra el Inventario'
      Hint = 'Cierra el Inventario'
      ImageIndex = 68
      OnExecute = ACierraExecute
    end
    object AAbre: TAction
      Category = 'Procesos'
      Caption = 'Abre el Inventario'
      Hint = 'Abre el Inventario'
      ImageIndex = 67
      OnExecute = AAbreExecute
    end
    object AInsertarVariosStock: TAction
      Tag = 1
      Category = 'Procesos;"Inserci'#243'n de Art'#237'culos Masiva"'
      Caption = 'Inserci'#243'n de Art'#237'culos con Stock'
      Hint = 'Inserci'#243'n de Art'#237'culos con Stock'
      ImageIndex = 109
      OnExecute = AInsertarVariosExecute
    end
    object AInsertarVariosBarrera: TAction
      Tag = 2
      Category = 'Procesos;"Inserci'#243'n de Art'#237'culos Masiva"'
      Caption = 'Inserci'#243'n de Art'#237'culos con Mvtos. desde '#250'ltima Barrera'
      Hint = 'Inserci'#243'n de Art'#237'culos con Movimientos desde la '#250'ltima Barrera'
      ImageIndex = 109
      OnExecute = AInsertarVariosExecute
    end
    object AInsertarVariosBarreraStock: TAction
      Tag = 3
      Category = 'Procesos;"Inserci'#243'n de Art'#237'culos Masiva"'
      Caption = 'Inserci'#243'n de Art'#237'culos con Mvtos. desde '#250'ltima Barrera y Stock'
      Hint = 
        'Inserci'#243'n de Art'#237'culos con Movimientos desde la '#250'ltima Barrera y' +
        ' con Stock'
      ImageIndex = 109
      OnExecute = AInsertarVariosExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos;"Inserci'#243'n de Art'#237'culos Masiva"'
      Caption = 'Inserci'#243'n de Art'#237'culos'
      ImageIndex = 109
    end
    object AInfoStock: TAction
      Category = 'Procesos'
      Caption = 'Info Stock'
      Hint = 'Informaci'#243'n de Stocks '
      ImageIndex = 1
      OnExecute = AInfoStockExecute
    end
    object ACreaInventarioTodosAlmacenes: TAction
      Category = 'Procesos'
      Caption = 'Crea Inventario para todos los Almacenes'
      Hint = 'Crea Inventario para todos los Almacenes, con las unidades a 0'
      ImageIndex = 22
      OnExecute = ACreaInventarioTodosAlmacenesExecute
    end
    object AAsignaLoteAuto: TAction
      Category = 'Procesos'
      Caption = 'Asigna Lote Auto'
      Hint = 'Asigna Lote'
      ImageIndex = 80
      OnExecute = AAsignaLoteAutoExecute
    end
    object AEtiquetasArticulo: TAction
      Category = 'Procesos'
      Caption = 'AEtiquetasArticulo'
      Hint = 'Etiqueta por art'#237'culo'
      ImageIndex = 95
      OnExecute = AEtiquetasArticuloExecute
    end
    object AEtiquetaArticulosTodos: TAction
      Category = 'Procesos'
      Caption = 'Etiqueta Articulos Todos'
      Hint = 'Etiquetar lo filtrado'
      ImageIndex = 95
      OnExecute = AEtiquetaArticulosTodosExecute
    end
    object AInsertarModelo: TAction
      Category = 'Procesos;"Inserci'#243'n de Art'#237'culos Masiva"'
      Caption = 'Insertar Articulos de un Modelo'
      Hint = 'Insertar Articulos de un Modelo'
      ImageIndex = 109
      OnExecute = AInsertarModeloExecute
    end
    object AConfListados: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfListadosExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 380
    Top = 28
  end
  inherited CEDetalle: TControlEdit
    Complementario = nil
    SubComplementario = ALMain
    Left = 598
    Top = 328
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 634
    Top = 330
    inherited CEDetalleMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEDetalleMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEDetalleMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEDetalleMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEDetalleMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEDetalleMidelete: TMenuItem
      ShortCut = 16460
    end
    inherited CEDetalleMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEDetalleMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEDetalleMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEDetalleMirefresh: TMenuItem
      ShortCut = 16499
    end
  end
end
