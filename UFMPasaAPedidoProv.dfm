inherited FMPasaAPedidoProv: TFMPasaAPedidoProv
  Left = 341
  Top = 288
  Width = 826
  Height = 450
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Paso a Pedido de Proveedor'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 816
    Height = 397
    inherited TBMain: TLFToolBar
      Width = 812
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMPasaAPedidoProv.DSTMPPedidosAProv
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBGLineas
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 23
        DataSource = DMPasaAPedidoProv.DSTMPPedidosAProv
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 141
      end
      inherited TbuttComp: TToolButton
        Left = 149
      end
      object TButtTodas: TToolButton
        Left = 172
        Top = 0
        Hint = 'Selecciona todas las l'#237'neas'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodasClick
      end
      object TButtNinguna: TToolButton
        Left = 195
        Top = 0
        Hint = 'Deselecciona las l'#237'neas'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtNingunaClick
      end
      object TButtStock: TToolButton
        Left = 218
        Top = 0
        Hint = 'Muestra informaci'#243'n de stock del art'#237'culo'
        Caption = 'Stock'
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtStockClick
      end
      object TButCambiaEquivalente: TToolButton
        Left = 241
        Top = 0
        Hint = 'Cambia por un articulo equivalente'
        Caption = 'Cambia por un articulo equivalente'
        ImageIndex = 109
        ParentShowHint = False
        ShowHint = True
        OnClick = TButCambiaEquivalenteClick
      end
      object TButtSepProduccion: TToolButton
        Left = 264
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtDesglosaEscandallo: TToolButton
        Left = 272
        Top = 0
        Hint = 'Desglosa segun escandallos de produccion'
        Caption = 'Desglosar escandallos'
        ImageIndex = 10
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesglosaEscandalloClick
      end
      object TButtDesglosaOrden: TToolButton
        Left = 295
        Top = 0
        Hint = 'Desglosa segun orden de produccion'
        Caption = 'Desglosar orden'
        ImageIndex = 116
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesglosaOrdenClick
      end
      object TSep2: TToolButton
        Left = 318
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtTraspasaPropuesta: TToolButton
        Left = 326
        Top = 0
        Hint = 'Traspasa las l'#237'neas de este Pedido a una Propuesta del Proveedor'
        Caption = 'Pedir propuesta a este Proveedor'
        ImageIndex = 73
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTraspasaPropuestaClick
      end
      object TButtTraspasaPedido: TToolButton
        Left = 349
        Top = 0
        Hint = 'Traspasa las l'#237'neas de este Pedido a un Pedido del Proveedor'
        Caption = 'Pedir a este Proveedor'
        ImageIndex = 62
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTraspasaPedidoClick
      end
      object TSep3: TToolButton
        Left = 372
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLUnirAPedidoAbierto: TLFPanel
        Left = 380
        Top = 0
        Width = 157
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object CBUnirAPedidoAbierto: TLFCheckBox
          Left = 6
          Top = 3
          Width = 171
          Height = 17
          Caption = 'Unir a Documento Abierto'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object TSep4: TToolButton
        Left = 537
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLSerie: TLFPanel
        Left = 545
        Top = 0
        Width = 264
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LSerie: TLFLabel
          Left = 107
          Top = 5
          Width = 66
          Height = 13
          Caption = ' Serie Destino'
          Layout = tlCenter
        end
        object LCanal: TLFLabel
          Left = 4
          Top = 4
          Width = 66
          Height = 13
          Caption = 'Canal Destino'
          Layout = tlCenter
        end
        object EFSerie: TEditFind2000
          Left = 176
          Top = 1
          Width = 74
          Height = 21
          MaxLength = 10
          TabOrder = 1
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
          OnBusqueda = EFSerieBusqueda
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCanal: TEditFind2000
          Left = 73
          Top = 1
          Width = 30
          Height = 21
          MaxLength = 3
          TabOrder = 0
          OnChange = EFCanalChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    object PNLCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 812
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PNLAlmacen: TLFPanel
        Left = 0
        Top = 0
        Width = 333
        Height = 25
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LAlmacen: TLFLabel
          Left = 15
          Top = 5
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almac'#233'n'
        end
        object EFAlmacen: TLFEditFind2000
          Left = 62
          Top = 1
          Width = 67
          Height = 21
          TabOrder = 0
          OnChange = EFAlmacenChange
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
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloAlmacen: TLFEdit
          Left = 130
          Top = 1
          Width = 200
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
      object PNLProveedor: TLFPanel
        Left = 333
        Top = 0
        Width = 479
        Height = 25
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object LProveedor: TLFLabel
          Left = 9
          Top = 5
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
          Layout = tlCenter
        end
        object EFProveedor: TLFEditFind2000
          Left = 62
          Top = 1
          Width = 73
          Height = 21
          TabOrder = 0
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
          OnBusqueda = EFProveedorBusqueda
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EProveedor: TLFEdit
          Left = 136
          Top = 1
          Width = 249
          Height = 21
          Color = clInfoBk
          TabOrder = 1
        end
        object BAplicaProveedor: TButton
          Left = 391
          Top = 1
          Width = 46
          Height = 22
          Hint = 'Aplica proveedor a todas las l'#237'neas seleccionadas'
          Caption = 'Aplicar'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = BAplicaProveedorClick
        end
      end
    end
    object DBGLineas: TDBGridFind2000
      Left = 2
      Top = 53
      Width = 812
      Height = 342
      Align = alClient
      DataSource = DMPasaAPedidoProv.DSTMPPedidosAProv
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGLineasCellClick
      OnDrawColumnCell = DBGLineasDrawColumnCell
      OnDblClick = DBGLineasDblClick
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 4
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
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'PROVEEDOR')
      CamposNoAccesibles.Strings = (
        'ARTICULO'
        'ARTICULO_TITULO'
        'UNIDADES')
      ColumnasCheckBoxes.Strings = (
        'MARCADO'
        'NUEVO'
        'ES_COMPONENTE')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
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
      OnBusqueda = DBGLineasBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'PROVEEDOR')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ES_COMPONENTE'
          ReadOnly = True
          Width = 25
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 105
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clMenuText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 280
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIR'
          Title.Alignment = taRightJustify
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOMBRE_R_SOCIAL'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_ORDEN'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK_TOTAL'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK_MINIMO'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK_MAXIMO'
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
          FieldName = 'PEDIDOS_D_CLI'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EN_PROCESO_PROD'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PEDIDO_MINIMO'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PEDIDO_OPTIMO'
          ReadOnly = True
          Width = 70
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
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'D_RIG'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRO_NUM_PLANO'
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
          FieldName = 'STOCK_ALM'
          Width = 72
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 397
    Width = 816
  end
  inherited CEMain: TControlEdit
    DataSource = DMPasaAPedidoProv.DSTMPPedidosAProv
    Left = 679
    Top = 335
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 710
    Top = 335
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
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
    Left = 648
    Top = 335
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGLineas.Columns')
    Left = 741
    Top = 335
  end
end
