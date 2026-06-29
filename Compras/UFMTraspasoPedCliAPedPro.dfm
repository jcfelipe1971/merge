inherited FMTraspasoPedCliAPedPro: TFMTraspasoPedCliAPedPro
  Left = 364
  Top = 268
  Width = 1164
  Height = 474
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Paso a Pedido de Proveedor'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1154
    Height = 421
    inherited TBMain: TLFToolBar
      Width = 1150
      EdgeBorders = [ebRight, ebBottom]
      inherited NavMain: THYMNavigator
        Width = 110
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited TbuttComp: TToolButton [2]
        Left = 118
      end
      inherited TSepTerc: TToolButton
        Left = 141
      end
      object PNLProveedor: TLFPanel [4]
        Left = 149
        Top = 0
        Width = 398
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LProveedor: TLFLabel
          Left = 8
          Top = 4
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor  '
          Layout = tlCenter
        end
        object EFProveedor: TLFEditFind2000
          Left = 62
          Top = 1
          Width = 73
          Height = 21
          TabOrder = 0
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
          OnExiste = EFProveedorExiste
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object LFEProveedor: TLFEdit
          Left = 136
          Top = 1
          Width = 259
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
      end
      object TButtRegenera: TToolButton [5]
        Left = 547
        Top = 0
        Hint = 'Regenera la lista de pedidos de este proveedor'
        Caption = 'Regenera'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtRegeneraClick
      end
      object ToolButton4: TToolButton [6]
        Left = 570
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInfStocks: TToolButton [7]
        Left = 578
        Top = 0
        Hint = 'Informaci'#243'n de Stocks '
        Caption = 'Info. Stocks'
        ImageIndex = 1
        OnClick = TButtInfStocksClick
      end
      object TBSep1: TToolButton [8]
        Left = 601
        Top = 0
        Width = 8
        ImageIndex = 0
        Style = tbsSeparator
      end
      object TButtTodas: TToolButton [9]
        Left = 609
        Top = 0
        Hint = 'Selecciona todas las l'#237'neas'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodasClick
      end
      object TButtNinguna: TToolButton [10]
        Left = 632
        Top = 0
        Hint = 'Deselecciona las l'#237'neas'
        Caption = 'Ninguna'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtNingunaClick
      end
      object TBTraspasaPedido: TToolButton [11]
        Left = 655
        Top = 0
        Hint = 'Traspasa las l'#237'neas de este Pedido a un Pedido del Proveedor'
        Caption = 'Pedir a este Proveedor'
        ImageIndex = 62
        ParentShowHint = False
        ShowHint = True
        OnClick = TBTraspasaPedidoClick
      end
      object ToolButton3: TToolButton [12]
        Left = 678
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel [13]
        Left = 686
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 0
      end
    end
    object PNLDatosCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 1150
      Height = 48
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LSerie: TLFLabel
        Left = 30
        Top = 6
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Layout = tlCenter
      end
      object LAlmacen: TLFLabel
        Left = 399
        Top = 6
        Width = 20
        Height = 13
        Alignment = taRightJustify
        Caption = 'Alm.'
        Layout = tlCenter
      end
      object LReferencia: TLFLabel
        Left = 3
        Top = 26
        Width = 52
        Height = 13
        Alignment = taRightJustify
        Caption = 'Referenica'
        Layout = tlCenter
      end
      object LFecha: TLFLabel
        Left = 389
        Top = 27
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
        Layout = tlCenter
      end
      object EFSerie: TLFEditFind2000
        Left = 59
        Top = 2
        Width = 59
        Height = 21
        TabOrder = 0
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
      object ESerie: TLFEdit
        Left = 119
        Top = 2
        Width = 259
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 1
      end
      object EFAlmacen: TLFEditFind2000
        Left = 423
        Top = 2
        Width = 73
        Height = 21
        TabOrder = 2
        OnChange = EFAlmacenChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ALMACEN'
        CampoStr = 'AL_TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ALMACENES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ALMACEN')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EAlmacen: TLFEdit
        Left = 497
        Top = 2
        Width = 259
        Height = 21
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
      object EReferencia: TLFEdit
        Left = 59
        Top = 24
        Width = 319
        Height = 21
        TabOrder = 4
      end
      object DEFecha: TLFDateEdit
        Left = 423
        Top = 24
        Width = 98
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
      object CBAgregarAAbierto: TLFCheckBox
        Left = 544
        Top = 27
        Width = 201
        Height = 17
        Hint = 
          'Busca un pedido a proveedor que est'#233' abierto'#13#10'y que cumpla con l' +
          'as mismas condiciones que '#13#10'lo que se est'#225' traspasando:'#13#10'- Prove' +
          'edor'#13#10'- Serie'#13#10'- Almacen'#13#10'- Referencia'
        Caption = 'Agregar a Ped. abierto'
        ClicksDisabled = False
        ColorCheck = 57088
        ShowHint = True
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object PNLLineas: TLFPanel
      Left = 2
      Top = 76
      Width = 1150
      Height = 233
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGLineas: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 1150
        Height = 233
        Align = alClient
        DataSource = DMTraspasoPedCliAPedPro.DSTMPPedidosAProv
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGLineasDrawColumnCell
        OnDblClick = DBGLineasDblClick
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
        Transaction = DMTraspasoPedCliAPedPro.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'ARTICULO'
          'ARTICULO_TITULO'
          'CLIENTE'
          'PEDIDO'
          'TITULO_CLI')
        CamposNoAccesibles.Strings = (
          'ARTICULO_TITULO'
          'UNIDADES'
          'ID_DETALLES_S'
          'ID_S'
          'STOCK'
          'STOCK_MAXIMO'
          'STOCK_MINIMO'
          'SU_REFERENCIA'
          'TITULO_CLI'
          'ALMACEN'
          'CANAL'
          'CLIENTE'
          'EJERCICIO'
          'EMPRESA'
          'ENTRADA')
        ColumnasCheckBoxes.Strings = (
          'MARCADO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
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
            Width = 90
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
            Width = 250
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
            Width = 58
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
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'P_COSTE'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO_1'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO_2'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCUENTO_3'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PEDIDO'
            ReadOnly = True
            Width = 95
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SU_REFERENCIA'
            ReadOnly = True
            Width = 140
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'STOCK'
            ReadOnly = True
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'STOCK_MINIMO'
            ReadOnly = True
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK_MAXIMO'
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CLIENTE'
            ReadOnly = True
            Width = 45
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_CLI'
            ReadOnly = True
            Width = 250
            Visible = True
          end>
      end
    end
    object PNLNotas: TLFPanel
      Left = 2
      Top = 309
      Width = 1150
      Height = 110
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 3
      OnResize = PNLNotasResize
      object DBRENotas: TDBRichEdit
        Left = 0
        Top = 24
        Width = 770
        Height = 86
        Align = alClient
        DataField = 'NOTAS'
        DataSource = DMTraspasoPedCliAPedPro.DSTMPPedidosAProv
        TabOrder = 0
        OnEnter = DBRENotasEnter
        OnSelectionChange = DBRENotasSelectionChange
      end
      object DBRENotas2: TDBRichEdit
        Left = 770
        Top = 24
        Width = 380
        Height = 86
        Align = alRight
        DataField = 'NOTAS2'
        DataSource = DMTraspasoPedCliAPedPro.DSTMPPedidosAProv
        TabOrder = 1
        OnEnter = DBRENotas2Enter
        OnSelectionChange = DBRENotas2SelectionChange
      end
      object TBNotasRich: TLFToolBar
        Left = 0
        Top = 0
        Width = 1150
        Height = 24
        AutoSize = True
        EdgeInner = esNone
        EdgeOuter = esNone
        Images = DMMain.ToolbarImages
        TabOrder = 2
        Separators = True
        object TButtIdiomaNegrita: TToolButton
          Left = 0
          Top = 2
          Action = FMain.RichEditBold1
        end
        object TButtIdiomaCursiva: TToolButton
          Left = 23
          Top = 2
          Action = FMain.RichEditItalic1
        end
        object TButtIdiomaSubrayado: TToolButton
          Left = 46
          Top = 2
          Action = FMain.RichEditUnderline1
        end
        object TButtIdiomaSep1: TToolButton
          Left = 69
          Top = 2
          Width = 8
          Style = tbsSeparator
          Visible = False
        end
        object TButtIdiomaAlinIzq: TToolButton
          Left = 77
          Top = 2
          Action = FMain.RichEditAlignLeft1
        end
        object TButtIdiomaAlinCentr: TToolButton
          Left = 100
          Top = 2
          Action = FMain.RichEditAlignCenter1
        end
        object TButtIdiomaAlinDer: TToolButton
          Left = 123
          Top = 2
          Action = FMain.RichEditAlignRight1
        end
        object TButtIdiomaSep2: TToolButton
          Left = 146
          Top = 2
          Width = 8
          Style = tbsSeparator
          Visible = False
        end
        object TButtIdiomaBullet: TToolButton
          Left = 154
          Top = 2
          Action = FMain.RichEditBullets1
        end
        object TButtIdiomaSep3: TToolButton
          Left = 177
          Top = 2
          Width = 8
          Style = tbsSeparator
          Visible = False
        end
        object PNLTamano: TLFPanel
          Left = 185
          Top = 2
          Width = 40
          Height = 22
          TabOrder = 0
          object EFontSize: TLFEdit
            Left = 1
            Top = 0
            Width = 24
            Height = 21
            TabOrder = 0
            Text = '0'
            OnChange = EFontSizeChange
          end
          object UpDownFontSize: TUpDown
            Left = 25
            Top = 0
            Width = 15
            Height = 21
            Associate = EFontSize
            Min = 0
            Position = 0
            TabOrder = 1
            Wrap = True
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 421
    Width = 1154
  end
  inherited CEMain: TControlEdit
    Left = 250
    Top = 38
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 288
    Top = 38
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGLineas.Columns')
    Left = 325
    Top = 39
  end
end
