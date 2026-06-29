inherited FMFacturaAlbaranes: TFMFacturaAlbaranes
  Left = 214
  Top = 161
  Width = 1501
  Height = 605
  HelpContext = 205
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturaci'#243'n Autom'#225'tica a Clientes'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1491
    Height = 233
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 1487
      Wrapable = True
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLSeleccionDestino: TLFPanel
        Left = 31
        Top = 0
        Width = 557
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LCanalDestino: TLFLabel
          Left = 296
          Top = 3
          Width = 60
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal Dst.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object LSerieDestino: TLFLabel
          Left = 7
          Top = 3
          Width = 57
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie Dst.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object ETituloCanal: TLFEdit
          Left = 391
          Top = 0
          Width = 163
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object EFCanalDestino: TLFEditFind2000
          Left = 359
          Top = 0
          Width = 31
          Height = 21
          TabOrder = 1
          OnChange = EFCanalDestinoChange
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESerieDestino: TLFEdit
          Left = 132
          Top = 0
          Width = 163
          Height = 21
          Color = clInfoBk
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object EFSerieDestino: TLFEditFind2000
          Left = 66
          Top = 0
          Width = 65
          Height = 21
          TabOrder = 3
          OnChange = EFSerieDestinoChange
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFSerieDestinoBusqueda
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object TSep2: TToolButton
        Left = 588
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMostrarFiltros: TToolButton
        Left = 596
        Top = 0
        Hint = 'Mostrar los filtros de marcado'
        Caption = 'TButtMostrarFiltros'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMostrarFiltrosClick
      end
      object TSep3: TToolButton
        Left = 619
        Top = 0
        Width = 8
        ImageIndex = 72
        Style = tbsSeparator
      end
      object TButtTodos: TToolButton
        Left = 627
        Top = 0
        Hint = 'Marcar todos los Albaranes'
        Caption = 'Todos'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodosClick
      end
      object TButtDesmarcar: TToolButton
        Left = 650
        Top = 0
        Hint = 'Quita la marca de todos los Albaranes'
        Caption = 'Desmarcar'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtDesmarcarClick
      end
      object TSep4: TToolButton
        Left = 673
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNTotal: TLFPanel
        Left = 681
        Top = 0
        Width = 152
        Height = 22
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object LTotalFactura: TLFLabel
          Left = 4
          Top = 3
          Width = 67
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a fac.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RETotalFactura: THYGRightEdit
          Left = 72
          Top = 0
          Width = 78
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
          TabOrder = 0
          Text = '0'
        end
      end
      object BTSep5: TToolButton
        Left = 833
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtFacturar: TToolButton
        Left = 841
        Top = 0
        Hint = 'Facturar los Albaranes seleccionados'
        Caption = 'Facturar'
        ImageIndex = 61
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtFacturarClick
      end
    end
    object PNLOpciones: TLFPanel
      Left = 2
      Top = 28
      Width = 1487
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PNLFechaDoc: TLFPanel
        Left = 0
        Top = 0
        Width = 369
        Height = 26
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LBLFFactura: TLFLabel
          Left = 5
          Top = 4
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = '&Fecha Dst.'
          FocusControl = DTPFechaFactura
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DTPFechaFactura: TLFDateEdit
          Left = 71
          Top = 0
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object CBFechaEntregaPrev: TLFCheckBox
          Left = 247
          Top = 3
          Width = 112
          Height = 17
          Caption = 'Fec. Entrega Prev.'
          ClicksDisabled = False
          ColorCheck = 57088
          Enabled = False
          TabOrder = 2
          TabStop = True
          Visible = False
          Alignment = taLeftJustify
          OnChange = CBFechaEntregaPrevChange
        end
        object CBFechaAlbaran: TLFCheckBox
          Left = 162
          Top = 3
          Width = 83
          Height = 17
          Caption = 'Fec. Albaran'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBFechaAlbaranChange
        end
      end
      object CBCerrar: TLFCheckBox
        Left = 377
        Top = 2
        Width = 104
        Height = 16
        Hint = 'Cerrar Facturas'
        Caption = 'Cerrar Facturas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBCertificar: TLFCheckBox
        Left = 489
        Top = 2
        Width = 80
        Height = 16
        Hint = 'Certificaci'#243'n de Facturas'
        Caption = 'Certificar'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBFacturaResumida: TLFCheckBox
        Left = 576
        Top = 2
        Width = 72
        Height = 16
        Hint = 'Genera Factura resumida con solo una linea de detalle'
        Caption = 'Resumida'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 54
      Width = 1487
      Height = 177
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object TBFiltroAgrupaciones: TLFToolBar
        Left = 0
        Top = 74
        Width = 1487
        Height = 26
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        TabStop = True
        Separators = True
        object TButtAnyadirSelecAgr: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Agrupaci'#243'n'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecAgrClick
        end
        object TButtQuitarSelecAgr: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Agrupaci'#243'n'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecAgrClick
        end
        object PNLSeleccionAgrupacion: TLFPanel
          Left = 46
          Top = 0
          Width = 427
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LBLAgrupacion: TLFLabel
            Left = 23
            Top = 4
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrupaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object ETitAgrupacion: TLFEdit
            Left = 151
            Top = 0
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object EFAgrupaciones: TLFEditFind2000
            Left = 91
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFAgrupacionesChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGRUPACION'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo='#39'C'#39
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'SYS_AGRUPACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGRUPACION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TBFiltroClientes: TLFToolBar
        Left = 0
        Top = 100
        Width = 1487
        Height = 26
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object TButtAnyadirSelecClientes: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Clientes'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecClientesClick
        end
        object TButtQuitarSelecClientes: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Clientes'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecClientesClick
        end
        object PNLClientes: TLFPanel
          Left = 46
          Top = 0
          Width = 750
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LDesdeCliente: TLFLabel
            Left = 8
            Top = 4
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LHastaCliente: TLFLabel
            Left = 397
            Top = 3
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFClienteDesde: TLFEditFind2000
            Left = 91
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFClienteDesdeChange
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
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFClienteHasta: TLFEditFind2000
            Left = 437
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFClienteHastaChange
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
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloClienteDesde: TLFEdit
            Left = 151
            Top = 0
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object ETituloClienteHasta: TLFEdit
            Left = 497
            Top = 0
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object TBFiltroFechas: TLFToolBar
        Left = 0
        Top = 52
        Width = 1487
        Height = 22
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 2
        Separators = True
        object TButtAnyadirSelecFechas: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Fechas'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecFechasClick
        end
        object TButtQuitarSelecFechas: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Fechas'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecFechasClick
        end
        object PNLSeleccionFechas: TLFPanel
          Left = 46
          Top = 0
          Width = 419
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LDesdeFecha: TLFLabel
            Left = 10
            Top = 4
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LHastaFecha: TLFLabel
            Left = 202
            Top = 4
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DTPDesdeFecha: TLFDateEdit
            Left = 91
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPHastaFecha: TLFDateEdit
            Left = 241
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
        end
      end
      object TBFiltroProyectos: TLFToolBar
        Left = 0
        Top = 152
        Width = 1487
        Height = 26
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 3
        Separators = True
        object TButtAnyadirSelecProy: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Proyectos'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecProyClick
        end
        object TButtQuitarSelecProy: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Proyectos'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecProyClick
        end
        object PNLSeleccionProyecto: TLFPanel
          Left = 46
          Top = 0
          Width = 427
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LBLProyecto: TLFLabel
            Left = 36
            Top = 4
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object ETituloProyecto: TLFEdit
            Left = 151
            Top = 0
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object EFProyectos: TLFEditFind2000
            Left = 91
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFProyectosChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFProyectosBusqueda
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TBFiltros0: TLFToolBar
        Left = 0
        Top = 26
        Width = 1487
        Height = 26
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Separators = True
        object PNLEspaciador: TLFPanel
          Left = 0
          Top = 0
          Width = 46
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
        end
        object PNLFiltroAgente: TLFPanel
          Left = 46
          Top = 0
          Width = 291
          Height = 22
          BevelOuter = bvNone
          TabOrder = 1
          object LAgente: TLFLabel
            Left = 18
            Top = 3
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFFiltroAgente: TLFEditFind2000
            Left = 62
            Top = 0
            Width = 65
            Height = 21
            TabOrder = 0
            OnChange = EFFiltroAgenteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFiltroAgente: TLFEdit
            Left = 128
            Top = 0
            Width = 163
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PNLSeleccionSerie: TLFPanel
          Left = 337
          Top = 0
          Width = 161
          Height = 22
          BevelOuter = bvNone
          TabOrder = 2
          object BtnMultiSerie: TSpeedButton
            Left = 62
            Top = 0
            Width = 87
            Height = 22
            Caption = 'Multiserie'
            OnClick = BtnMultiSerieClick
          end
          object LSerieOrigen: TLFLabel
            Left = 4
            Top = 3
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie Alb.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
        end
        object PNLSeleccionPeriodoFacturacion: TLFPanel
          Left = 498
          Top = 0
          Width = 206
          Height = 21
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 3
          object LPeriodoFacturacion: TLFLabel
            Left = 0
            Top = 3
            Width = 57
            Height = 13
            Hint = 'Periodo de Facturacion'
            Alignment = taRightJustify
            Caption = '&Per. Fact.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object CBPeriodoFacturacion: TLFComboBox
            Left = 60
            Top = 0
            Width = 146
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBPeriodoFacturacionChange
          end
        end
        object PNLImporteSeleccion: TLFPanel
          Left = 704
          Top = 0
          Width = 223
          Height = 22
          BevelOuter = bvNone
          TabOrder = 4
          object LImporteSeleccion: TLFLabel
            Left = 9
            Top = 4
            Width = 58
            Height = 13
            Hint = 'Seleccionar albaranes de clientes que suman importe minimo'
            Alignment = taRightJustify
            Caption = 'Importe Min.'
          end
          object SBImporteSeleccion: TSpeedButton
            Left = 196
            Top = 0
            Width = 23
            Height = 22
            Hint = 'Seleccionar albaranes de clientes que suman importe minimo'
            OnClick = SBImporteSeleccionClick
          end
          object EImporteSeleccion: TLFEdit
            Left = 72
            Top = 0
            Width = 121
            Height = 21
            Hint = 'Seleccionar albaranes de clientes que suman importe minimo'
            TabOrder = 0
          end
        end
        object PNLFiltorDiaPago: TLFPanel
          Left = 927
          Top = 0
          Width = 250
          Height = 22
          BevelOuter = bvNone
          TabOrder = 6
          object LFiltroDiaPago: TLFLabel
            Left = 5
            Top = 4
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dia Pago'
          end
          object CBSinDiaPago: TLFCheckBox
            Left = 157
            Top = 2
            Width = 86
            Height = 17
            Hint = 'Ocultar albaranes tipo Muestra'
            Caption = 'Sin Dia Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
          end
          object EFiltroDesdeDiaPago: TLFEdit
            Left = 53
            Top = 0
            Width = 50
            Height = 21
            TabOrder = 0
            Text = '0'
          end
          object EFiltroHastaDiaPago: TLFEdit
            Left = 104
            Top = 0
            Width = 50
            Height = 21
            TabOrder = 1
            Text = '30'
          end
        end
        object PNLOcultarMuestras: TLFPanel
          Left = 1177
          Top = 0
          Width = 125
          Height = 22
          BevelOuter = bvNone
          TabOrder = 5
          object CBOcultarMuestras: TLFCheckBox
            Left = 3
            Top = 2
            Width = 118
            Height = 17
            Hint = 'Ocultar albaranes tipo Muestra'
            Caption = 'Ocultar Muestras'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBOcultarMuestrasChange
          end
        end
      end
      object TBFitros1: TLFToolBar
        Left = 0
        Top = 0
        Width = 1487
        Height = 26
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        Separators = True
        object TButtRefrescar: TToolButton
          Left = 0
          Top = 0
          Hint = 'Refresca la informaci'#243'n en pantalla'
          Caption = 'Refrescar'
          ImageIndex = 26
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtRefrescarClick
        end
        object TButtInicializa: TToolButton
          Left = 23
          Top = 0
          Hint = 'Inicializa los filtros'
          Caption = 'Inicializa'
          ImageIndex = 20
          OnClick = TButtInicializaClick
        end
        object PNLFecha: TLFPanel
          Left = 46
          Top = 0
          Width = 238
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LFiltroDesdeFecha: TLFLabel
            Left = 0
            Top = 5
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Albar'#225'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DEFiltroFechaDesde: TLFDateEdit
            Left = 62
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DEFiltroFechaHasta: TLFDateEdit
            Left = 153
            Top = 0
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
        end
        object TBSep2: TToolButton
          Left = 284
          Top = 0
          Width = 8
          ImageIndex = 1
          Style = tbsSeparator
        end
        object PNLFiltroCliente: TLFPanel
          Left = 292
          Top = 0
          Width = 468
          Height = 21
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 1
          object PNLFiltroClienteDesde: TLFLabel
            Left = 0
            Top = 3
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFFiltroDesdeCliente: TLFEditFind2000
            Left = 42
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFFiltroDesdeClienteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFFiltroHastaCliente: TLFEditFind2000
            Left = 258
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFFiltroHastaClienteChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFiltroDesdeCliente: TLFEdit
            Left = 102
            Top = 0
            Width = 150
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EFiltroHastaCliente: TLFEdit
            Left = 318
            Top = 0
            Width = 150
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object TBSep1: TToolButton
          Left = 760
          Top = 0
          Width = 8
          ImageIndex = 2
          Style = tbsSeparator
        end
        object PNLFiltroFormaPago: TLFPanel
          Left = 768
          Top = 0
          Width = 472
          Height = 21
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 2
          object LFiltroDesdeFormaPago: TLFLabel
            Left = 0
            Top = 3
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Pago'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFFiltroDesdeFormaPago: TLFEditFind2000
            Left = 47
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFFiltroDesdeFormaPagoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FORMA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FORMA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFFiltroHastaFormaPago: TLFEditFind2000
            Left = 262
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFFiltroHastaFormaPagoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FORMA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FORMA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFiltroDesdeFormaPago: TLFEdit
            Left = 107
            Top = 0
            Width = 150
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EFiltroHastaFormaPago: TLFEdit
            Left = 322
            Top = 0
            Width = 150
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object TBFormaPago: TLFToolBar
        Left = 0
        Top = 126
        Width = 1487
        Height = 26
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 6
        Separators = True
        object TButtAnyadirSelecFormaPago: TToolButton
          Left = 0
          Top = 0
          Hint = 'A'#241'adir la selecci'#243'n por Clientes'
          ImageIndex = 146
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtAnyadirSelecFormaPagoClick
        end
        object TButtQuitarSelecFormaPago: TToolButton
          Left = 23
          Top = 0
          Hint = 'Quitar la selecci'#243'n por Clientes'
          ImageIndex = 147
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtQuitarSelecFormaPagoClick
        end
        object PNLFormaPago: TLFPanel
          Left = 46
          Top = 0
          Width = 750
          Height = 22
          BevelOuter = bvNone
          TabOrder = 0
          object LDesdeFormaPago: TLFLabel
            Left = 1
            Top = 4
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Pago Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LHastaFormaPago: TLFLabel
            Left = 397
            Top = 3
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFDesdeFormaPago: TLFEditFind2000
            Left = 91
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFDesdeFormaPagoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FORMA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FORMA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFHastaFormaPago: TLFEditFind2000
            Left = 437
            Top = 0
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFHastaFormaPagoChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FORMA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = True
            Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'FORMA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDesdeFormaPago: TLFEdit
            Left = 151
            Top = 0
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EHastaFormaPago: TLFEdit
            Left = 497
            Top = 0
            Width = 239
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 552
    Width = 1491
  end
  object PNLDetalle: TLFPanel [2]
    Left = 0
    Top = 233
    Width = 1491
    Height = 319
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object splitter: TSplitter
      Left = 0
      Top = 261
      Width = 1491
      Height = 8
      Cursor = crVSplit
      Align = alBottom
      Color = clAppWorkSpace
      ParentColor = False
    end
    object DBGFAlbaranes: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 1491
      Height = 261
      Align = alClient
      DataSource = DMFacturaAlbaranes.DSQMAlbaranes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGFAlbaranesDrawColumnCell
      OnDblClick = DBGFAlbaranesDblClick
      IniStorage = FSMain
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
        'CAMPANYA'
        'FECHA'
        'RIG'
        'CLIENTE'
        'TITULO'
        'SU_REFERENCIA'
        'LIQUIDO'
        'MONEDA'
        'ALMACEN'
        'PROYECTO'
        'SERIE'
        'FORMA_PAGO'
        'TOTAL_ANTICIPADO'
        'DOCUMENTO_MUESTRAS'
        'I_PORTES'
        'INDICE'
        'POR_PORTES'
        'RANGO'
        'TIPO_PORTES'
        'NOMBRE_COMERCIAL'
        'Z_OBSERVACION'
        'PEDIDO_CLIENTE'
        'AGENTE'
        'FACTURABLE')
      ColumnasCheckBoxes.Strings = (
        'ENTRADA_FACTURACION'
        'DOCUMENTO_MUESTRAS'
        'FACTURABLE')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OnRowChange = DBGFAlbaranesRowChange
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO'
          ReadOnly = True
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          ReadOnly = True
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLIENTE'
          ReadOnly = True
          Width = 70
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
          FieldName = 'NOMBRE_COMERCIAL'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CAMPANYA'
          ReadOnly = True
          Width = 49
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FORMA_PAGO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Width = 72
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          ReadOnly = True
          Width = 160
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          ReadOnly = True
          Width = 72
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_ANTICIPADO'
          ReadOnly = True
          Width = 72
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA'
          ReadOnly = True
          Width = 42
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PROYECTO'
          ReadOnly = True
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_FACTURACION'
          Width = 53
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOCUMENTO_MUESTRAS'
          ReadOnly = True
          Width = 53
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FACTURABLE'
          ReadOnly = True
          Width = 53
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_PORTES'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POR_PORTES'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'I_PORTES'
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RANGO'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'INDICE'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FOLIO'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'O_COMPRA'
          ReadOnly = True
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'AGENTE'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PEDIDO_CLIENTE'
          ReadOnly = True
          Width = 120
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Z_OBSERVACION'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIA_PAGO_1'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIA_PAGO_2'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIA_PAGO_3'
          ReadOnly = True
          Width = 60
          Visible = True
        end>
    end
    object PNLNotasFacturacion: TLFPanel
      Left = 0
      Top = 269
      Width = 1491
      Height = 50
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object MNotasFacturacion: TLFMemo
        Left = 0
        Top = 0
        Width = 1491
        Height = 50
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 1136
    Top = 260
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 1172
    Top = 260
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
    Left = 1128
    Top = 224
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AAsignaEntrada: TAction
      Category = 'Procesos'
      Caption = 'Apropiarse de los albaranes ya marcados'
      Hint = 'Asigna a esta sesi'#243'n los albaranes marcados en otras sesiones'
      ImageIndex = 24
      OnExecute = AAsignaEntradaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EImporteSeleccion.Text'
      'CBOcultarMuestras.Checked'
      'CBFacturaResumida.Checked'
      'CBFechaEntregaPrev.Checked')
    Left = 1164
    Top = 226
  end
end
