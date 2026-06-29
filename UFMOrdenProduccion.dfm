inherited FMOrdenProduccion: TFMOrdenProduccion
  Left = 335
  Top = 214
  HelpContext = 277
  Caption = 'Orden de Producci'#243'n'
  ClientHeight = 445
  ClientWidth = 758
  PopupMenu = CEProcesosPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 421
    inherited TBMain: TLFToolBar
      Width = 754
      inherited NavMain: THYMNavigator
        DataSource = DMOrdenProduccion.DSQMOrdenProd
        Hints.Strings = ()
        EditaControl = DBEFSerie
        InsertaControl = DBEFSerie
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
      object EFSerieKri: TLFEditFind2000
        Left = 337
        Top = 0
        Width = 44
        Height = 22
        TabOrder = 2
        OnChange = EFSerieKriChange
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
      object PNLSelOrdenKri: TLFPanel
        Left = 381
        Top = 0
        Width = 172
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LOrden: TLFLabel
          Left = 17
          Top = 4
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Orden'
          Layout = tlCenter
        end
        object EFOrdenKri: TLFEditFind2000
          Left = 48
          Top = 0
          Width = 121
          Height = 21
          TabOrder = 0
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'NORDEN'
          CampoStr = 'ARTICULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ORDENES_PRODUCCION'
          Tabla_asociada.DesplegarBusqueda = False
          OnExiste = EFOrdenKriExiste
          OrdenadoPor.Strings = (
            'NORDEN')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object TButtCierraOrdenKri: TToolButton
        Left = 553
        Top = 0
        Action = ACerrar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 754
      Height = 391
      inherited TSFicha: TTabSheet
        object SBAArticulo: TSpeedButton [0]
          Left = 123
          Top = 42
          Width = 160
          Height = 22
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Compuesto'
          GroupIndex = -1
          OnClick = SBAArticuloClick
        end
        inherited PEdit: TLFPanel
          Width = 746
          Height = 363
          object LBLNumOrden: TLFLabel
            Left = 54
            Top = 30
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Orden'
          end
          object LBLEscandallo: TLFLabel
            Left = 46
            Top = 254
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LBLArticulo: TLFLabel
            Left = 61
            Top = 188
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LBLUnidades: TLFLabel
            Left = 53
            Top = 232
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LBLEstado: TLFLabel
            Left = 444
            Top = 29
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LBLPrioridad: TLFLabel
            Left = 57
            Top = 276
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prioridad'
          end
          object LBLMerma: TLFLabel
            Left = 55
            Top = 298
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = '% Merma'
          end
          object LBLMaterial: TLFLabel
            Left = 61
            Top = 210
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Material'
          end
          object LBLAlmacen: TLFLabel
            Left = 57
            Top = 166
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLSerie: TLFLabel
            Left = 74
            Top = 74
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object Label1: TLFLabel
            Left = 277
            Top = 30
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Orden'
          end
          object LBLOperario: TLFLabel
            Left = 58
            Top = 52
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object Label2: TLFLabel
            Left = 452
            Top = 74
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cierre'
          end
          object DBENumOrden: TLFDbedit
            Left = 105
            Top = 26
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NORDEN'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
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
          object DBEFArticulo: TLFDBEditFind2000
            Left = 105
            Top = 184
            Width = 121
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 8
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFArticuloBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFEscandallo: TLFDBEditFind2000
            Left = 105
            Top = 250
            Width = 121
            Height = 21
            DataField = 'ESCANDALLO'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 13
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS_ESC_PRODUCCION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'NUMERO'
            CampoStr = 'NUMERO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFEscandalloBusqueda
            OrdenadoPor.Strings = (
              'NUMERO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object GBPedido: TGroupBox
            Left = 105
            Top = 92
            Width = 513
            Height = 67
            Caption = 'Pedido Asociado'
            TabOrder = 5
            object LBLPedido: TLFLabel
              Left = 13
              Top = 22
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pedido'
            end
            object LBLLinea: TLFLabel
              Left = 18
              Top = 44
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'nea'
            end
            object DBEFPedido: TLFDBEditFind2000
              Left = 52
              Top = 18
              Width = 85
              Height = 21
              DataField = 'PEDIDO'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_DETALLE_PEDIDO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'RIG'
              CampoStr = 'RIG'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OnBusqueda = DBEFPedidoBusqueda
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFLinea: TLFDBEditFind2000
              Left = 52
              Top = 40
              Width = 85
              Height = 21
              DataField = 'LINEA'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              TabOrder = 1
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_DETALLE_PEDIDO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LINEA'
              CampoStr = 'LINEA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OnBusqueda = DBEFLineaBusqueda
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
          object DBETitArticulo: TLFDbedit
            Left = 227
            Top = 184
            Width = 391
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxArticulos
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
          object GBFechas: TGroupBox
            Left = 429
            Top = 230
            Width = 189
            Height = 86
            Caption = 'Fechas'
            TabOrder = 18
            object LBLFechaEntrega: TLFLabel
              Left = 51
              Top = 19
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Entrega'
            end
            object LBLFechaInicio: TLFLabel
              Left = 63
              Top = 41
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'Inicio'
            end
            object LBLFechaInicioProd: TLFLabel
              Left = 6
              Top = 63
              Width = 82
              Height = 13
              Alignment = taRightJustify
              Caption = 'Inicio Producci'#243'n'
            end
            object DBDTPFEntrega: TLFDBDateEdit
              Left = 94
              Top = 15
              Width = 87
              Height = 21
              DataField = 'FECHA_ENTREGA'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DBDTPFInicio: TLFDBDateEdit
              Left = 94
              Top = 37
              Width = 87
              Height = 21
              DataField = 'FECHA_INICIO'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
            object DBDTPFInicioProd: TLFDBDateEdit
              Left = 94
              Top = 59
              Width = 87
              Height = 21
              TabStop = False
              DataField = 'FECHA_INICIO_PROD'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              ReadOnly = True
              CheckOnExit = True
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              NumGlyphs = 2
              ParentFont = False
              TabOrder = 2
            end
          end
          object DBEEstado: TLFDbedit
            Left = 480
            Top = 26
            Width = 137
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxEstados
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object DBEPrioridad: TLFDbedit
            Left = 105
            Top = 272
            Width = 121
            Height = 21
            DataField = 'PRIORIDAD'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 14
          end
          object DBEMerma: TLFDbedit
            Left = 105
            Top = 294
            Width = 121
            Height = 21
            DataField = 'P_MERMA'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 15
          end
          object GBCantidades: TGroupBox
            Left = 229
            Top = 230
            Width = 197
            Height = 86
            Caption = 'Cantidad'
            TabOrder = 17
            object LBLCantOrdenada: TLFLabel
              Left = 11
              Top = 19
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ordenada'
            end
            object LBLEsperada: TLFLabel
              Left = 13
              Top = 41
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Esperada'
            end
            object LBLFinal: TLFLabel
              Left = 36
              Top = 63
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Final'
            end
            object DBECantOrdenada: TLFDbedit
              Left = 64
              Top = 15
              Width = 121
              Height = 21
              DataField = 'CANT_ORDENADA'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              TabOrder = 0
            end
            object DBECantEsperada: TLFDbedit
              Left = 64
              Top = 37
              Width = 121
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CANT_ESPERADA'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
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
            object DBECantFinal: TLFDbedit
              Left = 64
              Top = 59
              Width = 121
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CANT_FINAL'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
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
          object DBEFMaterial: TLFDBEditFind2000
            Left = 105
            Top = 206
            Width = 121
            Height = 21
            DataField = 'MATERIAL'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_MATERIAL'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBETitMaterial: TLFDbedit
            Left = 227
            Top = 206
            Width = 224
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxMaterial
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
          object DBEUnidades: TLFDbedit
            Left = 105
            Top = 228
            Width = 121
            Height = 21
            DataField = 'UNIDADES'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 12
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 105
            Top = 162
            Width = 121
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 6
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
          object DBETitAlmacen: TLFDbedit
            Left = 227
            Top = 162
            Width = 391
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxAlmacenes
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
          object DBEFSerie: TLFDBEditFind2000
            Left = 105
            Top = 70
            Width = 121
            Height = 21
            DataField = 'SERIE'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 3
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
          object DBETitSerie: TLFDbedit
            Left = 227
            Top = 70
            Width = 207
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMOrdenProduccion.DSxSeries
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
          object DBDTPFecha_orden: TLFDBDateEdit
            Left = 342
            Top = 26
            Width = 95
            Height = 21
            DataField = 'FECHA_ORDEN'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DBETercero: TLFDBEditFind2000
            Left = 105
            Top = 48
            Width = 121
            Height = 21
            DataField = 'TERCERO_OPERARIO'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 1
            OnChange = DBETerceroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_COMERCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDBDOperario: TLFHYDBDescription
            Left = 227
            Top = 48
            Width = 390
            Height = 21
            Color = clInfoBk
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
            Tabla_a_buscar = 'SYS_TERCEROS'
            Campo_Descripcion = 'NOMBRE_COMERCIAL'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'TERCERO_OPERARIO')
            CamposWhereTabla.Strings = (
              'TERCERO')
          end
          object DBDateEdit1: TLFDBDateEdit
            Left = 517
            Top = 70
            Width = 100
            Height = 21
            DataField = 'FECHA_CIERRE'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 20
          end
          object LFDBEEjercicioKri: TLFDbedit
            Left = 227
            Top = 26
            Width = 43
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
        end
      end
      object TSProcesos: TTabSheet [1]
        Caption = '&Procesos'
        ImageIndex = 3
        OnShow = TSProcesosShow
        object TBProcesoso: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 26
          AutoSize = True
          EdgeBorders = [ebBottom]
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object Panel1: TLFPanel
            Left = 0
            Top = 2
            Width = 324
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBENordenProcesos: TLFDbedit
              Left = 1
              Top = 1
              Width = 41
              Height = 21
              Color = clInfoBk
              DataField = 'NORDEN'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEArtProcesos: TLFDbedit
              Left = 43
              Top = 1
              Width = 280
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
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
          object ToolButton4: TToolButton
            Left = 324
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object HYNavProcesoso: THYMNavigator
            Left = 332
            Top = 2
            Width = 220
            Height = 22
            DataSource = DMOrdenProduccion.DSProcesos
            Flat = True
            ParentShowHint = False
            PopupMenu = CEProcesosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFProcesos
            InsertaControl = DBGFProcesos
            Exclusivo = False
            ControlEdit = CEProcesos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNProcesos: TLFPanel
          Left = 0
          Top = 26
          Width = 746
          Height = 337
          Align = alClient
          TabOrder = 1
          object DBGFProcesos: TDBGridFind2000
            Left = 1
            Top = 1
            Width = 744
            Height = 335
            Align = alClient
            DataSource = DMOrdenProduccion.DSProcesos
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 1
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoCambiarColumna = True
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'OPERARIO'
              'PROCESO')
            CamposAMostrar.Strings = (
              'OPERARIO'
              '0'
              'PROCESO'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'ORDEN'
              'OPERARIO'
              'TITULO'
              'TITULO_OPERARIO'
              'PROCESO')
            CamposNoAccesibles.Strings = (
              'ORDEN'
              'TITULO'
              'TITULO_OPERARIO')
            MensajeNoExiste = False
            Numericos.Strings = (
              'TERCERO'
              'PROCESO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_TERCEROS'
              'EMP_PROCESOS_PRODUCCION')
            Titulos.Strings = (
              'NOMBRE_R_SOCIAL'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFProcesosBusqueda
            OrdenMultiple = True
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ORDEN'
                Width = 36
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCESO'
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Width = 145
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OPERARIO'
                Width = 32
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_OPERARIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Width = 163
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DURACION'
                Width = 54
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DURACION_INICIAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRECIO_INICIAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Visible = True
              end>
          end
        end
      end
      object TSNotas: TTabSheet [2]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 26
          AutoSize = True
          EdgeBorders = [ebBottom]
          TabOrder = 0
          Separators = True
          object PNLNotas: TLFPanel
            Left = 0
            Top = 2
            Width = 324
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEOrdenNot: TLFDbedit
              Left = 1
              Top = 1
              Width = 41
              Height = 21
              Color = clInfoBk
              DataField = 'NORDEN'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEDesNotas: TLFDbedit
              Left = 43
              Top = 1
              Width = 280
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMOrdenProduccion.DSQMOrdenProd
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
          object ToolButton3: TToolButton
            Left = 324
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 332
            Top = 2
            Width = 88
            Height = 22
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = ControlEdit1PMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            InsertaControl = DBMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLENotas: TLFPanel
          Left = 0
          Top = 26
          Width = 746
          Height = 337
          Align = alClient
          Enabled = False
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 1
            Top = 1
            Width = 744
            Height = 335
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMOrdenProduccion.DSQMOrdenProd
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 746
          Height = 363
          DataSource = DMOrdenProduccion.DSQMOrdenProd
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'CANT_ORDENADA'
            'ESTADO'
            'FECHA_INICIO_PROD'
            'LINEA'
            'MATERIAL'
            'NORDEN'
            'PEDIDO'
            'PRIORIDAD'
            'SERIE')
          Columns = <
            item
              Expanded = False
              FieldName = 'NORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANT_ORDENADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO_PROD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATERIAL'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 421
    Width = 758
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEProcesos
    Left = 548
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 580
    Top = 34
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 642
    Top = 34
    object AListadoOrdenesProduccion: TAction
      Category = 'Listados'
      Caption = 'Listado de Ordenes de Producci'#243'n'
      Hint = 'Listado de Ordenes de Producci'#243'n'
      ImageIndex = 14
      OnExecute = AListadoOrdenesProduccionExecute
    end
    object ADesgloseOrdenProduccion: TAction
      Category = 'Listados'
      Caption = 'Desglose Orden Producci'#243'n'
      Hint = 'Desglose Orden Producci'#243'n'
      ImageIndex = 14
      OnExecute = ADesgloseOrdenProduccionExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AEscandallo: TAction
      Category = 'Otros'
      Caption = 'Escandallo asociado a la Orden'
      Hint = 'Escandallo asociado a la Orden'
      ImageIndex = 10
      OnExecute = AEscandalloExecute
    end
    object AInfoLotes: TAction
      Category = 'Otros'
      Caption = 'Informaci'#243'n de Lotes'
      Hint = 'Informaci'#243'n de Lotes'
      ImageIndex = 120
      ShortCut = 16460
      OnExecute = AInfoLotesExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AInicioProduccion: TAction
      Category = 'Procesos'
      Caption = 'Rec'#225'lculo de la fecha de inicio de Producci'#243'n'
      Hint = 'Rec'#225'lculo de la fecha de inicio de Producci'#243'n'
      ImageIndex = 3
      OnExecute = AInicioProduccionExecute
    end
    object ALanzar: TAction
      Category = 'Procesos'
      Caption = 'Lanzar la Orden de Producci'#243'n'
      Hint = 'Lanzar la Orden de Producci'#243'n'
      ImageIndex = 92
      OnExecute = ALanzarExecute
    end
    object ADeslanzar: TAction
      Category = 'Procesos'
      Caption = 'Deslanzar la Orden de Producci'#243'n'
      Hint = 'Deslanzar la Orden de Producci'#243'n'
      ImageIndex = 51
      OnExecute = ADeslanzarExecute
    end
    object ACerradoParcial: TAction
      Category = 'Procesos'
      Caption = 'Cerrar parcialmente la Orden de Producci'#243'n'
      Hint = 'Cerrar parcialmente la Orden de Producci'#243'n'
      ImageIndex = 88
      OnExecute = ACerradoParcialExecute
    end
    object ACerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar la Orden de Producci'#243'n'
      Hint = 'Cerrar la Orden de Producci'#243'n'
      ImageIndex = 68
      OnExecute = ACerrarExecute
    end
    object AAbrir: TAction
      Category = 'Procesos'
      Caption = 'Abrir la Orden de Producci'#243'n'
      Hint = 'Abrir la Orden de Producci'#243'n'
      ImageIndex = 67
      OnExecute = AAbrirExecute
    end
    object ARegenerarEscandalloKri: TAction
      Category = 'Procesos'
      Caption = 'Regenera el escandallo asociado a la orden'
      Hint = 'Regenera el escandallo asocioado a la orden'
      ImageIndex = 26
      OnExecute = ARegenerarEscandalloKriExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AListadoCodigoBarras: TAction
      Category = 'Listados'
      Caption = 'Listado C'#243'digo de Barras'
      Hint = 'Listado de codigo de barras de la orden.'
      ImageIndex = 38
      OnExecute = AListadoCodigoBarrasExecute
    end
    object AArticulo: TAction
      Category = 'Otros'
      Caption = 'Articulo asociado a la orden'
      Hint = 'Ver ficha de articulo de la orden'
      ImageIndex = 109
      OnExecute = AArticuloExecute
    end
    object AArticulosEscandallo: TAction
      Category = 'Otros'
      Caption = 'Articulos del Escandallo'
      Hint = 'Ver ficha de articulos del escandallo'
      ImageIndex = 111
      OnExecute = AArticulosEscandalloExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFSerieKri.Text')
    Left = 642
    Top = 6
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLENotas
    SubComplementario = ALMain
    PopUpMenu = ControlEdit1PMEdit
    Teclas = DMMain.Teclas
    Left = 554
    Top = 174
  end
  object ControlEdit1PMEdit: TPopUpTeclas
    Left = 588
    Top = 142
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
    end
  end
  object CEProcesos: TControlEdit
    EnlazadoA = CENotas
    FichaEdicion = TSProcesos
    FichaExclusiva = TSProcesos
    SubComplementario = ALMain
    PopUpMenu = CEProcesosPMEdit
    Teclas = DMMain.Teclas
    Left = 554
    Top = 144
  end
  object CEProcesosPMEdit: TPopUpTeclas
    Left = 590
    Top = 182
    object CEProcesosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEProcesosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEProcesosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEProcesosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEProcesosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEProcesosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEProcesosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEProcesosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEProcesosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEProcesosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
