object FMRemesasPagoGastos: TFMRemesasPagoGastos
  Left = 611
  Top = 383
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Impago'
  ClientHeight = 171
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LBLFechaPago: TLFLabel
    Left = 60
    Top = 83
    Width = 55
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fecha Pag.'
  end
  object LCentroCoste: TLFLabel
    Left = 54
    Top = 107
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = 'Centro Coste'
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 312
    Height = 26
    AutoSize = True
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtConfirmar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Confirmar el vencimiento'
      Caption = 'Confirmar'
      ImageIndex = 19
      ParentShowHint = False
      ShowHint = True
      OnClick = TButtConfirmarClick
    end
    object EPMain: THYMEditPanel
      Left = 23
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
  object DTPFechaImpagado: TLFDateEdit
    Left = 120
    Top = 79
    Width = 114
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    TabOrder = 1
  end
  object EFDigito_1: TLFEditFind2000
    Left = 120
    Top = 103
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 2
    Base_de_datos = DMMain.DataBase
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'LET_DIGITO'
    CampoStr = 'TITULO'
    CondicionBusqueda = 'num_digito=1'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = True
    SalirSiNoExiste = True
    Tabla_a_buscar = 'CON_CENTROS_COSTE'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'let_digito')
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
  end
  object EFDigito_2: TLFEditFind2000
    Left = 143
    Top = 103
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 3
    Base_de_datos = DMMain.DataBase
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'LET_DIGITO'
    CampoStr = 'TITULO'
    CondicionBusqueda = 'num_digito=2'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = True
    SalirSiNoExiste = False
    Tabla_a_buscar = 'CON_CENTROS_COSTE'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'let_digito')
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
  end
  object EFDigito_3: TLFEditFind2000
    Left = 166
    Top = 103
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 4
    Base_de_datos = DMMain.DataBase
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'LET_DIGITO'
    CampoStr = 'TITULO'
    CondicionBusqueda = 'num_digito=3'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = True
    SalirSiNoExiste = False
    Tabla_a_buscar = 'CON_CENTROS_COSTE'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'let_digito')
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
  end
  object EFDigito_4: TLFEditFind2000
    Left = 189
    Top = 103
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 5
    Base_de_datos = DMMain.DataBase
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'LET_DIGITO'
    CampoStr = 'TITULO'
    CondicionBusqueda = 'num_digito=4'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = True
    SalirSiNoExiste = False
    Tabla_a_buscar = 'CON_CENTROS_COSTE'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'let_digito')
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
  end
  object EFDigito_5: TLFEditFind2000
    Left = 212
    Top = 103
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 6
    Base_de_datos = DMMain.DataBase
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'LET_DIGITO'
    CampoStr = 'TITULO'
    CondicionBusqueda = 'num_digito=5'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = True
    SalirSiNoExiste = False
    Tabla_a_buscar = 'CON_CENTROS_COSTE'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'let_digito')
    Filtros = [obEmpresa, obEjercicio, obCanal]
    Entorno = DMMain.EntornoBusqueda
  end
end
