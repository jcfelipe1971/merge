inherited FMSeleccionArticulo: TFMSeleccionArticulo
  Left = 198
  Top = 311
  Width = 1413
  Height = 412
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Seleccion Articulo'
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1403
    Height = 359
    inherited TBMain: TLFToolBar
      Top = 97
      Width = 1399
      object TBOk: TToolButton [0]
        Left = 0
        Top = 0
        Caption = 'Ok'
        ImageIndex = 25
        OnClick = TBOkClick
      end
      object TBSep1: TToolButton [1]
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 31
        Width = 26
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PNLArticulos: TLFPanel
      Left = 2
      Top = 123
      Width = 1399
      Height = 234
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGArticulos: THYTDBGrid
        Left = 0
        Top = 0
        Width = 1399
        Height = 234
        Align = alClient
        DataSource = DSBusqueda
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGArticulosDblClick
        OnKeyUp = DBGArticulosKeyUp
        OnTitleClick = DBGArticulosTitleClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CamposAOrdenarImgs = DMMain.ToolbarImages
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK1'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDOS_D_CLI1'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDOS_A_PRO1'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STOCK2'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDOS_D_CLI2'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PEDIDOS_A_PRO2'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_IVA_INCLUIDO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FAMILIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_FAMILIA'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SUBFAMILIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_SUBFAMILIA'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARCA'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_ARTICULO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_CLIENTE'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_PROVEEDOR'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALTO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ANCHO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FONDO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_1'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_2'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_3'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_4'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_5'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_6'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_7'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALFA_8'
            Width = 200
            Visible = True
          end>
      end
    end
    object PNLBusqueda: TLFPanel
      Left = 2
      Top = 2
      Width = 1399
      Height = 95
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object PNLImagen: TLFPanel
        Left = 1288
        Top = 0
        Width = 111
        Height = 95
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object IArticulo: TImage
          Left = 0
          Top = 0
          Width = 111
          Height = 95
          Align = alClient
          AutoSize = True
          Center = True
          Proportional = True
          Stretch = True
        end
      end
      object PNLFiltros: TLFPanel
        Left = 0
        Top = 0
        Width = 1288
        Height = 95
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          1288
          95)
        object LCliente: TLFLabel
          Left = 172
          Top = 6
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object LAlmacen: TLFLabel
          Left = 10
          Top = 6
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almacen 1'
        end
        object LProveedor: TLFLabel
          Left = 155
          Top = 28
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
        end
        object LFamilia: TLFLabel
          Left = 324
          Top = 6
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Familia'
        end
        object LSubfamilia: TLFLabel
          Left = 308
          Top = 25
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Subfamilia'
        end
        object LAlto: TLFLabel
          Left = 474
          Top = 7
          Width = 18
          Height = 13
          Alignment = taRightJustify
          Caption = 'Alto'
        end
        object LAncho: TLFLabel
          Left = 461
          Top = 29
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ancho'
        end
        object LAlmacen2: TLFLabel
          Left = 10
          Top = 28
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almacen 2'
        end
        object LTarifa: TLFLabel
          Left = 592
          Top = 7
          Width = 27
          Height = 13
          Caption = 'Tarifa'
        end
        object LMaca: TLFLabel
          Left = 592
          Top = 29
          Width = 27
          Height = 13
          Caption = 'Maca'
        end
        object LTipoArticulo: TLFLabel
          Left = 818
          Top = 7
          Width = 59
          Height = 13
          Caption = 'Tipo Articulo'
        end
        object LBusqueda: TLFLabel
          Left = 12
          Top = 61
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Busqueda'
        end
        object EFCliente: TLFEditFind2000
          Left = 208
          Top = 3
          Width = 84
          Height = 21
          TabOrder = 2
          OnChange = EBusquedaChange
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
        object EFAlmacen: TLFEditFind2000
          Left = 64
          Top = 3
          Width = 84
          Height = 21
          TabOrder = 0
          OnChange = EBusquedaChange
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
        object EFProveedor: TLFEditFind2000
          Left = 208
          Top = 25
          Width = 84
          Height = 21
          TabOrder = 3
          OnChange = EBusquedaChange
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
          OrdenadoPor.Strings = (
            'PROVEEDOR')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFFamilia: TLFEditFind2000
          Left = 360
          Top = 3
          Width = 84
          Height = 21
          TabOrder = 4
          OnChange = EBusquedaChange
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
        object EFSubFamilia: TLFEditFind2000
          Left = 360
          Top = 25
          Width = 84
          Height = 21
          TabOrder = 5
          OnChange = EBusquedaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SUBFAMILIA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_SUBFAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFSubFamiliaBusqueda
          OrdenadoPor.Strings = (
            'SUBFAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object CBCaseInsensitive: TLFCheckBox
          Left = 1056
          Top = 3
          Width = 121
          Height = 17
          Caption = 'Ignorar minusculas'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 17
          TabStop = True
          Alignment = taLeftJustify
          OnChange = EBusquedaChange
        end
        object EAlto: TLFEdit
          Left = 496
          Top = 3
          Width = 84
          Height = 21
          AutoSize = False
          TabOrder = 6
          OnChange = EBusquedaChange
          OnKeyUp = EBusquedaKeyUp
        end
        object EAncho: TLFEdit
          Left = 496
          Top = 25
          Width = 84
          Height = 21
          AutoSize = False
          TabOrder = 7
          OnChange = EBusquedaChange
          OnKeyUp = EBusquedaKeyUp
        end
        object EFAlmacen2: TLFEditFind2000
          Left = 64
          Top = 25
          Width = 84
          Height = 21
          TabOrder = 1
          OnChange = EBusquedaChange
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
        object CBCalcularStock: TLFCheckBox
          Left = 1179
          Top = 3
          Width = 121
          Height = 17
          Caption = 'Calcular Stock'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 19
          TabStop = True
          Alignment = taLeftJustify
          OnChange = EBusquedaChange
        end
        object CBCalcularPedidos: TLFCheckBox
          Left = 1179
          Top = 25
          Width = 121
          Height = 17
          Caption = 'Calcular Pedidos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 20
          TabStop = True
          Alignment = taLeftJustify
          OnChange = EBusquedaChange
        end
        object EFTarifa: TLFEditFind2000
          Left = 624
          Top = 3
          Width = 49
          Height = 21
          TabOrder = 8
          OnChange = EFTarifaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'TARIFA'
          CampoNum = 'TARIFA'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'propaga=1 and activa=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_TARIFAS_ARTICULO'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFMarca: TLFEditFind2000
          Left = 624
          Top = 25
          Width = 49
          Height = 21
          TabOrder = 10
          OnChange = EFMarcaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'ID_MARCA'
          CampoNum = 'ID_MARCA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS_MOD_MARCAS'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFTipoArticulo: TLFEditFind2000
          Left = 881
          Top = 3
          Width = 49
          Height = 21
          TabOrder = 12
          OnChange = EFTipoArticuloChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'TIPO'
          CampoNum = 'TIPO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_TIPO_ARTICULO'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloTarifa: TLFEdit
          Left = 674
          Top = 3
          Width = 138
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object EFTtuloMarca: TLFEdit
          Left = 674
          Top = 25
          Width = 138
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 11
        end
        object EFTipoArticuloTitulo: TLFEdit
          Left = 931
          Top = 3
          Width = 121
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 13
        end
        object BSImilar: TButton
          Left = 1056
          Top = 23
          Width = 121
          Height = 23
          Caption = 'Similares'
          TabOrder = 18
          OnClick = BSImilarClick
        end
        object EBusqueda: TLFEdit
          Left = 64
          Top = 58
          Width = 1217
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          TabOrder = 21
          OnChange = EBusquedaChange
          OnKeyUp = EBusquedaKeyUp
        end
        object CBSoloDisponibleVenta: TLFCheckBox
          Left = 816
          Top = 25
          Width = 121
          Height = 17
          Hint = 'Solo articulos disponibles para vender'
          Caption = 'Solo Disponible Venta'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 14
          TabStop = True
          Alignment = taLeftJustify
          OnChange = EBusquedaChange
        end
        object CBBloqueadoEnCompras: TLFCheckBox
          Left = 939
          Top = 40
          Width = 110
          Height = 16
          Hint = 'Mostrar articulos bloqeado para Compras'
          Caption = 'Ver Bloq. Compras'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 16
          TabStop = True
          Alignment = taLeftJustify
          OnChange = EBusquedaChange
        end
        object CBBloqueadoEnVentas: TLFCheckBox
          Left = 939
          Top = 25
          Width = 110
          Height = 16
          Hint = 'Mostrar articulos bloqeado para Ventas'
          Caption = 'Ver Bloq. Ventas'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 15
          TabStop = True
          Alignment = taLeftJustify
          OnChange = EBusquedaChange
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 359
    Width = 1403
  end
  inherited CEMain: TControlEdit
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 320
    Top = 0
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
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFAlmacen.Text'
      'EFAlmacen2.Text'
      'CBCaseInsensitive.Checked'
      'CBCalcularStock.Checked'
      'CBCalcularPedidos.Checked'
      'EFTarifa.Text'
      'CBSoloDisponibleVenta.Checked')
    Top = 0
  end
  object TmrBusqueda: TTimer
    Interval = 250
    OnTimer = TmrBusquedaTimer
    Left = 440
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 728
  end
  object DSBusqueda: TDataSource
    DataSet = xBusqueda
    Left = 688
  end
  object xBusqueda: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    SelectSQL.Strings = (
      
        'SELECT A.ID_A, A.ARTICULO, A.TITULO, A.FAMILIA, F.TITULO TITULO_' +
        'FAMILIA, A.SUBFAMILIA, SF.TITULO TITULO_SUBFAMILIA,'
      
        '       A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALFA_4, A.ALFA_5, A.ALFA_' +
        '6, A.ALFA_7, A.ALFA_8, A.ALTO, A.ANCHO, A.FONDO,'
      '       M.TITULO MARCA, T.TITULO TIPO_ARTICULO, A.IMAGEN,'
      '       (SELECT FIRST 1'
      '                       CASE'
      '                         WHEN (TT.IVA_INCLUIDO = 0) THEN'
      '                             PP.PRECIO_VENTA'
      
        '                         ELSE PP.PRECIO_VENTA / (1 + (I.P_IVA / ' +
        '100))'
      '                       END'
      '        FROM ART_TARIFAS_PRECIOS PP'
      
        '        JOIN ART_TARIFAS_C TT ON TT.EMPRESA = PP.EMPRESA AND TT.' +
        'TARIFA = PP.TARIFA'
      '        WHERE'
      '        PP.EMPRESA = A.EMPRESA AND'
      '        PP.TARIFA = :TARIFA AND'
      '        PP.ARTICULO = A.ARTICULO'
      '        ORDER BY PP.LINEA) PRECIO,'
      '       (SELECT FIRST 1'
      '                       CASE'
      '                         WHEN (TT.IVA_INCLUIDO = 0) THEN'
      
        '                             PP.PRECIO_VENTA + (PP.PRECIO_VENTA ' +
        '* I.P_IVA / 100)'
      '                         ELSE PP.PRECIO_VENTA'
      '                       END'
      '        FROM ART_TARIFAS_PRECIOS PP'
      
        '        JOIN ART_TARIFAS_C TT ON TT.EMPRESA = PP.EMPRESA AND TT.' +
        'TARIFA = PP.TARIFA'
      '        WHERE'
      '        PP.EMPRESA = A.EMPRESA AND'
      '        PP.TARIFA = :TARIFA AND'
      '        PP.ARTICULO = A.ARTICULO'
      '        ORDER BY PP.LINEA) PRECIO_IVA_INCLUIDO,'
      '       --'
      '       (SELECT PEDIDOS_D_CLI'
      
        '        FROM A_ART_DAME_STOCK(A.EMPRESA, A.CANAL, :ALMACEN, A.AR' +
        'TICULO, '#39'NOW'#39', 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, NULL)) PEDIDOS_D_CL' +
        'I1,'
      '       (SELECT PEDIDOS_A_PRO'
      
        '        FROM A_ART_DAME_STOCK(A.EMPRESA, A.CANAL, :ALMACEN, A.AR' +
        'TICULO, '#39'NOW'#39', 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, NULL)) PEDIDOS_A_PR' +
        'O1,'
      '       (SELECT PEDIDOS_D_CLI'
      
        '        FROM A_ART_DAME_STOCK(A.EMPRESA, A.CANAL, :ALMACEN, A.AR' +
        'TICULO, '#39'NOW'#39', 1, 1, 0, 0, 0, 0, 1, 0, 0, 0, NULL)) PEDIDOS_D_CL' +
        'I2,'
      '       (SELECT PEDIDOS_A_PRO'
      
        '        FROM A_ART_DAME_STOCK(A.EMPRESA, A.CANAL, :ALMACEN, A.AR' +
        'TICULO, '#39'NOW'#39', 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, NULL)) PEDIDOS_A_PR' +
        'O2, CAST(SUBSTRING((SELECT LIST(COALESCE(CODIGO_CLIENTE, '#39'---'#39'),' +
        ' '#39', '#39')'
      
        '                                                                ' +
        '                                                                ' +
        '                    FROM ART_ARTICULOS_CODCLI'
      
        '                                                                ' +
        '                                                                ' +
        '                    WHERE'
      
        '                                                                ' +
        '                                                                ' +
        '                    EMPRESA = A.EMPRESA AND'
      
        '                                                                ' +
        '                                                                ' +
        '                    ARTICULO = A.ARTICULO'
      
        '                                                                ' +
        '                                                                ' +
        '                    -- AND CLIENTE = _CLIENTE'
      
        '       ) FROM 1 FOR 256) AS VARCHAR(256)) CODIGO_CLIENTE, CAST(S' +
        'UBSTRING((SELECT LIST(COALESCE(CODIGO_PROVEEDOR, '#39'---'#39'), '#39', '#39')'
      
        '                                                                ' +
        '          FROM ART_ARTICULOS_CODPROV'
      
        '                                                                ' +
        '          WHERE'
      
        '                                                                ' +
        '          EMPRESA = A.EMPRESA AND'
      
        '                                                                ' +
        '          ARTICULO = A.ARTICULO'
      
        '                                                                ' +
        '          -- AND PROVEEDOR = _PROVEEDOR'
      
        '       ) FROM 1 FOR 256) AS VARCHAR(256)) CODIGO_PROVEEDOR, A. D' +
        'ISPONIBILIDAD, A. BAJA, A. BLOQUEO_VENTAS, A. BLOQUEO_COMPRAS'
      'FROM VER_ARTICULOS_CUENTAS A'
      
        'JOIN ART_FAMILIAS F ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.F' +
        'AMILIA'
      'JOIN SYS_TIPO_IVA I ON A.TIPO_IVA = I.TIPO AND A.PAIS = I.PAIS'
      
        'LEFT JOIN ART_SUBFAMILIAS SF ON F.ID_FAMILIA = SF.ID_FAMILIA AND' +
        ' A.SUBFAMILIA = SF.SUBFAMILIA'
      'LEFT JOIN ART_ARTICULOS_MOD_MARCAS M ON M.ID_MARCA = A.ID_MARCA'
      'LEFT JOIN SYS_TIPO_ARTICULO T ON T.TIPO = A.TIPO_ARTICULO'
      'WHERE'
      'A.EMPRESA = :EMPRESA AND'
      'A.EJERCICIO = :EJERCICIO AND'
      'A.CANAL = :CANAL AND'
      'A.FAMILIA <> '#39'SYS'#39' AND'
      '-- AND A.FAMILIA = FAMILIA'
      '-- AMD A.SUBFAMILIA = SUBFAMILIA'
      'A.ARTICULO IN (SELECT ARTICULO'
      '               FROM VER_ARTICULOS_EF'
      '               WHERE'
      '               EMPRESA = :EMPRESA AND'
      '               EJERCICIO = :EJERCICIO AND'
      '               CANAL = :CANAL AND'
      
        '               ((ARTICULO LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1' +
        ' FOR 15) || '#39'%'#39') OR --'
      
        '               (TITULO LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 60) || '#39'%'#39') OR --'
      
        '               (ALFA_1 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') OR --'
      
        '               (ALFA_2 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') OR --'
      
        '               (ALFA_3 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') OR --'
      
        '               (ALFA_4 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') OR --'
      
        '               (ALFA_5 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') OR --'
      
        '               (ALFA_6 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') OR --'
      
        '               (ALFA_7 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') OR --'
      
        '               (ALFA_8 LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FO' +
        'R 40) || '#39'%'#39') --'
      '               )'
      '               UNION'
      '               SELECT ARTICULO'
      '               FROM VER_ARTICULOS_COD_CLI'
      '               WHERE'
      '               EMPRESA = :EMPRESA AND'
      
        '               CODIGO_CLIENTE LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FR' +
        'OM 1 FOR 40) || '#39'%'#39
      '               -- AND CLIENTE =CLIENTE'
      '               UNION'
      '               SELECT ARTICULO'
      '               FROM VER_ARTICULOS_COD_PROV'
      '               WHERE'
      '               EMPRESA = :EMPRESA AND'
      
        '               ((CODIGO_PROVEEDOR LIKE '#39'%'#39' || SUBSTRING(:BUSQUED' +
        'A FROM 1 FOR 40) || '#39'%'#39') OR --'
      
        '               (TITULO_ART LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM ' +
        '1 FOR 60)) --'
      '               )'
      '               -- AND PROVEEDOR = PROVEEDOR'
      '               UNION'
      '               SELECT ARTICULO'
      '               FROM ART_ARTICULOS_LOTES'
      '               WHERE'
      '               EMPRESA = :EMPRESA AND'
      '               CANAL = :CANAL AND'
      
        '               LOTE LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FOR 2' +
        '0) || '#39'%'#39
      '               UNION'
      '               SELECT ARTICULO'
      '               FROM ART_ARTICULOS_BARRAS'
      '               WHERE'
      '               EMPRESA = :EMPRESA AND'
      
        '               BARRAS LIKE '#39'%'#39' || SUBSTRING(:BUSQUEDA FROM 1 FOR' +
        ' 25) || '#39'%'#39')')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AutoCalcFields = False
    AfterScroll = xBusquedaAfterScroll
    OnCalcFields = xBusquedaCalcFields
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TLocal
    Left = 649
    object xBusquedaID_A: TIntegerField
      DisplayLabel = 'Id Art.'
      FieldName = 'ID_A'
    end
    object xBusquedaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xBusquedaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object xBusquedaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xBusquedaSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Subfamilia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object xBusquedaALFA_1: TFIBStringField
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xBusquedaALFA_2: TFIBStringField
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xBusquedaALFA_3: TFIBStringField
      FieldName = 'ALFA_3'
      Size = 40
    end
    object xBusquedaALFA_4: TFIBStringField
      FieldName = 'ALFA_4'
      Size = 40
    end
    object xBusquedaALFA_5: TFIBStringField
      FieldName = 'ALFA_5'
      Size = 40
    end
    object xBusquedaALFA_6: TFIBStringField
      FieldName = 'ALFA_6'
      Size = 40
    end
    object xBusquedaALFA_7: TFIBStringField
      FieldName = 'ALFA_7'
      Size = 40
    end
    object xBusquedaALFA_8: TFIBStringField
      FieldName = 'ALFA_8'
      Size = 40
    end
    object xBusquedaSTOCK1: TFloatField
      DisplayLabel = 'Stock 1'
      FieldKind = fkCalculated
      FieldName = 'STOCK1'
      Calculated = True
    end
    object xBusquedaPEDIDOS_D_CLI: TFloatField
      DisplayLabel = 'Ped. Cli. 1'
      FieldName = 'PEDIDOS_D_CLI1'
    end
    object xBusquedaPEDIDOS_A_PRO: TFloatField
      DisplayLabel = 'Ped. Prov. 1'
      FieldName = 'PEDIDOS_A_PRO1'
    end
    object xBusquedaCODIGO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cod. Cliente'
      FieldName = 'CODIGO_CLIENTE'
      Size = 256
    end
    object xBusquedaCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 256
    end
    object xBusquedaALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object xBusquedaANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object xBusquedaFONDO: TFloatField
      DisplayLabel = 'Fondo'
      FieldName = 'FONDO'
    end
    object xBusquedaSTOCK2: TFloatField
      DisplayLabel = 'Stock 2'
      FieldKind = fkCalculated
      FieldName = 'STOCK2'
      Calculated = True
    end
    object xBusquedaPEDIDOS_D_CLI2: TFloatField
      DisplayLabel = 'Ped. Cli. 2'
      FieldName = 'PEDIDOS_D_CLI2'
    end
    object xBusquedaPEDIDOS_A_PRO2: TFloatField
      DisplayLabel = 'Ped. Prov. 2'
      FieldName = 'PEDIDOS_A_PRO2'
    end
    object xBusquedaTITULO_FAMILIA: TFIBStringField
      DisplayLabel = 'Tit. Familia'
      FieldName = 'TITULO_FAMILIA'
      Size = 40
    end
    object xBusquedaTITULO_SUBFAMILIA: TFIBStringField
      DisplayLabel = 'Tit. Subfamilia'
      FieldName = 'TITULO_SUBFAMILIA'
      Size = 40
    end
    object xBusquedaMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 5
    end
    object xBusquedaTIPO_ARTICULO: TFIBStringField
      DisplayLabel = 'Tipo Articulo'
      FieldName = 'TIPO_ARTICULO'
      Size = 60
    end
    object xBusquedaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xBusquedaPRECIO_IVA_INCLUIDO: TFloatField
      DisplayLabel = 'Precio IVA Inc.'
      FieldName = 'PRECIO_IVA_INCLUIDO'
    end
    object xBusquedaIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object xBusquedaDISPONIBILIDAD: TIntegerField
      FieldName = 'DISPONIBILIDAD'
    end
    object xBusquedaBLOQUEO_VENTAS: TIntegerField
      FieldName = 'BLOQUEO_VENTAS'
    end
    object xBusquedaBLOQUEO_COMPRAS: TIntegerField
      FieldName = 'BLOQUEO_COMPRAS'
    end
    object xBusquedaBAJA: TIntegerField
      FieldName = 'BAJA'
    end
  end
  object TmrImagenArticulo: TTimer
    Enabled = False
    Interval = 250
    OnTimer = TmrImagenArticuloTimer
    Left = 768
  end
end
