inherited FPregSumasYSaldos: TFPregSumasYSaldos
  Left = 451
  Top = 226
  HelpContext = 250
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Sumas y Saldos'
  ClientHeight = 376
  ClientWidth = 589
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 589
    Height = 376
    inherited TBMain: TLFToolBar
      Width = 589
      EdgeBorders = []
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object TBMulticanal: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSeleccion
      end
      object TBExportar: TToolButton
        Left = 432
        Top = 0
        Action = AExportar
      end
    end
    inherited PBListado: TProgressBar
      Top = 360
      Width = 589
      TabOrder = 4
    end
    object PMonedas: TLFPanel
      Left = 0
      Top = 181
      Width = 589
      Height = 55
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LMoneda: TLFLabel
        Left = 5
        Top = 21
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
        Layout = tlCenter
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 48
        Top = 18
        Width = 87
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = DMRSumasySaldos.DSxMonedas
        TabOrder = 0
      end
    end
    object PCuentas: TLFPanel
      Left = 0
      Top = 36
      Width = 589
      Height = 145
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object GBCuentas: TGroupBox
        Left = 0
        Top = 0
        Width = 589
        Height = 78
        Align = alTop
        Caption = 'Cuentas'
        TabOrder = 0
        object LDesdeCuenta: TLFLabel
          Left = 12
          Top = 25
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LHastaCuenta: TLFLabel
          Left = 15
          Top = 47
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFDesde: TLFEditFind2000
          Left = 48
          Top = 21
          Width = 121
          Height = 21
          TabOrder = 0
          OnChange = EFDesdeChange
          OnExit = EFDesdeExit
          OnKeyDown = EFDesdeKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_SUBCUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'cuenta')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFHasta: TLFEditFind2000
          Left = 48
          Top = 43
          Width = 121
          Height = 21
          TabOrder = 1
          OnChange = EFHastaChange
          OnExit = EFHastaExit
          OnKeyDown = EFHastaKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tabla_a_buscar = 'VER_SUBCUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'cuenta')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
        end
        object ECtaDesde: TLFEdit
          Left = 170
          Top = 21
          Width = 402
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
        object ECtaHasta: TLFEdit
          Left = 170
          Top = 43
          Width = 402
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
          TabOrder = 3
        end
      end
      object GBSeccion: TGroupBox
        Left = 0
        Top = 78
        Width = 589
        Height = 67
        Align = alClient
        Caption = 'Filtros'
        TabOrder = 1
        object LHastaSeccion: TLFLabel
          Left = 160
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object LDesdeSeccion: TLFLabel
          Left = 157
          Top = 19
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LBNivel: TLFLabel
          Left = 19
          Top = 30
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nivel'
        end
        object ESeccionD: TLFEdit
          Left = 193
          Top = 14
          Width = 81
          Height = 21
          MaxLength = 11
          TabOrder = 1
        end
        object ESeccionH: TLFEdit
          Left = 193
          Top = 36
          Width = 81
          Height = 21
          MaxLength = 11
          TabOrder = 2
        end
        object CBNivelFiltro: TLFComboBox
          Left = 48
          Top = 26
          Width = 87
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBNivelFiltroChange
        end
        object CBCierre: TCheckBox
          Left = 320
          Top = 44
          Width = 90
          Height = 17
          Caption = 'Cierre'
          TabOrder = 5
        end
        object CBPerdidas: TCheckBox
          Left = 320
          Top = 12
          Width = 90
          Height = 17
          Caption = 'P'#233'rdidas'
          TabOrder = 3
        end
        object CBGanacias: TCheckBox
          Left = 320
          Top = 28
          Width = 90
          Height = 17
          Caption = 'Ganacias'
          TabOrder = 4
        end
        object GBCentroDeCostes: TGroupBox
          Left = 422
          Top = 15
          Width = 165
          Height = 50
          Align = alRight
          Caption = 'Centro de Costes'
          TabOrder = 6
          object EFDigito1: TLFEditFind2000
            Left = 16
            Top = 21
            Width = 24
            Height = 21
            TabOrder = 0
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'LET_DIGITO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'NUM_DIGITO=1'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'CON_CENTROS_COSTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'let_digito')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDigito2: TLFEditFind2000
            Left = 41
            Top = 21
            Width = 24
            Height = 21
            TabOrder = 1
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'LET_DIGITO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'NUM_DIGITO=2'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'CON_CENTROS_COSTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'let_digito')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDigito3: TLFEditFind2000
            Left = 66
            Top = 21
            Width = 24
            Height = 21
            TabOrder = 2
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'LET_DIGITO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'NUM_DIGITO=3'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'CON_CENTROS_COSTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'let_digito')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDigito4: TLFEditFind2000
            Left = 91
            Top = 21
            Width = 24
            Height = 21
            TabOrder = 3
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'LET_DIGITO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'NUM_DIGITO=4'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'CON_CENTROS_COSTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'let_digito')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EFDigito5: TLFEditFind2000
            Left = 116
            Top = 21
            Width = 24
            Height = 21
            TabOrder = 4
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'LET_DIGITO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'NUM_DIGITO=5'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = True
            Tabla_a_buscar = 'CON_CENTROS_COSTE'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'let_digito')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
    end
    object PNLOpciones: TLFPanel
      Left = 0
      Top = 236
      Width = 589
      Height = 124
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object PNivFecha: TLFPanel
        Left = 0
        Top = 0
        Width = 224
        Height = 124
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object GBFechas: TGroupBox
          Left = 0
          Top = 0
          Width = 224
          Height = 64
          Align = alTop
          Caption = 'Fechas'
          TabOrder = 0
          object LBFechaD: TLFLabel
            Left = 12
            Top = 19
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LBFechaH: TLFLabel
            Left = 15
            Top = 41
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object DTPDesde: TLFDateEdit
            Left = 48
            Top = 15
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object DTPHasta: TLFDateEdit
            Left = 48
            Top = 37
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
            OnExit = DTPHastaExit
          end
        end
        object GBNiveles: TGroupBox
          Left = 0
          Top = 64
          Width = 224
          Height = 60
          Align = alClient
          Caption = 'Niveles'
          TabOrder = 1
          object LBNivelD: TLFLabel
            Left = 12
            Top = 21
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LBNivelH: TLFLabel
            Left = 15
            Top = 42
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object CBDesde: TLFComboBox
            Left = 48
            Top = 17
            Width = 87
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBDesdeChange
          end
          object CBHasta: TLFComboBox
            Left = 48
            Top = 39
            Width = 87
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
            OnChange = CBDesdeChange
          end
        end
      end
      object GBOpciones: TGroupBox
        Left = 224
        Top = 0
        Width = 365
        Height = 124
        Align = alRight
        Caption = 'Opciones'
        TabOrder = 1
        object CheckSaldoCero: TLFCheckBox
          Left = 9
          Top = 23
          Width = 250
          Height = 17
          Caption = 'Cuenta con Saldo Cero'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object ChkBSaldosApertura: TLFCheckBox
          Left = 9
          Top = 39
          Width = 250
          Height = 17
          Caption = 'Mostrar Saldos de Apertura'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
        end
        object ChkBNoCierre: TLFCheckBox
          Left = 9
          Top = 71
          Width = 250
          Height = 17
          Caption = 'No Contabilizar Apuntes de Cierre'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
        object ChkBNoReg: TLFCheckBox
          Left = 9
          Top = 55
          Width = 250
          Height = 17
          Caption = 'No Contabilizar Apuntes de Regularizaci'#243'n'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBPorMeses: TLFCheckBox
          Left = 9
          Top = 94
          Width = 250
          Height = 17
          Caption = 'Por meses'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBPorMesesChange
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 528
    Top = 6
    inherited ASalir: TAction
      Tag = 2
    end
    inherited ARecargar: TAction
      Tag = 2
      OnExecute = ARecargarExecute
    end
    object AMultiSeleccion: TAction
      Caption = '&Multi-Selec'
      Hint = 'Multi - Selecci'#243'n'
      ImageIndex = 132
      OnExecute = AMultiSeleccionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBGanacias.Checked'
      'CBCierre.Checked'
      'CBPerdidas.Checked')
  end
end
