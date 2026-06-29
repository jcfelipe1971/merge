object FMPonderaEmpresa: TFMPonderaEmpresa
  Left = 547
  Top = 338
  HelpContext = 136
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Pondera Empresa'
  ClientHeight = 274
  ClientWidth = 392
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLDatos: TLFPanel
    Left = 0
    Top = 0
    Width = 392
    Height = 56
    Align = alTop
    TabOrder = 0
    DesignSize = (
      392
      56)
    object LBLBaseDatos: TLFLabel
      Left = 2
      Top = 3
      Width = 99
      Height = 16
      AutoSize = False
      Caption = 'Base de Datos'
      Color = clInfoBk
      ParentColor = False
    end
    object LBase: TLFLabel
      Left = 102
      Top = 3
      Width = 288
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Desconectada - Conecta con G2K2.ini'
      Color = clInfoBk
      ParentColor = False
    end
    object LBLProcesando: TLFLabel
      Left = 2
      Top = 37
      Width = 99
      Height = 16
      AutoSize = False
      Caption = 'Procesando'
      Color = clInfoBk
      ParentColor = False
    end
    object LArticulo: TLFLabel
      Left = 102
      Top = 37
      Width = 288
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = '...'
      Color = clInfoBk
      ParentColor = False
    end
    object LBLFaltan: TLFLabel
      Left = 2
      Top = 20
      Width = 99
      Height = 16
      AutoSize = False
      Caption = 'Faltan'
      Color = clInfoBk
      ParentColor = False
    end
    object LFaltan: TLFLabel
      Left = 102
      Top = 20
      Width = 288
      Height = 16
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = '?'
      Color = clInfoBk
      ParentColor = False
    end
  end
  object PNLErrores: TLFPanel
    Left = 0
    Top = 220
    Width = 392
    Height = 54
    Align = alClient
    TabOrder = 1
    object MErrores: TLFMemo
      Left = 1
      Top = 1
      Width = 390
      Height = 52
      Hint = 'Articulos que han generado un error al ponderarlos'
      TabStop = False
      Align = alClient
      Lines.Strings = (
        'Lista de Errores:')
      TabOrder = 0
    end
  end
  object PNLRangos: TLFPanel
    Left = 0
    Top = 56
    Width = 392
    Height = 130
    Align = alTop
    TabOrder = 2
    DesignSize = (
      392
      130)
    object GBEmpresas: TGroupBox
      Left = 0
      Top = 1
      Width = 194
      Height = 62
      Caption = 'Empresas'
      TabOrder = 0
      object Label2: TLFLabel
        Left = 14
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Label4: TLFLabel
        Left = 17
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EDesdeEmpresa: TLFEditFind2000
        Left = 50
        Top = 13
        Width = 121
        Height = 21
        TabOrder = 0
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'EMPRESA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_EMPRESAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'empresa')
        Filtros = []
      end
      object EHastaEmpresa: TLFEditFind2000
        Left = 50
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 1
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'EMPRESA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_EMPRESAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'empresa')
        Filtros = []
      end
    end
    object GBCanales: TGroupBox
      Left = 197
      Top = 1
      Width = 194
      Height = 62
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Canales'
      TabOrder = 1
      object Label6: TLFLabel
        Left = 14
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Label7: TLFLabel
        Left = 17
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EDesdeCanal: TLFEditFind2000
        Left = 50
        Top = 13
        Width = 121
        Height = 21
        TabOrder = 0
        OnEnter = EDesdeCanalEnter
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'canal')
        Filtros = []
      end
      object EHastaCanal: TLFEditFind2000
        Left = 50
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 1
        OnEnter = EHastaCanalEnter
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
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'canal')
        Filtros = []
      end
    end
    object GBArticulos: TGroupBox
      Left = 0
      Top = 64
      Width = 194
      Height = 62
      Caption = 'Art'#237'culos'
      TabOrder = 2
      object Label8: TLFLabel
        Left = 14
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Label9: TLFLabel
        Left = 17
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EDesdeArticulo: TLFEditFind2000
        Left = 50
        Top = 13
        Width = 121
        Height = 21
        TabOrder = 0
        OnEnter = EDesdeArticuloEnter
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
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'articulo')
        Filtros = []
      end
      object EHastaArticulo: TLFEditFind2000
        Left = 50
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 1
        OnEnter = EHastaArticuloEnter
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
        Tabla_a_buscar = 'VER_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'articulo')
        Filtros = []
      end
    end
    object GBAlmacenes: TGroupBox
      Left = 197
      Top = 64
      Width = 194
      Height = 62
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Almacenes'
      TabOrder = 3
      object Label10: TLFLabel
        Left = 14
        Top = 18
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object Label11: TLFLabel
        Left = 17
        Top = 38
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object EDesdeAlmacen: TLFEditFind2000
        Left = 50
        Top = 13
        Width = 121
        Height = 21
        TabOrder = 0
        OnEnter = EDesdeAlmacenEnter
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
        OrdenadoPor.Strings = (
          'almacen')
        Filtros = []
      end
      object EHastaAlmacen: TLFEditFind2000
        Left = 50
        Top = 35
        Width = 121
        Height = 21
        TabOrder = 1
        OnEnter = EHastaAlmacenEnter
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
        OrdenadoPor.Strings = (
          'almacen')
        Filtros = []
      end
    end
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 186
    Width = 392
    Height = 34
    Align = alTop
    TabOrder = 3
    object BEmpezar: TButton
      Left = 78
      Top = 4
      Width = 75
      Height = 25
      Hint = 'Empieza la ponderaci'#243'n de los articulos seleccionados'
      Caption = '&Empezar'
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BEmpezarClick
    end
    object BInterrumpir: TButton
      Left = 238
      Top = 4
      Width = 75
      Height = 25
      Hint = 'Interrumpe la ponderaci'#243'n'
      BiDiMode = bdLeftToRight
      Caption = '&Interrumpir'
      Enabled = False
      ParentBiDiMode = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = BInterrumpirClick
    end
  end
end
