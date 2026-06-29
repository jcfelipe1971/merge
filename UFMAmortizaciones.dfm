inherited FMAmortizaciones: TFMAmortizaciones
  Left = 424
  Top = 211
  Width = 828
  Height = 577
  HelpContext = 255
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Control de Inmovilizado (Amortizaciones)'
  FormStyle = fsNormal
  PopupMenu = CECentroCostePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 818
    Height = 282
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 814
      inherited NavMain: THYMNavigator
        DataSource = DMAmortizacion.DSQMInmovilizado
        Hints.Strings = ()
        DelMessage = 
          ' Va a borrar un elemento que afecta a varios ejercicios, '#191'desea ' +
          'continuar?'
        EditaControl = DBEArticulo
        InsertaControl = DBEArticulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 814
      Height = 252
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 806
          Height = 224
          inherited G2KTableLoc: TG2KTBLoc
            Left = 40
            Plan.Strings = (
              
                'PLAN JOIN (VER_INMOVILIZADO_CUENTAS CUEN INDEX (PK_CON_INMOVILIZ' +
                'ADOS_CUENTAS),'
              'VER_INMOVILIZADO_CUENTAS INM INDEX (PK_CON_INMOVILIZADOS))')
            DataSource = DMAmortizacion.DSQMInmovilizado
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_INMOVILIZADO_CUENTAS'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO_ART'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object LBLArticulo: TLFLabel
            Left = 49
            Top = 8
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLGrupo: TLFLabel
            Left = 57
            Top = 74
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object LBLTituloFicha: TLFLabel
            Left = 58
            Top = 30
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLVCompra: TLFLabel
            Left = 594
            Top = 73
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'V. a Amortizar'
          end
          object LBLVResidual: TLFLabel
            Left = 605
            Top = 95
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'V. Residual'
          end
          object LBLUltModif: TLFLabel
            Left = 603
            Top = 140
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha '#218'lt Amort.'
          end
          object LBLFechaFAmort: TLFLabel
            Left = 602
            Top = 118
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Fin Amort.'
          end
          object LBLFechaBaja: TLFLabel
            Left = 375
            Top = 8
            Width = 30
            Height = 13
            Caption = 'F.Baja'
            Visible = False
          end
          object LBLGastosAmort: TLFLabel
            Left = 7
            Top = 206
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Gastos Amort.'
          end
          object LBLCAmort: TLFLabel
            Left = 13
            Top = 184
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Amortizaci'#243'n'
          end
          object LBLCInmov: TLFLabel
            Left = 15
            Top = 162
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Inmovilizado'
          end
          object LBLPerAmort: TLFLabel
            Left = 12
            Top = 140
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodos Amort.'
          end
          object LBLMetAmort: TLFLabel
            Left = 17
            Top = 118
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#233'todo Amort.'
          end
          object LBLVidaUtil: TLFLabel
            Left = 47
            Top = 96
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Vida '#218'til'
          end
          object LBLCoeficiente: TLFLabel
            Left = 186
            Top = 96
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coeficiente'
          end
          object LBLCinvent: TLFLabel
            Left = 26
            Top = 52
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'C. Inventario'
          end
          object LBLFechaCompra: TLFLabel
            Left = 590
            Top = 8
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Compra'
          end
          object LBLFechaIni: TLFLabel
            Left = 601
            Top = 30
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inicio'
          end
          object LBLValorBaja: TLFLabel
            Left = 247
            Top = 8
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'V. Baja'
            Visible = False
          end
          object LblMoneda: TLFLabel
            Left = 338
            Top = 140
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLValorCompraKri: TLFLabel
            Left = 610
            Top = 51
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'V. Compra'
          end
          object DBEArticulo: TLFDbedit
            Left = 92
            Top = 4
            Width = 105
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ARTICULO'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 0
          end
          object DBEGrupo: TLFDbedit
            Left = 92
            Top = 70
            Width = 403
            Height = 21
            DataField = 'TITULO'
            DataSource = DMAmortizacion.DSxGruposInmovilizado
            TabOrder = 6
            OnExit = DBEGrupoExit
            OnKeyDown = DBEGrupoKeyDown
          end
          object DBETitulo: TLFDbedit
            Left = 92
            Top = 26
            Width = 403
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TITULO_ART'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 4
          end
          object DBEValorCompra: TLFDbedit
            Left = 665
            Top = 70
            Width = 87
            Height = 21
            DataField = 'VALOR_COMPRA'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 20
          end
          object DBEValorResidual: TLFDbedit
            Left = 665
            Top = 92
            Width = 87
            Height = 21
            DataField = 'VALOR_RESIDUAL'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 21
          end
          object DBEFEchaUltima: TLFDbedit
            Left = 684
            Top = 136
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'FECHA_ULT_AMORTIZACION'
            DataSource = DMAmortizacion.DSQMInmovilizado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 28
          end
          object DBEFechaFin: TLFDbedit
            Left = 684
            Top = 114
            Width = 68
            Height = 21
            Color = clInfoBk
            DataField = 'FECHA_FIN_AMORTIZACION'
            DataSource = DMAmortizacion.DSQMInmovilizado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 408
            Top = 4
            Width = 87
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = DMAmortizacion.DSQMInmovilizado
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
            Visible = False
          end
          object DBCBBaja: TLFDBCheckBox
            Left = 200
            Top = 7
            Width = 43
            Height = 17
            Caption = 'Baja'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            OnClick = DBCBBajaClick
            Alignment = taLeftJustify
            DataField = 'CANCELADO'
            DataSource = DMAmortizacion.DSQMInmovilizado
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ECGastos: TLFEdit
            Left = 191
            Top = 202
            Width = 370
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
            TabOrder = 27
          end
          object DBEFCuentaG: TLFDBEditFind2000
            Left = 92
            Top = 202
            Width = 98
            Height = 21
            DataField = 'CUENTA_GASTOS'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 16
            OnChange = DBEFCuentaGChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = '(gestion=19)'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFBusqueda
            OnVerificacion = DBEFCuentaGVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCuentaA: TLFDBEditFind2000
            Left = 92
            Top = 180
            Width = 98
            Height = 21
            DataField = 'CUENTA_AMORTIZACION'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 15
            OnChange = DBEFCuentaAChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = '(gestion=18)'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFBusqueda
            OnVerificacion = DBEFCuentaAVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECAmortizacion: TLFEdit
            Left = 191
            Top = 180
            Width = 370
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
            TabOrder = 26
          end
          object DBEFCuentaI: TLFDBEditFind2000
            Left = 92
            Top = 158
            Width = 98
            Height = 21
            DataField = 'CUENTA_INMOVILIZADO'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 14
            OnChange = DBEFCuentaIChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = '((gestion=106)or(gestion=107))'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFBusqueda
            OnVerificacion = DBEFCuentaIVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECInmovilizado: TLFEdit
            Left = 191
            Top = 158
            Width = 370
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
            TabOrder = 25
          end
          object DBCBIndirecta: TLFDBCheckBox
            Left = 391
            Top = 116
            Width = 122
            Height = 17
            Hint = 
              'Directo = C. Gastos - C.Inmovilizado (68... - 21...)'#13#10'Indirecto ' +
              '= C. Gastos - C.Amortizacion (68... - 28...)'#13#10
            Caption = 'Modo Indirecto'
            ClicksDisabled = False
            ColorCheck = 57088
            ShowHint = True
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INDIRECTO'
            DataSource = DMAmortizacion.DSQMInmovilizado
            ParentShowHint = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEVidaUtil: TLFDbedit
            Left = 92
            Top = 92
            Width = 49
            Height = 21
            DataField = 'VIDA_UTIL'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 7
          end
          object DBEVidaMax: TLFDbedit
            Left = 142
            Top = 92
            Width = 38
            Height = 21
            Color = clInfoBk
            DataField = 'periodo_maximo'
            DataSource = DMAmortizacion.DSxGruposInmovilizado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
          end
          object DBECoeficiente: TLFDbedit
            Left = 244
            Top = 92
            Width = 43
            Height = 21
            DataField = 'COEFICIENTE'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 8
          end
          object DBECoefMax: TLFDbedit
            Left = 288
            Top = 92
            Width = 43
            Height = 21
            Color = clInfoBk
            DataField = 'porcentaje_maximo'
            DataSource = DMAmortizacion.DSxGruposInmovilizado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBECenInventario: TLFDbedit
            Left = 128
            Top = 48
            Width = 367
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAmortizacion.DSxCentroInventario
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBEFCentInventario: TLFDBEditFind2000
            Left = 92
            Top = 48
            Width = 35
            Height = 21
            DataField = 'CENTRO_INVENTARIO'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CENTROS_INVENTARIO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CENTRO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CENTRO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBDTPFechaCompra: TLFDBDateEdit
            Left = 665
            Top = 4
            Width = 87
            Height = 21
            DataField = 'FECHA_ADQUISICION'
            DataSource = DMAmortizacion.DSQMInmovilizado
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 17
          end
          object DBDTPFEchaInicio: TLFDBDateEdit
            Left = 665
            Top = 26
            Width = 87
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMAmortizacion.DSQMInmovilizado
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 18
          end
          object DBEFTipoAmortizacion: TLFDBEditFind2000
            Left = 92
            Top = 114
            Width = 49
            Height = 21
            DataField = 'TIPO_AMORTIZACION'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_AMORTIZACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBEFPeriodosAmortizacion: TLFDBEditFind2000
            Left = 92
            Top = 136
            Width = 49
            Height = 21
            DataField = 'PERIODOS_AMORTIZACION'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 12
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PERIODOS_AMORTIZACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PERIODICIDAD'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PERIODICIDAD')
            Filtros = []
          end
          object DBETituloMetodoAmortizacion: TLFDbedit
            Left = 142
            Top = 114
            Width = 189
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAmortizacion.DSxtipoAmortizacion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
          end
          object DBETituloPeriodoAmortizacion: TLFDbedit
            Left = 142
            Top = 136
            Width = 189
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAmortizacion.DSxPeriodosAmortizacion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
          end
          object DBCHBSegundaMano: TLFDBCheckBox
            Left = 391
            Top = 94
            Width = 122
            Height = 17
            Caption = 'Segunda mano'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SEGUNDA_MANO'
            DataSource = DMAmortizacion.DSQMInmovilizado
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorBaja: TLFDbedit
            Left = 284
            Top = 4
            Width = 88
            Height = 21
            DataField = 'VALOR_BAJA'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 2
            Visible = False
          end
          object ETitMoneda: TLFEdit
            Left = 431
            Top = 136
            Width = 130
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
            TabOrder = 32
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 381
            Top = 136
            Width = 49
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 13
            OnChange = DBEFMonedaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEValorCompraKri: TLFDbedit
            Left = 665
            Top = 48
            Width = 87
            Height = 21
            DataField = 'VALOR_COMPRA_KRI'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 19
          end
          object PNLCentroCoste: TLFPanel
            Left = 575
            Top = 157
            Width = 176
            Height = 66
            BevelOuter = bvNone
            Caption = 'Sin Centro de Coste'
            TabOrder = 33
            OnEnter = PNLCentroCosteEnter
            OnExit = PNLCentroCosteExit
            object DBGCentroCoste: TDBGridFind2000
              Left = 0
              Top = 21
              Width = 176
              Height = 45
              Align = alClient
              DataSource = DMAmortizacion.DSQMInmovilizadoCoste
              Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoCambiarColumna = False
              AutoPostEnCheckBox = False
              AutoStartDrag = False
              AutoStartDragInterval = 0
              IndiceBitmapOrdenable = 0
              IndiceBitmapAscendente = 1
              IndiceBitmapChecked = 3
              IndiceBitmapDescendente = -1
              BaseDeDatos = DMMain.DataBase
              Transaction = DMAmortizacion.TLocal
              BuscarNums = False
              Campos.Strings = (
                'DIGITO_1'
                'DIGITO_2'
                'DIGITO_3'
                'DIGITO_4'
                'DIGITO_5')
              CamposAMostrar.Strings = (
                'DIGITO_1'
                '0'
                'DIGITO_2'
                '0'
                'DIGITO_3'
                '0'
                'DIGITO_4'
                '0'
                'DIGITO_5'
                '0')
              CamposAMostrarAnchos.Strings = (
                '0'
                '0'
                '0'
                '0'
                '0')
              CamposADevolver.Strings = (
                ''
                ''
                ''
                ''
                '')
              CamposDesplegar.Strings = (
                '1'
                '1'
                '1'
                '1'
                '1')
              CampoAOrdenarColor = clInfoBk
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              MensajeNoExiste = False
              Numericos.Strings = (
                'LET_DIGITO'
                'LET_DIGITO'
                'LET_DIGITO'
                'LET_DIGITO'
                'LET_DIGITO')
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tablas.Strings = (
                'CON_CENTROS_COSTE'
                'CON_CENTROS_COSTE'
                'CON_CENTROS_COSTE'
                'CON_CENTROS_COSTE'
                'CON_CENTROS_COSTE')
              Acciones.Strings = (
                ''
                ''
                ''
                ''
                '')
              Titulos.Strings = (
                'TITULO'
                'TITULO'
                'TITULO'
                'TITULO'
                'TITULO')
              Posicion = tpCentrado
              OnBusqueda = DBGCentroCosteBusqueda
              Planes.Strings = (
                ''
                ''
                ''
                ''
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'LET_DIGITO'
                'LET_DIGITO'
                'LET_DIGITO'
                'LET_DIGITO'
                'LET_DIGITO')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'DIGITO_1'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIGITO_2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIGITO_3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIGITO_4'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIGITO_5'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PORCENTAJE'
                  Width = 49
                  Visible = True
                end>
            end
            object NavCentroCoste: THYMNavigator
              Left = 0
              Top = 0
              Width = 176
              Height = 21
              DataSource = DMAmortizacion.DSQMInmovilizadoCoste
              VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
              Align = alTop
              ParentShowHint = False
              PopupMenu = CECentroCostePMEdit
              ShowHint = True
              TabOrder = 1
              Visible = False
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CECentroCoste
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PNLNotas: TLFPanel
          Left = 0
          Top = 21
          Width = 806
          Height = 203
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBMemoNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 806
            Height = 203
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMAmortizacion.DSQMInmovilizado
            TabOrder = 0
          end
        end
        object TBArticulo: TLFToolBar
          Left = 0
          Top = 0
          Width = 806
          Height = 21
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLArticulo: TLFPanel
            Left = 0
            Top = 0
            Width = 506
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object DBENotasArticulo: TLFDbedit
              Left = 0
              Top = 0
              Width = 105
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMAmortizacion.DSQMInmovilizado
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
            object DBENotasTitulo: TLFDbedit
              Left = 106
              Top = 0
              Width = 400
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_ART'
              DataSource = DMAmortizacion.DSQMInmovilizado
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
          end
          object ToolButton2: TToolButton
            Left = 506
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 514
            Top = 0
            Width = 88
            Height = 21
            DataSource = DMAmortizacion.DSQMInmovilizado
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMemoNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 806
          Height = 224
          DataSource = DMAmortizacion.DSQMInmovilizado
          ReadOnly = True
          CamposAOrdenar.Strings = (
            'AMORTIZACION_ACUMULADA'
            'AMORTIZACION_AMUM_EJE'
            'ARTICULO'
            'COEFICIENTE'
            'CUENTA_ABONO'
            'CUENTA_AMORTIZACION'
            'CUENTA_GASTOS'
            'CUENTA_INMOVILIZADO'
            'FECHA_ADQUISICION'
            'FECHA_FIN_AMORTIZACION'
            'FECHA_INICIO'
            'FECHA_ULT_AMORTIZACION'
            'TIPO_AMORTIZACION'
            'TITULO_ART'
            'VALOR_ACTUAL'
            'VALOR_COMPRA'
            'VALOR_FIN_EJE'
            'VALOR_INI_EJE'
            'VALOR_RESIDUAL'
            'VIDA_UTIL')
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ART'
              Width = 381
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_COMPRA_CANAL'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN_AMORTIZACION'
              Width = 63
              Visible = True
            end>
        end
      end
    end
  end
  object PNLDetalle: TLFPanel [1]
    Left = 0
    Top = 282
    Width = 818
    Height = 242
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 22
      Width = 818
      Height = 168
      Align = alClient
      DataSource = DMAmortizacion.DSQMAmortizaciones
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      OnKeyDown = DBGFDetalleKeyDown
      OnKeyPress = DBGFDetalleKeyPress
      OnKeyUp = DBGFDetalleKeyUp
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMAmortizacion.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'CONTABILIZADO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_AMORTIZADO'
          Width = 128
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VALOR_AMORTIZADO_CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 84
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'AMORTIZACION_ACUMULADA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 129
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VALOR_ACTUAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 121
          Visible = True
        end
        item
          Alignment = taCenter
          Color = clInfoBk
          Expanded = False
          FieldName = 'CONTABILIZADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIC'
          Visible = True
        end>
    end
    object PCPie: TLFPageControl
      Left = 0
      Top = 190
      Width = 818
      Height = 52
      ActivePage = TSTotales
      Align = alBottom
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabPosition = tpBottom
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSTotales: TTabSheet
        Caption = 'Totales'
        object PNLPieTotales: TLFPanel
          Left = 0
          Top = 0
          Width = 810
          Height = 26
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LBLAmortAcum: TLFLabel
            Left = 8
            Top = 3
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Amort. Acumulada'
          end
          object LBLVActual: TLFLabel
            Left = 223
            Top = 3
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor actual'
          end
          object DBEAmortAcum: TLFDbedit
            Left = 100
            Top = 0
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'AMORTIZACION_ACUMULADA'
            DataSource = DMAmortizacion.DSQMInmovilizado
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
          object DBEValorActual: TLFDbedit
            Left = 285
            Top = 0
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'VALOR_ACTUAL'
            DataSource = DMAmortizacion.DSQMInmovilizado
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
        end
      end
      object TSEjercicio: TTabSheet
        Caption = 'Ejercicio Actual'
        ImageIndex = 1
        object PNLPieEjerActual: TLFPanel
          Left = 0
          Top = 0
          Width = 810
          Height = 26
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LBLVIniEjerc: TLFLabel
            Left = 13
            Top = 3
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'V. Inicio Ejercicio'
          end
          object LBLAmortEjer: TLFLabel
            Left = 194
            Top = 3
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Amort. A. Ejercicio'
          end
          object LBLVFinEjerc: TLFLabel
            Left = 394
            Top = 3
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'V. Fin Ejercicio'
          end
          object DBEValorIniEje: TLFDbedit
            Left = 100
            Top = 0
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'VALOR_INI_EJE'
            DataSource = DMAmortizacion.DSQMInmovilizado
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
          object DBEAmorAcumEje: TLFDbedit
            Left = 285
            Top = 0
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'AMORTIZACION_AMUM_EJE'
            DataSource = DMAmortizacion.DSQMInmovilizado
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
          object DBEValorFinEje: TLFDbedit
            Left = 470
            Top = 0
            Width = 84
            Height = 21
            Color = clInfoBk
            DataField = 'VALOR_FIN_EJE'
            DataSource = DMAmortizacion.DSQMInmovilizado
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
        end
      end
    end
    object TBPie: TLFToolBar
      Left = 0
      Top = 0
      Width = 818
      Height = 22
      AutoSize = True
      EdgeBorders = [ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 2
      Separators = True
      object NavDet: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = DMAmortizacion.DSQMAmortizaciones
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
        OnClickAfterAdjust = NavDetClickAfterAdjust
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 524
    Width = 818
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Complementario = TBPie
    Left = 624
    Top = 382
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 656
    Top = 382
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 530
    Top = 356
    object ALstAmortizaciones: TAction
      Category = 'Listados'
      Caption = 'Listado de Amortizaciones'
      Hint = 'Listado de Amortizaciones'
      ImageIndex = 14
      OnExecute = ALstAmortizacionesExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ATraspasa: TAction
      Category = 'Procesos'
      Caption = 'Traspasa a Contabilidad cuotas pendientes'
      Hint = 'Traspasa a Contabilidad cuotas pendientes'
      ImageIndex = 25
      OnExecute = ATraspasaExecute
    end
    object ATraspasaCuotas: TAction
      Category = 'Procesos'
      Caption = 'Traspasa cuotas de todos los Art'#237'culos'
      Hint = 'Traspasa cuotas de todos los art'#237'culos, excepto las bajas.'
      ImageIndex = 35
      OnExecute = ATraspasaCuotasExecute
    end
    object ABorraUno: TAction
      Category = 'Procesos'
      Caption = 'Borra el '#250'ltimo Asiento contable'
      Hint = 'Borra el '#250'ltimo Asiento contable'
      ImageIndex = 27
      OnExecute = ABorraUnoExecute
    end
    object ABorraTodos: TAction
      Category = 'Procesos'
      Caption = 'Borra todos los Asientos del Ejercicio'
      Hint = 'Borra todos los Asientos del Ejercicio de este articulo'
      ImageIndex = 27
      OnExecute = ABorraTodosExecute
    end
    object ABorrar: TAction
      Category = 'Procesos'
      Caption = 'Borra todos los Asientos de todos los Art'#237'culos'
      Hint = 'Borra todos los Asientos de TODOS los Art'#237'culos del ejercicio'
      ImageIndex = 27
      OnExecute = ABorrarExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AAsientoBaja: TAction
      Category = 'Procesos'
      Caption = 'Ver el Asiento de Baja'
      Hint = 'Ver el Asiento de Baja'
      ImageIndex = 13
      OnExecute = AAsientoBajaExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object AFiltrarPendientes: TAction
      Tag = 1
      Category = 'Filtros'
      Caption = 'Filtrar art'#237'culos con cuotas pendientes'
      Hint = 
        'Filtrar art'#237'culos con cuotas pendientes de contabilizar.'#13#10'Tiene ' +
        'en cuenta la fecha de trabajo como l'#237'mite.'
      ImageIndex = 56
      OnExecute = AFiltrarPendientesExecute
    end
    object AFiltrarBajasPendientes: TAction
      Category = 'Filtros'
      Caption = 'Filtrar art'#237'culos con bajas pendientes'
      Hint = 
        'Filtrar art'#237'culos con bajas pendientes de contabilizar'#13#10'Tiene en' +
        ' cuenta la fecha de trabajo como l'#237'mite.'
      ImageIndex = 90
      OnExecute = AFiltrarBajasPendientesExecute
    end
    object AQuitaFiltro: TAction
      Category = 'Filtros'
      Caption = 'Muestra todos los art'#237'culos'
      Hint = 'Muestra todos los art'#237'culos'
      ImageIndex = 109
      OnExecute = AQuitaFiltroExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosInmovilizado: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Inmovilizado'
      Hint = 'Visualiza los adjuntos del Inmovilizado'
      ImageIndex = 59
      OnExecute = AAdjuntosInmovilizadoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 566
    Top = 354
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = PMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 624
    Top = 442
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 656
    Top = 442
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLNotas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 624
    Top = 412
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 656
    Top = 412
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECentroCoste: TControlEdit
    PopUpMenu = CECentroCostePMEdit
    Teclas = DMMain.Teclas
    Left = 624
    Top = 352
  end
  object CECentroCostePMEdit: TPopUpTeclas
    Left = 656
    Top = 352
    object CECentroCosteMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CECentroCosteMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECentroCosteMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECentroCosteMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CECentroCosteMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECentroCosteMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECentroCosteMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CECentroCosteMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECentroCosteMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECentroCosteMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
