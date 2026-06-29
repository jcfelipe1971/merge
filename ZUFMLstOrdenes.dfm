object ZFMLstOrdenes: TZFMLstOrdenes
  Left = 431
  Top = 293
  AutoSize = True
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Listados de '#243'rdenes de producci'#243'n'
  ClientHeight = 484
  ClientWidth = 514
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
  object gbOrder: TGroupBox
    Left = 0
    Top = 188
    Width = 514
    Height = 74
    Align = alTop
    Caption = 'Orden'
    TabOrder = 0
    Visible = False
    object LHastaOrden: TLFLabel
      Left = 17
      Top = 42
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LDesdeOrden: TLFLabel
      Left = 14
      Top = 21
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object dbeUntilOrder: TLFDbedit
      Left = 141
      Top = 39
      Width = 363
      Height = 21
      Color = clInfoBk
      DataField = 'S_REFERENCIA'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbeFromOrder: TLFDbedit
      Left = 141
      Top = 17
      Width = 363
      Height = 21
      Color = clInfoBk
      DataField = 'S_REFERENCIA'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object efFromOrder: TLFEditFind2000
      Left = 50
      Top = 17
      Width = 90
      Height = 21
      AutoSelect = False
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = efFromReceptionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'RIG'
      CampoStr = 'S_REFERENCIA'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_GES_ORDPROD_C'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = efFromOrderBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object efUntilOrder: TLFEditFind2000
      Left = 50
      Top = 39
      Width = 90
      Height = 21
      AutoSelect = False
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = efFromReceptionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'RIG'
      CampoStr = 'S_REFERENCIA'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_GES_ORDPROD_C'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = efFromOrderBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  object gbLabel: TGroupBox
    Left = 0
    Top = 336
    Width = 514
    Height = 74
    Align = alTop
    Caption = 'Etiqueta'
    TabOrder = 2
    Visible = False
    object LDesdeEtiqueta: TLFLabel
      Left = 14
      Top = 21
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object LHastaEtiqueta: TLFLabel
      Left = 17
      Top = 43
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object dbeFromLabel: TLFDbedit
      Left = 141
      Top = 17
      Width = 363
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbeUntilLabel: TLFDbedit
      Left = 141
      Top = 39
      Width = 363
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object efFromLabel: TLFEditFind2000
      Tag = 2
      Left = 50
      Top = 17
      Width = 90
      Height = 21
      AutoSelect = False
      TabOrder = 0
      OnChange = efFromReceptionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = efFromOrderBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object efUntilLabel: TLFEditFind2000
      Tag = 2
      Left = 50
      Top = 39
      Width = 90
      Height = 21
      AutoSelect = False
      TabOrder = 1
      OnChange = efFromReceptionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = efFromOrderBusqueda
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  object gbClient: TGroupBox
    Left = 0
    Top = 262
    Width = 514
    Height = 74
    Align = alTop
    Caption = 'Cliente'
    TabOrder = 1
    Visible = False
    object LHastaCliente: TLFLabel
      Left = 17
      Top = 43
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LDesdeCliente: TLFLabel
      Left = 14
      Top = 21
      Width = 31
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde'
    end
    object dbeUntilClient: TLFDbedit
      Left = 141
      Top = 39
      Width = 363
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE_COMERCIAL'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
    end
    object dbeFromClient: TLFDbedit
      Left = 141
      Top = 17
      Width = 363
      Height = 21
      Color = clInfoBk
      DataField = 'NOMBRE_COMERCIAL'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object efFromClient: TLFEditFind2000
      Tag = 1
      Left = 50
      Top = 17
      Width = 90
      Height = 21
      AutoSelect = False
      CharCase = ecUpperCase
      TabOrder = 0
      OnChange = efFromReceptionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'NOMBRE_COMERCIAL'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = efFromOrderBusqueda
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object efUntilClient: TLFEditFind2000
      Tag = 1
      Left = 50
      Top = 39
      Width = 90
      Height = 21
      AutoSelect = False
      CharCase = ecUpperCase
      TabOrder = 1
      OnChange = efFromReceptionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = True
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CLIENTE'
      CampoStr = 'NOMBRE_COMERCIAL'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = efFromOrderBusqueda
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 514
    Height = 40
    AutoSize = True
    ButtonHeight = 36
    ButtonWidth = 72
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    ShowCaptions = True
    TabOrder = 3
    Separators = True
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'Min Max'
      ImageIndex = 39
      Visible = False
    end
    object tbPrint: TToolButton
      Tag = 1
      Left = 72
      Top = 0
      Hint = 'Imprimir el informe'
      Caption = '&Imprimir'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      OnClick = tbViewClick
    end
    object tbView: TToolButton
      Left = 144
      Top = 0
      Hint = 'Previsualizar el informe'
      Caption = '&Previsualizar'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = tbViewClick
    end
    object tbDesign: TToolButton
      Tag = 2
      Left = 216
      Top = 0
      Caption = '&Dise'#241'ar'
      ImageIndex = 2
      OnClick = tbViewClick
    end
    object tbExit: TToolButton
      Left = 288
      Top = 0
      Hint = 'Cerrar esta ventana'
      Caption = '&Cerrar'
      ImageIndex = 0
      ParentShowHint = False
      ShowHint = True
      OnClick = tbExitClick
    end
  end
  object PNLFechas: TLFPanel
    Left = 0
    Top = 410
    Width = 514
    Height = 74
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    object gbReception: TGroupBox
      Tag = 3
      Left = 0
      Top = 0
      Width = 257
      Height = 74
      Align = alLeft
      Caption = 'Fecha de recepci'#243'n'
      TabOrder = 0
      Visible = False
      object LHastaFechaRecepcion: TLFLabel
        Left = 47
        Top = 43
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeFechaRecepcion: TLFLabel
        Left = 46
        Top = 22
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object dtpFromReception: TLFDateEdit
        Left = 80
        Top = 17
        Width = 129
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
        OnChange = dtpdUntilDeliveryChange
      end
      object dtpUntilReception: TLFDateEdit
        Left = 80
        Top = 39
        Width = 129
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnChange = dtpdUntilDeliveryChange
      end
    end
    object gbDelivery: TGroupBox
      Tag = 3
      Left = 258
      Top = 0
      Width = 257
      Height = 74
      Caption = 'Fecha de entrega'
      TabOrder = 1
      Visible = False
      object LHastaFechaEntrega: TLFLabel
        Left = 47
        Top = 44
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesdeFechaEntrega: TLFLabel
        Left = 44
        Top = 22
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object dtpFromDelivery: TLFDateEdit
        Left = 80
        Top = 17
        Width = 129
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
        OnChange = dtpdUntilDeliveryChange
      end
      object dtpUntilDelivery: TLFDateEdit
        Left = 80
        Top = 39
        Width = 129
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnChange = dtpdUntilDeliveryChange
      end
    end
  end
  object gbState: TGroupBox
    Left = 0
    Top = 114
    Width = 514
    Height = 74
    Align = alTop
    Caption = 'Estado'
    TabOrder = 5
    Visible = False
    object xchbPL: TLFCheckBox
      Left = 6
      Top = 16
      Width = 77
      Height = 17
      Caption = '&Planning'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 0
      TabStop = True
      Alignment = taLeftJustify
    end
    object xchbEX: TLFCheckBox
      Tag = 1
      Left = 217
      Top = 16
      Width = 77
      Height = 17
      Caption = '&Expedida'
      ClicksDisabled = False
      TabOrder = 1
      TabStop = True
      Alignment = taLeftJustify
    end
    object xchbCC: TLFCheckBox
      Tag = 2
      Left = 6
      Top = 45
      Width = 111
      Height = 17
      Caption = '&Control de calidad'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 2
      TabStop = True
      Alignment = taLeftJustify
    end
    object xchbIM: TLFCheckBox
      Tag = 3
      Left = 428
      Top = 16
      Width = 77
      Height = 17
      Caption = '&Impresi'#243'n'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
    object xchbDI: TLFCheckBox
      Tag = 4
      Left = 428
      Top = 45
      Width = 61
      Height = 17
      Caption = '&Dise'#241'o'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
    end
    object xchbPR: TLFCheckBox
      Tag = 4
      Left = 217
      Top = 45
      Width = 88
      Height = 17
      Caption = 'P&reimpresi'#243'n'
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 5
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  object PNLTipoYFiltro: TLFPanel
    Left = 0
    Top = 40
    Width = 514
    Height = 74
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 6
    object gbFilters: TGroupBox
      Left = 176
      Top = 0
      Width = 338
      Height = 74
      Align = alRight
      Caption = 'Filtrar por'
      TabOrder = 0
      object chbOrder: TLFCheckBox
        Left = 8
        Top = 45
        Width = 77
        Height = 17
        Caption = '&Orden'
        ClicksDisabled = False
        TabOrder = 0
        TabStop = True
        OnClick = chbOrderClick
        Alignment = taLeftJustify
      end
      object chbClient: TLFCheckBox
        Tag = 1
        Left = 8
        Top = 16
        Width = 77
        Height = 17
        Caption = '&Cliente'
        ClicksDisabled = False
        TabOrder = 1
        TabStop = True
        OnClick = chbOrderClick
        Alignment = taLeftJustify
      end
      object chbLabel: TLFCheckBox
        Tag = 2
        Left = 121
        Top = 16
        Width = 89
        Height = 17
        Caption = '&Etiqueta'
        ClicksDisabled = False
        TabOrder = 2
        TabStop = True
        OnClick = chbOrderClick
        Alignment = taLeftJustify
      end
      object chbDelivery: TLFCheckBox
        Tag = 4
        Left = 234
        Top = 45
        Width = 61
        Height = 17
        Caption = 'Entrega'
        ClicksDisabled = False
        TabOrder = 3
        TabStop = True
        OnClick = chbOrderClick
        Alignment = taLeftJustify
      end
      object chbReception: TLFCheckBox
        Tag = 3
        Left = 230
        Top = 12
        Width = 77
        Height = 17
        Caption = '&Recepci'#243'n'
        ClicksDisabled = False
        TabOrder = 4
        TabStop = True
        OnClick = chbOrderClick
        Alignment = taLeftJustify
      end
      object chbState: TLFCheckBox
        Tag = 5
        Left = 121
        Top = 45
        Width = 61
        Height = 17
        Caption = 'Estado'
        ClicksDisabled = False
        TabOrder = 5
        TabStop = True
        OnClick = chbOrderClick
        Alignment = taLeftJustify
      end
    end
    object rgListType: TRadioGroup
      Left = 0
      Top = 0
      Width = 176
      Height = 74
      Align = alClient
      Caption = 'Tipo de listado'
      ItemIndex = 0
      Items.Strings = (
        'Listado est'#225'ndar detallado'
        'Listado especial tipo reporte')
      TabOrder = 1
    end
  end
  object FormStorage: TFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'rgListType.ItemIndex')
    StoredValues = <>
    Left = 404
    Top = 4
  end
end
