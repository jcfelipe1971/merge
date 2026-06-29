inherited FPregMayor: TFPregMayor
  Left = 396
  Top = 246
  ActiveControl = EFCuentaDesde
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Mayor'
  ClientHeight = 343
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 592
    Height = 343
    inherited TBMain: TLFToolBar
      Width = 592
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
      object TBExportar: TToolButton
        Left = 360
        Top = 0
        Action = AExportar
      end
    end
    inherited PBListado: TProgressBar
      Top = 327
      Width = 592
      TabOrder = 2
    end
    object PNLLstMayor: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 291
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeCuenta: TLFLabel
        Left = 4
        Top = 95
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cuenta Desde'
      end
      object LHastaCuenta: TLFLabel
        Left = 7
        Top = 117
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cuenta Hasta'
      end
      object LBLDesde: TLFLabel
        Left = 41
        Top = 139
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LBLHasta: TLFLabel
        Left = 44
        Top = 161
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LAlcance: TLFLabel
        Left = 202
        Top = 161
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Alcance'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LMoneda: TLFLabel
        Left = 202
        Top = 139
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
      end
      object LNivel: TLFLabel
        Left = 48
        Top = 72
        Width = 24
        Height = 13
        Caption = 'Nivel'
      end
      object EFCuentaDesde: TLFEditFind2000
        Left = 77
        Top = 91
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 1
        OnChange = EFCuentaDesdeChange
        OnExit = EFCuentaDesdeExit
        OnKeyDown = EFCuentaDesdeKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCuentaHasta: TLFEditFind2000
        Left = 77
        Top = 113
        Width = 121
        Height = 21
        CharCase = ecUpperCase
        MaxLength = 15
        TabOrder = 2
        OnChange = EFCuentaHastaChange
        OnExit = EFCuentaHastaExit
        OnKeyDown = EFCuentaHastaKeyDown
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CUENTA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'CON_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CUENTA')
        Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETituloCDesde: TLFEdit
        Left = 199
        Top = 91
        Width = 386
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object ETituloCHasta: TLFEdit
        Left = 199
        Top = 113
        Width = 386
        Height = 21
        CharCase = ecUpperCase
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
      object CBCanales: TLFComboBox
        Left = 247
        Top = 157
        Width = 124
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 9
        OnChange = CBCanalesChange
        Items.Strings = (
          'Todos los canales')
      end
      object DTPDesde: TLFDateEdit
        Left = 77
        Top = 135
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
      object DTPHasta: TLFDateEdit
        Left = 77
        Top = 157
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 6
      end
      object EFMoneda: TLFEditFind2000
        Left = 247
        Top = 135
        Width = 49
        Height = 21
        TabOrder = 7
        OnChange = EFMonedaChange
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
          'DEFECTO DESC'
          'MONEDA')
        Filtros = []
      end
      object ETituloMoneda: TLFEdit
        Left = 297
        Top = 135
        Width = 288
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
      object CBSaldoCero: TLFCheckBox
        Left = 77
        Top = 184
        Width = 156
        Height = 17
        Caption = 'Cuentas con Saldo 0'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 10
        TabStop = True
        OnClick = CBSaldoCeroClick
        Alignment = taLeftJustify
      end
      object PNLCentroCoste: TLFPanel
        Left = 76
        Top = 208
        Width = 208
        Height = 26
        BevelOuter = bvNone
        TabOrder = 11
        object LCentroCoste: TLFLabel
          Left = 4
          Top = 6
          Width = 74
          Height = 13
          Hint = 'Digitar (F6)'
          Alignment = taRightJustify
          Caption = '&Centro Coste'
          FocusControl = EFDigito1
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFDigito1: TLFEditFind2000
          Left = 81
          Top = 2
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
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
        object EFDigito2: TLFEditFind2000
          Left = 106
          Top = 2
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'let_digito')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDigito3: TLFEditFind2000
          Left = 131
          Top = 2
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'let_digito')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDigito4: TLFEditFind2000
          Left = 156
          Top = 2
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'let_digito')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFDigito5: TLFEditFind2000
          Left = 181
          Top = 2
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
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
          SalirSiNoExiste = True
          Tabla_a_buscar = 'CON_CENTROS_COSTE'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'let_digito')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object CBNivel: TLFComboBox
        Left = 77
        Top = 69
        Width = 121
        Height = 21
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 428
    Top = 22
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
