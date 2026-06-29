inherited FMPropPedidos: TFMPropPedidos
  Left = 313
  Top = 130
  Width = 1386
  Height = 710
  HelpContext = 1621
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Propuestas de Pedidos a Proveedores'
  Constraints.MinWidth = 1300
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1376
    Height = 657
    inherited TBMain: TLFToolBar
      Width = 1372
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 36
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      object PNLModo: TLFPanel
        Left = 36
        Top = 0
        Width = 235
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object LModo: TLFLabel
          Left = 4
          Top = 4
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Modo'
          Layout = tlCenter
        end
        object CBModo: TLFComboBox
          Left = 35
          Top = 0
          Width = 198
          Height = 21
          DropDownCount = 9
          ItemHeight = 13
          TabOrder = 0
          Text = 'Modo'
          OnChange = CBModoChange
        end
      end
      object TBTSep01: TToolButton
        Left = 271
        Top = 0
        Width = 8
        ImageIndex = 63
        Style = tbsSeparator
      end
      object TButtRegenera: TToolButton
        Left = 279
        Top = 0
        Hint = 'Genera o Regenera la tabla de Propuesta de Pedidos'
        Caption = 'Regenera'
        ImageIndex = 94
        OnClick = TButtRegeneraClick
      end
      object TButtCancela: TToolButton
        Left = 302
        Top = 0
        Hint = 'Cancela las propuestas generadas'
        Caption = 'Cancela'
        ImageIndex = 27
        OnClick = TButtCancelaClick
      end
      object TBTSep02: TToolButton
        Left = 325
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object TButtMarcados: TToolButton
        Tag = 1
        Left = 332
        Top = 0
        Hint = 'Muestra solo los art'#237'culos marcados'
        Caption = 'Marcados'
        Grouped = True
        ImageIndex = 7
        Style = tbsCheck
        OnClick = FiltraRango
      end
      object TButtDesmarcados: TToolButton
        Tag = 2
        Left = 355
        Top = 0
        Hint = 'Muestra solo los art'#237'culos no marcados'
        Caption = 'Desmarcados'
        Grouped = True
        ImageIndex = 6
        Style = tbsCheck
        OnClick = FiltraRango
      end
      object TButtTodos: TToolButton
        Left = 378
        Top = 0
        Hint = 'Muestra todos los art'#237'culos marcados o desmarcados'
        Caption = 'Todos'
        Down = True
        Grouped = True
        ImageIndex = 8
        Style = tbsCheck
        OnClick = FiltraRango
      end
      object TBTSep03: TToolButton
        Left = 401
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object TButtMarcarTodos: TToolButton
        Left = 408
        Top = 0
        Hint = 'Marcar Todos'
        Caption = 'Marcar Todos'
        ImageIndex = 146
        OnClick = TButtMarcarTodosClick
      end
      object TButtDesmarcarTodos: TToolButton
        Left = 431
        Top = 0
        Hint = 'Desmarcar Todos'
        Caption = 'Desmarcar Todos'
        ImageIndex = 147
        OnClick = TButtDesmarcarTodosClick
      end
      object TBTSep04: TToolButton
        Left = 454
        Top = 0
        Width = 7
        Enabled = False
        Style = tbsSeparator
      end
      object TButtInfoStock: TToolButton
        Left = 461
        Top = 0
        Hint = 'Informacion de stock'
        Caption = 'Informacion de stock'
        ImageIndex = 1
        OnClick = TButtInfoStockClick
      end
      object TBTSep05: TToolButton
        Left = 484
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBGenerarPropuesta: TToolButton
        Left = 492
        Top = 0
        Hint = 'Genera las propuestas de los registros marcados'
        Caption = 'Generar Propuesta'
        ImageIndex = 73
        OnClick = TBGenerarPropuestaClick
      end
      object TBGenerarPedido: TToolButton
        Left = 515
        Top = 0
        Hint = 'Genera los pedidos de los registros marcados'
        Caption = 'Generar Pedido'
        ImageIndex = 62
        OnClick = TBGenerarPedidoClick
      end
      object TBTSep07: TToolButton
        Left = 538
        Top = 0
        Width = 7
        Style = tbsSeparator
      end
      object TBLocalizador: TToolButton
        Left = 545
        Top = 0
        Hint = 'Localizador de articulo'
        Caption = 'Localizador de articulo'
        ImageIndex = 83
        OnClick = TBLocalizadorClick
      end
      object ToolButton1: TToolButton
        Left = 568
        Top = 0
        Width = 8
        ImageIndex = 12
        Style = tbsSeparator
      end
      object TBGeneraPMP: TToolButton
        Left = 576
        Top = 0
        Hint = 'Genera Plan Maestro de Prodccion'
        Caption = 'Genera Plan Maestro de Prodccion'
        ImageIndex = 11
        OnClick = TBGeneraPMPClick
      end
    end
    object DBGPedidos: TDBGridFind2000
      Left = 2
      Top = 161
      Width = 1372
      Height = 321
      Align = alClient
      DataSource = DMPropPedidos.DSQMPedidos
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGPedidosCellClick
      OnDrawColumnCell = DBGPedidosDrawColumnCell
      OnDblClick = DBGPedidosDblClick
      OnTitleClick = DBGPedidosTitleClick
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
      BuscarNums = False
      Campos.Strings = (
        'PROVEEDOR')
      CamposAMostrar.Strings = (
        'PROVEEDOR'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'MARCADO'
        'RECALCULAR')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'PROVEEDOR')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_PROVEEDORES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      OnBusqueda = DBGPedidosBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = False
      OrdenadosPor.Strings = (
        'PROVEEDOR')
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN'
          Width = 31
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 82
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO_TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 274
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIR'
          Title.Alignment = taRightJustify
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECALCULAR'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Width = 63
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOMBRE_R_SOCIAL'
          Width = 228
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EXISTENCIAS'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK_VIRTUAL'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MINIMO'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MAXIMO'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_MINIMO'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_OPTIMO'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PEDIDOS_D_CLI'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PEDIDOS_A_PRO'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EN_PRODUCCION'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COBERTURA'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VENTAS_PERIODO_ANTERIOR'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ROTURA'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_COBERTURA'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COBERTURA_ROTURA'
          ReadOnly = True
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'INCR_PEDIDO'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIAS_ENTREGA'
          ReadOnly = True
          Width = 53
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_ARTICULO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FAMILIA'
          ReadOnly = True
          Width = 40
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
          FieldName = 'ALFA_1'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_2'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_3'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_4'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_5'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_6'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_7'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALFA_8'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REF_PROVEEDOR'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_PEDIDO'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_PRODUCCION'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE_ULT'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CODIGO_PROVEEDOR'
          ReadOnly = True
          Width = 150
          Visible = True
        end>
    end
    object PNLInformacion: TLFPanel
      Left = 2
      Top = 630
      Width = 1372
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      object LPedidoOptimo: TLFLabel
        Left = 1017
        Top = 6
        Width = 69
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pedido '#211'ptimo'
      end
      object LPedidoMinimo: TLFLabel
        Left = 815
        Top = 6
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pedido M'#237'nimo'
      end
      object LStockMinimo: TLFLabel
        Left = 420
        Top = 6
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Stock M'#237'nimo'
      end
      object LStockMaximo: TLFLabel
        Left = 619
        Top = 6
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Stock M'#225'ximo'
      end
      object LStockActual: TLFLabel
        Left = 225
        Top = 6
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Stock Actual'
      end
      object LUnidadesPedidas: TLFLabel
        Left = 4
        Top = 6
        Width = 90
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total Uds. Pedidas'
      end
      object DBEP_Minimo: TLFDbedit
        Left = 890
        Top = 2
        Width = 115
        Height = 21
        Color = clInfoBk
        DataField = 'P_MINIMO'
        DataSource = DMPropPedidos.DSQMPedidos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBEP_Optimo: TLFDbedit
        Left = 1090
        Top = 2
        Width = 115
        Height = 21
        Color = clInfoBk
        DataField = 'P_OPTIMO'
        DataSource = DMPropPedidos.DSQMPedidos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEExistencias: TLFDbedit
        Left = 290
        Top = 2
        Width = 115
        Height = 21
        Color = clInfoBk
        DataField = 'EXISTENCIAS'
        DataSource = DMPropPedidos.DSQMPedidos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBEMinimo: TLFDbedit
        Left = 490
        Top = 2
        Width = 115
        Height = 21
        Color = clInfoBk
        DataField = 'MINIMO'
        DataSource = DMPropPedidos.DSQMPedidos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEMaximo: TLFDbedit
        Left = 690
        Top = 2
        Width = 115
        Height = 21
        Color = clInfoBk
        DataField = 'MAXIMO'
        DataSource = DMPropPedidos.DSQMPedidos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object LFDUnidadesPedidas: TLFDbedit
        Left = 98
        Top = 2
        Width = 115
        Height = 21
        Color = clInfoBk
        DataField = 'UNIDADES_PEDIDAS'
        DataSource = DMPropPedidos.DSQMPedidosTotales
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
    end
    object DBGPedidosCliente: TDBGridFind2000
      Left = 2
      Top = 482
      Width = 1372
      Height = 148
      Align = alBottom
      Color = clInfoBk
      DataSource = DMPropPedidos.DSxMPedidosOrigen
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGPedidosClienteDblClick
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
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'ARTICULO_TITULO'
        'PROVEEDOR'
        'PEDIR'
        'MARCADO')
      CamposNoAccesibles.Strings = (
        'ARTICULO'
        'ARTICULO_TITULO'
        'PROVEEDOR')
      ColumnasCheckBoxes.Strings = (
        'MANIPULACION')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = False
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Width = 45
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
          FieldName = 'SERIE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA'
          Width = 30
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
          FieldName = 'U_PENDIENTES'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLIENTE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_R_SOCIAL'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENTE'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOMBRE_AGENTE'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANIPULACION'
          Width = 32
          Visible = True
        end>
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 28
      Width = 1372
      Height = 133
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 4
      object GBDatosDestino: TGroupBox
        Left = 1089
        Top = 0
        Width = 282
        Height = 70
        Align = alLeft
        Caption = 'Datos Destino '
        TabOrder = 3
        object LAlmacen: TLFLabel
          Left = 11
          Top = 41
          Width = 70
          Height = 13
          Alignment = taRightJustify
          Caption = 'Alm. recepci'#243'n'
          Layout = tlCenter
        end
        object LSerie: TLFLabel
          Left = 17
          Top = 19
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = ' Serie destino'
          Layout = tlCenter
        end
        object EFAlmacen: TEditFind2000
          Left = 86
          Top = 37
          Width = 78
          Height = 21
          TabOrder = 1
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
        object EFSerie: TEditFind2000
          Left = 86
          Top = 15
          Width = 78
          Height = 21
          TabOrder = 0
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
        object CBUnirADocAbierto: TLFCheckBox
          Left = 169
          Top = 17
          Width = 106
          Height = 38
          Caption = 'Unir a Documento Abierto'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object GBFiltro: TGroupBox
        Left = 313
        Top = 0
        Width = 672
        Height = 70
        Align = alLeft
        Caption = 'Filtro '
        TabOrder = 1
        object LProveedorMostrar: TLFLabel
          Left = 18
          Top = 19
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
          Layout = tlCenter
        end
        object LTipoArticulo: TLFLabel
          Left = 8
          Top = 41
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Articulo'
          Layout = tlCenter
        end
        object LDesdeArticlo: TLFLabel
          Left = 143
          Top = 18
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Art.'
          Layout = tlCenter
        end
        object LHastaArticulo: TLFLabel
          Left = 146
          Top = 40
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Art.'
          Layout = tlCenter
        end
        object LDesdeFamilia: TLFLabel
          Left = 397
          Top = 18
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fam.'
          Layout = tlCenter
        end
        object LHastaFamilia: TLFLabel
          Left = 397
          Top = 39
          Width = 23
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fam.'
          Layout = tlCenter
        end
        object LMasArticulos: TLFLabel
          Left = 291
          Top = 31
          Width = 6
          Height = 13
          Alignment = taRightJustify
          Caption = '+'
          Layout = tlCenter
        end
        object EFProveedorMostrar: TEditFind2000
          Left = 71
          Top = 15
          Width = 64
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PROVEEDOR'
          CampoStr = 'NOMBRE_R_SOCIAL'
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
        object CBMostrarSoloPedir: TLFCheckBox
          Left = 490
          Top = 19
          Width = 103
          Height = 30
          Caption = 'Mostrar solo Art'#237'culos a pedir'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 8
          TabStop = True
          Alignment = taLeftJustify
        end
        object EFTipoArticulo: TEditFind2000
          Left = 71
          Top = 37
          Width = 64
          Height = 21
          TabOrder = 1
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_TIPO_ARTICULO'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TIPO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object BFiltrar: TButton
          Left = 591
          Top = 13
          Width = 76
          Height = 23
          Hint = 'Filtra articulos'
          Caption = 'Filtrar'
          TabOrder = 9
          OnClick = BFiltrarClick
        end
        object EFDesdeArticulo: TEditFind2000
          Left = 197
          Top = 15
          Width = 90
          Height = 21
          TabOrder = 2
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
        object EFHastaArticulo: TEditFind2000
          Left = 197
          Top = 37
          Width = 90
          Height = 21
          TabOrder = 3
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
        object EFHastaFamilia: TEditFind2000
          Left = 430
          Top = 37
          Width = 58
          Height = 21
          TabOrder = 7
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
          Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDesdeFamilia: TEditFind2000
          Left = 430
          Top = 15
          Width = 58
          Height = 21
          TabOrder = 6
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
          Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDesdeArticulo2: TEditFind2000
          Left = 301
          Top = 15
          Width = 90
          Height = 21
          TabOrder = 4
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
        object EFHastaArticulo2: TEditFind2000
          Left = 301
          Top = 37
          Width = 90
          Height = 21
          TabOrder = 5
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
        object BReset: TButton
          Left = 591
          Top = 41
          Width = 76
          Height = 23
          Hint = 'Quita filtro'
          Caption = 'Reset'
          TabOrder = 10
          OnClick = BResetClick
        end
      end
      object GBRecalculo: TGroupBox
        Left = 0
        Top = 0
        Width = 313
        Height = 70
        Align = alLeft
        Caption = 'Recalcular '
        TabOrder = 0
        object LAlmacenes: TLFLabel
          Left = 4
          Top = 16
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almac'#233'n'
          Layout = tlCenter
        end
        object BRecalcular: TButton
          Left = 213
          Top = 13
          Width = 86
          Height = 24
          Caption = 'Recalcular'
          TabOrder = 1
          OnClick = BRecalcularClick
        end
        object CBAlmacenesCalcular: TLFComboBox
          Tag = 1
          Left = 52
          Top = 15
          Width = 157
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Todos los Almacenes'
          OnChange = CBAlmacenesCalcularChange
          Items.Strings = (
            'Todos los Almacenes')
        end
        object PNLRangoFechas: TPanel
          Left = 5
          Top = 40
          Width = 294
          Height = 22
          BevelOuter = bvNone
          TabOrder = 2
          object LCompararVentas: TLFLabel
            Left = 0
            Top = 3
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rango'
          end
          object DEFechaHasta: TLFDateEdit
            Left = 138
            Top = 0
            Width = 92
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object BMasTresMeses: TButton
            Left = 265
            Top = 0
            Width = 28
            Height = 21
            Caption = '+3M'
            TabOrder = 3
            OnClick = BMasTresMesesClick
          end
          object BMasUnMes: TButton
            Left = 234
            Top = 0
            Width = 28
            Height = 21
            Caption = '+1M'
            TabOrder = 2
            OnClick = BMasUnMesClick
          end
          object DEFechaDesde: TLFDateEdit
            Left = 46
            Top = 0
            Width = 92
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
        end
      end
      object GBNotaDetallePedido: TGroupBox
        Left = 0
        Top = 70
        Width = 1372
        Height = 63
        Align = alBottom
        Caption = 'Nota Detalle Pedido'
        TabOrder = 4
        object DBMNotaDetallePedido: TLFDBMemo
          Left = 2
          Top = 15
          Width = 1368
          Height = 46
          Align = alClient
          DataField = 'NOTA_DETALLE_PEDIDO'
          DataSource = DMPropPedidos.DSQMPedidos
          TabOrder = 0
        end
      end
      object GBIncluyeStock: TGroupBox
        Left = 985
        Top = 0
        Width = 104
        Height = 70
        Align = alLeft
        Caption = 'Incluye Stock'
        Enabled = False
        TabOrder = 2
        object CBIncluyeStockComponentes: TLFCheckBox
          Left = 12
          Top = 41
          Width = 89
          Height = 17
          Caption = 'Componentes'
          ClicksDisabled = False
          ColorCheck = 57088
          Enabled = False
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBIncluyeStockCompuestos: TLFCheckBox
          Left = 12
          Top = 19
          Width = 89
          Height = 17
          Caption = 'Compuestos'
          ClicksDisabled = False
          ColorCheck = 57088
          Enabled = False
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 657
    Width = 1376
  end
  inherited CEMain: TControlEdit
    Left = 16
    Top = 388
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 12
    Top = 428
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
    Left = 64
    Top = 392
    object CAListados: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListado: TAction
      Category = 'Listados'
      Caption = 'Listado'
      Hint = 'Listado pide limites'
      ImageIndex = 14
      OnExecute = AListadoExecute
    end
    object AListadoFamilia: TAction
      Category = 'Listados'
      Caption = 'Listado por Familia'
      Hint = 'Listado por familia'
      ImageIndex = 14
      OnExecute = AListadoFamiliaExecute
    end
    object AListadoProveedor: TAction
      Category = 'Listados'
      Caption = 'Listado por Proveedor'
      Hint = 'Listado por proveedor'
      ImageIndex = 14
      OnExecute = AListadoProveedorExecute
    end
    object AListadoProveedorTodosAlm: TAction
      Category = 'Listados'
      Caption = 'Listado por Proveedor todos los Alm.'
      Hint = 'Listado por Proveedor todos los Alm.'
      ImageIndex = 14
      OnExecute = AListadoProveedorTodosAlmExecute
    end
    object AListadoFamiliaTodosAlm: TAction
      Category = 'Listados'
      Caption = 'Listado por Familia todos los Alm.'
      ImageIndex = 14
      OnExecute = AListadoFamiliaTodosAlmExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 64
    Top = 432
  end
end
