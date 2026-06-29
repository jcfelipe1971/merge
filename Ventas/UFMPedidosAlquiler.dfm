inherited FMPedidosAlquiler: TFMPedidosAlquiler
  Left = 206
  Top = 176
  Caption = 'Pedidos de Clientes Alquiler'
  OldCreateOrder = True
  PopupMenu = CEAlquilerPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        PopupMenu = CEAlquilerPMEdit
        EditaControl = DBEFClienteAlquiler
        InsertaControl = DBEFClienteAlquiler
        ControlEdit = CEAlquiler
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSOtros: TTabSheet
        inherited PNLCabOtros: TLFPanel
          inherited NavOtros: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSNotas: TTabSheet
        inherited PNLCabNotas: TLFPanel
          inherited NavNotas: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          TabFicha = TSAlquiler
        end
      end
      inherited TSDirManual: TTabSheet
        inherited PNLDirManual: TLFPanel
          inherited NavDirEntrega: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      object TSAlquiler: TTabSheet
        Caption = 'Alquiler'
        object PNLAlquiler: TLFPanel
          Left = 0
          Top = 0
          Width = 1264
          Height = 221
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          DesignSize = (
            1264
            221)
          object LTarifaAlquiler: TLFLabel
            Left = 46
            Top = 49
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LAgenteAlquiler: TLFLabel
            Left = 39
            Top = 92
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LAlmacenAlquiler: TLFLabel
            Left = 32
            Top = 137
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LClienteAlquiler: TLFLabel
            Left = 41
            Top = 27
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LDias: TLFLabel
            Left = 663
            Top = 49
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dias'
            FocusControl = DBEDias
          end
          object LDireccionAlquiler: TLFLabel
            Left = 28
            Top = 71
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LDireccionEventoAlquiler: TLFLabel
            Left = 21
            Top = 161
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dir. Evento'
          end
          object LEstadoAlquiler: TLFLabel
            Left = 151
            Top = 5
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LFechaEntregaAlquiler: TLFLabel
            Left = 407
            Top = 72
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Entrega'
          end
          object LFechaEventoAlquiler: TLFLabel
            Left = 410
            Top = 50
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Evento'
          end
          object LFechaPedidoAlquiler: TLFLabel
            Left = 438
            Top = 5
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LFechaRecogidaAlquiler: TLFLabel
            Left = 398
            Top = 94
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Recogida'
          end
          object LFormaPagoAlquiler: TLFLabel
            Left = 16
            Top = 114
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LPedidoAlquiler: TLFLabel
            Left = 40
            Top = 5
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
            FocusControl = DBEPedidoAlquiler
          end
          object LReferenciaAlquiler: TLFLabel
            Left = 416
            Top = 27
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
            FocusControl = DBEReferenciaAlquiler
          end
          object LAnticiposAlquiler: TLFLabel
            Left = 425
            Top = 116
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Anticipos'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTotalAnticipos: TLFLabel
            Left = 653
            Top = 94
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Ant.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBCHKListadoAlquiler: TLFDBCheckBox
            Left = 348
            Top = 4
            Width = 33
            Height = 17
            Caption = 'Lst.'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 17
            TabStop = True
            OnClick = DBCHKListadoClick
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'MODIFICA_DOC'
            DataSource = DMPedidosAlquiler.DSxInfoActualizada
            ValueChecked = '4'
            ValueUnchecked = '0'
          end
          object DBDEFechaEntregaAlquiler: TLFDBDateEdit
            Left = 474
            Top = 68
            Width = 87
            Height = 21
            DataField = 'FECHA_ENTREGA'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 12
            OnExit = DBDTPFechaExit
          end
          object DBDEFechaEventoAlquiler: TLFDBDateEdit
            Left = 474
            Top = 46
            Width = 87
            Height = 21
            DataField = 'FECHA_EVENTO'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
            OnExit = DBDTPFechaExit
          end
          object DBDEFechaPedidoAlquiler: TLFDBDateEdit
            Left = 474
            Top = 2
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
            OnExit = DBDTPFechaExit
          end
          object DBDEFechaRecogidaAlquiler: TLFDBDateEdit
            Left = 474
            Top = 90
            Width = 87
            Height = 21
            DataField = 'FECHA_RECOGIDA'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
            OnExit = DBDTPFechaExit
          end
          object DBDTPHoraEntregaAlquiler: TDBDateTimePicker
            Left = 562
            Top = 68
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 43735.3871174653
            Time = 43735.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 13
            DataField = 'FECHA_ENTREGA'
            DataSource = DMPedidosAlquiler.DSQMCabecera
          end
          object DBDTPHoraRecogidaAlquiler: TDBDateTimePicker
            Left = 562
            Top = 90
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 43735.3871174653
            Time = 43735.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 15
            DataField = 'FECHA_RECOGIDA'
            DataSource = DMPedidosAlquiler.DSQMCabecera
          end
          object DBEClienteAlquiler: TLFDbedit
            Left = 144
            Top = 24
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidosAlquiler.DSxClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
            OnDblClick = SBAClienteDblClick
          end
          object DBEDias: TLFDbedit
            Left = 690
            Top = 46
            Width = 87
            Height = 21
            AutoSize = False
            DataField = 'DIAS'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 16
          end
          object DBEEstadoAlquiler: TLFDbedit
            Left = 187
            Top = 2
            Width = 158
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMPedidos.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object DBEFAgenteAlquiler: TLFDBEditFind2000
            Left = 79
            Top = 90
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'AGENTE'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 4
            Accion = ANewAgente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'agente')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEFAlmacenAlquiler: TLFDBEditFind2000
            Left = 79
            Top = 134
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMPedidosAlquiler.DSQMCabecera
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
              'almacen')
            Filtros = [obEmpresa]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEFDireccionAlquiler: TLFDBEditFind2000
            Left = 79
            Top = 68
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES                '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'COD_POSTAL'
              'LOCALIDAD')
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = [obTercero]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEFFormaPagoAlquiler: TLFDBEditFind2000
            Left = 79
            Top = 112
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'FORMA_PAGO'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'forma_pago')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEFTarifaAlquiler: TLFDBEditFind2000
            Left = 79
            Top = 46
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TARIFA'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TARIFAS_ARTICULO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'propaga=1 and activa=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEPedidoAlquiler: TLFDbedit
            Left = 79
            Top = 2
            Width = 64
            Height = 21
            DataField = 'RIG'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 0
          end
          object DBEReferenciaAlquiler: TLFDbedit
            Left = 474
            Top = 24
            Width = 303
            Height = 21
            AutoSize = False
            DataField = 'SU_REFERENCIA'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 9
          end
          object DBETituloAlmacenAlquiler: TLFDbedit
            Left = 144
            Top = 134
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidosAlquiler.DSxAlmacenes
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
          object DBETituloFormaPagoAlquiler: TLFDbedit
            Left = 144
            Top = 112
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidosAlquiler.DSxFormasPago
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
          object DBMDireccionEventoAlquiler: TLFDBMemo
            Left = 78
            Top = 156
            Width = 306
            Height = 65
            Anchors = [akLeft, akTop, akBottom]
            DataField = 'DIRECCION_EVENTO'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 7
          end
          object DBTPHoraEventoAlquiler: TDBDateTimePicker
            Left = 562
            Top = 46
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 43735.3871174653
            Time = 43735.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 11
            DataField = 'FECHA_EVENTO'
            DataSource = DMPedidosAlquiler.DSQMCabecera
          end
          object ETituloAgenteAlquiler: TLFDbedit
            Left = 144
            Top = 90
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidosAlquiler.DSxAgentes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
            OnDblClick = SBAAgenteDblClick
          end
          object ETituloDireccionAlquiler: TLFDbedit
            Left = 144
            Top = 68
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidosAlquiler.DSxDirecciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
          end
          object ETituloTarifaAlquiler: TLFDbedit
            Left = 144
            Top = 46
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidosAlquiler.DSxTarifas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBEFClienteAlquiler: TLFDBEditFind2000
            Left = 79
            Top = 24
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'CLIENTE'
            DataSource = DMPedidosAlquiler.DSQMCabecera
            TabOrder = 1
            OnChange = EFClienteChange
            Accion = ANewCliente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TELEFONO'
              'TELEFONO2'
              'TELEFAX')
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = EFClienteExiste
            OrdenadoPor.Strings = (
              'cliente')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBGAnticiposAlquiler: THYTDBGrid
            Left = 474
            Top = 112
            Width = 303
            Height = 109
            TabStop = False
            Anchors = [akLeft, akTop, akBottom]
            DataSource = DMPedidosAlquiler.DSxAnticiposAlquiler
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 25
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = False
            CamposAMarcar.Strings = (
              'PAGADO')
            CamposChecked.Strings = (
              '1')
            CamposNoChecked.Strings = (
              '0')
            CamposAOrdenar.Strings = (
              'FECHA_REGISTRO'
              'LIQUIDO'
              'PAGADO'
              'REGISTRO')
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'REGISTRO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_REGISTRO'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LIQUIDO'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MONEDA'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PAGADO'
                Width = 40
                Visible = True
              end>
          end
          object DBETotalAnticipos: TLFDbedit
            Left = 704
            Top = 90
            Width = 73
            Height = 21
            Color = clInfoBk
            DataField = 'TOTAL_ANTICIPOS'
            DataSource = DMPedidosAlquiler.DSxInfoActualizada
            Enabled = False
            TabOrder = 26
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
      end
      object TButtCreaAnticipo: TToolButton
        Left = 791
        Top = 0
        Action = ACreaAnticipo
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ORDEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 32
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO_LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Alignment = taRightJustify
          Width = 57
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TIPO_UNIDAD_LOGISTICA'
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_UNIDAD_LOGISTICA'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_LOGISTICAS'
          Width = 44
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'STOCK_FUTURO'
          Title.Caption = 'Stock Futuro'
          Width = 65
          Visible = True
        end
        item
          Color = clMoneyGreen
          Expanded = False
          FieldName = 'STOCK_VIRTUAL_KRI'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_EXT'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 44
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_PENDIENTES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Title.Alignment = taRightJustify
          Width = 75
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTE_ADICIONAL'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_LINEA_KRI'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_IVA'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_2'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_3'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_IMPONIBLE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'MARGEN_KRI'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'I_DESCUENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BRUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PIEZAS_X_BULTO'
          Width = 53
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BULTOS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_COMISION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMISION'
          Title.Alignment = taRightJustify
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'I_COMISION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 85
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'T_COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'M_BRUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'COMISION_LINEAL'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'I_COMISION_LINEAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_IVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_RECARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_DTO_LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION_ENTREGA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CONF_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REC_DET'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CODIGO_CLIENTE'
          ReadOnly = True
          Width = 104
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_CLIENTE'
          ReadOnly = True
          Width = 234
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INVERSION_SUJETO_PASIVO'
          Width = 30
          Visible = True
        end>
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiprior: TMenuItem
      OnClick = nil
    end
    inherited CEMainMinext: TMenuItem
      OnClick = nil
    end
    inherited CEMainMilast: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiinsert: TMenuItem
      OnClick = nil
    end
    inherited CEMainMidelete: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiedit: TMenuItem
      OnClick = nil
    end
    inherited CEMainMipost: TMenuItem
      OnClick = nil
    end
    inherited CEMainMicancel: TMenuItem
      OnClick = nil
    end
    inherited CEMainMirefresh: TMenuItem
      OnClick = nil
    end
  end
  inherited ALMain: TLFActionList
    object AVerAnticipos: TAction [68]
      Category = 'Otros'
      Caption = 'Ver Anticipos en Cartera'
      Hint = 'Ver Anticipos en Cartera'
      ImageIndex = 70
      OnExecute = AVerAnticiposExecute
    end
  end
  inherited RelojNotas: TTimer
    Left = 642
  end
  inherited CodBarras: TCodeBar
    Left = 608
  end
  object CEAlquiler: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = TSAlquiler
    FichaExclusiva = TSAlquiler
    PanelEdicion = PNLAlquiler
    SubComplementario = ALMain
    PopUpMenu = CEAlquilerPMEdit
    Teclas = DMMain.Teclas
    Left = 640
    Top = 160
  end
  object CEAlquilerPMEdit: TPopUpTeclas
    Left = 672
    Top = 160
    object CEAlquilerMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAlquilerMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAlquilerMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAlquilerMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAlquilerMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEAlquilerMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEAlquilerMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAlquilerMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAlquilerMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAlquilerMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
