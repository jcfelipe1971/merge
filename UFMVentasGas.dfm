inherited FMVentasGas: TFMVentasGas
  Left = 273
  Top = 83
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Mantenimiento Ventas Gas'
  ClientHeight = 622
  ClientWidth = 857
  OldCreateOrder = True
  PopupMenu = CEMonedasPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 857
    Height = 598
    inherited TBMain: TLFToolBar
      Width = 853
      ButtonWidth = 25
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMVentasGas.DSQMVentasGas
        Hints.Strings = ()
        EditaControl = DBEFechaInicio
        InsertaControl = DBEFechaInicio
        InsertaUltimo = True
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 248
      end
      inherited TbuttComp: TToolButton
        Left = 256
        Caption = 'Ver Asiento'
        ImageIndex = -1
        Visible = False
      end
      object TButtInforme: TToolButton
        Left = 281
        Top = 0
        Action = ALstVentasGas
        ParentShowHint = False
        ShowHint = True
      end
      object PNLSerie: TLFPanel
        Left = 306
        Top = 0
        Width = 270
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 20
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object EFSerie: TLFEditFind2000
          Left = 48
          Top = 0
          Width = 58
          Height = 21
          TabStop = False
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
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETitSerie: TLFDbedit
          Left = 107
          Top = 0
          Width = 161
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMVentasGas.DSxSeries
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
      end
    end
    inherited PCMain: TLFPageControl
      Width = 853
      Height = 474
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        object SBAsiento: TSpeedButton [0]
          Left = 652
          Top = 22
          Width = 67
          Height = 22
          Action = AVerAsiento
          OnDblClick = AVerAsientoExecute
        end
        inherited PEdit: TLFPanel
          Width = 845
          Height = 107
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 32
            Top = 20
            Tabla_a_buscar = 'PRO_VER_ESCANDALLO'
            CampoNum = 'COMPUESTO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LblGas: TLFLabel
            Left = 57
            Top = 5
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gas'
            FocusControl = DBERig
          end
          object LblFecha: TLFLabel
            Left = 18
            Top = 27
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inicio'
          end
          object LblTurno: TLFLabel
            Left = 32
            Top = 47
            Width = 44
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Turno'
          end
          object LFechaCierre: TLFLabel
            Left = 274
            Top = 25
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cierre'
          end
          object LNotas: TLFLabel
            Left = 48
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LEstado: TLFLabel
            Left = 374
            Top = 4
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LPrecio: TLFLabel
            Left = 617
            Top = 72
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LVenta: TLFLabel
            Left = 620
            Top = 49
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Venta'
            FocusControl = DBEIDVenta
          end
          object LCosto: TLFLabel
            Left = 620
            Top = 92
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Costo'
          end
          object DBERig: TLFDbedit
            Left = 80
            Top = 0
            Width = 63
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMVentasGas.DSQMVentasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBEFechaInicio: TLFDBDateEdit
            Left = 80
            Top = 22
            Width = 105
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMVentasGas.DSQMVentasGas
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 0
          end
          object DBETurno: TLFDBEditFind2000
            Left = 80
            Top = 44
            Width = 63
            Height = 21
            AutoSize = False
            DataField = 'TURNO'
            DataSource = DMVentasGas.DSQMVentasGas
            TabOrder = 4
            OnChange = DBETurnoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_TURNOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TURNO'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'TURNO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TURNO')
            Filtros = []
          end
          object DBCBEstado: TLFDBCheckBox
            Left = 540
            Top = 4
            Width = 108
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMVentasGas.DSQMVentasGas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFechaCierre: TLFDBDateEdit
            Left = 337
            Top = 22
            Width = 103
            Height = 21
            DataField = 'FECHA_CIERRE'
            DataSource = DMVentasGas.DSQMVentasGas
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBMNotas: TLFDBMemo
            Left = 80
            Top = 66
            Width = 432
            Height = 39
            DataField = 'NOTAS'
            DataSource = DMVentasGas.DSQMVentasGas
            TabOrder = 5
          end
          object DBDTInicio: TDBDateTimePicker
            Left = 186
            Top = 22
            Width = 75
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963
            Format = 'hh:mm'
            Time = 42963
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 1
            DataField = 'FECHA_INICIO'
            DataSource = DMVentasGas.DSQMVentasGas
          end
          object DBDTCierre: TDBDateTimePicker
            Left = 441
            Top = 22
            Width = 71
            Height = 21
            CalAlignment = dtaLeft
            Date = 42963
            Format = 'hh:mm'
            Time = 42963
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 3
            DataField = 'FECHA_CIERRE'
            DataSource = DMVentasGas.DSQMVentasGas
          end
          object LFDBEstado: TLFDbedit
            Left = 411
            Top = 0
            Width = 101
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescEstado'
            DataSource = DMVentasGas.DSQMVentasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            OnChange = LFDBEstadoChange
          end
          object DBEOrden: TLFDbedit
            Left = 450
            Top = 44
            Width = 62
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ORDEN'
            DataSource = DMVentasGas.DSQMVentasGas
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEPrecio: TLFDbedit
            Left = 652
            Top = 66
            Width = 66
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'PRECIO'
            DataSource = DMVentasGas.DSQMVentasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object ETituloTurno: TLFEdit
            Left = 144
            Top = 44
            Width = 305
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 11
          end
          object DBCHKContab: TLFDBCheckBox
            Left = 540
            Top = 25
            Width = 108
            Height = 17
            Caption = '&Contabilizado'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTABILIZADO'
            DataSource = DMVentasGas.DSQMVentasGas
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAsiento: TLFDbedit
            Left = 652
            Top = 22
            Width = 66
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'RIC'
            DataSource = DMVentasGas.DSQMVentasGas
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
          object DBEIDVenta: TLFDbedit
            Left = 652
            Top = 44
            Width = 66
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_VENTA'
            DataSource = DMVentasGas.DSQMVentasGas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBECosto: TLFDbedit
            Left = 652
            Top = 86
            Width = 66
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'COSTE'
            DataSource = DMVentasGas.DSQMVentasGas
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
        end
        object PNLDetalles: TLFPanel
          Left = 0
          Top = 107
          Width = 845
          Height = 339
          Align = alClient
          BevelOuter = bvNone
          Caption = 'PNLDetalles'
          TabOrder = 1
          object PNLDet: TLFPanel
            Left = 0
            Top = 145
            Width = 845
            Height = 194
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object PCDetEmpleados: TLFPageControl
              Left = 0
              Top = 0
              Width = 845
              Height = 194
              ActivePage = TSDispensador
              Align = alClient
              OwnerDraw = True
              TabIndex = 0
              TabOrder = 0
              TabActiveColor = clWhite
              TabInactiveColor = 14936298
              object TSDispensador: TTabSheet
                Caption = 'Dispensador'
                OnShow = TSDispensadorShow
                object DBGFDispensador: TDBGridFind2000
                  Left = 0
                  Top = 22
                  Width = 837
                  Height = 144
                  Align = alClient
                  DataSource = DMVentasGas.DSQMDispensador
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
                  AutoCambiarColumna = False
                  AutoPostEnCheckBox = False
                  AutoStartDrag = False
                  AutoStartDragInterval = 0
                  IndiceBitmapOrdenable = 0
                  IndiceBitmapAscendente = 1
                  IndiceBitmapChecked = 3
                  IndiceBitmapDescendente = 2
                  BaseDeDatos = DMMain.DataBase
                  Transaction = DMVentasGas.TLocal
                  BuscarNums = False
                  Campos.Strings = (
                    'COD_DISPENSADOR')
                  CamposAMostrar.Strings = (
                    'COD_DISPENSADOR'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '80'
                    '80'
                    '80'
                    '0'
                    '0'
                    '0'
                    '0'
                    '0'
                    '0'
                    '0')
                  CamposADevolver.Strings = (
                    '')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'COD_DISPENSADOR')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'SYS_GAS_DISPENSADOR')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'TITULO')
                  Posicion = tpCentrado
                  OnBusqueda = DBGFDispensadorBusqueda
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    'COD_DISPENSADOR'
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    '')
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_DISPENSADOR'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DescDispensador'
                      ReadOnly = True
                      Width = 186
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LECTURA_INICIAL'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LECTURA_FINAL'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'UNID_DESCARGADAS'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'UNID_DISPENSADAS'
                      ReadOnly = True
                      Width = 65
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA_EMPLEADO'
                      ReadOnly = True
                      Width = 65
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'ID_VENTA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'PRECIO'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_TOTAL'
                      ReadOnly = True
                      Width = 65
                      Visible = True
                    end>
                end
                object TBDispensador: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 837
                  Height = 22
                  AutoSize = True
                  EdgeBorders = []
                  EdgeOuter = esNone
                  Flat = True
                  HotImages = DMMain.ILMain_Ac
                  Images = DMMain.ILMain_Ac
                  TabOrder = 1
                  Separators = True
                  object NavDispensador: THYMNavigator
                    Left = 0
                    Top = 0
                    Width = 200
                    Height = 22
                    DataSource = DMVentasGas.DSQMDispensador
                    Flat = True
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ModoDeSeguridad = True
                    DelCaption = 'Informaci'#243'n'
                    DelMessage = ' '#191' Borra el registro ? '
                    EditaControl = DBGFDispensador
                    InsertaControl = DBGFDispensador
                    Exclusivo = True
                    OrdenAscendente = True
                    InsertaUltimo = True
                  end
                end
              end
              object TSFPago: TTabSheet
                Caption = 'Forma Pago'
                ImageIndex = 1
                OnShow = TSFPagoShow
                object DBGFFPago: TDBGridFind2000
                  Left = 0
                  Top = 22
                  Width = 837
                  Height = 144
                  Align = alClient
                  DataSource = DMVentasGas.DSQMFPago
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  IniStorage = FSMain
                  Insercion = False
                  ColumnaInicial = 1
                  UsaDicG2K = False
                  Changed = True
                  AutoCambiarColumna = False
                  AutoPostEnCheckBox = False
                  AutoStartDrag = False
                  AutoStartDragInterval = 0
                  IndiceBitmapOrdenable = 0
                  IndiceBitmapAscendente = 1
                  IndiceBitmapChecked = 3
                  IndiceBitmapDescendente = 2
                  BaseDeDatos = DMMain.DataBase
                  Transaction = DMVentasGas.TLocal
                  BuscarNums = False
                  Campos.Strings = (
                    'FORMA_PAGO')
                  CamposAMostrar.Strings = (
                    'FORMA_PAGO'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '80'
                    '80'
                    '0'
                    '0')
                  CamposADevolver.Strings = (
                    '')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'FORMA')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'SYS_FORMAS_PAGO')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'TITULO')
                  Posicion = tpCentrado
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    'FORMA'
                    ''
                    ''
                    '')
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FORMA_PAGO'
                      Width = 98
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DescFPago'
                      ReadOnly = True
                      Width = 181
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'IMPORTE'
                      Width = 86
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'ID_VENTA'
                      ReadOnly = True
                      Visible = True
                    end>
                end
                object TBFPago: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 837
                  Height = 22
                  AutoSize = True
                  EdgeBorders = []
                  Flat = True
                  HotImages = DMMain.ILMain_Ac
                  Images = DMMain.ILMain_Ac
                  TabOrder = 1
                  Separators = True
                  object NavFPago: THYMNavigator
                    Left = 0
                    Top = 0
                    Width = 200
                    Height = 22
                    DataSource = DMVentasGas.DSQMFPago
                    Flat = True
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ModoDeSeguridad = True
                    DelCaption = 'Informaci'#243'n'
                    DelMessage = ' '#191' Borra el registro ? '
                    EditaControl = DBGFFPago
                    InsertaControl = DBGFFPago
                    Exclusivo = True
                    OrdenAscendente = True
                    InsertaUltimo = True
                  end
                end
              end
              object TSMonedas: TTabSheet
                Caption = 'Monedas'
                ImageIndex = 2
                OnShow = TSMonedasShow
                object DBGFMonedas: TDBGridFind2000
                  Left = 0
                  Top = 22
                  Width = 837
                  Height = 144
                  Align = alClient
                  DataSource = DMVentasGas.DSQMMonedas
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
                  AutoCambiarColumna = False
                  AutoPostEnCheckBox = False
                  AutoStartDrag = False
                  AutoStartDragInterval = 0
                  IndiceBitmapOrdenable = 0
                  IndiceBitmapAscendente = 1
                  IndiceBitmapChecked = 3
                  IndiceBitmapDescendente = 2
                  BaseDeDatos = DMMain.DataBase
                  Transaction = DMVentasGas.TLocal
                  BuscarNums = False
                  Campos.Strings = (
                    'COD_MONEDA')
                  CamposAMostrar.Strings = (
                    'COD_MONEDA'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '80'
                    '80'
                    '80'
                    '0'
                    '0'
                    '0'
                    '0'
                    '0'
                    '0'
                    '0')
                  CamposADevolver.Strings = (
                    '')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'COD_MONEDA')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'SYS_TIPO_MONEDAS')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'DESCRIPCION')
                  Posicion = tpCentrado
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    'COD_MONEDA'
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    ''
                    '')
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_MONEDA'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DescMoneda'
                      ReadOnly = True
                      Width = 241
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CANTIDAD'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'TOTAL'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA_EMPLEADO'
                      ReadOnly = True
                      Width = 113
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'ID_VENTA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'VALOR'
                      ReadOnly = True
                      Visible = True
                    end>
                end
                object TBMonedas: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 837
                  Height = 22
                  AutoSize = True
                  EdgeBorders = []
                  Flat = True
                  HotImages = DMMain.ILMain_Ac
                  Images = DMMain.ILMain_Ac
                  TabOrder = 1
                  Separators = True
                  object NavMonedas: THYMNavigator
                    Left = 0
                    Top = 0
                    Width = 200
                    Height = 22
                    DataSource = DMVentasGas.DSQMMonedas
                    Flat = True
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ModoDeSeguridad = True
                    DelCaption = 'Informaci'#243'n'
                    DelMessage = ' '#191' Borra el registro ? '
                    EditaControl = DBGFMonedas
                    InsertaControl = DBGFMonedas
                    Exclusivo = True
                    OrdenAscendente = True
                    InsertaUltimo = True
                  end
                end
              end
            end
          end
          object PNLDetGas: TLFPanel
            Left = 0
            Top = 0
            Width = 845
            Height = 145
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object PCDetGas: TLFPageControl
              Left = 0
              Top = 0
              Width = 845
              Height = 145
              ActivePage = TSTanque
              Align = alTop
              OwnerDraw = True
              TabIndex = 0
              TabOrder = 0
              OnChange = PCDetGasChange
              TabActiveColor = clWhite
              TabInactiveColor = 14936298
              object TSTanque: TTabSheet
                Caption = 'Tanque'
                OnShow = TSTanqueShow
                object TBTanque: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 837
                  Height = 21
                  AutoSize = True
                  ButtonHeight = 21
                  EdgeBorders = []
                  Flat = True
                  TabOrder = 0
                  Separators = True
                  object NavTanque: THYMNavigator
                    Left = 0
                    Top = 0
                    Width = 200
                    Height = 21
                    DataSource = DMVentasGas.DSQMTanque
                    Flat = True
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ModoDeSeguridad = True
                    DelCaption = 'Informaci'#243'n'
                    DelMessage = ' '#191' Borra el registro ? '
                    EditaControl = DBGFTanque
                    InsertaControl = DBGFTanque
                    Exclusivo = True
                    OrdenAscendente = True
                    InsertaUltimo = True
                  end
                end
                object DBGFTanque: TDBGridFind2000
                  Left = 0
                  Top = 21
                  Width = 837
                  Height = 96
                  Align = alClient
                  DataSource = DMVentasGas.DSQMTanque
                  TabOrder = 1
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnCellClick = DBGFTanqueCellClick
                  OnDblClick = DBGFTanqueDblClick
                  IniStorage = FSMain
                  Insercion = False
                  ColumnaInicial = 1
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
                  Campos.Strings = (
                    'COD_TANQUE')
                  CamposAMostrar.Strings = (
                    'COD_TANQUE'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '80')
                  CamposADevolver.Strings = (
                    '')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'COD_TANQUE')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'SYS_GAS_TANQUE')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'TITULO')
                  Posicion = tpCentrado
                  OnBusqueda = DBGFTanqueBusqueda
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    'COD_TANQUE')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'COD_TANQUE'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DescTanque'
                      ReadOnly = True
                      Width = 167
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CAPACIDAD'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'POR_INICIAL'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'POR_FINAL'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'UNID_DESCARGA_TANQ'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CAP_INICIAL'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'CAP_FINAL'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'UNID_SALIDA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'PRECIO'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_TOTAL'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'RIG_MOV'
                      ReadOnly = True
                      Visible = True
                    end>
                end
              end
              object TSEmpleado: TTabSheet
                Caption = 'Empleado'
                ImageIndex = 2
                OnShow = TSEmpleadoShow
                object DBGFEmpleado: TDBGridFind2000
                  Left = 0
                  Top = 21
                  Width = 837
                  Height = 96
                  Align = alClient
                  DataSource = DMVentasGas.DSQMEmpleado
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
                  Campos.Strings = (
                    'EMPLEADO')
                  CamposAMostrar.Strings = (
                    'EMPLEADO'
                    '0')
                  CamposAMostrarAnchos.Strings = (
                    '80')
                  CamposADevolver.Strings = (
                    '')
                  CamposDesplegar.Strings = (
                    '1')
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  MensajeNoExiste = False
                  Numericos.Strings = (
                    'EMPLEADO')
                  SalirSiVacio = False
                  SalirSiNoExiste = False
                  Tablas.Strings = (
                    'VER_EMPLEADOS_EF')
                  Acciones.Strings = (
                    '')
                  Titulos.Strings = (
                    'TITULO')
                  Posicion = tpCentrado
                  Planes.Strings = (
                    '')
                  OrdenMultiple = True
                  OrdenadosPor.Strings = (
                    'EMPLEADO')
                  Filtros = []
                  Columns = <
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'LINEA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'EMPLEADO'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'DescEmpleado'
                      ReadOnly = True
                      Width = 244
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'ID_VENTA'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_DISPENSADOR'
                      ReadOnly = True
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_PAGADO'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'IMPORTE_DIFERENCIA'
                      Visible = True
                    end
                    item
                      Color = clInfoBk
                      Expanded = False
                      FieldName = 'UNIDADES_DISPENSADAS'
                      Visible = True
                    end>
                end
                object TBEmpleado: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 837
                  Height = 21
                  AutoSize = True
                  ButtonHeight = 21
                  EdgeBorders = []
                  Flat = True
                  TabOrder = 1
                  Separators = True
                  object NavEmpleado: THYMNavigator
                    Left = 0
                    Top = 0
                    Width = 200
                    Height = 21
                    DataSource = DMVentasGas.DSQMEmpleado
                    Flat = True
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    ModoDeSeguridad = True
                    DelCaption = 'Informaci'#243'n'
                    DelMessage = ' '#191' Borra el registro ? '
                    EditaControl = DBGFEmpleado
                    InsertaControl = DBGFEmpleado
                    Exclusivo = True
                    OrdenAscendente = True
                    InsertaUltimo = True
                  end
                end
              end
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 845
          Height = 446
          DataSource = DMVentasGas.DSQMVentasGas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'COMPUESTO'
            'ESCANDALLO'
            'FECHA_CREAC'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TURNO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_VENTA_O'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_VENTA_D'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Visible = True
            end>
        end
      end
    end
    object PNLTotales: TLFPanel
      Left = 2
      Top = 502
      Width = 853
      Height = 94
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object PCTotales: TLFPageControl
        Left = 0
        Top = 0
        Width = 853
        Height = 94
        ActivePage = TSTotales
        Align = alClient
        MultiLine = True
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 0
        TabPosition = tpBottom
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSTotales: TTabSheet
          Caption = '&Totales'
          object PNLTot: TLFPanel
            Left = 0
            Top = 0
            Width = 845
            Height = 68
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LDiferenciaCobroDispensador: TLFLabel
              Left = 747
              Top = 2
              Width = 75
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Dif. Cob. Tanq.'
            end
            object LTotalTanque: TLFLabel
              Left = 34
              Top = 17
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tanques'
            end
            object LInicio: TLFLabel
              Left = 80
              Top = 2
              Width = 88
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Inicio'
            end
            object LFinal: TLFLabel
              Left = 261
              Top = 2
              Width = 87
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Final'
            end
            object LTotalDispensador: TLFLabel
              Left = 6
              Top = 38
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dispensadores'
            end
            object LDiferencia: TLFLabel
              Left = 349
              Top = 2
              Width = 89
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Diferencia'
            end
            object LTotalCobrado: TLFLabel
              Left = 671
              Top = 2
              Width = 75
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Total Cobrado'
            end
            object LImporte: TLFLabel
              Left = 517
              Top = 2
              Width = 72
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Importe'
            end
            object LFLImpTanqDisp: TLFLabel
              Left = 591
              Top = 22
              Width = 75
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Dif. Tanq-Disp'
            end
            object LFLTanqDisp: TLFLabel
              Left = 439
              Top = 23
              Width = 75
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Dif.Tanq-Disp'
            end
            object LDescarga: TLFLabel
              Left = 172
              Top = 2
              Width = 88
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Descarga'
            end
            object LFDDifCob: TLFDbedit
              Left = 747
              Top = 15
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_COB_TANQUE'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 0
            end
            object LFDInicioTanques: TLFDbedit
              Left = 80
              Top = 15
              Width = 88
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_INI_TANQUE'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 1
            end
            object LFDFinalTanques: TLFDbedit
              Left = 261
              Top = 15
              Width = 87
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_FIN_TANQUE'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 2
            end
            object LFDInicioDisp: TLFDbedit
              Left = 80
              Top = 37
              Width = 88
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_INI_DISP'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 3
            end
            object LFDFinalDisp: TLFDbedit
              Left = 261
              Top = 37
              Width = 87
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_FIN_DISP'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 4
            end
            object LFDDifTanques: TLFDbedit
              Left = 349
              Top = 15
              Width = 89
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_DIF_TANQUE'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 5
            end
            object LFDDifDisp: TLFDbedit
              Left = 349
              Top = 37
              Width = 89
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_DIF_DISP'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 6
            end
            object LFDCobrado: TLFDbedit
              Left = 671
              Top = 15
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL_COBRADO'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 7
            end
            object DBEImporteDifTanque: TLFDbedit
              Left = 515
              Top = 15
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'IMPORTE_DIF_TANQUE'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 8
            end
            object LFDImporteDisp: TLFDbedit
              Left = 515
              Top = 37
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'IMPORTE_DIF_DISP'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 9
            end
            object LFDDifImpTanqDisp: TLFDbedit
              Left = 591
              Top = 37
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_IMPORTE_TANQ_DISP'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 10
            end
            object LFDifTanqDisp: TLFDbedit
              Left = 439
              Top = 37
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'DIF_TANQUES_DISPENSADORES'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 11
            end
            object LFDSobrante: TLFDbedit
              Left = 671
              Top = 37
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL_SOBRANTE'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 12
            end
            object LFDFaltante: TLFDbedit
              Left = 747
              Top = 37
              Width = 75
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL_FALTANTE'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 13
            end
            object LFDdescargtanque: TLFDbedit
              Left = 172
              Top = 15
              Width = 88
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_DESCARGA_TANQ'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 14
            end
            object LFDdescargdisp: TLFDbedit
              Left = 172
              Top = 37
              Width = 88
              Height = 21
              Color = clInfoBk
              DataField = 'TOT_DESCARGA_DISP'
              DataSource = DMVentasGas.DSxInfoActualizada
              ReadOnly = True
              TabOrder = 15
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 598
    Width = 857
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 632
    Top = 416
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 636
    Top = 384
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 664
    Top = 384
    object ACerrarVenta: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Venta'
      Hint = 'Cerrar Venta'
      ImageIndex = 68
      OnExecute = ACerrarVentaExecute
    end
    object ALstVentasGas: TAction
      Category = 'Listados'
      Caption = 'Listado Ventas Gas'
      Hint = 'Listado de Ventas de Gas'
      ImageIndex = 14
      OnExecute = ALstVentasGasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAbrirVenta: TAction
      Category = 'Procesos'
      Caption = 'Abrir Venta'
      Hint = 'Abrir Venta'
      ImageIndex = 67
      OnExecute = AAbrirVentaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AConfVentasGas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados Ventas Gas'
      Hint = 'Listados Ventas Gas'
      ImageIndex = 77
      OnExecute = AConfVentasGasExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AVerAsiento: TAction
      Category = 'Procesos'
      Caption = 'Ver Asiento'
      Hint = 'Ver Asiento'
      ImageIndex = 30
      OnExecute = AVerAsientoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGMain.Columns'
      'DBGFTanque.Columns'
      'DBGFDispensador.Columns'
      'DBGFFPago.Columns')
    Left = 702
    Top = 383
  end
  object CETanque: TControlEdit
    FichaEdicion = TSTanque
    FichaExclusiva = TSTanque
    PopUpMenu = CETanquePMEdit
    Teclas = DMMain.Teclas
    Left = 552
    Top = 157
  end
  object CETanquePMEdit: TPopUpTeclas
    Left = 552
    Top = 128
    object CEMainMifirst1: TMenuItem
      Caption = 'Primero'
      Enabled = False
    end
    object CEMainMiprior1: TMenuItem
      Caption = 'Anterior'
      Enabled = False
    end
    object CEMainMinext1: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
    end
    object CEMainMilast1: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
    end
    object CEMainMiinsert1: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
    end
    object CEMainMidelete1: TMenuItem
      Caption = 'Borrar'
      Enabled = False
    end
    object CEMainMiedit1: TMenuItem
      Caption = 'Modificar'
      Enabled = False
    end
    object CEMainMipost1: TMenuItem
      Caption = 'Grabar'
      Enabled = False
    end
    object CEMainMicancel1: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
    end
    object CEMainMirefresh1: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
    end
    object CEMainMiSep1: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar1: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
      Visible = False
    end
    object CEMainMiaprox1: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta1: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime1: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango1: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEMainMireport1: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy1: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut1: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste1: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir1: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object CEEmpleadoPMEdit: TPopUpTeclas
    Left = 764
    Top = 124
  end
  object CEEmpleado: TControlEdit
    FichaEdicion = TSEmpleado
    FichaExclusiva = TSEmpleado
    PopUpMenu = CEEmpleadoPMEdit
    Teclas = DMMain.Teclas
    Left = 764
    Top = 153
  end
  object CEDispensadorPMEdit: TPopUpTeclas
    Left = 804
    Top = 128
  end
  object CEDispensador: TControlEdit
    FichaEdicion = TSDispensador
    FichaExclusiva = TSDispensador
    PopUpMenu = CEDispensadorPMEdit
    Teclas = DMMain.Teclas
    Left = 804
    Top = 157
  end
  object CEFPagoPMEdit: TPopUpTeclas
    Left = 764
    Top = 64
  end
  object CEFPago: TControlEdit
    FichaEdicion = TSFPago
    FichaExclusiva = TSFPago
    PopUpMenu = CEFPagoPMEdit
    Teclas = DMMain.Teclas
    Left = 764
    Top = 93
  end
  object CEMonedasPMEdit: TPopUpTeclas
    Left = 804
    Top = 64
  end
  object CEMonedas: TControlEdit
    FichaEdicion = TSMonedas
    FichaExclusiva = TSMonedas
    PopUpMenu = CEMonedasPMEdit
    Teclas = DMMain.Teclas
    Left = 804
    Top = 93
  end
end
