object FMComprasProv: TFMComprasProv
  Left = 376
  Top = 109
  ActiveControl = CBEjercicio
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Compras de Art'#237'culos al Proveedor'
  ClientHeight = 447
  ClientWidth = 760
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 760
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Separators = True
    DesignSize = (
      760
      22)
    object PNLOpciones: TLFPanel
      Left = 0
      Top = 0
      Width = 341
      Height = 22
      Anchors = []
      BevelOuter = bvNone
      TabOrder = 0
      object CBEjercicio: TLFCheckBox
        Left = 0
        Top = 0
        Width = 115
        Height = 22
        Caption = 'Todos Ejercicios'
        ClicksDisabled = False
        Layout = checkboxRight
        TabOrder = 0
        TabStop = True
        OnClick = CBEjercicioClick
        Alignment = taLeftJustify
      end
      object CBCanal: TLFCheckBox
        Left = 120
        Top = 0
        Width = 115
        Height = 22
        Caption = 'Todos Canales'
        ClicksDisabled = False
        Layout = checkboxRight
        TabOrder = 1
        TabStop = True
        OnClick = CBCanalClick
        Alignment = taLeftJustify
      end
      object CBSerie: TLFCheckBox
        Left = 240
        Top = 0
        Width = 99
        Height = 22
        Caption = 'Todas Series'
        ClicksDisabled = False
        Layout = checkboxRight
        TabOrder = 2
        TabStop = True
        OnClick = CBSerieClick
        Alignment = taLeftJustify
      end
    end
    object TSepOpciones: TToolButton
      Left = 341
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PNLMoneda: TLFPanel
      Left = 349
      Top = 0
      Width = 287
      Height = 22
      BevelOuter = bvNone
      TabOrder = 2
      object LBLMoneda: TLFLabel
        Left = 13
        Top = 4
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
        Layout = tlCenter
      end
      object DBEFMoneda: TLFEditFind2000
        Left = 63
        Top = 1
        Width = 36
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'DBEFMoneda'
        OnChange = DBEFMonedaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'MONEDA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_MONEDAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'MONEDA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETitMoneda: TLFDbedit
        Left = 100
        Top = 1
        Width = 186
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMComprasProv.DSxMonedas
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
    object ToolButton4: TToolButton
      Left = 636
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtImprimir: TToolButton
      Left = 644
      Top = 0
      Hint = 'Impresi'#243'n de Datos'
      Caption = 'Impresion de Datos'
      ImageIndex = 14
      Visible = False
    end
    object TButtConfigurar: TToolButton
      Left = 667
      Top = 0
      Hint = 'Configuracion R'#225'pida del listado'
      Caption = 'Configurar'
      ImageIndex = 77
      Visible = False
    end
    object ToolButton1: TToolButton
      Left = 690
      Top = 0
      Width = 8
      Style = tbsSeparator
      Visible = False
    end
    object EPMain: THYMEditPanel
      Left = 698
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana ? '
      ShowHint = True
      TabOrder = 1
      Flat = True
      Exclusivo = True
    end
  end
  object DBGFArticulosCli: TDBGridFind2000
    Left = 0
    Top = 22
    Width = 760
    Height = 401
    Align = alClient
    Color = clInfoBk
    DataSource = DMComprasProv.DSxComprasProveedor
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Insercion = False
    ColumnaInicial = 0
    UsaDicG2K = True
    Changed = False
    AutoCambiarColumna = False
    AutoPostEnCheckBox = False
    AutoStartDrag = False
    AutoStartDragInterval = 0
    IndiceBitmapOrdenable = 0
    IndiceBitmapAscendente = 0
    IndiceBitmapChecked = -1
    IndiceBitmapDescendente = 0
    BaseDeDatos = DMMain.DataBase
    BuscarNums = False
    CampoAOrdenarColor = clInfoBk
    ColumnasCheckBoxes.Strings = (
      'RECIBIDO')
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
        FieldName = 'ARTICULO'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TITULO'
        Width = 399
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UNIDADES'
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'COSTE'
        Width = 110
        Visible = True
      end>
  end
  object PNLTotal: TLFPanel
    Left = 0
    Top = 423
    Width = 760
    Height = 24
    Align = alBottom
    AutoSize = True
    BevelOuter = bvNone
    TabOrder = 2
    DesignSize = (
      760
      24)
    object LBLTotal: TLFLabel
      Left = 585
      Top = 4
      Width = 34
      Height = 16
      Alignment = taRightJustify
      Anchors = [akTop, akRight]
      Caption = 'Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object RMETotal: THYGRightEdit
      Left = 623
      Top = 0
      Width = 121
      Height = 24
      Anchors = [akTop, akRight]
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
  end
end
