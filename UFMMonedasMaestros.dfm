inherited FMMonedasMaestros: TFMMonedasMaestros
  Left = 393
  Top = 107
  HelpContext = 299
  Caption = 'Cambio de Monedas de Maestros'
  ClientHeight = 272
  ClientWidth = 387
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 387
    Height = 248
    TabOrder = 1
    object LMonedaOrigen: TLFLabel [0]
      Left = 17
      Top = 68
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda Origen'
    end
    object LMonedaDestino: TLFLabel [1]
      Left = 12
      Top = 90
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda Destino'
    end
    object LAgrupacion: TLFLabel [2]
      Left = 36
      Top = 112
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'Agrupaci'#243'n'
    end
    object LMaestro: TLFLabel [3]
      Left = 52
      Top = 45
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = 'Maestro'
    end
    inherited TBMain: TLFToolBar
      Width = 383
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 11
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object EFMonedaOrigen: TLFEditFind2000
      Left = 95
      Top = 64
      Width = 52
      Height = 21
      TabOrder = 1
      OnChange = EFMonedaOrigenChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'MONEDA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_MONEDAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'MONEDA')
      Filtros = []
    end
    object EFMonedaDestino: TLFEditFind2000
      Left = 95
      Top = 86
      Width = 52
      Height = 21
      TabOrder = 3
      OnChange = EFMonedaDestinoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'MONEDA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_MONEDAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'MONEDA')
      Filtros = []
    end
    object EFAgrupacion: TLFEditFind2000
      Left = 95
      Top = 108
      Width = 52
      Height = 21
      TabOrder = 5
      OnChange = EFAgrupacionChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'AGRUPACION'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'TIPO = '#39'C'#39
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'SYS_AGRUPACIONES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'AGRUPACION')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
    end
    object ETitMonedaOrigen: TLFEdit
      Left = 148
      Top = 64
      Width = 214
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
      TabOrder = 2
    end
    object ETitMonedaDestino: TLFEdit
      Left = 148
      Top = 86
      Width = 214
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
      TabOrder = 4
    end
    object ETitAgrupacion: TLFEdit
      Left = 148
      Top = 108
      Width = 214
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
      TabOrder = 6
    end
    object CBAgrupacion: TLFCheckBox
      Left = 95
      Top = 132
      Width = 267
      Height = 17
      Caption = 'Usar Agrupaci'#243'n'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 7
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBCanales: TLFCheckBox
      Left = 95
      Top = 151
      Width = 267
      Height = 17
      Caption = 'Aplicar a todos los Canales'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 8
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBEjercicios: TLFCheckBox
      Left = 95
      Top = 170
      Width = 267
      Height = 17
      Caption = 'Aplicar a todos los Ejercicios'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 9
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBTodos: TLFCheckBox
      Left = 95
      Top = 189
      Width = 267
      Height = 17
      Caption = 'Aplicar a todos e ignorar Moneda de Origen'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 10
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBBMaestros: TLFComboBox
      Left = 95
      Top = 41
      Width = 267
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ParentFont = False
      TabOrder = 0
      OnChange = CBBMaestrosChange
      Items.Strings = (
        'Clientes'
        'Proveedores'
        'Acreedores'
        'Todos los Maestros')
    end
  end
  inherited TBActions: TLFToolBar
    Top = 248
    Width = 387
    EdgeBorders = []
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
    Left = 190
    Top = 12
    object AProcesar: TAction
      Category = 'Procesos'
      Caption = 'Procesar'
      Hint = 'Procesar'
      ImageIndex = 16
      OnExecute = AProcesarExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 260
    Top = 12
  end
end
