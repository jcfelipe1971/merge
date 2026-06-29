inherited FMFacturarTickets: TFMFacturarTickets
  Left = 230
  Top = 147
  Width = 1331
  Height = 521
  ActiveControl = CBAbierto
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturacion de Tickets'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1321
    Height = 468
    inherited TBMain: TLFToolBar
      Width = 1317
      inherited NavMain: THYMNavigator
        Width = 135
        DataSource = DMFacturarTickets.DSQMTickets
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 135
      end
      inherited EPMain: THYMEditPanel
        Left = 143
        Width = 33
        DataSource = DMFacturarTickets.DSQMTickets
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 3
      end
      inherited TSepTerc: TToolButton
        Left = 176
      end
      inherited TbuttComp: TToolButton
        Left = 184
      end
      object BSep1: TToolButton
        Left = 207
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescar: TToolButton
        Left = 215
        Top = 0
        Hint = 'Recargar datos'
        Action = AMostrarTodos
        Caption = 'Recargar'
      end
      object TButtMarcarTodos: TToolButton
        Left = 238
        Top = 0
        Action = AMarcarTodos
      end
      object TButtDesmarcar: TToolButton
        Left = 261
        Top = 0
        Action = ADesmarcar
      end
      object BTSep2: TToolButton
        Left = 284
        Top = 0
        Width = 8
        ImageIndex = 27
        Style = tbsSeparator
      end
      object PNLSerieOrigen: TLFPanel
        Left = 292
        Top = 0
        Width = 202
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerieOrigen: TLFLabel
          Left = 10
          Top = 4
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie Origen'
        end
        object CBSerieOrigen: TLFComboBox
          Left = 73
          Top = 0
          Width = 128
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSerieOrigenChange
        end
      end
      object TSep3: TToolButton
        Left = 494
        Top = 0
        Width = 8
        ImageIndex = 62
        Style = tbsSeparator
      end
      object PNLOpciones: TLFPanel
        Left = 502
        Top = 0
        Width = 675
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LSerieDestino: TLFLabel
          Left = 7
          Top = 4
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie Destino'
        end
        object LCanalDestino: TLFLabel
          Left = 207
          Top = 4
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal Dst.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object BAsignaCanal: TSpeedButton
          Left = 458
          Top = 0
          Width = 22
          Height = 22
          Hint = 'Asigna canal destino a ticket seleccionados'
          Flat = True
          OnClick = BAsignaCanalClick
        end
        object DEFechaValor: TLFDateEdit
          Left = 582
          Top = 0
          Width = 90
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 4
        end
        object CBSerieDestino: TLFComboBox
          Left = 75
          Top = 0
          Width = 128
          Height = 21
          ItemHeight = 13
          TabOrder = 0
        end
        object EFCanalDestino: TLFEditFind2000
          Left = 259
          Top = 0
          Width = 31
          Height = 21
          TabOrder = 1
          Text = '0'
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
        object ETituloCanal: TLFEdit
          Left = 292
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
        object CBFechaValor: TLFCheckBox
          Left = 492
          Top = 3
          Width = 90
          Height = 17
          Hint = 'Establece Fecha de Facturacion'
          Caption = 'Fec. Factura'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          OnClick = CBFechaValorClick
          Alignment = taLeftJustify
        end
      end
      object TSep2: TToolButton
        Left = 1177
        Top = 0
        Width = 8
        ImageIndex = 62
        Style = tbsSeparator
      end
      object TButtValidarAnulados: TToolButton
        Left = 1185
        Top = 0
        Action = AValidarAnulados
      end
      object TButtFacturar: TToolButton
        Left = 1208
        Top = 0
        Action = AFacturar
      end
    end
    object PNLFiltros: TPanel
      Left = 2
      Top = 28
      Width = 1317
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LRit: TLFLabel
        Left = 1023
        Top = 9
        Width = 18
        Height = 13
        Caption = 'RIT'
      end
      object SBLimpiarRit: TSpeedButton
        Left = 1022
        Top = 30
        Width = 85
        Height = 22
        Action = ALimpiaFiltro
      end
      object GBEstado: TGroupBox
        Left = 708
        Top = 0
        Width = 211
        Height = 55
        Align = alLeft
        Caption = 'Estado '
        TabOrder = 0
        object CBMostrarTodos: TLFCheckBox
          Left = 7
          Top = 14
          Width = 50
          Height = 17
          Caption = 'Todos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          OnClick = CBMostrarTodosClick
          Alignment = taLeftJustify
        end
        object CBAbierto: TLFCheckBox
          Left = 66
          Top = 14
          Width = 62
          Height = 17
          Hint = 'Tickets Abiertos'
          Caption = 'Edici'#243'n'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          OnClick = CBFiltroEstadoClick
          Alignment = taLeftJustify
        end
        object CBAnuladas: TLFCheckBox
          Left = 138
          Top = 13
          Width = 65
          Height = 17
          Hint = 'Anulados pendietes de validar'
          Caption = 'Anulados'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          OnClick = CBFiltroEstadoClick
          Alignment = taLeftJustify
        end
        object CBCerradas: TLFCheckBox
          Left = 138
          Top = 34
          Width = 64
          Height = 17
          Hint = 'Tickets cerrados'
          Caption = 'Cerrados'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          OnClick = CBFiltroEstadoClick
          Alignment = taLeftJustify
        end
        object CBAnuladoValido: TLFCheckBox
          Left = 66
          Top = 34
          Width = 63
          Height = 17
          Hint = 'Anulados Validados'
          Caption = 'Validados'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          OnClick = CBFiltroEstadoClick
          Alignment = taLeftJustify
        end
      end
      object PNLFechas: TLFPanel
        Left = 0
        Top = 0
        Width = 184
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object LHastaFecha: TLFLabel
          Left = 13
          Top = 34
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LDesdeFecha: TLFLabel
          Left = 10
          Top = 12
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object BFechaHoy: TSpeedButton
          Left = 134
          Top = 7
          Width = 44
          Height = 22
          Hint = 'Fecha actual de trabajo'
          Flat = True
          NumGlyphs = 2
          OnClick = BFechaHoyClick
        end
        object BFechaAnterior: TSpeedButton
          Left = 134
          Top = 29
          Width = 22
          Height = 22
          Hint = 'Dia anterior'
          Flat = True
          NumGlyphs = 2
          OnClick = BFechaAnteriorClick
        end
        object BFechaSiguiente: TSpeedButton
          Left = 156
          Top = 29
          Width = 22
          Height = 22
          Hint = 'Dia posterior'
          Flat = True
          NumGlyphs = 2
          OnClick = BFechaSiguienteClick
        end
        object DEHastaFecha: TLFDateEdit
          Left = 47
          Top = 30
          Width = 85
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DEFechaChange
        end
        object DEDesdeFecha: TLFDateEdit
          Left = 47
          Top = 8
          Width = 85
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = DEFechaChange
        end
      end
      object PNLLimites: TLFPanel
        Left = 184
        Top = 0
        Width = 344
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object LHastaSesion: TLFLabel
          Left = 8
          Top = 34
          Width = 63
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Sesi'#243'n'
        end
        object LDesdeSesion: TLFLabel
          Left = 5
          Top = 12
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Sesi'#243'n'
        end
        object LHastaCaja: TLFLabel
          Left = 129
          Top = 34
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Caja'
        end
        object LDesdeCaja: TLFLabel
          Left = 126
          Top = 12
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Caja'
        end
        object LHastaTurno: TLabel
          Left = 231
          Top = 34
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Turno'
        end
        object LDesdeTurno: TLabel
          Left = 228
          Top = 12
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Turno'
        end
        object EFDesdeSesion: TLFEditFind2000
          Left = 75
          Top = 9
          Width = 40
          Height = 21
          TabOrder = 0
          OnChange = EFSesionesChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SESION'
          CampoStr = 'FECHA_INICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_TPV_SESIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SESION DESC')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHastaSesion: TLFEditFind2000
          Left = 75
          Top = 31
          Width = 40
          Height = 21
          TabOrder = 1
          OnChange = EFSesionesChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SESION'
          CampoStr = 'FECHA_INICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_TPV_SESIONES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SESION DESC')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHastaCaja: TLFEditFind2000
          Left = 185
          Top = 31
          Width = 40
          Height = 21
          TabOrder = 2
          OnChange = EFCajaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CAJA'
          CampoStr = 'FECHA_INICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_TPV_SESIONES_CAJAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CAJA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDesdeCaja: TLFEditFind2000
          Left = 185
          Top = 9
          Width = 40
          Height = 21
          TabOrder = 3
          OnChange = EFCajaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CAJA'
          CampoStr = 'FECHA_INICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_TPV_SESIONES_CAJAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CAJA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDesdeTurno: TLFEditFind2000
          Left = 295
          Top = 9
          Width = 40
          Height = 21
          TabOrder = 4
          Text = '1'
          OnChange = EFTurnoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TURNO'
          CampoStr = 'FECHA_INICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_TPV_SESIONES_CAJAS_TURNO'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TURNO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHastaTurno: TLFEditFind2000
          Left = 295
          Top = 31
          Width = 40
          Height = 21
          TabOrder = 5
          Text = '1'
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TURNO'
          CampoStr = 'FECHA_INICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'GES_TPV_SESIONES_CAJAS_TURNO'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TURNO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object PNLTotal: TLFPanel
        Left = 528
        Top = 0
        Width = 180
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 3
        object LTotal: TLFLabel
          Left = 4
          Top = 12
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a Facturar'
        end
        object LTotalAnulados: TLFLabel
          Left = 13
          Top = 34
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total a Anular'
        end
        object DBETotal: TLFDbedit
          Left = 84
          Top = 9
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'TOTAL'
          DataSource = DMFacturarTickets.DSxTotal
          ReadOnly = True
          TabOrder = 0
        end
        object DBETotalAnulados: TLFDbedit
          Left = 84
          Top = 30
          Width = 73
          Height = 21
          Color = clInfoBk
          DataField = 'TOTAL'
          DataSource = DMFacturarTickets.DSxTotalAnulados
          ReadOnly = True
          TabOrder = 1
        end
      end
      object GBTipoTickets: TGroupBox
        Left = 919
        Top = 0
        Width = 100
        Height = 55
        Align = alLeft
        Caption = 'Tickets'
        TabOrder = 4
        object CBNoFacturados: TLFCheckBox
          Left = 15
          Top = 14
          Width = 74
          Height = 17
          Caption = 'Sin Facturar'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          OnClick = CBFiltroEstadoClick
          Alignment = taLeftJustify
        end
        object CBFacturados: TLFCheckBox
          Left = 15
          Top = 34
          Width = 74
          Height = 17
          Caption = 'Facturado'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          OnClick = CBFiltroEstadoClick
          Alignment = taLeftJustify
        end
      end
      object ERigTicket: TLFEdit
        Left = 1045
        Top = 6
        Width = 61
        Height = 21
        TabOrder = 5
        Text = '0'
        OnChange = ERigTicketChange
        OnKeyPress = ERigTicketKeyPress
      end
      object CBPriorizaStock: TLFCheckBox
        Left = 1109
        Top = 3
        Width = 100
        Height = 17
        Caption = 'Prioriza Stock'
        State = cbGrayed
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBFacturaPorLinea: TLFCheckBox
        Left = 1109
        Top = 19
        Width = 100
        Height = 17
        Caption = 'Fac. por Linea'
        State = cbGrayed
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 7
        TabStop = True
        Visible = False
        Alignment = taLeftJustify
      end
      object CBPriorizaFormaPago: TLFCheckBox
        Left = 1205
        Top = 3
        Width = 100
        Height = 17
        Caption = 'Prioriza F. Pago'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 8
        TabStop = True
        Visible = False
        Alignment = taLeftJustify
      end
      object CBFacturaPorImporte: TLFCheckBox
        Left = 1205
        Top = 19
        Width = 100
        Height = 17
        Caption = 'Fac. por Importe'
        State = cbGrayed
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 9
        TabStop = True
        Visible = False
        Alignment = taLeftJustify
      end
    end
    object DBGFTickets: TDBGridFind2000
      Left = 2
      Top = 83
      Width = 1317
      Height = 383
      Align = alClient
      DataSource = DMFacturarTickets.DSQMTickets
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGFTicketsCellClick
      OnDrawColumnCell = DBGFTicketsDrawColumnCell
      OnDblClick = DBGFTicketsDblClick
      IniStorage = FSMain
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
      Transaction = DMFacturarTickets.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'AGENTE'
        'ALMACEN'
        'CAJA'
        'CLIENTE'
        'DESCRIPCION'
        'FECHA'
        'FORMA_PAGO'
        'LIQUIDO'
        'NOMBRE'
        'RIT'
        'SERIE'
        'SESION'
        'TARIFA'
        'TITULO'
        'TITULO_ESTADO'
        'TURNO'
        'USUARIO'
        'CANAL_A_FACTURAR'
        'PERIODO_FACTURACION')
      ColumnasCheckBoxes.Strings = (
        'ENTRADA_FAC')
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
          Expanded = False
          FieldName = 'ENTRADA_FAC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANAL_A_FACTURAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 50
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
          FieldName = 'TIPO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIT'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SESION'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CAJA'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TURNO'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'USUARIO'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MONEDA'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCRIPCION'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FORMAS_PAGO'
          ReadOnly = True
          Width = 82
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLIENTE'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTADO'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          ReadOnly = True
          Width = 80
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
          FieldName = 'TITULO_CAJA'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOMBRE'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_ESTADO'
          ReadOnly = True
          Width = 120
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MOTIVO_ANULADO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SFV_NUM_DOSIFICACION'
          ReadOnly = True
          Width = 62
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FACTURACION'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FACTURA'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PERIODO_FACTURACION'
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 468
    Width = 1321
  end
  inherited CEMain: TControlEdit
    DataSource = DMFacturarTickets.DSQMTickets
    Left = 608
    Top = 240
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 640
    Top = 240
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
    Left = 608
    Top = 272
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AFacturar: TAction
      Category = 'Procesos'
      Caption = 'Facturar Selecci'#243'n'
      Hint = 'Facturar los tickes seleccionados'
      ImageIndex = 61
      OnExecute = AFacturarExecute
    end
    object AValidarAnulados: TAction
      Category = 'Procesos'
      Caption = 'Validar tickets anulados'
      Hint = 'Validar los tickes anulados'
      ImageIndex = 118
      OnExecute = AValidarAnuladosExecute
    end
    object AMostrarTodos: TAction
      Category = 'Procesos'
      Caption = 'Refrescar'
      Hint = 'Refresca datos'
      ImageIndex = 26
      OnExecute = AMostrarTodosExecute
    end
    object AMarcarTodos: TAction
      Category = 'Procesos'
      Caption = 'Marcar Todos'
      Hint = 'Marcar Todos'
      ImageIndex = 146
      OnExecute = AMarcarTodosExecute
    end
    object ADesmarcar: TAction
      Category = 'Procesos'
      Caption = 'Desmarcar'
      Hint = 'Desmarcar todos'
      ImageIndex = 147
      OnExecute = ADesmarcarExecute
    end
    object AExportarSFV: TAction
      Category = 'Procesos'
      Caption = 'Exportar SFV'
      Hint = 'Exportar SFV'
      ImageIndex = 36
      OnExecute = AExportarSFVExecute
    end
    object AExportarExcel: TAction
      Category = 'Procesos'
      Caption = 'Exportar a excel'
      ImageIndex = 36
      OnExecute = AExportarExcelExecute
    end
    object AListadoTicket: TAction
      Category = 'Listados'
      Caption = 'Listado Tickets'
      Hint = 'Listado Tickets'
      ImageIndex = 14
      OnExecute = AListadoTicketExecute
    end
    object AListadoIngresosEgresos: TAction
      Category = 'Listados'
      Caption = 'Ingresos y egresos'
      ImageIndex = 14
      OnExecute = AListadoIngresosEgresosExecute
    end
    object AListadoTicketDetalle: TAction
      Category = 'Listados'
      Caption = 'Listado tickets detalles'
      Hint = 'Listado tickets detalles'
      ImageIndex = 14
      OnExecute = AListadoTicketDetalleExecute
    end
    object AConfListadoTicket: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Tickets'
      Hint = 'Listado Tickets'
      ImageIndex = 77
      OnExecute = AConfListadoTicketExecute
    end
    object AConfListadoTicketDetalle: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado tickets detalles'
      Hint = 'Listado tickets detalles'
      ImageIndex = 77
      OnExecute = AConfListadoTicketDetalleExecute
    end
    object AAnulaTicket: TAction
      Category = 'Procesos'
      Caption = 'Anula ticket'
      ImageIndex = 147
      OnExecute = AAnulaTicketExecute
    end
    object AConfIngresosEgresos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Ingresos egresos'
      ImageIndex = 77
      OnExecute = AConfIngresosEgresosExecute
    end
    object ALimpiaFiltro: TAction
      Category = 'Procesos'
      Caption = 'Limpia filtro'
      ImageIndex = 26
      OnExecute = ALimpiaFiltroExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBSerieDestino.Text')
    Left = 640
    Top = 272
  end
end
