inherited FMGenFormasPago: TFMGenFormasPago
  Left = 564
  Top = 286
  Width = 646
  Height = 432
  HelpContext = 154
  ActiveControl = NavMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Formas de Pago de la Empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 636
    Height = 379
    inherited TBMain: TLFToolBar
      Width = 632
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = DMGenFormasPago.DSQMFormaPago
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETipo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBETipo
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 286
      end
      inherited TbuttComp: TToolButton
        Left = 294
        ImageIndex = 39
      end
    end
    inherited PCMain: TLFPageControl
      Width = 632
      Height = 349
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 624
          Height = 321
          inherited G2KTableLoc: TG2KTBLoc
            Left = 30
            Top = 6
            DataSource = DMGenFormasPago.DSQMFormaPago
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'FORMA_PAGO')
          end
          object LCodigo: TLFLabel
            Left = 68
            Top = 4
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
            FocusControl = DBETipo
          end
          object LTitulo: TLFLabel
            Left = 73
            Top = 26
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LTipoEfecto: TLFLabel
            Left = 57
            Top = 115
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Efecto'
          end
          object LBLPlazos: TLFLabel
            Left = 70
            Top = 93
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plazos'
          end
          object LBLPrimerPlazo: TLFLabel
            Left = 173
            Top = 92
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dias 1er Plazo'
          end
          object LBLRestoPlazos: TLFLabel
            Left = 307
            Top = 92
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Resto Plazos'
          end
          object LCuenta: TLFLabel
            Left = 67
            Top = 136
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LDatosAMostrar: TLFLabel
            Left = 113
            Top = 180
            Width = 175
            Height = 13
            Alignment = taRightJustify
            Caption = 'Datos Bancarios a mostrar en Ventas'
          end
          object LTipoPago: TLFLabel
            Left = 37
            Top = 158
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Pago'
            Visible = False
          end
          object LImporteMinimo: TLFLabel
            Left = 27
            Top = 267
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe M'#237'nimo'
            FocusControl = DBEImporteMinimo
          end
          object LFormaPagoAlternativa: TLFLabel
            Left = 50
            Top = 289
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alternativa'
          end
          object LTituloLargo: TLFLabel
            Left = 45
            Top = 48
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo Largo'
            FocusControl = DBETituloLargo
          end
          object LCuentaPagoComisionTarjeta: TLFLabel
            Left = 22
            Top = 223
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Comisi'#243'n'
          end
          object LComision: TLFLabel
            Left = 59
            Top = 245
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comisi'#243'n'
          end
          object DBETipo: TLFDbedit
            Left = 105
            Top = 0
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'FORMA_PAGO'
            DataSource = DMGenFormasPago.DSQMFormaPago
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
          object DBCBRemesar: TLFDBCheckBox
            Left = 460
            Top = 24
            Width = 150
            Height = 17
            Caption = '&Remesar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'REMESAR'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETitulo: TLFDbedit
            Left = 105
            Top = 22
            Width = 325
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 1
          end
          object DBCBProntoPago: TLFDBCheckBox
            Left = 460
            Top = 46
            Width = 150
            Height = 17
            Caption = '&Pronto Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PRONTO_PAGO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBSEPlazos: TDBSpinEdit
            Left = 105
            Top = 88
            Width = 57
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 3
            Value = 0
            DataField = 'PLAZOS'
            DataSource = DMGenFormasPago.DSQMFormaPago
          end
          object DBSEPrimerPlazo: TDBSpinEdit
            Left = 245
            Top = 88
            Width = 57
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 4
            Value = 0
            DataField = 'DIAS_1_PLAZO'
            DataSource = DMGenFormasPago.DSQMFormaPago
          end
          object DBSERestoPlazos: TDBSpinEdit
            Left = 373
            Top = 88
            Width = 57
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 5
            Value = 0
            DataField = 'DIAS_E_PLAZOS'
            DataSource = DMGenFormasPago.DSQMFormaPago
          end
          object DBEFCuenta: TLFDBEditFind2000
            Left = 105
            Top = 132
            Width = 101
            Height = 21
            DataField = 'CUENTA_PAGO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 8
            OnChange = DBEFCuentaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFCuentaVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECuenta: TLFEdit
            Left = 207
            Top = 132
            Width = 223
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
            TabOrder = 9
          end
          object DBEFTipoEfecto: TLFDBEditFind2000
            Left = 105
            Top = 110
            Width = 45
            Height = 21
            DataField = 'TIPO_EFECTO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 6
            OnChange = DBEFTipoEfectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_EFECTO'
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
          object ETipoEfecto: TLFEdit
            Left = 151
            Top = 110
            Width = 279
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
          object DBCBPagoAutomatico: TLFDBCheckBox
            Left = 460
            Top = 68
            Width = 150
            Height = 17
            Caption = 'Pago &Autom'#225'tico'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PAGO_AUTOMATICO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBVDatosBancarios: TDBComboBoxValue
            Left = 291
            Top = 176
            Width = 139
            Height = 21
            Style = csDropDownList
            DataField = 'DATOS_BANCARIOS'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ItemHeight = 13
            Items.Strings = (
              'Ninguno'
              'Datos del Cliente'
              'Datos de la Empresa')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 11
          end
          object DBCBHeredaFinanciacion: TLFDBCheckBox
            Left = 460
            Top = 113
            Width = 150
            Height = 17
            Caption = 'Hereda Financiaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'HEREDA_FINANCIACION'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBOrdenarPago: TLFDBCheckBox
            Left = 460
            Top = 157
            Width = 150
            Height = 17
            Caption = 'Ordenar Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 19
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ORDENAR_PAGO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBMesNatural: TLFDBCheckBox
            Left = 460
            Top = 90
            Width = 150
            Height = 17
            Caption = 'Pago en Mes Natural'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 16
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBMesNaturalChange
            DataField = 'MES_NATURAL'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBTipoPago: TDBComboBox
            Left = 105
            Top = 154
            Width = 64
            Height = 21
            DataField = 'TIPO_PAGO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ItemHeight = 13
            Items.Strings = (
              'T'
              'C')
            TabOrder = 10
            Visible = False
          end
          object DBCBAceptar: TLFDBCheckBox
            Left = 460
            Top = 135
            Width = 150
            Height = 17
            Caption = 'Aceptacion/Confirming'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 18
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBAceptarChange
            DataField = 'ACEPTAR'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEImporteMinimo: TLFDbedit
            Left = 105
            Top = 264
            Width = 101
            Height = 21
            DataField = 'IMPORTE_MINIMO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 26
          end
          object DBEFPagoAlternativa: TLFDBEditFind2000
            Left = 105
            Top = 286
            Width = 45
            Height = 21
            DataField = 'FORMA_ALTERNATIVA'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 27
            OnChange = DBEFPagoAlternativaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'FORMA_PAGO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloFormaPagoAlternativa: TLFEdit
            Left = 151
            Top = 286
            Width = 279
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 28
          end
          object DBCBPedirDetallesDePago: TLFDBCheckBox
            Left = 460
            Top = 179
            Width = 150
            Height = 17
            Caption = 'Pedir Detalles de Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 20
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PEDIR_DETALLE_PAGO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETituloLargo: TLFDbedit
            Left = 105
            Top = 44
            Width = 325
            Height = 21
            DataField = 'TITULO_LARGO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 2
            OnEnter = DBETituloLargoEnter
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 460
            Top = 2
            Width = 150
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCuentaPagoComisionTarjeta: TLFDBEditFind2000
            Left = 105
            Top = 220
            Width = 101
            Height = 21
            DataField = 'CUENTA_PAGO_COMISION_TARJETA'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 22
            OnChange = DBEFCuentaPagoComisionTarjetaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnVerificacion = DBEFCuentaPagoComisionTarjetaVerificacion
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECuentaPagoComisionTarjeta: TLFEdit
            Left = 207
            Top = 220
            Width = 223
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
            TabOrder = 23
          end
          object DBCBDivideAsientoComisionTarjeta: TLFDBCheckBox
            Left = 209
            Top = 243
            Width = 218
            Height = 17
            Caption = 'Divide Asiento Comisi'#243'n Tarjeta'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 25
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DIVIDE_ASIENTO_COMISION_TARJETA'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEComision: TLFDbedit
            Left = 105
            Top = 242
            Width = 101
            Height = 21
            DataField = 'COMISION_TARJETA'
            DataSource = DMGenFormasPago.DSQMFormaPago
            TabOrder = 24
          end
          object DBCHSinRecibos: TLFDBCheckBox
            Left = 460
            Top = 202
            Width = 150
            Height = 17
            Caption = 'No generar recibos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 21
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SIN_RECIBOS'
            DataSource = DMGenFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSSeries: TTabSheet [1]
        Caption = 'Series'
        ImageIndex = 2
        object PNSeries: TLFPanel
          Left = 0
          Top = 0
          Width = 624
          Height = 321
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PCSeries: TLFPageControl
            Left = 0
            Top = 0
            Width = 624
            Height = 292
            ActivePage = TEFichaSerie
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            TabPosition = tpBottom
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TEFichaSerie: TTabSheet
              Caption = 'Ficha'
              object PnlSerie: TLFPanel
                Left = 0
                Top = 0
                Width = 616
                Height = 266
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object LSerie: TLFLabel
                  Left = 62
                  Top = 62
                  Width = 24
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Serie'
                end
                object LCuentaPagoSerie: TLFLabel
                  Left = 52
                  Top = 83
                  Width = 34
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cuenta'
                end
                object LCuentaComisionSerie: TLFLabel
                  Left = 11
                  Top = 105
                  Width = 77
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cuenta Comison'
                end
                object DBEFCuentaPagoSerie: TLFDBEditFind2000
                  Left = 91
                  Top = 80
                  Width = 102
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'CUENTA_PAGO'
                  DataSource = DMGenFormasPago.DSQMSeries
                  TabOrder = 1
                  OnChange = DBEFCuentaPagoSerieChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'CON_CUENTAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  CondicionBusqueda = 'TIPO=5'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OnVerificacion = DBEFCuentaPagoSerieVerificacion
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DBEFSerie: TLFDBEditFind2000
                  Left = 91
                  Top = 58
                  Width = 102
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'SERIE'
                  DataSource = DMGenFormasPago.DSQMSeries
                  TabOrder = 0
                  OnChange = DBEFSerieChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'VER_SERIES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'SERIE'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = False
                  OrdenadoPor.Strings = (
                    'SERIE')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object ESerie: TLFEdit
                  Left = 194
                  Top = 58
                  Width = 275
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 2
                end
                object ECuentaPagoSerie: TLFEdit
                  Left = 194
                  Top = 80
                  Width = 275
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object DBEFCuentaPagoComisionTarjetaSerie: TLFDBEditFind2000
                  Left = 92
                  Top = 102
                  Width = 101
                  Height = 21
                  DataField = 'CUENTA_PAGO_COMISION_TARJETA'
                  DataSource = DMGenFormasPago.DSQMSeries
                  TabOrder = 4
                  OnChange = DBEFCuentaPagoComisionTarjetaSerieChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = False
                  Tabla_a_buscar = 'CON_CUENTAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'CUENTA'
                  CampoStr = 'TITULO'
                  CondicionBusqueda = 'TIPO=5'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = False
                  SalirSiVacio = True
                  OnVerificacion = DBEFCuentaPagoComisionTarjetaSerieVerificacion
                  OrdenadoPor.Strings = (
                    'CUENTA')
                  Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
                  Entorno = DMMain.EntornoBusqueda
                end
                object ECuentaPagoComisionTarjetaSerie: TLFEdit
                  Left = 194
                  Top = 102
                  Width = 275
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
                  TabOrder = 5
                end
                object DBCBDivideAsientoComisionTarjetaSerie: TLFDBCheckBox
                  Left = 92
                  Top = 124
                  Width = 218
                  Height = 17
                  Caption = 'Divide Asiento Comisi'#243'n Tarjeta'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 6
                  TabStop = True
                  Alignment = taLeftJustify
                  DataField = 'DIVIDE_ASIENTO_COMISION_TARJETA'
                  DataSource = DMGenFormasPago.DSQMSeries
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
            end
            object TSTablaSerie: TTabSheet
              Caption = 'Tabla'
              ImageIndex = 1
              object DBGFSeries: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 483
                Height = 266
                Align = alClient
                Color = clInfoBk
                DataSource = DMGenFormasPago.DSQMSeries
                ReadOnly = True
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
                IndiceBitmapAscendente = 0
                IndiceBitmapChecked = -1
                IndiceBitmapDescendente = 0
                BaseDeDatos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA_PAGO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO'
                    Width = 286
                    Visible = True
                  end>
              end
            end
          end
          object TBSerie: TLFToolBar
            Left = 0
            Top = 292
            Width = 624
            Height = 29
            Align = alBottom
            Caption = 'TBSerie'
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            TabOrder = 1
            Separators = True
            object NavSerie: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMGenFormasPago.DSQMSeries
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBEFCuentaPagoSerie
              InsertaControl = DBEFSerie
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
        end
      end
      object TSSuplemento: TTabSheet [2]
        Caption = 'Suplemento'
        ImageIndex = 3
        object PNLSuplemento: TLFPanel
          Left = 0
          Top = 0
          Width = 624
          Height = 321
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PMSuplemento: TLFPageControl
            Left = 0
            Top = 0
            Width = 624
            Height = 292
            ActivePage = TSFichaSuplemento
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            TabPosition = tpBottom
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSFichaSuplemento: TTabSheet
              Caption = 'Ficha'
              object PNLFichaSuplemento: TLFPanel
                Left = 0
                Top = 0
                Width = 616
                Height = 266
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 0
                object LTrasnsportista: TLFLabel
                  Left = 4
                  Top = 62
                  Width = 66
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Trasnsportista'
                end
                object LPais: TLFLabel
                  Left = 50
                  Top = 84
                  Width = 20
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Pais'
                end
                object LImporteSuplemento: TLFLabel
                  Left = 35
                  Top = 105
                  Width = 35
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Importe'
                end
                object DBEPaisSuplemento: TLFDBEditFind2000
                  Left = 75
                  Top = 80
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'PAIS'
                  DataSource = DMGenFormasPago.DSQMSuplemento
                  TabOrder = 1
                  OnChange = DBEPaisSuplementoChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'SYS_PAISES'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'PAIS'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = True
                  SalirSiVacio = True
                  OnVerificacion = DBEFCuentaPagoSerieVerificacion
                  OrdenadoPor.Strings = (
                    'PAIS')
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                end
                object DBEAcreedorSuplemento: TLFDBEditFind2000
                  Left = 75
                  Top = 58
                  Width = 107
                  Height = 21
                  CharCase = ecUpperCase
                  DataField = 'ACREEDOR'
                  DataSource = DMGenFormasPago.DSQMSuplemento
                  TabOrder = 0
                  OnChange = DBEAcreedorSuplementoChange
                  AutoCambiarFoco = False
                  Base_de_datos = DMMain.DataBase
                  BuscarNums = True
                  Tabla_a_buscar = 'VER_TRANSPORTISTAS'
                  Tabla_asociada.DesplegarBusqueda = False
                  CampoNum = 'TRANSPORTISTA'
                  CampoStr = 'TITULO'
                  ReemplazarCaracter = True
                  SalirSiNoExiste = True
                  SalirSiVacio = True
                  OrdenadoPor.Strings = (
                    'TRANSPORTISTA')
                  Filtros = [obEmpresa]
                  Entorno = DMMain.EntornoBusqueda
                end
                object EAcreedorSuplemento: TLFEdit
                  Left = 183
                  Top = 58
                  Width = 275
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 3
                end
                object EPaisSuplemento: TLFEdit
                  Left = 183
                  Top = 80
                  Width = 275
                  Height = 21
                  Color = clInfoBk
                  Enabled = False
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 4
                end
                object DBELImporteSuplemento: TLFDbedit
                  Left = 75
                  Top = 102
                  Width = 107
                  Height = 21
                  DataField = 'IMPORTE_SUPLEMENTO'
                  DataSource = DMGenFormasPago.DSQMSuplemento
                  TabOrder = 2
                end
              end
            end
            object TSTablaSuplemento: TTabSheet
              Caption = 'Tabla'
              ImageIndex = 1
              object DBGSuplemento: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 483
                Height = 218
                Align = alClient
                Color = clInfoBk
                DataSource = DMGenFormasPago.DSQMSuplemento
                ReadOnly = True
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
                IndiceBitmapAscendente = 0
                IndiceBitmapChecked = -1
                IndiceBitmapDescendente = 0
                BaseDeDatos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ACREEDOR'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO'
                    Width = 268
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAIS'
                    Width = 30
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IMPORTE_SUPLEMENTO'
                    Width = 72
                    Visible = True
                  end>
              end
            end
          end
          object TBSuplemento: TLFToolBar
            Left = 0
            Top = 292
            Width = 624
            Height = 29
            Align = alBottom
            Caption = 'TBSerie'
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            TabOrder = 1
            Separators = True
            object NavSuplemento: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMGenFormasPago.DSQMSuplemento
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBELImporteSuplemento
              InsertaControl = DBEAcreedorSuplemento
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 624
          Height = 321
          DataSource = DMGenFormasPago.DSQMFormaPago
          CamposAMarcar.Strings = (
            'ACEPTAR'
            'ACTIVO'
            'DIVIDE_ASIENTO_COMISION_TARJETA'
            'HEREDA_FINANCIACION'
            'MES_NATURAL'
            'ORDENAR_PAGO'
            'PAGO_AUTOMATICO'
            'PEDIR_DETALLE_PAGO'
            'PRONTO_PAGO'
            'REMESAR'
            'SIN_RECIBOS')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'CUENTA_PAGO'
            'DIAS_1_PLAZO'
            'DIAS_E_PLAZOS'
            'FORMA_PAGO'
            'PLAZOS'
            'REMESAR'
            'TIPO_EFECTO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 264
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLAZOS'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAS_1_PLAZO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAS_E_PLAZOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_EFECTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMESAR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 379
    Width = 636
  end
  inherited CEMain: TControlEdit
    Left = 314
    Top = 16
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 350
    Top = 20
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 314
    Top = 62
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARegeneraFP: TAction
      Category = 'Procesos'
      Caption = 'Regenera las Formas de Pago'
      Hint = 'Regenera las Formas de Pago'
      ImageIndex = 39
      OnExecute = ARegeneraFPExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 354
    Top = 62
  end
end
