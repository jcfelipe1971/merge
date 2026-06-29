inherited FPregFichasArticulos: TFPregFichasArticulos
  Left = 542
  Top = 156
  ActiveControl = DTPFechaD
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Movimiento de Art'#237'culos'
  ClientHeight = 485
  ClientWidth = 724
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 724
    Height = 485
    inherited TBMain: TLFToolBar
      Width = 724
      TabOrder = 3
      object TButtConfiguracionRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 469
      Width = 724
      TabOrder = 4
    end
    object GBPeriodo: TGroupBox
      Left = 0
      Top = 420
      Width = 724
      Height = 62
      Align = alTop
      Caption = ' Rango de Fechas '
      TabOrder = 2
      object LHastaPeriodo: TLFLabel
        Left = 127
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdePeriodo: TLFLabel
        Left = 124
        Top = 16
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LDesdeFecha: TLFLabel
        Left = 541
        Top = 14
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaFecha: TLFLabel
        Left = 544
        Top = 37
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EFPeriodo_D: TLFEditFind2000
        Left = 160
        Top = 12
        Width = 34
        Height = 21
        TabOrder = 1
        OnChange = EFPeriodo_DChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'PERIODO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PERIODOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEPeriodoDesde: TLFDbedit
        Left = 195
        Top = 12
        Width = 208
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxPeriodo_Desde
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object EFPeriodo_H: TLFEditFind2000
        Left = 160
        Top = 34
        Width = 34
        Height = 21
        TabOrder = 2
        OnChange = EFPeriodo_HChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'PERIODO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PERIODOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEPeriodoHasta: TLFDbedit
        Left = 195
        Top = 34
        Width = 208
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxPeriodo_Hasta
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
      object ChkBPeriodos: TLFCheckBox
        Left = 10
        Top = 26
        Width = 79
        Height = 17
        Caption = 'Por Periodos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        OnClick = ChkBPeriodosClick
        Alignment = taLeftJustify
        OnChange = ChkBPeriodosChange
      end
      object ChkBFechas: TLFCheckBox
        Left = 443
        Top = 23
        Width = 74
        Height = 17
        Caption = 'Por Fechas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        OnClick = ChkBFechasClick
        Alignment = taLeftJustify
        OnChange = ChkBFechasChange
      end
      object DTPFechaD: TLFDateEdit
        Left = 577
        Top = 11
        Width = 87
        Height = 22
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DTPFechaH: TLFDateEdit
        Left = 577
        Top = 34
        Width = 87
        Height = 22
        CheckOnExit = True
        BiDiMode = bdLeftToRight
        ParentBiDiMode = False
        NumGlyphs = 2
        TabOrder = 5
      end
    end
    object PNLFiltros: TLFPanel
      Left = 0
      Top = 228
      Width = 724
      Height = 192
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object GBFiltros: TGroupBox
        Left = 0
        Top = 0
        Width = 724
        Height = 192
        Align = alClient
        Caption = 'Filtros'
        TabOrder = 0
        object LDesdeAlmacen: TLFLabel
          Left = 132
          Top = 17
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Almac'#233'n'
          Enabled = False
        end
        object LHastaAlmacen: TLFLabel
          Left = 135
          Top = 39
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Almac'#233'n'
          Enabled = False
        end
        object LBLClienteD: TLFLabel
          Left = 141
          Top = 106
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Cliente'
          Enabled = False
        end
        object LBLClienteH: TLFLabel
          Left = 144
          Top = 128
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Cliente'
          Enabled = False
        end
        object LBLSerieD: TLFLabel
          Left = 149
          Top = 61
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Serie'
          Enabled = False
        end
        object LBLSerieH: TLFLabel
          Left = 152
          Top = 83
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Serie'
          Enabled = False
        end
        object LBLMovH: TLFLabel
          Left = 117
          Top = 172
          Width = 90
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Movimientos'
          Enabled = False
        end
        object LBLMovD: TLFLabel
          Left = 119
          Top = 150
          Width = 88
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Movimiento'
          Enabled = False
        end
        object EFAlmacen_D: TLFEditFind2000
          Left = 212
          Top = 14
          Width = 42
          Height = 21
          Enabled = False
          MaxLength = 3
          TabOrder = 1
          OnChange = EFAlmacen_DChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'almacen')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmacen_H: TLFEditFind2000
          Left = 212
          Top = 36
          Width = 42
          Height = 21
          Enabled = False
          MaxLength = 3
          TabOrder = 3
          OnChange = EFAlmacen_HChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'almacen')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEAlmacenDesde: TLFDbedit
          Left = 255
          Top = 14
          Width = 171
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxAlmacen_Desde
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
        object DBEAlmacenHasta: TLFDbedit
          Left = 255
          Top = 36
          Width = 171
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxAlmacen_Hasta
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
        object CBStock: TLFCheckBox
          Left = 10
          Top = 17
          Width = 95
          Height = 15
          Caption = 'Por Almacenes'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          OnClick = CBStockClick
          Alignment = taLeftJustify
        end
        object EFClienteH: TLFEditFind2000
          Left = 212
          Top = 124
          Width = 56
          Height = 21
          TabOrder = 13
          OnChange = EFClienteHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object CBFiltrar: TLFCheckBox
          Left = 10
          Top = 105
          Width = 96
          Height = 15
          Caption = 'Por Clientes'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 10
          TabStop = True
          OnClick = CBFiltrarClick
          Alignment = taLeftJustify
        end
        object EFClienteD: TLFEditFind2000
          Left = 212
          Top = 102
          Width = 56
          Height = 21
          TabOrder = 11
          OnChange = EFClienteDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'CLIENTE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CLIENTE')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitClienteD: TLFDbedit
          Left = 269
          Top = 102
          Width = 274
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxClienteD
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
        object DBETitClienteH: TLFDbedit
          Left = 269
          Top = 124
          Width = 274
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxClienteH
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 14
        end
        object CBdireccion: TLFCheckBox
          Left = 553
          Top = 104
          Width = 166
          Height = 16
          Caption = 'Incluir la direcci'#243'n del cliente'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 15
          TabStop = True
          OnClick = CBdireccionClick
          Alignment = taLeftJustify
        end
        object CBFiltroSerie: TLFCheckBox
          Left = 10
          Top = 61
          Width = 107
          Height = 15
          Caption = 'Por Series'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 5
          TabStop = True
          OnClick = CBFiltroSerieClick
          Alignment = taLeftJustify
        end
        object EFSerieH: TLFEditFind2000
          Left = 212
          Top = 80
          Width = 90
          Height = 21
          TabOrder = 8
          OnChange = EFSerieHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'Activo = 1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GEN_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'serie')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFSerieD: TLFEditFind2000
          Left = 212
          Top = 58
          Width = 90
          Height = 21
          TabOrder = 6
          OnChange = EFSerieDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'TITULO')
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'Activo = 1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GEN_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'serie')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object CBSalidas: TLFCheckBox
          Left = 553
          Top = 171
          Width = 123
          Height = 17
          Caption = ' Mostrar solo salidas'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 22
          TabStop = True
          OnClick = CBSalidasClick
          Alignment = taLeftJustify
        end
        object EFMovH: TLFEditFind2000
          Left = 212
          Top = 168
          Width = 56
          Height = 21
          TabOrder = 19
          OnChange = EFMovHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_TIPO_MOVIMIENTO'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFMovHBusqueda
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EFMovD: TLFEditFind2000
          Left = 212
          Top = 146
          Width = 56
          Height = 21
          TabOrder = 17
          OnChange = EFMovDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TIPO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_TIPO_MOVIMIENTO'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFMovDBusqueda
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBEMovH: TLFDbedit
          Left = 269
          Top = 168
          Width = 204
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxMovH
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 20
        end
        object DBEMovD: TLFDbedit
          Left = 269
          Top = 146
          Width = 204
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxMovD
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 18
        end
        object CBFiltroMov: TLFCheckBox
          Left = 10
          Top = 149
          Width = 103
          Height = 15
          Caption = 'Por Movimientos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 16
          TabStop = True
          OnClick = CBFiltroMovClick
          Alignment = taLeftJustify
        end
        object CBEntradas: TLFCheckBox
          Left = 553
          Top = 147
          Width = 125
          Height = 17
          Caption = ' Mostrar solo entradas'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 21
          TabStop = True
          OnClick = CBEntradasClick
          Alignment = taLeftJustify
        end
        object DBETitSerieD: TLFDbedit
          Left = 303
          Top = 58
          Width = 240
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxAlmacen_Desde
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
        object DBETitSerieH: TLFDbedit
          Left = 303
          Top = 80
          Width = 240
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMRFichasArticulos.DSxAlmacen_Hasta
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
      end
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 724
      Height = 192
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LHastaArticulo: TLFLabel
        Left = 139
        Top = 37
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo Hasta'
      end
      object LDesdeArticulo: TLFLabel
        Left = 136
        Top = 15
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo Desde'
      end
      object LDesdeFamilia: TLFLabel
        Left = 139
        Top = 59
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fam'#237'lia'
      end
      object LHastaFamilia: TLFLabel
        Left = 142
        Top = 81
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fam'#237'lia'
      end
      object LHastaSubfamilia: TLFLabel
        Left = 126
        Top = 125
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Subfam'#237'lia'
      end
      object LDesdeSubfamilia: TLFLabel
        Left = 123
        Top = 103
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Subfam'#237'lia'
      end
      object LDesdeCanal: TLFLabel
        Left = 146
        Top = 148
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Canal'
      end
      object LHastaCanal: TLFLabel
        Left = 149
        Top = 168
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Canal'
      end
      object EFArticulo_H: TLFEditFind2000
        Left = 212
        Top = 34
        Width = 108
        Height = 21
        TabOrder = 2
        OnChange = EFArticulo_HChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticulo_HBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFArticulo_D: TLFEditFind2000
        Left = 212
        Top = 12
        Width = 108
        Height = 21
        TabOrder = 0
        OnChange = EFArticulo_DChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = False
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_ARTICULOS_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFArticulo_DBusqueda
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEArt_Hasta: TLFDbedit
        Left = 321
        Top = 34
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxArt_Hasta
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBEArt_Desde: TLFDbedit
        Left = 321
        Top = 12
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxArt_Desde
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEFamiliaDesde: TLFDbedit
        Left = 277
        Top = 56
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxFamiliaD
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object EFFamiliaD: TLFEditFind2000
        Left = 212
        Top = 56
        Width = 64
        Height = 21
        TabOrder = 4
        OnChange = EFFamiliaDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'familia')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEFamiliaHasta: TLFDbedit
        Left = 277
        Top = 78
        Width = 302
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxFamiliaH
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
      object EFFamiliaH: TLFEditFind2000
        Left = 212
        Top = 78
        Width = 64
        Height = 21
        TabOrder = 6
        OnChange = EFFamiliaHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_FAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'familia')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSubfamiliaH: TLFEditFind2000
        Left = 212
        Top = 122
        Width = 64
        Height = 21
        TabOrder = 10
        OnChange = EFSubfamiliaHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SUBFAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_SUBFAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SUBFAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFSubfamiliaD: TLFEditFind2000
        Left = 212
        Top = 100
        Width = 64
        Height = 21
        TabOrder = 8
        OnChange = EFSubfamiliaDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'SUBFAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'ART_SUBFAMILIAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'SUBFAMILIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETituloSubfamiliaH: TLFEdit
        Left = 277
        Top = 122
        Width = 302
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
      object DBETituloSubfamiliaD: TLFEdit
        Left = 277
        Top = 100
        Width = 302
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
        TabOrder = 9
      end
      object DBECanadD: TLFDbedit
        Left = 261
        Top = 144
        Width = 173
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxCanalDesde
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
      object DBECanalH: TLFDbedit
        Left = 261
        Top = 166
        Width = 173
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRFichasArticulos.DSxCanalHasta
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
      object EFCanalD: TLFEditFind2000
        Left = 212
        Top = 144
        Width = 48
        Height = 21
        TabOrder = 12
        OnChange = EFCanalDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CANAL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'canal')
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCanalH: TLFEditFind2000
        Left = 212
        Top = 166
        Width = 48
        Height = 21
        TabOrder = 14
        OnChange = EFCanalHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = True
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CANAL'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'canal')
        Filtros = [obEmpresa, obEjercicio]
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 544
    Top = 6
    inherited ARecargar: TAction
      OnExecute = ARecargaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 508
    Top = 8
  end
end
