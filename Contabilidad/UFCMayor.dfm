inherited FCMayor: TFCMayor
  Left = 409
  Top = 162
  Width = 832
  Height = 493
  HelpContext = 239
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mayor'
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 822
    Height = 440
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 818
      EdgeBorders = [ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = DMMayor.DSxCuentas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
        TabOrder = 1
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 46
        DataSource = DMMayor.DSxCuentas
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 0
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 142
      end
      inherited TbuttComp: TToolButton
        Left = 150
      end
      object TButtSeparador2: TToolButton
        Left = 173
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRefrescaMayor: TToolButton
        Left = 181
        Top = 0
        Action = ARefrescaMayor
      end
      object TButtFiltraFichas: TToolButton
        Left = 204
        Top = 0
        Action = AFiltraFechas
      end
      object TButtFiltraMoneda: TToolButton
        Left = 227
        Top = 0
        Action = AFiltraMoneda
      end
      object TButtSeparador3: TToolButton
        Left = 250
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLCuenta: TLFPanel
        Left = 258
        Top = 0
        Width = 350
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LDigiteCuenta: TLFLabel
          Left = 9
          Top = 4
          Width = 92
          Height = 13
          Hint = 'Digitar (F6)'
          Alignment = taRightJustify
          Caption = '&Digite la Cuenta'
          FocusControl = EFCuenta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFCuenta: TLFEditFind2000
          Left = 104
          Top = 0
          Width = 121
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnExit = EFCuentaExit
          OnKeyDown = EFCuentaKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'restriccion=0'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'CON_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'cuenta')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
        end
        object CBCanales: TLFComboBox
          Left = 226
          Top = 0
          Width = 124
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = CBCanalesChange
          Items.Strings = (
            'Todos los canales')
        end
      end
      object PNLCentroCoste: TLFPanel
        Left = 608
        Top = 0
        Width = 208
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LCentroCoste: TLFLabel
          Left = 3
          Top = 4
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
          Left = 80
          Top = 0
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 0
          OnChange = EFDigito1Change
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
          Left = 105
          Top = 0
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 1
          OnChange = EFDigito2Change
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
          Left = 130
          Top = 0
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 2
          OnChange = EFDigito3Change
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
          Left = 155
          Top = 0
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 3
          OnChange = EFDigito4Change
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
          Left = 180
          Top = 0
          Width = 24
          Height = 21
          CharCase = ecUpperCase
          TabOrder = 4
          OnChange = EFDigito5Change
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
    end
    inherited PCMain: TLFPageControl
      Width = 818
      Height = 410
      TabOrder = 0
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Top = 68
          Width = 810
          Height = 314
          TabOrder = 2
        end
        object DBGConsulta: THYTDBGrid
          Left = 0
          Top = 68
          Width = 810
          Height = 314
          Align = alClient
          Color = clInfoBk
          DataSource = DMMayor.DSxMayor
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGConsultaDrawColumnCell
          OnDblClick = DBGConsultaDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAMarcar.Strings = (
            'PUNTEO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ASIENTO'
            'D_FECHA'
            'D_NUMERO'
            'D_SERIE'
            'DEBE'
            'FECHA'
            'HABER'
            'LINEA'
            'RIC'
            'SALDO'
            'TEXTO'
            'TIPO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CANAL'
              Title.Alignment = taRightJustify
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ASIENTO'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TEXTO'
              Width = 251
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEBE'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HABER'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDO'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_FECHA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_SERIE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_NUMERO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_1'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_2'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_3'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_4'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIGITO_5'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PUNTEO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PUNTEO'
              Width = 72
              Visible = True
            end>
        end
        object PNLSaldos: TLFPanel
          Left = 0
          Top = 0
          Width = 810
          Height = 68
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LBLSaldoAnt: TLFLabel
            Left = 377
            Top = 4
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo anterior'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LBLDesde: TLFLabel
            Left = 1
            Top = 48
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LBLHasta: TLFLabel
            Left = 134
            Top = 48
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LBLMonedaFicha: TLFLabel
            Left = 262
            Top = 48
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LBLSaldoAct: TLFLabel
            Left = 579
            Top = 48
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo Actual'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEAntD: TLFDbedit
            Left = 461
            Top = 0
            Width = 97
            Height = 21
            AutoSize = False
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'DEBE_A'
            DataSource = DMMayor.DSxSaldos
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
          object DBEAntH: TLFDbedit
            Left = 559
            Top = 0
            Width = 101
            Height = 21
            AutoSize = False
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'HABER_A'
            DataSource = DMMayor.DSxSaldos
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
          object DBESaldoAnt: TLFDbedit
            Left = 661
            Top = 0
            Width = 121
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'SALDO_A'
            DataSource = DMMayor.DSxSaldos
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
          object ETitMoneda: TLFEdit
            Left = 361
            Top = 44
            Width = 195
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
          object DTPDesde: TLFDateEdit
            Left = 41
            Top = 44
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DTPHasta: TLFDateEdit
            Left = 171
            Top = 44
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object EFMoneda: TLFEditFind2000
            Left = 311
            Top = 44
            Width = 49
            Height = 21
            TabOrder = 6
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
              'MONEDA')
            Filtros = []
          end
          object DBESaldoAct: TLFDbedit
            Left = 661
            Top = 44
            Width = 121
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMMayor.DSxSaldos
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
          object DBEHaber: TLFDbedit
            Left = 559
            Top = 22
            Width = 101
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'HABER'
            DataSource = DMMayor.DSxSaldos
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
          object DBECuenta: TLFDbedit
            Left = 0
            Top = 22
            Width = 129
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'CUENTA'
            DataSource = DMMayor.DSxCuentas
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
          object DBETitulo: TLFDbedit
            Left = 130
            Top = 22
            Width = 330
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMMayor.DSxCuentas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBEDebe: TLFDbedit
            Left = 461
            Top = 22
            Width = 97
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'DEBE'
            DataSource = DMMayor.DSxSaldos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBESaldo: TLFDbedit
            Left = 661
            Top = 22
            Width = 121
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'SALDO_RNG'
            DataSource = DMMayor.DSxSaldos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object NavMayor: THYMNavigator
            Left = 0
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMMayor.DSxMayor
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 13
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEMain
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 810
          Height = 382
          DataSource = DMMayor.DSxCuentas
          CamposAOrdenar.Strings = (
            'CUENTA'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 141
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 440
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUPERIOR'
              Width = 116
              Visible = True
            end>
        end
      end
      object TSMovPeriodos: TTabSheet
        Caption = '&Periodos'
        ImageIndex = 2
        OnShow = TSMovPeriodosShow
        object PNL_Per_1: TLFPanel
          Left = 0
          Top = 0
          Width = 810
          Height = 23
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLMoneda: TLFLabel
            Left = 445
            Top = 4
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object DBEpCuenta: TLFDbedit
            Left = 0
            Top = 0
            Width = 115
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            Color = clInfoBk
            DataField = 'CUENTA'
            DataSource = DMMayor.DSxCuentas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEpTitulo: TLFDbedit
            Left = 116
            Top = 0
            Width = 320
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            BevelKind = bkFlat
            BevelWidth = 2
            BorderStyle = bsNone
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMMayor.DSxCuentas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object EMoneda: TLFEdit
            Left = 494
            Top = 0
            Width = 54
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
        object DBGPeriodos: THYTDBGrid
          Left = 0
          Top = 23
          Width = 810
          Height = 359
          Align = alClient
          Color = clInfoBk
          DataSource = DMMayor.DSxmayor_cuenta_periodo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = False
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIT_PER'
              Width = 357
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEBE'
              Title.Alignment = taRightJustify
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HABER'
              Title.Alignment = taRightJustify
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDO'
              Title.Alignment = taRightJustify
              Width = 110
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 440
    Width = 822
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 544
    Top = 166
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 576
    Top = 168
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 242
    Top = 44
    object AVisualizarListado: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Filtrado'
      Hint = 'Visualizar Listado Filtrado'
      ImageIndex = 14
      OnExecute = AVisualizarListadoExecute
    end
    object AVisualizaMayor: TAction
      Category = 'Listados'
      Caption = 'Visualiza Mayor'
      Hint = 'Visualiza Mayor'
      ImageIndex = 14
      OnExecute = AVisualizaMayorExecute
    end
    object Asep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AConfRapidaListadoMayor: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida del Listado del Mayor'
      Hint = 'Configuraci'#243'n R'#225'pida del Listado del Mayor'
      ImageIndex = 77
      OnExecute = AConfRapidaListadoMayorExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ARefrescaMayor: TAction
      Category = 'Procesos'
      Caption = 'Refresca Mayor'
      Hint = 'Refresca Mayor'
      ImageIndex = 26
      OnExecute = ARefrescaMayorExecute
    end
    object ATraspasaBorrador: TAction
      Category = 'Procesos'
      Caption = 'Traspasa a Borrador para que pueda modificarse'
      Hint = 'Traspasa a Borrador para que pueda modificarse'
      ImageIndex = 25
      OnExecute = ATraspasaBorradorExecute
    end
    object AFiltraFechas: TAction
      Category = 'Procesos'
      Caption = 'Filtra entre fechas seleccionadas'
      Hint = 'Filtra entre fechas seleccionadas'
      ImageIndex = 22
      ShortCut = 49222
      OnExecute = AFiltraFechasExecute
    end
    object AFiltraMoneda: TAction
      Category = 'Procesos'
      Caption = 'Filtra con la moneda seleccionada'
      Hint = 'Filtra con la moneda seleccionada'
      ImageIndex = 56
      ShortCut = 49229
      OnExecute = AFiltraMonedaExecute
    end
    object AEliminaRIC: TAction
      Category = 'Procesos'
      Caption = 'Elimina el asiento ( R.I.C. )'
      Hint = 'Elimina el asiento ( R.I.C. )'
      ImageIndex = 27
      OnExecute = AEliminaRICExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AExportarHojaCalculo: TAction
      Category = 'Listados'
      Caption = 'Exportar a Hoja de Calculo'
      Hint = 'Exportar a Hoja de Calculo'
      ImageIndex = 21
      OnExecute = AExportarHojaCalculoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 210
    Top = 38
  end
end
