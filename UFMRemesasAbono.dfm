object FMRemesasAbono: TFMRemesasAbono
  Left = 710
  Top = 214
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Abono'
  ClientHeight = 224
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LFechaAbono: TLFLabel
    Left = 52
    Top = 154
    Width = 64
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fecha Abono'
  end
  object LBLBase: TLFLabel
    Left = 56
    Top = 36
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Base Gastos'
  end
  object LImporteCA: TLFLabel
    Left = 58
    Top = 128
    Width = 58
    Height = 13
    Hint = 'Importe para la cuenta ahorro.'
    Alignment = taRightJustify
    Caption = 'Importe C.A.'
    ParentShowHint = False
    ShowHint = True
  end
  object CargosDescuento: TLFLabel
    Left = 60
    Top = 106
    Width = 56
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cargos Dto.'
  end
  object LBLIba: TLFLabel
    Left = 63
    Top = 58
    Width = 53
    Height = 13
    Alignment = taRightJustify
    Caption = 'IVA Gastos'
  end
  object LBLGastosSinIva: TLFLabel
    Left = 47
    Top = 80
    Width = 69
    Height = 13
    Alignment = taRightJustify
    Caption = 'Gastos sin IVA'
  end
  object LCentroCoste: TLFLabel
    Left = 55
    Top = 204
    Width = 61
    Height = 13
    Alignment = taRightJustify
    Caption = 'Centro Coste'
  end
  object LFechaGastos: TLFLabel
    Left = 50
    Top = 176
    Width = 66
    Height = 13
    Alignment = taRightJustify
    Caption = 'Fecha Gastos'
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
  object DEFechaAbono: TLFDateEdit
    Left = 121
    Top = 150
    Width = 114
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    TabOrder = 6
    OnKeyDown = OnKeyDown
  end
  object REBaseGastos: TLFEdit
    Left = 121
    Top = 32
    Width = 114
    Height = 21
    TabOrder = 1
    OnKeyDown = OnKeyDown
  end
  object REGastosIva: TLFEdit
    Left = 121
    Top = 54
    Width = 114
    Height = 21
    TabOrder = 2
    OnKeyDown = OnKeyDown
  end
  object REGastosSinIva: TLFEdit
    Left = 121
    Top = 76
    Width = 114
    Height = 21
    TabOrder = 3
    OnKeyDown = OnKeyDown
  end
  object REGastosDto: TLFEdit
    Left = 121
    Top = 102
    Width = 114
    Height = 21
    TabOrder = 4
    OnKeyDown = OnKeyDown
  end
  object REImporteCA: TLFEdit
    Left = 121
    Top = 124
    Width = 114
    Height = 21
    TabOrder = 5
    OnKeyDown = OnKeyDown
  end
  object EFDigito_1: TLFEditFind2000
    Left = 121
    Top = 200
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 8
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
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
    Left = 144
    Top = 200
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 9
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
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
    Left = 167
    Top = 200
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 10
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
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
    Left = 190
    Top = 200
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 11
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
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
    Left = 213
    Top = 200
    Width = 22
    Height = 21
    MaxLength = 1
    TabOrder = 12
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
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
  object DEFechaGastos: TLFDateEdit
    Left = 121
    Top = 172
    Width = 114
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    TabOrder = 7
    OnKeyDown = OnKeyDown
  end
end
