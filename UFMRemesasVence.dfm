object FMRemesasAbona: TFMRemesasAbona
  Left = 785
  Top = 169
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Abono Remesa Vista'
  ClientHeight = 171
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
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 312
    Height = 22
    AutoSize = True
    EdgeBorders = []
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object TButtConfirmar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Confirmar el abono'
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
      OnClickSalir = EPMainClickSalir
    end
  end
  object PMain: TLFPanel
    Left = 0
    Top = 22
    Width = 312
    Height = 149
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object LCentroCoste: TLFLabel
      Left = 56
      Top = 117
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Centro Coste'
    end
    object LBLIvaGastos: TLFLabel
      Left = 64
      Top = 49
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'IVA Gastos'
    end
    object LBLGastosSinIva: TLFLabel
      Left = 48
      Top = 71
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Gastos sin IVA'
    end
    object LBLBase: TLFLabel
      Left = 57
      Top = 26
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Base Gastos'
    end
    object LFechaCobro: TLFLabel
      Left = 56
      Top = 94
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Cobro'
    end
    object EFDigito_5: TLFEditFind2000
      Left = 213
      Top = 109
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
    object EFDigito_4: TLFEditFind2000
      Left = 190
      Top = 109
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 7
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
    object EFDigito_3: TLFEditFind2000
      Left = 167
      Top = 109
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 6
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
    object EFDigito_2: TLFEditFind2000
      Left = 144
      Top = 109
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 5
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
    object EFDigito_1: TLFEditFind2000
      Left = 121
      Top = 109
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 4
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
    object DEFechaAbono: TLFDateEdit
      Left = 121
      Top = 87
      Width = 114
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
      OnKeyDown = OnKeyDown
    end
    object REBaseGastos: TLFEdit
      Left = 121
      Top = 21
      Width = 114
      Height = 21
      TabOrder = 0
      OnKeyDown = OnKeyDown
    end
    object REGastosIva: TLFEdit
      Left = 121
      Top = 43
      Width = 114
      Height = 21
      TabOrder = 1
      OnKeyDown = OnKeyDown
    end
    object REGastosSinIva: TLFEdit
      Left = 121
      Top = 65
      Width = 114
      Height = 21
      TabOrder = 2
      OnKeyDown = OnKeyDown
    end
  end
end
