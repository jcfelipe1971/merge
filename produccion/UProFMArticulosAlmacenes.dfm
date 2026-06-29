inherited ProFMArticulosAlmacenes: TProFMArticulosAlmacenes
  Left = 338
  Top = 248
  Width = 693
  Height = 472
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Visualizador de Art'#237'culos'
  PopupMenu = CEDetStocksPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 683
    Height = 187
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 679
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = ProDMArticulosAlmacenes.DSQMArticulos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 198
      end
      inherited TbuttComp: TToolButton
        Left = 206
      end
      object LBLTarifa: TLFLabel
        Left = 229
        Top = 0
        Width = 48
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Buscar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EArticulo: TLFEdit
        Left = 277
        Top = 0
        Width = 108
        Height = 22
        TabOrder = 2
        OnKeyDown = EArticuloKeyDown
      end
      object TButtImagenesArticulo: TToolButton
        Left = 385
        Top = 0
        Hint = 'Imagenes de Art'#237'culo'
        Action = AImagenesArticulo
      end
      object TButtFicherosDePedidoDeCliente: TToolButton
        Left = 408
        Top = 0
        Action = AFicherosDePedidoDeCliente
      end
      object LFLabel4: TLFLabel
        Left = 431
        Top = 0
        Width = 48
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tarifa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object LFETarifa: TLFEditFind2000
        Left = 479
        Top = 0
        Width = 38
        Height = 22
        TabOrder = 3
        OnChange = LFETarifaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TARIFA'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'activa=1'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_TARIFAS_C'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TARIFA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitTarifa: TLFDbedit
        Left = 517
        Top = 0
        Width = 133
        Height = 22
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMArticulosAlmacenes.DSxTarifas
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
    end
    inherited PCMain: TLFPageControl
      Width = 679
      Height = 157
      inherited TSFicha: TTabSheet
        object SBAArticulo: TSpeedButton [0]
          Left = 168
          Top = 30
          Width = 329
          Height = 21
          Action = AArticulos
          Caption = 'Ver Datos Articulo'
          OnDblClick = AArticuloExecute
        end
        inherited PEdit: TLFPanel
          Width = 671
          Height = 129
          Enabled = True
          inherited G2KTableLoc: TG2KTBLoc
            Left = 11
            Top = 3
            Plan.Strings = (
              
                'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
                'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
            DataSource = DMArticulos.DSQMArticulos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO_ARTICULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LArticulo: TLFLabel
            Left = 41
            Top = 35
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LPrecioVenta: TLFLabel
            Left = 37
            Top = 56
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta'
          end
          object DBEArticulo: TLFDbedit
            Left = 82
            Top = 31
            Width = 88
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = ProDMArticulosAlmacenes.DSQMArticulos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 171
            Top = 31
            Width = 334
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_ARTICULO'
            DataSource = ProDMArticulosAlmacenes.DSQMArticulos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnDblClick = DBETituloDblClick
          end
          object DBEPVenta: TLFDbedit
            Left = 82
            Top = 53
            Width = 88
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_VENTA'
            DataSource = ProDMArticulosAlmacenes.DSQMArticulos
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
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 671
          Height = 129
          DataSource = ProDMArticulosAlmacenes.DSQMArticulos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'TARIFA'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              Width = 289
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_VENTA'
              Width = 68
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 419
    Width = 683
    EdgeOuter = esNone
  end
  object PnlDet: TLFPanel [2]
    Left = 0
    Top = 187
    Width = 683
    Height = 232
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 683
      Height = 23
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDetStocks: THYMNavigator
        Left = 0
        Top = 0
        Width = 110
        Height = 22
        DataSource = ProDMArticulosAlmacenes.DSQMDetStocks
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetStocksPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFDetStocks
        InsertaControl = DBGFDetStocks
        Exclusivo = True
        ControlEdit = CEDetStocks
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton4: TToolButton
        Left = 110
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfoStock: TToolButton
        Left = 118
        Top = 0
        Hint = 'Informaci'#243'n de Stocks'
        Action = AInfoStocks
        ImageIndex = 1
        ParentShowHint = False
        ShowHint = True
      end
    end
    object DBGFDetStocks: TDBGridFind2000
      Left = 0
      Top = 23
      Width = 683
      Height = 209
      Align = alClient
      Color = clInfoBk
      DataSource = ProDMArticulosAlmacenes.DSQMDetStocks
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
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
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
        'ALMACEN'
        'EXISTENCIAS'
        'ENTRADAS'
        'SALIDAS'
        'STOCK_MAXIMO'
        'STOCK_MINIMO'
        'STOCK_VIRTUAL'
        'PEDIDOS_D_CLI'
        'PEDIDOS_A_PRO'
        'RESERVADAS'
        'EN_PROCESO_PROD'
        'DISPONIBLES')
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
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADAS'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALIDAS'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EXISTENCIAS'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDOS_D_CLI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESERVADAS'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_MINIMO'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_MAXIMO'
          Width = 61
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDOS_A_PRO'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EN_PROCESO_PROD'
          Width = 74
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetStocks
    Left = 224
    Top = 52
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 460
    Top = 60
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
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      Hint = 'Listados'
      ImageIndex = 14
    end
    object AListStocksArticulo: TAction
      Category = 'Listados'
      Caption = 'Listado Almacenes Art'#237'culo'
      ImageIndex = 14
      OnExecute = AListStocksArticuloExecute
    end
  end
  object CEDetStocks: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PnlDet
    PopUpMenu = CEDetStocksPMEdit
    Teclas = DMMain.Teclas
    Left = 280
    Top = 40
  end
  object CEDetStocksPMEdit: TPopUpTeclas
    Left = 316
    Top = 40
    object CEDetStocksMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetStocksMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetStocksMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetStocksMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetStocksMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetStocksMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEDetStocksMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEDetStocksMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEDetStocksMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEDetStocksMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALArticulosAlmacen: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 306
    Top = 144
    object AArticulos: TAction
      Caption = 'Ver Datos Cliente'
      Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
      ShortCut = 49219
      OnExecute = AArticuloExecute
    end
    object AInfoStocks: TAction
      Caption = 'AInfoStocks'
      OnExecute = AInfoStocksExecute
    end
    object AArticulosImagenes: TAction
      Caption = 'AArticulosImagenes'
    end
    object AImagenesArticulo: TAction
      Caption = 'Imagenes de Art'#237'culo'
      ImageIndex = 28
      OnExecute = AImagenesArticuloExecute
    end
    object AFicherosDePedidoDeCliente: TAction
      Caption = 'Ficheros de Articulo'
      Hint = 'Ficheros de Articulo'
      ImageIndex = 109
      OnExecute = AFicherosDePedidoDeClienteExecute
    end
  end
end
