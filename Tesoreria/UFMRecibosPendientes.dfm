inherited FMRecibosPendientes: TFMRecibosPendientes
  Left = 353
  Top = 274
  Width = 802
  Height = 495
  HelpContext = 268
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recibos Pendientes'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 442
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 788
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBMostrarNoPagados: TToolButton
        Left = 33
        Top = 0
        Action = AMostrarNoPagados
      end
      object TBMostrarPagados: TToolButton
        Left = 56
        Top = 0
        Action = AMostrarTodos
      end
    end
    object PCRecPendientes: TLFPageControl
      Left = 2
      Top = 28
      Width = 788
      Height = 412
      ActivePage = TSCobros
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      OnChange = PCRecPendientesChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCobros: TTabSheet
        Caption = 'Cobros'
        ImageIndex = 1
        OnShow = TSCobrosShow
        object PCCli: TLFPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 384
          ActivePage = TSClientes
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSClientes: TTabSheet
            Caption = '&Clientes'
            object TBCobros: TLFToolBar
              Left = 0
              Top = 0
              Width = 772
              Height = 22
              AutoSize = True
              EdgeBorders = []
              EdgeInner = esNone
              EdgeOuter = esNone
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Separators = True
              object PNLCtaCliente: TLFPanel
                Left = 0
                Top = 0
                Width = 377
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object LCuentaCobros: TLFLabel
                  Left = 9
                  Top = 4
                  Width = 41
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cuenta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFCliDesde: TLFEditFind2000
                  Left = 55
                  Top = 0
                  Width = 160
                  Height = 22
                  AutoSize = False
                  MaxLength = 15
                  TabOrder = 0
                  OnExit = EFCliDesdeExit
                  OnKeyDown = EFCliDesdeKeyDown
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = True
                  Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object EDTOldCntCliente: TLFEdit
                  Left = 216
                  Top = 0
                  Width = 160
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
                  TabOrder = 1
                end
              end
              object ToolButton3: TToolButton
                Left = 377
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object EdFiltroCli: TLFEdit
                Left = 385
                Top = 0
                Width = 150
                Height = 22
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
              object PNLEjercicio: TLFPanel
                Left = 535
                Top = 0
                Width = 132
                Height = 22
                BevelOuter = bvNone
                TabOrder = 2
                object LBLEjercicio: TLFLabel
                  Left = 12
                  Top = 4
                  Width = 50
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Ejercicio'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFEjercicioCli: TLFEditFind2000
                  Left = 66
                  Top = 0
                  Width = 66
                  Height = 21
                  TabOrder = 0
                  OnExit = EFEjercicioCliExit
                  OnKeyDown = EFEjercicioCliKeyDown
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'EJERCICIO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'EJERCICIO desc')
                  Filtros = [obEmpresa, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
              end
            end
            object PNLClientes: TLFPanel
              Left = 0
              Top = 22
              Width = 772
              Height = 336
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object PNLImpagados: TLFPanel
                Left = 0
                Top = 0
                Width = 772
                Height = 336
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                Visible = False
                object DBGImpagados: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 772
                  Height = 336
                  TabStop = False
                  Align = alClient
                  Color = clInfoBk
                  DataSource = DMRecibosPendientes.DSxRevImpagados
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDblClick = DBGFRecPendCliDblClick
                  Insercion = False
                  ColumnaInicial = 0
                  UsaDicG2K = True
                  Changed = False
                  Idioma = 'CAS'
                  AutoCambiarColumna = False
                  AutoPostEnCheckBox = False
                  AutoStartDrag = False
                  AutoStartDragInterval = 0
                  IndiceBitmapOrdenable = 0
                  IndiceBitmapAscendente = 1
                  IndiceBitmapChecked = 3
                  IndiceBitmapDescendente = 2
                  BaseDeDatos = DMMain.DataBase
                  Transaction = DMRecibosPendientes.TLocal
                  BuscarNums = False
                  CampoAOrdenarColor = clInfoBk
                  CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                  CamposAOrdernar.Strings = (
                    'DOC_FECHA'
                    'VENCIMIENTO'
                    'CUENTA'
                    'TITULO_CUENTA'
                    'MONEDA'
                    'DOC_NUMERO'
                    'DOC_SERIE'
                    'RECIBIDO'
                    'PAGADO')
                  ColumnasCheckBoxes.Strings = (
                    'RECIBIDO'
                    'PAGADO')
                  ColumnasChecked.Strings = (
                    '1'
                    '1')
                  ColumnasNoChecked.Strings = (
                    '0'
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
                      FieldName = 'EJERCICIO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'REGISTRO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DOC_SERIE'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FECHA_REGISTRO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'EJERCICIO_ORIGEN'
                      Width = 65
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CANAL_ORIGEN'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'RECIBO_ORIGEN'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'FECHA_ULT_IMPAGO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'NUM_IMPAGOS'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'GASTOS'
                      Visible = True
                    end>
                end
              end
              object PNLRecPendCli: TLFPanel
                Left = 0
                Top = 0
                Width = 772
                Height = 336
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object DBGFRecPendCli: TDBGridFind2000
                  Left = 0
                  Top = 0
                  Width = 772
                  Height = 313
                  TabStop = False
                  Align = alClient
                  Color = clInfoBk
                  DataSource = DMRecibosPendientes.DSxListarRemesa
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                  TitleFont.Charset = DEFAULT_CHARSET
                  TitleFont.Color = clWindowText
                  TitleFont.Height = -11
                  TitleFont.Name = 'MS Sans Serif'
                  TitleFont.Style = []
                  OnDrawColumnCell = DBGFRecPendCliDrawColumnCell
                  OnDblClick = DBGFRecPendCliDblClick
                  Insercion = False
                  ColumnaInicial = 0
                  UsaDicG2K = True
                  Changed = False
                  Idioma = 'CAS'
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
                    'DOC_FECHA'
                    'VENCIMIENTO'
                    'CUENTA'
                    'TITULO_CUENTA'
                    'MONEDA'
                    'DOC_NUMERO'
                    'DOC_SERIE'
                    'RECIBIDO'
                    'PAGADO')
                  ColumnasCheckBoxes.Strings = (
                    'RECIBIDO'
                    'PAGADO')
                  ColumnasChecked.Strings = (
                    '1'
                    '1')
                  ColumnasNoChecked.Strings = (
                    '0'
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
                      FieldName = 'DOC_FECHA'
                      Width = 62
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'VENCIMIENTO'
                      Width = 62
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'CUENTA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'TITULO_CUENTA'
                      Width = 200
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'LIQUIDO_MONEDA'
                      Title.Alignment = taRightJustify
                      Width = 82
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'MONEDA'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DOC_NUMERO'
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'DOC_SERIE'
                      Width = 30
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'RECIBIDO'
                      Width = 46
                      Visible = True
                    end
                    item
                      Expanded = False
                      FieldName = 'PAGADO'
                      Width = 41
                      Visible = True
                    end>
                end
                object PNLImpagadosTotales: TLFPanel
                  Left = 0
                  Top = 313
                  Width = 772
                  Height = 23
                  Align = alBottom
                  BevelOuter = bvNone
                  Enabled = False
                  TabOrder = 1
                  DesignSize = (
                    772
                    23)
                  object LTotalLiquidoClientes: TLFLabel
                    Left = 605
                    Top = 5
                    Width = 63
                    Height = 13
                    Alignment = taRightJustify
                    Anchors = [akTop, akRight]
                    Caption = 'Total L'#237'quido'
                  end
                  object DBETotalLiquidoClientes: TLFDbedit
                    Left = 672
                    Top = 1
                    Width = 100
                    Height = 21
                    Anchors = [akTop, akRight]
                    Color = clInfoBk
                    DataField = 'LIQUIDO'
                    DataSource = DMRecibosPendientes.DSxListarRemesaTotales
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGray
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ParentFont = False
                    ReadOnly = True
                    TabOrder = 0
                  end
                end
              end
            end
          end
        end
      end
      object TSPagos: TTabSheet
        Caption = 'Pagos'
        OnShow = TSPagosShow
        object PCPagos: TLFPageControl
          Left = 0
          Top = 0
          Width = 780
          Height = 384
          ActivePage = TSProveedores
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabPosition = tpBottom
          OnChange = PCPagosChange
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSProveedores: TTabSheet
            Caption = '&Proveedores'
            OnShow = TSProveedoresShow
            object TBProv: TLFToolBar
              Left = 0
              Top = 0
              Width = 772
              Height = 22
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Separators = True
              object PNLCtaProveedor: TLFPanel
                Left = 0
                Top = 0
                Width = 377
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object LCuentaPagos: TLFLabel
                  Left = 9
                  Top = 4
                  Width = 41
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cuenta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFProvDesde: TLFEditFind2000
                  Left = 55
                  Top = 0
                  Width = 160
                  Height = 22
                  AutoSize = False
                  MaxLength = 15
                  TabOrder = 0
                  OnExit = EFProvDesdeExit
                  OnKeyDown = EFProvDesdeKeyDown
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = True
                  Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object EDTOldCuentaProveedor: TLFEdit
                  Left = 216
                  Top = 0
                  Width = 160
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  ReadOnly = True
                  TabOrder = 1
                end
              end
              object ToolButton4: TToolButton
                Left = 377
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object EdFiltroProv: TLFEdit
                Left = 385
                Top = 0
                Width = 150
                Height = 22
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
              object PNLEjercicioPagos: TLFPanel
                Left = 535
                Top = 0
                Width = 132
                Height = 22
                BevelOuter = bvNone
                TabOrder = 2
                object LEjercicioPagosProv: TLFLabel
                  Left = 12
                  Top = 4
                  Width = 50
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Ejercicio'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFEjercicioPro: TLFEditFind2000
                  Left = 66
                  Top = 0
                  Width = 66
                  Height = 21
                  TabOrder = 0
                  OnExit = EFEjercicioProExit
                  OnKeyDown = EFEjercicioProKeyDown
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'EJERCICIO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'EJERCICIO desc')
                  Filtros = [obEmpresa, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
              end
            end
            object PNLProv: TLFPanel
              Left = 0
              Top = 22
              Width = 772
              Height = 336
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBGFRecPendProv: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 772
                Height = 313
                TabStop = False
                Align = alClient
                Color = clInfoBk
                DataSource = DMRecibosPendientes.DSxListarRemesa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGFRecPendProvDrawColumnCell
                OnDblClick = DBGFRecPendProvDblClick
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
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
                  'DOC_FECHA'
                  'VENCIMIENTO'
                  'CUENTA'
                  'TITULO_CUENTA'
                  'MONEDA'
                  'DOC_NUMERO'
                  'DOC_SERIE'
                  'RECIBIDO'
                  'PAGADO')
                ColumnasCheckBoxes.Strings = (
                  'RECIBIDO'
                  'PAGADO')
                ColumnasChecked.Strings = (
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DOC_FECHA'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VENCIMIENTO'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_CUENTA'
                    Width = 194
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LIQUIDO'
                    Title.Alignment = taRightJustify
                    Width = 82
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Width = 30
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RECIBIDO'
                    Width = 46
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGADO'
                    Width = 47
                    Visible = True
                  end>
              end
              object PNLRecPendProv: TLFPanel
                Left = 0
                Top = 313
                Width = 772
                Height = 23
                Align = alBottom
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 1
                DesignSize = (
                  772
                  23)
                object LTotalLiquidoProv: TLFLabel
                  Left = 605
                  Top = 5
                  Width = 63
                  Height = 13
                  Alignment = taRightJustify
                  Anchors = [akTop, akRight]
                  Caption = 'Total L'#237'quido'
                end
                object DBETotalLiquidoProv: TLFDbedit
                  Left = 672
                  Top = 1
                  Width = 100
                  Height = 21
                  Anchors = [akTop, akRight]
                  Color = clInfoBk
                  DataField = 'LIQUIDO'
                  DataSource = DMRecibosPendientes.DSxListarRemesaTotales
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
          end
          object TSAcreedores: TTabSheet
            Caption = '&Acreedores'
            ImageIndex = 1
            OnShow = TSAcreedoresShow
            object TBAcr: TLFToolBar
              Left = 0
              Top = 0
              Width = 772
              Height = 22
              AutoSize = True
              EdgeBorders = []
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Separators = True
              object PNLCtaAcreedor: TLFPanel
                Left = 0
                Top = 0
                Width = 377
                Height = 22
                BevelOuter = bvNone
                TabOrder = 1
                object LCuentaPagosAcr: TLFLabel
                  Left = 9
                  Top = 4
                  Width = 41
                  Height = 13
                  Alignment = taRightJustify
                  AutoSize = False
                  Caption = 'Cuenta'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFAcrDesde: TLFEditFind2000
                  Left = 55
                  Top = 0
                  Width = 160
                  Height = 22
                  AutoSize = False
                  MaxLength = 15
                  TabOrder = 0
                  OnExit = EFAcrDesdeExit
                  OnKeyDown = EFAcrDesdeKeyDown
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = True
                  Tabla_a_buscar = 'VER_ACREEDORES_CUENTAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object EDTOldCuentaAcreedor: TLFEdit
                  Left = 216
                  Top = 0
                  Width = 160
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
                  TabOrder = 1
                end
              end
              object ToolButton1: TToolButton
                Left = 377
                Top = 0
                Width = 8
                Style = tbsSeparator
              end
              object EdFiltroAcr: TLFEdit
                Left = 385
                Top = 0
                Width = 150
                Height = 22
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
              object PNLEjercicioPagosAcr: TLFPanel
                Left = 535
                Top = 0
                Width = 132
                Height = 22
                BevelOuter = bvNone
                TabOrder = 2
                object LEjercicioPagosAcr: TLFLabel
                  Left = 12
                  Top = 4
                  Width = 50
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Ejercicio'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFEjercicioAcr: TLFEditFind2000
                  Left = 66
                  Top = 0
                  Width = 66
                  Height = 21
                  TabOrder = 0
                  OnExit = EFEjercicioAcrExit
                  OnKeyDown = EFEjercicioAcrKeyDown
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'EJERCICIO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'EJERCICIO desc')
                  Filtros = [obEmpresa, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
              end
            end
            object PNLAcr: TLFPanel
              Left = 0
              Top = 22
              Width = 772
              Height = 336
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBGFRecPendAcr: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 772
                Height = 313
                TabStop = False
                Align = alClient
                Color = clInfoBk
                DataSource = DMRecibosPendientes.DSxListarRemesa
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGFRecPendAcrDrawColumnCell
                OnDblClick = DBGFRecPendAcrDblClick
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
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
                  'DOC_FECHA'
                  'VENCIMIENTO'
                  'CUENTA'
                  'TITULO_CUENTA'
                  'MONEDA'
                  'DOC_NUMERO'
                  'DOC_SERIE'
                  'RECIBIDO'
                  'PAGADO')
                ColumnasCheckBoxes.Strings = (
                  'RECIBIDO'
                  'PAGADO')
                ColumnasChecked.Strings = (
                  '1'
                  '1')
                ColumnasNoChecked.Strings = (
                  '0'
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DOC_FECHA'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VENCIMIENTO'
                    Width = 62
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_CUENTA'
                    Width = 194
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'LIQUIDO'
                    Title.Alignment = taRightJustify
                    Width = 82
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Width = 30
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RECIBIDO'
                    Width = 46
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGADO'
                    Width = 47
                    Visible = True
                  end>
              end
              object PNLRecPendAcr: TLFPanel
                Left = 0
                Top = 313
                Width = 772
                Height = 23
                Align = alBottom
                BevelOuter = bvNone
                Enabled = False
                TabOrder = 1
                DesignSize = (
                  772
                  23)
                object LTotalLiquido: TLFLabel
                  Left = 605
                  Top = 5
                  Width = 63
                  Height = 13
                  Alignment = taRightJustify
                  Anchors = [akTop, akRight]
                  Caption = 'Total L'#237'quido'
                end
                object DBETotalLiquidoAcr: TLFDbedit
                  Left = 672
                  Top = 1
                  Width = 100
                  Height = 21
                  Color = clInfoBk
                  DataField = 'LIQUIDO'
                  DataSource = DMRecibosPendientes.DSxListarRemesaTotales
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGray
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 792
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 288
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
    Left = 352
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 384
    Top = 0
  end
  object ALRecPendientes: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 416
    object AMostrarTodos: TAction
      Caption = 'AMostrarPagados'
      Hint = 'Mostrar todos los recibos'
      ImageIndex = 23
      OnExecute = AMostrarTodosExecute
    end
    object AMostrarNoPagados: TAction
      Caption = 'AMostrarNoPagados'
      Hint = 'Mostrar los recibos no pagados'
      ImageIndex = 22
      OnExecute = AMostrarNoPagadosExecute
    end
    object ASalir: TAction
      Caption = 'ASalir'
      Hint = 'Salir de la ventana'
      ImageIndex = 0
    end
    object AMostrarImpagados: TAction
      Caption = 'Mostrar Impagados'
      OnExecute = AMostrarImpagadosExecute
    end
  end
end
