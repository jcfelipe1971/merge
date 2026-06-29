inherited FMCambiaMonCartera: TFMCambiaMonCartera
  Left = 390
  Top = 463
  HelpContext = 300
  Caption = 'Cambio de Moneda Registros de Cartera'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    TabOrder = 1
    object LMonedaOrigen: TLFLabel [0]
      Left = 18
      Top = 55
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda Origen'
    end
    object LMonedaDestino: TLFLabel [1]
      Left = 13
      Top = 77
      Width = 78
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda Destino'
    end
    object LBLRegistrodesde: TLFLabel [2]
      Left = 18
      Top = 99
      Width = 73
      Height = 13
      Alignment = taRightJustify
      Caption = 'Registro Desde'
    end
    object LBLSigno: TLFLabel [3]
      Left = 64
      Top = 32
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Signo'
    end
    object LBLRegistroHasta: TLFLabel [4]
      Left = 208
      Top = 99
      Width = 70
      Height = 13
      Alignment = taRightJustify
      Caption = 'Registro Hasta'
    end
    inherited TBMain: TLFToolBar
      Width = 386
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 8
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object EFMonedaOrigen: TLFEditFind2000
      Left = 95
      Top = 51
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
      Top = 73
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
    object ETitMonedaOrigen: TLFEdit
      Left = 148
      Top = 51
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
      Top = 73
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
    object CBCanales: TLFCheckBox
      Left = 95
      Top = 120
      Width = 163
      Height = 17
      Caption = 'Aplicar a todos los Canales'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 7
      TabStop = True
      Alignment = taLeftJustify
    end
    object CBSigno: TLFComboBox
      Left = 95
      Top = 28
      Width = 267
      Height = 22
      Style = csOwnerDrawFixed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 16
      ItemIndex = 0
      ParentFont = False
      TabOrder = 0
      Text = 'Cobros'
      OnChange = CBSignoChange
      Items.Strings = (
        'Cobros'
        'Pagos'
        'Cobros y Pagos')
    end
    object SERegistroDesde: TSpinEdit
      Left = 95
      Top = 95
      Width = 80
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 5
      Value = 1
    end
    object SERegistroHasta: TSpinEdit
      Left = 282
      Top = 95
      Width = 80
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 6
      Value = 1
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
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
    Left = 194
    Top = 38
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
    Left = 276
    Top = 42
  end
end
