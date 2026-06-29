object FMIntroduceLotes: TFMIntroduceLotes
  Left = 309
  Top = 208
  ActiveControl = EFLote
  BorderIcons = [biMinimize, biMaximize]
  BorderStyle = bsSingle
  Caption = 'Introducci'#243'n de Lotes'
  ClientHeight = 261
  ClientWidth = 525
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 22
    Width = 525
    Height = 239
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLAlmacen: TLFLabel
      Left = 48
      Top = 142
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Almac'#233'n'
    end
    object LBLClasificacion: TLFLabel
      Left = 30
      Top = 73
      Width = 59
      Height = 13
      Alignment = taRightJustify
      Caption = 'Clasificaci'#243'n'
    end
    object LBLFFAbricacion: TLFLabel
      Left = 22
      Top = 51
      Width = 67
      Height = 13
      Alignment = taRightJustify
      Caption = 'F. Fabricaci'#243'n'
    end
    object LBLFENvasado: TLFLabel
      Left = 192
      Top = 50
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'F. Envasado'
    end
    object LBLFCaducidad: TLFLabel
      Left = 365
      Top = 50
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'F. Caducidad'
    end
    object LStock: TLFLabel
      Left = 426
      Top = 142
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Stock'
    end
    object LProveedor: TLFLabel
      Left = 40
      Top = 29
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
    end
    object LIDLote: TLFLabel
      Left = 60
      Top = 7
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Id lote'
    end
    object LFIdLote: TLFLabel
      Left = 401
      Top = 6
      Width = 21
      Height = 13
      Alignment = taRightJustify
      Caption = 'Lote'
    end
    object LNotas: TLFLabel
      Left = 61
      Top = 94
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Notas'
    end
    object LFMedida1: TLFLabel
      Left = 45
      Top = 165
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 1'
    end
    object LFMedida2: TLFLabel
      Left = 166
      Top = 164
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 2'
    end
    object LFMedida3: TLFLabel
      Left = 286
      Top = 164
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 3'
    end
    object LFMedida4: TLFLabel
      Left = 410
      Top = 164
      Width = 44
      Height = 13
      Alignment = taRightJustify
      Caption = 'Medida 4'
    end
    object EClasificacion: TLFEdit
      Left = 93
      Top = 69
      Width = 426
      Height = 21
      Color = clInfoBk
      MaxLength = 20
      TabOrder = 7
    end
    object DTPFFabricacion: TLFDateEdit
      Left = 93
      Top = 47
      Width = 87
      Height = 21
      CheckOnExit = True
      Color = clInfoBk
      NumGlyphs = 2
      TabOrder = 4
    end
    object DTPFEnvasado: TLFDateEdit
      Left = 256
      Top = 47
      Width = 87
      Height = 21
      CheckOnExit = True
      Color = clInfoBk
      NumGlyphs = 2
      TabOrder = 5
    end
    object DTPFCaducidad: TLFDateEdit
      Left = 432
      Top = 47
      Width = 87
      Height = 21
      CheckOnExit = True
      Color = clInfoBk
      NumGlyphs = 2
      TabOrder = 6
    end
    object EStock: TLFEdit
      Left = 458
      Top = 139
      Width = 61
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
      TabOrder = 9
    end
    object EFAlmacen: TLFEditFind2000
      Left = 93
      Top = 139
      Width = 87
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
      OnChange = EFAlmacenChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EDescAlmacen: TLFEdit
      Left = 181
      Top = 139
      Width = 167
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      ReadOnly = True
      TabOrder = 10
    end
    object EFAlmacenDST: TLFEditFind2000
      Left = 349
      Top = 139
      Width = 74
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
      TabOrder = 11
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ALMACEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ALMACENES'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFProveedor: TLFEditFind2000
      Left = 93
      Top = 25
      Width = 87
      Height = 21
      Color = clInfoBk
      TabOrder = 3
      OnChange = EFProveedorChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PROVEEDOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object EDescProveedor: TLFEdit
      Left = 181
      Top = 25
      Width = 338
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object ELote: TLFEdit
      Left = 426
      Top = 3
      Width = 93
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 20
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object ELoteNuevo: TLFEdit
      Left = 93
      Top = 3
      Width = 195
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 1
    end
    object EFLote: TLFEditFind2000
      Left = 93
      Top = 3
      Width = 87
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 2
      OnChange = EFLoteChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      Campos_Desplegar.Strings = (
        'F_FABRICACION'
        'STOCK'
        'ID_UBICACION')
      CampoNum = 'ID_LOTE'
      CampoStr = 'LOTE'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'ART_ARTICULOS_LOTES'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFLoteBusqueda
      OrdenadoPor.Strings = (
        'F_FABRICACION')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object BtAceptar1: TButton
      Left = 232
      Top = 191
      Width = 75
      Height = 25
      Caption = '&Asignar'
      TabOrder = 14
      OnClick = BtAceptar1Click
    end
    object MNotas: TLFMemo
      Left = 93
      Top = 91
      Width = 426
      Height = 47
      Color = clInfoBk
      Enabled = False
      Lines.Strings = (
        'MNotas')
      TabOrder = 8
    end
    object LFEMedida1: TLFEdit
      Left = 93
      Top = 161
      Width = 61
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
      TabOrder = 15
    end
    object LFEMedida2: TLFEdit
      Left = 214
      Top = 161
      Width = 61
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
      TabOrder = 16
    end
    object LFEMedida3: TLFEdit
      Left = 334
      Top = 161
      Width = 61
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
      TabOrder = 17
    end
    object LFEMedida4: TLFEdit
      Left = 458
      Top = 161
      Width = 61
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
      TabOrder = 18
    end
    object SBNuevo: TButton
      Left = 20
      Top = 191
      Width = 75
      Height = 25
      Caption = '&Nuevo'
      TabOrder = 19
      OnClick = SBNuevoClick
    end
    object SBLibre: TButton
      Left = 428
      Top = 191
      Width = 75
      Height = 25
      Caption = '&Salir'
      TabOrder = 20
      OnClick = SBLibreClick
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 525
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object PNLArticulo: TLFPanel
      Left = 0
      Top = 0
      Width = 333
      Height = 22
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object LArticulo: TLFLabel
        Left = 4
        Top = 4
        Width = 37
        Height = 13
        Alignment = taRightJustify
        Caption = 'Art'#237'culo'
        Layout = tlCenter
      end
      object EArticulo: TLFEdit
        Left = 44
        Top = 0
        Width = 97
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
        TabOrder = 0
      end
      object ETituloArticulo: TLFEdit
        Left = 142
        Top = 0
        Width = 191
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
    object ToolButton2: TToolButton
      Left = 333
      Top = 0
      Width = 7
      Style = tbsSeparator
    end
    object TBAbrirLote: TToolButton
      Left = 340
      Top = 0
      Hint = 'Abrir el Lote'
      Caption = 'TBAbrirLote'
      ImageIndex = 67
      OnClick = TBAbrirLoteClick
    end
    object TButtEtiquetas: TToolButton
      Left = 363
      Top = 0
      Hint = 'Impresi'#243'n de Etiquetas'
      Caption = 'Impresion de Etiquetas'
      ImageIndex = 14
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = TButtEtiquetasClick
    end
    object TBEliminaReetiquetado: TToolButton
      Left = 386
      Top = 0
      Hint = 'Eliminar reetiquetado del lote'
      ImageIndex = 95
      Visible = False
      OnClick = TBEliminaReetiquetadoClick
    end
    object HYMEditPanel1: THYMEditPanel
      Left = 409
      Top = 0
      Width = 23
      Height = 22
      VisibleButtons = [neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
    end
  end
end
