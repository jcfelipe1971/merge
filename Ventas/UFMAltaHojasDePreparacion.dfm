inherited FMAltaHojasDePreparacion: TFMAltaHojasDePreparacion
  Left = 291
  Top = 209
  Width = 1061
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cartera de Pedidos de Clientes'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 1050
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1051
    Height = 447
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 1047
      Height = 29
      ButtonHeight = 25
      inherited NavMain: THYMNavigator
        Width = 184
        Height = 25
        DataSource = DMAltaHojasDePreparacion.DSQMAltaPedidos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Align = alClient
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 184
      end
      inherited EPMain: THYMEditPanel
        Left = 192
        Width = 23
        Height = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 215
      end
      inherited TbuttComp: TToolButton
        Left = 223
      end
      object ToolButton1: TToolButton
        Left = 246
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object tButtRefrescar: TToolButton
        Left = 254
        Top = 0
        Action = ARefrescar
      end
      object ToolButton7: TToolButton
        Left = 277
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object tButtRefrescarFiltros: TToolButton
        Left = 285
        Top = 0
        Action = ARefrescarFiltros
      end
      object ToolButton4: TToolButton
        Left = 308
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBSeleccionarTodos: TToolButton
        Left = 316
        Top = 0
        Action = ASeleccionarTodos
      end
      object TBSeleccionarPreparables: TToolButton
        Left = 339
        Top = 0
        Action = ASeleccionarPreparables
      end
      object TBDeseleccionarTodos: TToolButton
        Left = 362
        Top = 0
        Action = ADeseleccionarTodos
      end
      object ToolButton3: TToolButton
        Left = 385
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBPrepararPedidos: TLFToolButton
        Left = 393
        Top = 0
        Hint = 'Prepara los pedidos seleccionados'
        Action = APreparaPedidos
      end
      object ToolButton6: TToolButton
        Left = 416
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBFiltraPedidos: TToolButton
        Left = 424
        Top = 0
        Action = AFiltraPedidos
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton8: TToolButton
        Left = 447
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBImprimeFiltro: TToolButton
        Left = 455
        Top = 0
        Hint = 'Listado Cartera Pedidos'
        Action = AListadoCarteraDePedidos
        Caption = 'Listado Cartera Pedidos'
      end
    end
    object PnlCabeceraPed: TLFPanel
      Left = 2
      Top = 31
      Width = 1047
      Height = 75
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeCliente: TLFLabel
        Left = 4
        Top = 10
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Cliente'
      end
      object LHastaCliente: TLFLabel
        Left = 7
        Top = 33
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Cliente'
      end
      object LDesdePedido: TLFLabel
        Left = 362
        Top = 12
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Pedido'
      end
      object LHastaPedido: TLFLabel
        Left = 365
        Top = 34
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Pedido'
      end
      object LDesdeFecha: TLFLabel
        Left = 511
        Top = 11
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LHastaFecha: TLFLabel
        Left = 514
        Top = 34
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LDesdeArticulo: TLFLabel
        Left = 676
        Top = 10
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Art.'
      end
      object LHastaArticulo: TLFLabel
        Left = 679
        Top = 33
        Width = 47
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Art.'
      end
      object LAlmacen: TLFLabel
        Left = 29
        Top = 55
        Width = 41
        Height = 13
        Alignment = taRightJustify
        Caption = 'Almac'#233'n'
      end
      object EFDesdeCliente: TLFEditFind2000
        Left = 74
        Top = 7
        Width = 57
        Height = 21
        TabOrder = 0
        OnChange = EFDesdeClienteChange
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
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFHastaCliente: TLFEditFind2000
        Left = 74
        Top = 29
        Width = 57
        Height = 21
        TabOrder = 1
        OnChange = EFHastaClienteChange
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
        Tabla_a_buscar = 'VER_CLIENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EDesdeCliente: TLFEdit
        Left = 132
        Top = 7
        Width = 220
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object EHastaCliente: TLFEdit
        Left = 132
        Top = 29
        Width = 220
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
      object EFDesdeFecha: TLFDateEdit
        Left = 579
        Top = 8
        Width = 89
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 6
        OnChange = EFDesdeFechaChange
      end
      object EFHastaFecha: TLFDateEdit
        Left = 579
        Top = 30
        Width = 89
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 7
        OnChange = EFHastaFechaChange
      end
      object EFDesdePedido: TLFEdit
        Left = 433
        Top = 8
        Width = 67
        Height = 21
        TabOrder = 4
        OnChange = EFDesdePedidoChange
      end
      object EFHastaPedido: TLFEdit
        Left = 433
        Top = 30
        Width = 67
        Height = 21
        TabOrder = 5
        OnChange = EFHastaPedidoChange
      end
      object EFDesdeArticulo: TLFEditFind2000
        Left = 730
        Top = 7
        Width = 87
        Height = 21
        TabOrder = 8
        OnChange = EFDesdeArticuloChange
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
      object EFHastaArticulo: TLFEditFind2000
        Left = 730
        Top = 29
        Width = 87
        Height = 21
        TabOrder = 9
        OnChange = EFHastaArticuloChange
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
      object CBAlmacenes: TLFComboBox
        Left = 74
        Top = 51
        Width = 278
        Height = 21
        ItemHeight = 13
        TabOrder = 10
        OnChange = CBAlmacenesChange
      end
      object EDesdeArticulo: TLFEdit
        Left = 818
        Top = 7
        Width = 220
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 11
      end
      object EHastaArticulo: TLFEdit
        Left = 818
        Top = 29
        Width = 220
        Height = 21
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 12
      end
    end
    object DBGPreparaPed: TFIBHYGGridFind
      Left = 2
      Top = 106
      Width = 1047
      Height = 339
      Align = alClient
      DataSource = DMAltaHojasDePreparacion.DSQMAltaPedidos
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGPreparaPedCellClick
      OnDrawColumnCell = DBGPreparaPedDrawColumnCell
      OnDblClick = DBGPreparaPedDblClick
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
        'CLIENTE'
        'ENTRADA_AGRUPACION'
        'RIG'
        'SERIE'
        'TITULO'
        'UNIDADES'
        'ARTICULO')
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
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Width = 36
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
          Width = 33
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
          FieldName = 'ARTICULO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 200
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
          Expanded = False
          FieldName = 'U_RESERVADAS'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_AGRUPACION'
          Width = 37
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNI_PREPARADOACTUAL'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_SERVIDAS'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UDS_EN_PREPARACION'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'U_DISP_PARA_SERVIR'
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 1051
    EdgeBorders = []
    TabOrder = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
    Left = 340
    Top = 156
    object AListadoCarteraDePedidosOLD: TAction
      Category = 'Listados'
      Caption = 'Listado de Cartera de PedidosOLD'
      Hint = 'Listado de Cartera de Pedidos'
      ImageIndex = 14
      Visible = False
      OnExecute = AListadoCarteraDePedidosOLDExecute
    end
    object AListadoCarteraDePedidos: TAction
      Category = 'Listados'
      Caption = 'Listado de Cartera de Pedidos'
      Hint = 'Listado pendientes'
      ImageIndex = 14
      OnExecute = AListadoCarteraDePedidosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfListadoCarteraPedidosOLD: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Hoja de Preparaci'#243'n'
      Hint = 'Configuracion de Listado de Cartera de Pedidos'
      ImageIndex = 77
      Visible = False
      OnExecute = AConfListadoCarteraPedidosOLDExecute
    end
    object AConfListadoCarteraPedidos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Cartera Pedidos'
      Hint = 'Configuracion de Listado pendientes'
      ImageIndex = 77
      OnExecute = AConfListadoCarteraPedidosExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 648
    Top = 12
  end
  object ALHojasDePreparacion: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 272
    Top = 136
    object AFiltraAltaPedido: TAction
      Caption = 'AFiltraAltaPedido'
      OnExecute = AFiltraAltaPedidoExecute
    end
    object APreparaPedidos: TAction
      Caption = 'Prepara Pedidos'
      Hint = 'Perpara los pedidos seleccionados'
      ImageIndex = 94
      OnExecute = APreparaPedidosExecute
    end
    object ASeleccionarTodos: TAction
      Caption = 'Seleccionar Todos'
      Hint = 'Selecciona todos los pedidos filtrados'
      ImageIndex = 146
      OnExecute = ASeleccionarTodosExecute
    end
    object ADeseleccionarTodos: TAction
      Caption = 'Deseleccionar Todos los pedidos'
      Hint = 'Quita la seleccion de todos los pedidos marcados'
      ImageIndex = 147
      OnExecute = ADeseleccionarTodosExecute
    end
    object ASeleccionarPreparables: TAction
      Caption = 'ASeleccionarPreparables'
      Hint = 'Selecciona todos los pedidos con stock suficiente'
      ImageIndex = 140
      OnExecute = ASeleccionarPreparablesExecute
    end
    object ARefrescar: TAction
      Caption = 'Refrescar'
      Hint = 'Refresca los datos'
      ImageIndex = 5
      OnExecute = ARefrescarExecute
    end
    object ARefrescarFiltros: TAction
      Caption = 'Refrescar Filtros'
      Hint = 'Refrescar Filtros'
      ImageIndex = 26
      OnExecute = ARefrescarFiltrosExecute
    end
    object AImprimeHojaGenerada: TAction
      Caption = 'AImprimeHojaGenerada'
      OnExecute = AImprimeHojaGeneradaExecute
    end
    object APoneAEstadoListado: TAction
      Caption = 'APoneAEstadoListado'
      OnExecute = APoneAEstadoListadoExecute
    end
    object AFiltraPedidos: TAction
      Caption = 'Filtra Pedidos'
      Hint = 'Ver todos los pedidos'
      ImageIndex = 62
      OnExecute = AFiltraPedidosExecute
    end
  end
end
