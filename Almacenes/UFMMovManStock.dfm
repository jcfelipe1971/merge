inherited FMMovManStock: TFMMovManStock
  Left = 384
  Top = 268
  Width = 803
  Height = 500
  HelpContext = 131
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Movimientos Manuales de Stocks'
  Constraints.MinHeight = 425
  Constraints.MinWidth = 803
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 793
    Height = 209
    inherited TBMain: TLFToolBar
      Width = 789
      inherited NavMain: THYMNavigator
        DataSource = DMMovManStock.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        OnClick = NavMainClick
        EditaControl = DBEComentario
        InsertaControl = DBRGTipoMov
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 80
        VisibleButtons = [neImprime, neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 308
      end
      inherited TbuttComp: TToolButton
        Left = 316
      end
      object TButtAbreCierra: TToolButton
        Left = 339
        Top = 0
        Action = AAbrirCerrar
      end
      object PNLFiltroSerie: TLFPanel
        Left = 362
        Top = 0
        Width = 215
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 14
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object CBSeries: TLFComboBox
          Left = 41
          Top = 0
          Width = 172
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSeriesChange
          Items.Strings = (
            'Todas las series')
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 789
      Height = 179
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 781
          Height = 151
          inherited G2KTableLoc: TG2KTBLoc
            Left = 70
            Top = 83
          end
          object LBLSerie: TLFLabel
            Left = 59
            Top = 51
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LBLNumero: TLFLabel
            Left = 232
            Top = 51
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero'
          end
          object LBLFecha: TLFLabel
            Left = 401
            Top = 51
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LFLOrigen: TLFLabel
            Left = 688
            Top = 48
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Origen'
          end
          object LEstado: TLFLabel
            Left = 555
            Top = 16
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LBLComentario: TLFLabel
            Left = 30
            Top = 72
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LBLAlmacenOrig: TLFLabel
            Left = 8
            Top = 103
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Origen'
          end
          object LBLAlmacenDst: TLFLabel
            Left = 3
            Top = 126
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n Destino'
          end
          object LBLCanalOrig: TLFLabel
            Left = 432
            Top = 103
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal Origen'
          end
          object LBLCanalDst: TLFLabel
            Left = 427
            Top = 126
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal Destino'
          end
          object DBRGTipoMov: TDBRadioGroup
            Left = 10
            Top = 0
            Width = 515
            Height = 41
            Caption = 'Tipo Mov.'
            Columns = 3
            DataField = 'TIPO_OPERACION'
            DataSource = DMMovManStock.DSQMCabecera
            Items.Strings = (
              '&Entrada'
              '&Salida'
              '&Traspaso entre Almacenes')
            TabOrder = 0
            Values.Strings = (
              'E'
              'S'
              'T')
            OnChange = DBRGTipoMovChange
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 438
            Top = 47
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMMovManStock.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DBERig: TLFDbedit
            Left = 274
            Top = 47
            Width = 87
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMMovManStock.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 87
            Top = 47
            Width = 87
            Height = 21
            DataField = 'SERIE'
            DataSource = DMMovManStock.DSQMCabecera
            TabOrder = 2
            OnChange = DBEFSerieChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'GEN_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFSerieBusqueda
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEComentario: TLFDbedit
            Left = 87
            Top = 69
            Width = 274
            Height = 21
            DataField = 'COMENTARIO'
            DataSource = DMMovManStock.DSQMCabecera
            TabOrder = 7
          end
          object LFDsbOrigen: TLFDbedit
            Left = 724
            Top = 45
            Width = 48
            Height = 21
            Color = clInfoBk
            DataField = 'ORIGEN'
            DataSource = DMMovManStock.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBEstado: TLFDbedit
            Left = 593
            Top = 12
            Width = 180
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMMovManStock.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnChange = DBEstadoChange
          end
          object DBEAlmacenDst: TLFDbedit
            Left = 137
            Top = 122
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMMovManStock.DSxAlmacenDst
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
          object DBEFAlmacenOrig: TLFDBEditFind2000
            Left = 87
            Top = 100
            Width = 49
            Height = 21
            DataField = 'ALMACEN_ORI'
            DataSource = DMMovManStock.DSQMCabecera
            TabOrder = 8
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
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAlmacenDst: TLFDBEditFind2000
            Left = 87
            Top = 122
            Width = 49
            Height = 21
            DataField = 'ALMACEN_DST'
            DataSource = DMMovManStock.DSQMCabecera
            TabOrder = 10
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
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEAlmacenOrig: TLFDbedit
            Left = 137
            Top = 100
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMMovManStock.DSxAlmacenOrig
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEFCanalDst: TLFDBEditFind2000
            Left = 498
            Top = 122
            Width = 49
            Height = 21
            DataField = 'CANAL_DST'
            DataSource = DMMovManStock.DSQMCabecera
            TabOrder = 14
            OnChange = DBEFCanalDstChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECanalOrig: TLFEdit
            Left = 548
            Top = 100
            Width = 224
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
            ReadOnly = True
            TabOrder = 13
          end
          object ECanalDst: TLFEdit
            Left = 548
            Top = 122
            Width = 224
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
            ReadOnly = True
            TabOrder = 15
          end
          object DBEFCanalOrig: TLFDBEditFind2000
            Left = 498
            Top = 100
            Width = 49
            Height = 21
            DataField = 'CANAL_ORI'
            DataSource = DMMovManStock.DSQMCabecera
            TabOrder = 12
            OnChange = DBEFCanalOrigChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDTPHora: TDBDateTimePicker
            Left = 525
            Top = 47
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 46010.3871174653
            Format = 'HH:mm'
            Time = 46010.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 5
            DataField = 'FECHA'
            DataSource = DMMovManStock.DSQMCabecera
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 781
          Height = 151
          DataSource = DMMovManStock.DSQMCabecera
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'ALMACEN_DST'
            'ALMACEN_ORI'
            'CANAL_DST'
            'CANAL_ORI'
            'COMENTARIO'
            'ESTADO'
            'FECHA'
            'RIG'
            'SERIE'
            'TIPO_OPERACION')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_OPERACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 107
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_ORI'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL_ORI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_DST'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL_DST'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Width = 191
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 209
    Width = 793
    Height = 238
    inherited TBDetalle: TLFToolBar
      Width = 793
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        DataSource = DMMovManStock.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
      end
      object ToolButton2: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtStocks: TToolButton
        Left = 228
        Top = 0
        Action = AStocks
        ParentShowHint = False
        ShowHint = True
      end
      object TButtUnidades_Ext: TToolButton
        Left = 251
        Top = 0
        Action = AUnidadesExt
        ParentShowHint = False
        ShowHint = True
      end
      object TButtInfoLotes: TToolButton
        Left = 274
        Top = 0
        Action = AInfoLotes
        ParentShowHint = False
        ShowHint = True
      end
      object TButSerializacion: TToolButton
        Left = 297
        Top = 0
        Action = ASerializacion
        ParentShowHint = False
        ShowHint = True
      end
      object TButHistNserie: TToolButton
        Left = 320
        Top = 0
        Action = AHistoricoSerializacion
        ParentShowHint = False
        ShowHint = True
      end
      object TButtUbicaciones: TToolButton
        Left = 343
        Top = 0
        Action = AVerUbicaciones
        DropdownMenu = PopupUbicaciones
        Style = tbsDropDown
      end
      object ToolButton3: TToolButton
        Left = 379
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtDescargaLector: TToolButton
        Left = 387
        Top = 0
        Action = ADescargaLectorCreaMov
      end
      object TButtImportarDetalle: TToolButton
        Left = 410
        Top = 0
        Hint = 'Importar Articulos desde Texto'
        Action = AImportarDetalle
        ParentShowHint = False
        ShowHint = True
      end
      object BAsignaKit: TToolButton
        Left = 433
        Top = 0
        Action = AAsignaKit
      end
      object TBInsercionMasivaModelo: TToolButton
        Left = 456
        Top = 0
        Action = AInsercionMasivaModelo
      end
      object PNLMostratSotck: TLFPanel
        Left = 479
        Top = 0
        Width = 174
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LMostraStock: TLFLabel
          Left = 10
          Top = 4
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Mostra Stock'
        end
        object CBMostrarStockOri: TLFCheckBox
          Left = 79
          Top = 3
          Width = 46
          Height = 17
          Caption = 'Orig.'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBMostrarStockChange
        end
        object CBMostrarStockDst: TLFCheckBox
          Left = 122
          Top = 3
          Width = 46
          Height = 17
          Caption = 'Dest.'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBMostrarStockChange
        end
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 793
      Height = 187
      DataSource = DMMovManStock.DSQMDetalle
      DefaultDrawing = False
      TabOrder = 0
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      OnKeyPress = DBGFDetalleKeyPress
      OnKeyUp = DBGFDetalleKeyUp
      IniStorage = FSMain
      ColumnaInicial = 1
      AutoCambiarColumna = True
      Transaction = DMMovManStock.TLocal
      BuscarNums = True
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO'
        'ARTICULO'
        'ARTICULO'
        'ID_UBICACION_E'
        'ID_UBICACION_S')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'ARTICULO'
        '0'
        'ARTICULO'
        '0'
        'ARTICULO'
        '0'
        'ID_UBICACION_E'
        '0'
        'ID_UBICACION_S'
        '1'
        'COMPOSICION')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        'ARTICULO'
        'ARTICULO'
        'ARTICULO'
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '0'
        '0'
        '0'
        '1'
        '1')
      Numericos.Strings = (
        'ARTICULO'
        'BARRAS'
        'CODIGO_PROVEEDOR'
        'NSERIE'
        'ID_UBICACION'
        'ID_UBICACION')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_EF'
        'VER_ARTICULOS_CON_BARRAS'
        'ART_ARTICULOS_CODPROV'
        'ART_ARTICULOS_SERIALIZACION'
        'ART_ALMACENES_UBICACIONES'
        'ART_ALMACENES_UBICACIONES')
      Acciones.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TIPO'
        'PROVEEDOR'
        'NSERIE'
        'TITULO'
        'TITULO')
      BeforeColExit = DBGFDetalleBeforeColExit
      OnBusqueda = DBGFDetalleBusqueda
      OnCampoDevuelve = DBGFDetalleCampoDevuelve
      OnExiste = DBGFDetalleExiste
      OnRowChange = DBGFDetalleRowChange
      Planes.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        ''
        ''
        'ID_UBICACION')
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
          Width = 31
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
          FieldName = 'TITULO'
          Width = 329
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_EXT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LOTE'
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
          Expanded = False
          FieldName = 'CLASIFICACION'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_UBICACION_S'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIT_UBICACION_S'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COMPOSICION_S'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CALLE_S'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTANTERIA_S'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REPISA_S'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POSICION_S'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_UBICACION_E'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIT_UBICACION_E'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COMPOSICION_E'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CALLE_E'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTANTERIA_E'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REPISA_E'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POSICION_E'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_VENTA'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN_PRODUCCION'
          Width = 65
          Visible = True
        end>
    end
    object PNLTotales: TLFPanel
      Left = 0
      Top = 209
      Width = 793
      Height = 29
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        793
        29)
      object LUnidades: TLFLabel
        Left = 515
        Top = 8
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Unidades'
      end
      object LTotal: TLFLabel
        Left = 661
        Top = 8
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Total'
      end
      object LAsiento: TLFLabel
        Left = 373
        Top = 8
        Width = 35
        Height = 13
        Alignment = taRightJustify
        Anchors = [akTop, akRight]
        Caption = 'Asiento'
      end
      object SBVerAsiento: TSpeedButton
        Left = 412
        Top = 4
        Width = 61
        Height = 18
        OnClick = SBVerAsientoClick
      end
      object DBESumaUnidades: TLFDbedit
        Left = 564
        Top = 4
        Width = 62
        Height = 21
        Anchors = [akTop, akRight]
        Color = clInfoBk
        DataField = 'UNIDADES'
        DataSource = DMMovManStock.DSxTotales
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBESumaPrecio: TLFDbedit
        Left = 689
        Top = 4
        Width = 81
        Height = 21
        Anchors = [akTop, akRight]
        Color = clInfoBk
        DataField = 'IMPORTE'
        DataSource = DMMovManStock.DSxTotales
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEAsiento: TLFDbedit
        Left = 412
        Top = 4
        Width = 62
        Height = 21
        Anchors = [akTop, akRight]
        AutoSize = False
        Color = clAqua
        DataField = 'RIC'
        DataSource = DMMovManStock.DSxTotales
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
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 793
  end
  inherited CEMain: TControlEdit
    Complementario = TBActions
    Left = 420
    Top = 32
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 452
    Top = 32
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    Left = 604
    Top = 40
    object AVisualizarListadodeMovimientos: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado de Movimientos'
      Hint = 'Visualizar Listado de Movimientos'
      ImageIndex = 14
      OnExecute = AVisualizarListadodeMovimientosExecute
    end
    object AImprimirListadodeMovimientos: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado de Movimientos'
      Hint = 'Imprimir Listado de Movimientos'
      ImageIndex = 14
      OnExecute = AImprimirListadodeMovimientosExecute
    end
    object AListadodeMovimientosFiltrado: TAction
      Category = 'Listados'
      Caption = 'Listado de Movimientos Filtrado'
      Hint = 'Listado de Movimientos Filtrado'
      ImageIndex = 14
      OnExecute = AListadodeMovimientosFiltradoExecute
    end
    object ACodBarras: TAction
      Category = 'Listados'
      Caption = 'Listado de C'#243'digos de Barras'
      Hint = 'Listados de etiquetas de C'#243'digos de Barras'
      ImageIndex = 38
      OnExecute = ACodBarrasExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AConfListados: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfListadosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Documento'
      Hint = 'Cerrar Documento'
      ImageIndex = 68
      OnExecute = AAbrirCerrarExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos;"Descarga Lector"'
      Caption = 'Descarga Lector'
      ImageIndex = 49
    end
    object ADescargaLectorCreaMov: TAction
      Category = 'Procesos;"Descarga Lector"'
      Caption = 'Genera movimiento'
      Hint = 'Descarga los datos leidos con el lector de codigos de barras'
      ImageIndex = 52
      OnExecute = ADescargaLectorCreaMovExecute
    end
    object ADescargaLectorVerificaMov: TAction
      Category = 'Procesos;"Descarga Lector"'
      Caption = 'Verifica Unidades'
      ImageIndex = 19
      OnExecute = ADescargaLectorVerificaMovExecute
    end
    object AListarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Lista Etiquetas'
      Hint = 'Lista Etiquetas de los articulos del documento'
      ImageIndex = 95
      OnExecute = AListarEtiquetasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBMostrarStockOri.Checked'
      'CBMostrarStockDst.Checked')
    Left = 384
    Top = 42
  end
  inherited CEDetalle: TControlEdit
    SubComplementario = ALMain
    Left = 502
    Top = 34
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 536
    Top = 36
  end
  object ALMovMan: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 572
    Top = 40
    object AStocks: TAction
      Caption = 'Informaci'#243'n de Stocks (Ctrl + S)'
      Hint = 'Informaci'#243'n de Stocks (Ctrl + S)'
      ImageIndex = 1
      ShortCut = 16467
      OnExecute = AStocksExecute
    end
    object AInfoLotes: TAction
      Caption = 'Informaci'#243'n de Lotes'
      Hint = 'Informaci'#243'n de Lotes'
      ImageIndex = 120
      ShortCut = 16460
      OnExecute = AInfoLotesExecute
    end
    object ASerializacion: TAction
      Caption = 'Generar n'#250'meros de serializaci'#243'n'
      Hint = 'Generar n'#250'meros de serializaci'#243'n'
      ImageIndex = 115
      ShortCut = 16462
      OnExecute = ASerializacionExecute
    end
    object AHistoricoSerializacion: TAction
      Caption = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      Hint = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      ImageIndex = 11
      OnExecute = AHistoricoSerializacionExecute
    end
    object AVerUbicaciones: TAction
      Caption = 'Ver Ubicaciones'
      Hint = 'Ver Ubicaciones'
      ImageIndex = 81
      OnExecute = AVerUbicacionesExecute
    end
    object AImportarDetalle: TAction
      Caption = 'Importar Detalle'
      Hint = 'Importar Detalle desde Texto'
      ImageIndex = 49
      OnExecute = AImportarDetalleExecute
    end
    object AUnidadesExt: TAction
      Caption = 'Unidades Extendidas'
      Hint = 'Unidades Extendidas'
      ImageIndex = 69
      ShortCut = 49221
      OnExecute = AUnidadesExtExecute
    end
    object AAsignaKit: TAction
      Caption = 'Seleccionar Kit'
      Hint = 'Selecionar Kit de Tallas'
      ImageIndex = 140
      OnExecute = AAsignaKitExecute
    end
    object AAsientoMovimiento: TAction
      Caption = 'AAsientoMovimiento'
      OnExecute = AAsientoMovimientoExecute
    end
    object AInsercionMasivaModelo: TAction
      Caption = 'Insercion Masiva Modelo'
      Hint = 'Inserta todos los colores de un modelo'
      ImageIndex = 10
      OnExecute = AInsercionMasivaModeloExecute
    end
  end
  object PopupUbicaciones: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 632
    Top = 40
    object MIEntradas1: TMenuItem
      Caption = 'Entradas'
      Hint = 'Ver Ubicaciones'
      ImageIndex = 43
      OnClick = AVerUbicacionesExecute
    end
    object MISalidas1: TMenuItem
      Caption = 'Salidas'
      Hint = 'Visualizar Listado de Movimientos'
      ImageIndex = 42
      OnClick = AVerUbicacionesExecute
    end
  end
end
