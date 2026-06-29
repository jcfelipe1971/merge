object ProFPregPlanif: TProFPregPlanif
  Left = 235
  Top = 174
  Width = 657
  Height = 437
  ActiveControl = LFCBArticulo
  Caption = 'Planificar'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object LFLabel1: TLFLabel
    Left = 28
    Top = 48
    Width = 60
    Height = 13
    Caption = 'Planificaci'#243'n'
  end
  object Label1: TLFLabel
    Left = 216
    Top = 48
    Width = 50
    Height = 13
    Caption = 'Calendario'
  end
  object GBOrden: TGroupBox
    Left = 4
    Top = 70
    Width = 641
    Height = 75
    Caption = 'Ordenes'
    TabOrder = 3
    object LFLabel2: TLFLabel
      Left = 133
      Top = 21
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object LFLabel3: TLFLabel
      Left = 136
      Top = 45
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object LFEFDOrden: TLFEditFind2000
      Left = 170
      Top = 18
      Width = 95
      Height = 21
      TabOrder = 1
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'RIG_OF'
      CampoStr = 'COMPUESTO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_ORD'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFEFHOrden: TLFEditFind2000
      Left = 170
      Top = 42
      Width = 95
      Height = 21
      TabOrder = 2
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'RIG_OF'
      CampoStr = 'COMPUESTO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_ORD'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFCBOrdenes: TLFCheckBox
      Left = 63
      Top = 32
      Width = 22
      Height = 17
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 0
      TabStop = True
      OnClick = LFCBOrdenesClick
      Alignment = taLeftJustify
    end
  end
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 649
    Height = 29
    EdgeBorders = []
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 2
    Separators = True
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Hint = 'Recargar'
      ImageIndex = 39
      ParentShowHint = False
      ShowHint = True
      OnClick = ToolButton4Click
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 2
      Hint = 'Generar Planificaci'#243'n'
      ImageIndex = 25
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 2
      Width = 8
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 54
      Top = 2
      Hint = 'Salir'
      ImageIndex = 0
      OnClick = ToolButton3Click
    end
  end
  object GBFecha: TGroupBox
    Left = 4
    Top = 313
    Width = 641
    Height = 83
    Caption = 'Fechas'
    TabOrder = 6
    object LFLabel8: TLFLabel
      Left = 164
      Top = 28
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object LFLabel9: TLFLabel
      Left = 346
      Top = 28
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object LFDEDFecha: TLFDateEdit
      Left = 200
      Top = 25
      Width = 94
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object LFDEHFecha: TLFDateEdit
      Left = 379
      Top = 25
      Width = 94
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 2
    end
    object LFCBFecha: TLFCheckBox
      Left = 63
      Top = 23
      Width = 52
      Height = 17
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 0
      TabStop = True
      OnClick = LFCBFechaClick
      Alignment = taLeftJustify
    end
  end
  object GBCliente: TGroupBox
    Left = 4
    Top = 232
    Width = 641
    Height = 81
    Caption = 'Clientes'
    TabOrder = 5
    object LFLabel7: TLFLabel
      Left = 135
      Top = 45
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object LFLabel6: TLFLabel
      Left = 133
      Top = 23
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object LFEFHCliente: TLFEditFind2000
      Left = 170
      Top = 42
      Width = 95
      Height = 21
      TabOrder = 2
      OnChange = LFEFHClienteChange
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
      Tabla_a_buscar = 'VER_CLIENTES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFDbedit3: TLFDbedit
      Left = 266
      Top = 42
      Width = 358
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMPregPlanif.DSxHCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object LFEFDCliente: TLFEditFind2000
      Left = 170
      Top = 20
      Width = 95
      Height = 21
      TabOrder = 1
      OnChange = LFEFDClienteChange
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
      Tabla_a_buscar = 'VER_CLIENTES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFDbedit2: TLFDbedit
      Left = 266
      Top = 20
      Width = 358
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMPregPlanif.DSxDCliente
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object LFCBCliente: TLFCheckBox
      Left = 63
      Top = 31
      Width = 55
      Height = 17
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 0
      TabStop = True
      OnClick = LFCBClienteClick
      Alignment = taLeftJustify
    end
  end
  object GBArticulo: TGroupBox
    Left = 4
    Top = 148
    Width = 641
    Height = 81
    Caption = 'Art'#237'culos'
    TabOrder = 4
    object LFLabel5: TLFLabel
      Left = 135
      Top = 44
      Width = 28
      Height = 13
      Caption = 'Hasta'
    end
    object LFLabel4: TLFLabel
      Left = 133
      Top = 21
      Width = 31
      Height = 13
      Caption = 'Desde'
    end
    object LFEFHArticulo: TLFEditFind2000
      Left = 170
      Top = 40
      Width = 95
      Height = 21
      TabOrder = 2
      OnChange = LFEFHArticuloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
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
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFDbedit1: TLFDbedit
      Left = 266
      Top = 40
      Width = 358
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMPregPlanif.DSxHArticulo
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object LFEFDArticulo: TLFEditFind2000
      Left = 170
      Top = 18
      Width = 95
      Height = 21
      TabOrder = 1
      OnChange = LFEFDArticuloChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
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
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFDbedit7: TLFDbedit
      Left = 266
      Top = 18
      Width = 358
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMPregPlanif.DSxDArticulo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object LFCBArticulo: TLFCheckBox
      Left = 63
      Top = 31
      Width = 58
      Height = 17
      Checked = True
      State = cbChecked
      ClicksDisabled = False
      TabOrder = 0
      TabStop = True
      OnClick = LFCBArticuloClick
      Alignment = taLeftJustify
    end
  end
  object LFEFCalendario: TLFEditFind2000
    Left = 275
    Top = 45
    Width = 65
    Height = 21
    TabOrder = 0
    Text = '1'
    OnChange = LFEFCalendarioChange
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'CALENDARIO'
    CampoStr = 'DESCRIPCION'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = False
    SalirSiNoExiste = False
    Tabla_a_buscar = 'OPE_CALENDARIO_C'
    Tabla_asociada.DesplegarBusqueda = False
    Filtros = [obEmpresa]
    Entorno = DMMain.EntornoBusqueda
  end
  object LFDbedit4: TLFDbedit
    Left = 341
    Top = 45
    Width = 280
    Height = 21
    Color = clInfoBk
    DataField = 'DESCRIPCION'
    DataSource = ProDMPregPlanif.DSxCalendario
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGrayText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object LFEPlanificacion: TLFEdit
    Left = 96
    Top = 45
    Width = 113
    Height = 21
    TabOrder = 7
  end
end
