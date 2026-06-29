inherited FMReciboNuevo: TFMReciboNuevo
  Left = 435
  Top = 191
  HelpContext = 270
  Caption = 'Introducci'#243'n de Recibos'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 319
    object LFechaRegistro: TLFLabel [0]
      Left = 36
      Top = 95
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LFormaPago: TLFLabel [1]
      Left = 36
      Top = 118
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Forma de Pago'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object LCuentaPago: TLFLabel [2]
      Left = 46
      Top = 140
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cta. de Pago'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object LCantidad: TLFLabel [3]
      Left = 73
      Top = 161
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object LCodCliPro: TLFLabel [4]
      Left = 76
      Top = 72
      Width = 32
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cliente'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object LDescripcion: TLFLabel [5]
      Left = 52
      Top = 183
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Descripci'#243'n'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object TButtPermuta: TSpeedButton [6]
      Left = 2
      Top = 42
      Width = 77
      Height = 23
      Caption = 'Permuta'
      Flat = True
      OnClick = TButtPermutaClick
    end
    object LMoneda: TLFLabel [7]
      Left = 69
      Top = 205
      Width = 39
      Height = 13
      Alignment = taRightJustify
      Caption = 'Moneda'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object LSerie: TLFLabel [8]
      Left = 84
      Top = 227
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    object LCuentaContrapartida: TLFLabel [9]
      Left = 43
      Top = 272
      Width = 65
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cta. de Cobro'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
    end
    inherited TBMain: TLFToolBar
      Width = 588
      TabOrder = 15
      object TButtRecibo: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Crea Recibo Nuevo'
        Caption = 'Recibo'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtReciboClick
      end
      inherited EPMain: THYMEditPanel
        Left = 23
        Width = 26
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtSep1: TToolButton
        Left = 49
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLTipoCartera: TLFPanel
        Left = 57
        Top = 0
        Width = 177
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LTipoCartera: TLFLabel
          Left = 36
          Top = 4
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cartera  '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object CBSigno: TLFComboBox
          Left = 81
          Top = 0
          Width = 96
          Height = 21
          Hint = 'Signo de la operaci'#243'n'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSignoChange
          Items.Strings = (
            'Cobros'
            'Pagos'
            'Anticipo Cobros'
            'Anticipo Pagos')
        end
      end
    end
    object DTPFechaRegistro: TLFDateEdit
      Left = 112
      Top = 90
      Width = 97
      Height = 22
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object EFFormaPago: TLFEditFind2000
      Left = 112
      Top = 113
      Width = 44
      Height = 21
      TabOrder = 2
      OnChange = EFFormaPagoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'FORMA_PAGO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'FORMA_PAGO')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFormaPago: TLFEdit
      Left = 157
      Top = 113
      Width = 413
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
      TabOrder = 6
    end
    object EFCuentaPago: TLFEditFind2000
      Left = 112
      Top = 135
      Width = 129
      Height = 21
      TabOrder = 3
      OnChange = EFCuentaPagoChange
      OnExit = EFCuentaPagoExit
      OnKeyDown = EFCuentaPagoKeyDown
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'TIPO=5'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CUENTA')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ECuentaPago: TLFEdit
      Left = 242
      Top = 135
      Width = 328
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
      TabOrder = 7
    end
    object ECantidad: TLFEdit
      Left = 112
      Top = 157
      Width = 129
      Height = 21
      TabOrder = 4
      OnKeyPress = ECantidadKeyPress
    end
    object EFCodCliPro: TLFEditFind2000
      Left = 112
      Top = 68
      Width = 73
      Height = 21
      TabOrder = 0
      OnChange = EFCodCliProChange
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
      Tabla_a_buscar = 'VER_CLIENTES_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CLIENTE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ECodCliPro: TLFEdit
      Left = 186
      Top = 68
      Width = 384
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
      TabOrder = 8
    end
    object EDescripcion: TLFEdit
      Left = 112
      Top = 179
      Width = 459
      Height = 21
      MaxLength = 60
      TabOrder = 5
    end
    object EFMoneda: TLFEditFind2000
      Left = 112
      Top = 201
      Width = 71
      Height = 21
      TabOrder = 9
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
      Tabla_a_buscar = 'VER_MONEDAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'MONEDA')
      Filtros = []
    end
    object EFSerie: TLFEditFind2000
      Left = 112
      Top = 223
      Width = 71
      Height = 21
      TabOrder = 10
      OnChange = EFSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'SERIE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ESerie: TLFEdit
      Left = 184
      Top = 223
      Width = 387
      Height = 21
      Color = clInfoBk
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object CBContabilizar: TLFCheckBox
      Left = 112
      Top = 248
      Width = 128
      Height = 17
      Caption = 'Generar asiento'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 12
      TabStop = True
      OnClick = CBContabilizarClick
      BiDiMode = bdLeftToRight
      ParentBiDiMode = False
      Alignment = taLeftJustify
    end
    object EFCtaContrapartida: TLFEditFind2000
      Left = 112
      Top = 267
      Width = 129
      Height = 21
      Enabled = False
      TabOrder = 13
      OnChange = EFCtaContrapartidaChange
      OnExit = EFCtaContrapartidaExit
      OnKeyDown = EFCtaContrapartidaKeyDown
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'TIPO=5'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CUENTA')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object ECuentaContrapartida: TLFEdit
      Left = 242
      Top = 267
      Width = 328
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
      TabOrder = 14
    end
  end
  inherited TBActions: TLFToolBar
    Top = 319
    Width = 592
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
  inherited FSMain: TLFFibFormStorage
    Left = 496
    Top = 38
  end
end
