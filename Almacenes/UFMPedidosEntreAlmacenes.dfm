inherited FMPedidosEntreAlmacenes: TFMPedidosEntreAlmacenes
  Left = 439
  Top = 237
  Width = 800
  Height = 450
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Pedidos Entre Almacenes'
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 161
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBEFAlmacenOrigen
        InsertaControl = DBEFAlmacenOrigen
      end
      inherited EPMain: THYMEditPanel
        Width = 99
        DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 327
      end
      inherited TbuttComp: TToolButton
        Left = 335
      end
      object TButtImprimeListado: TToolButton
        Left = 358
        Top = 0
        Action = AInformePedido
      end
      object PNLTitSerie: TLFPanel
        Left = 381
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBLSerieFiltro: TLFLabel
          Left = 12
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object ETitSerieFiltro: TLFEdit
          Left = 110
          Top = 0
          Width = 160
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
          TabOrder = 0
        end
        object EFSerieFiltro: TLFEditFind2000
          Left = 39
          Top = 0
          Width = 70
          Height = 21
          TabStop = False
          TabOrder = 1
          OnChange = EFSerieFiltroChange
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
      end
      object TBSep1: TToolButton
        Left = 656
        Top = 0
        Width = 8
        ImageIndex = 15
        Style = tbsSeparator
      end
      object TBVerTodos: TToolButton
        Left = 664
        Top = 0
        Action = AVerTodos
      end
      object TBVerAbiertos: TToolButton
        Left = 687
        Top = 0
        Action = AVerAbiertos
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 131
      inherited TSFicha: TTabSheet
        object SBVerMovManStock: TSpeedButton [0]
          Left = 712
          Top = 40
          Width = 65
          Height = 22
          Action = AVerMovManStock
          OnDblClick = SBVerMovManStockDblClick
        end
        inherited PEdit: TLFPanel
          Width = 778
          Height = 103
          inherited G2KTableLoc: TG2KTBLoc
            Left = 80
            Top = 31
            CamposADesplegar.Strings = (
              'ALMACEN_ORI'
              'ALMACEN_DST'
              'SERIE')
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'GES_CABECERAS_PEA'
            CampoNum = 'RIG'
            CampoStr = 'COMENTARIO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LAlmacenOrigen: TLFLabel
            Left = 19
            Top = 35
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. que Pide'
          end
          object LAlmacenDestino: TLFLabel
            Left = 4
            Top = 56
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. que entrega'
          end
          object LComentario: TLFLabel
            Left = 31
            Top = 79
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LRIG: TLFLabel
            Left = 47
            Top = 12
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero'
          end
          object LEstado: TLFLabel
            Left = 172
            Top = 12
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LEjercicio: TLFLabel
            Left = 413
            Top = 56
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LFecha: TLFLabel
            Left = 421
            Top = 12
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LMovManStock: TLFLabel
            Left = 649
            Top = 56
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mov. Man.'
          end
          object LSerie: TLFLabel
            Left = 429
            Top = 35
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
            Layout = tlCenter
          end
          object DBEFAlmacenOrigen: TLFDBEditFind2000
            Left = 88
            Top = 31
            Width = 65
            Height = 21
            DataField = 'ALMACEN_ORI'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            TabOrder = 0
            OnChange = DBEFAlmacenOrigenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAlmacenDestino: TLFDBEditFind2000
            Left = 88
            Top = 53
            Width = 65
            Height = 21
            DataField = 'ALMACEN_DST'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            TabOrder = 1
            OnChange = DBEFAlmacenDestinoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EAlmacenOrigen: TLFEdit
            Left = 154
            Top = 31
            Width = 232
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object EAlmacenDestino: TLFEdit
            Left = 154
            Top = 53
            Width = 232
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
          object DBEComentario: TLFDbedit
            Left = 88
            Top = 75
            Width = 298
            Height = 21
            DataField = 'COMENTARIO'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            TabOrder = 2
          end
          object DBERig: TLFDbedit
            Left = 88
            Top = 9
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            Enabled = False
            TabOrder = 7
          end
          object DBEEjercicio: TLFDbedit
            Left = 456
            Top = 53
            Width = 81
            Height = 21
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 456
            Top = 9
            Width = 105
            Height = 21
            DataField = 'FECHA'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEEstado: TLFDbedit
            Left = 209
            Top = 9
            Width = 177
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 9
            OnChange = DBEEstadoChange
          end
          object DBEMovManSotck: TLFDbedit
            Left = 704
            Top = 53
            Width = 65
            Height = 21
            Color = clAqua
            DataField = 'MOV_MAN_STOCK'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 456
            Top = 31
            Width = 81
            Height = 21
            DataField = 'SERIE'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            TabOrder = 4
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
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitSerie: TLFEdit
            Left = 538
            Top = 31
            Width = 231
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
            TabOrder = 11
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        object PNLCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 778
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLTitNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LBLFechaNotas: TLFLabel
              Left = 545
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLReferenciaNotas: TLFLabel
              Left = 74
              Top = 4
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Referencia'
              Layout = tlCenter
            end
            object DBENotasFechaCab: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBENotasSuReferenciaCab: TLFDbedit
              Left = 129
              Top = 0
              Width = 408
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'COMENTARIO'
              DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
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
            object DBENotasRIGCab: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
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
          object NavNotas: THYMNavigator
            Left = 655
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLDetNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 778
          Height = 81
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 778
            Height = 81
            Align = alClient
            BevelEdges = []
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 103
          DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
          CamposAOrdenar.Strings = (
            'ALMACEN_DST'
            'ALMACEN_ORI'
            'COMENTARIO'
            'ESTADO'
            'FECHA'
            'ID'
            'MOV_MAN_STOCK'
            'RIG'
            'SERIE')
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_ORI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_DST'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
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
  inherited TBActions: TLFToolBar [1]
    Top = 397
    Width = 790
  end
  inherited PDetalle: TLFPanel [2]
    Top = 161
    Width = 790
    Height = 236
    inherited TBDetalle: TLFToolBar
      Width = 790
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        DataSource = DMPedidosEntreAlmacenes.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
      end
      object ToolButton2: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtEnviarTodas: TToolButton
        Left = 228
        Top = 0
        Hint = 'Marca unidades enviadas = unidades pedidas en todas las lineas'
        Caption = 'Enviar Todas'
        ImageIndex = 53
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtEnviarTodasClick
      end
      object TButtRecibirTodas: TToolButton
        Left = 251
        Top = 0
        Hint = 'Marca unidades recibidas = unidades enviadas en todas las lineas'
        Caption = 'Recibir Todas'
        ImageIndex = 52
        OnClick = TButtRecibirTodasClick
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 790
      Height = 214
      DataSource = DMPedidosEntreAlmacenes.DSQMDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      IniStorage = FSMain
      ColumnaInicial = 1
      AutoCambiarColumna = True
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      Transaction = DMPedidosEntreAlmacenes.TLocal
      BuscarNums = True
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO'
        'ARTICULO'
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'ARTICULO'
        '0'
        'ARTICULO'
        '0'
        'ARTICULO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        'ARTICULO'
        'ARTICULO'
        'ARTICULO')
      CamposDesplegar.Strings = (
        '1'
        '0'
        '0'
        '0')
      Numericos.Strings = (
        'ARTICULO'
        'BARRAS'
        'CODIGO_PROVEEDOR'
        'NSERIE')
      Tablas.Strings = (
        'VER_ARTICULOS_EF'
        'VER_ARTICULOS_CON_BARRAS'
        'ART_ARTICULOS_CODPROV'
        'ART_ARTICULOS_SERIALIZACION')
      Acciones.Strings = (
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TIPO'
        'PROVEEDOR'
        'NSERIE')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        ''
        ''
        '')
      Columns = <
        item
          Expanded = False
          FieldName = 'LINEA'
          Width = 29
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
          Width = 354
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_PED'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_ENV'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_REC'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK_ALM'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK_ALM2'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK_ALM3'
          Width = 70
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
    EnlazadoA = CENotas
    Complementario = TBDetalle
    Left = 352
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 388
    Top = 28
  end
  inherited ALMain: TLFActionList
    Left = 424
    Top = 32
    object AInformePedido: TAction
      Category = 'Listados'
      Caption = 'Informe de Pedido'
      ImageIndex = 14
      OnExecute = AInformePedidoExecute
    end
    object AInformePedidosPendientes: TAction
      Category = 'Listados'
      Caption = 'Informe de Pedidos Pendientes'
      ImageIndex = 14
      OnExecute = AInformePedidosPendientesExecute
    end
    object APickingList: TAction
      Category = 'Listados'
      Caption = 'Picking List'
      Hint = 'Listado de Preparacion (Picking List)'
      ImageIndex = 14
      OnExecute = APickingListExecute
    end
    object ADisenyarPedido: TAction
      Category = 'Listados'
      Caption = 'Dise'#241'o de informe de pedido entre almacenes'
      ImageIndex = 77
      OnExecute = ADisenyarPedidoExecute
    end
    object ADisenyarPedidoPendientes: TAction
      Category = 'Listados'
      Caption = 'Dise'#241'ar Informe de Pedidos Pendientes'
      ImageIndex = 77
      OnExecute = ADisenyarPedidoPendientesExecute
    end
    object ADisenyarPickingList: TAction
      Category = 'Listados'
      Caption = 'Dise'#241'o de informe de Picking List'
      Hint = 'Listado de Preparacion (Picking List)'
      ImageIndex = 77
      OnExecute = ADisenyarPickingListExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAbrirPedido: TAction
      Category = 'Procesos'
      Caption = 'Abrir Pedido'
      ImageIndex = 67
      OnExecute = AAbrirPedidoExecute
    end
    object ACerrarPedido: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Pedido'
      ImageIndex = 68
      OnExecute = ACerrarPedidoExecute
    end
    object AAgruparPedidosAbiertos: TAction
      Category = 'Procesos'
      Caption = 'Agrupar Pedidos Abiertos'
      ImageIndex = 62
      OnExecute = AAgruparPedidosAbiertosExecute
    end
    object AGenerarPedidoStockMinimo: TAction
      Category = 'Procesos'
      Caption = 'Generar Pedido Stock Min.'
      ImageIndex = 62
      OnExecute = AGenerarPedidoStockMinimoExecute
    end
    object AVerMovManStock: TAction
      Category = 'Procesos'
      Caption = 'Ir al Movimiento Manual generado'
      ImageIndex = 25
      OnExecute = AVerMovManStockExecute
    end
    object ADescargaLectorPedido: TAction
      Category = 'Procesos;"Descarga Lector"'
      Caption = 'Descarga Lector Pedido'
      ImageIndex = 49
      OnExecute = ADescargaLectorPedidoExecute
    end
    object ADescargaLectorEnvio: TAction
      Category = 'Procesos;"Descarga Lector"'
      Caption = 'Descarga Lector Envio'
      ImageIndex = 49
      OnExecute = ADescargaLectorEnvioExecute
    end
    object ADescargaLectorRecepcion: TAction
      Category = 'Procesos;"Descarga Lector"'
      Caption = 'Descarga Lector Recepcion'
      ImageIndex = 49
      OnExecute = ADescargaLectorRecepcionExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos;"Descarga Lector"'
      Caption = 'Descarga Lector'
      ImageIndex = 49
    end
    object AVerTodos: TAction
      Category = 'Procesos'
      Caption = 'Ver Todos'
      Hint = 'Ver todos los pedidos'
      ImageIndex = 23
      OnExecute = AVerTodosExecute
    end
    object AVerAbiertos: TAction
      Category = 'Procesos'
      Caption = 'Ver Abiertos'
      Hint = 'Ver solo pedidos abiertos'
      ImageIndex = 22
      OnExecute = AVerAbiertosExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFSerieFiltro.Text')
    Left = 464
    Top = 32
  end
  object CENotas: TControlEdit
    DataSource = DMPedidosEntreAlmacenes.DSQMCabecera
    EnlazadoA = CEDetalle
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLDetNotas
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 576
    Top = 6
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 610
    Top = 6
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
