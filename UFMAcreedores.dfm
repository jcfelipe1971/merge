inherited FMAcreedores: TFMAcreedores
  Left = 435
  Top = 222
  Width = 930
  Height = 590
  HelpContext = 60
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Acreedores'
  FormStyle = fsNormal
  PopupMenu = CEAvisosPMEdit
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 920
    Height = 537
    inherited TBMain: TLFToolBar
      Width = 916
      inherited NavMain: THYMNavigator
        DataSource = DMAcreedores.DSQMAcreedores
        Hints.Strings = ()
        EditaControl = DBEFTipo
        InsertaControl = DBEAcreedor
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Listado de Carga de Transportistas'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        Busca01 = DBEAcreedor
        Busca02 = DBEFTercero
        Busca03 = DBECuenta
        Busca04 = DBEDiaPago1
        Busca05 = DBEDtoPP
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 296
        Hint = 'Muestra la informaci'#243'n del tercero asociado al acreedor'
        Visible = True
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 916
      Height = 507
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        object SBATercero: TSpeedButton [0]
          Left = 134
          Top = 30
          Width = 153
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBATerceroDblClick
        end
        object SBAContaExtracto: TSpeedButton [1]
          Left = 134
          Top = 30
          Width = 153
          Height = 21
          Hint = 'Doble click para ver extracto contable'
          GroupIndex = -1
          OnDblClick = SBAContaExtractoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 908
          Height = 479
          inherited G2KTableLoc: TG2KTBLoc
            Left = 15
            CamposADesplegar.Strings = (
              'NOMBRE_R_SOCIAL')
            DataSource = DMAcreedores.DSQMAcreedores
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ACREEDORES_CUENTAS'
            CampoNum = 'ACREEDOR'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ACREEDOR')
          end
          object LBLAcreedor: TLFLabel
            Left = 86
            Top = 20
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acreedor'
          end
          object LBLTercero: TLFLabel
            Left = 92
            Top = 42
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLDiaPago: TLFLabel
            Left = 83
            Top = 218
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'a Pago'
          end
          object LBLFormaPago: TLFLabel
            Left = 72
            Top = 86
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LBLCuenta: TLFLabel
            Left = 303
            Top = 20
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LBLTipo: TLFLabel
            Left = 108
            Top = 64
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBLDtoProntoPago: TLFLabel
            Left = 275
            Top = 218
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Pronto Pago'
          end
          object LBLModoIVa: TLFLabel
            Left = 82
            Top = 152
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object LBLRetencion: TLFLabel
            Left = 80
            Top = 306
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retenci'#243'n'
            FocusControl = DBEDtoPP
          end
          object LBMoneda: TLFLabel
            Left = 90
            Top = 130
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LCuentaGastos: TLFLabel
            Left = 59
            Top = 284
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Gastos'
          end
          object LPorCinanciacion: TLFLabel
            Left = 434
            Top = 218
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Por. Financiaci'#243'n'
          end
          object LCtaDtoPP: TLFLabel
            Left = 70
            Top = 240
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Dto. PP'
            FocusControl = DBEDtoPP
          end
          object LTipoNCF: TLFLabel
            Left = 84
            Top = 349
            Width = 45
            Height = 13
            Caption = 'Tipo NCF'
          end
          object LIdioma: TLFLabel
            Left = 98
            Top = 328
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
          end
          object LBancoParaPagos: TLFLabel
            Left = 6
            Top = 109
            Width = 123
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco para realizar pagos'
            FocusControl = DBEDtoPP
          end
          object LblTipoTrans: TLFLabel
            Left = 54
            Top = 197
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Transporte'
          end
          object LblPais: TLFLabel
            Left = 106
            Top = 175
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LBloqueo: TLFLabel
            Left = 596
            Top = 262
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bloqueo'
          end
          object LMotivoBloqueo: TLFLabel
            Left = 603
            Top = 284
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo'
          end
          object LCuentaIRPF: TLFLabel
            Left = 83
            Top = 262
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. IRPF'
            FocusControl = DBEDtoPP
          end
          object LNIF: TLFLabel
            Left = 465
            Top = 20
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LFechaAlta: TLFLabel
            Left = 658
            Top = 20
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
          end
          object LCampo1: TLFLabel
            Left = 86
            Top = 394
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 1'
            FocusControl = DBECampo1
          end
          object LCampo2: TLFLabel
            Left = 86
            Top = 414
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 2'
            FocusControl = DBECampo2
          end
          object LCampo3: TLFLabel
            Left = 86
            Top = 437
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 3'
            FocusControl = DBECampo3
          end
          object LCampo4: TLFLabel
            Left = 86
            Top = 458
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 4'
            FocusControl = DBECampo4
          end
          object LCampo5: TLFLabel
            Left = 478
            Top = 392
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 5'
            FocusControl = DBECampo5
          end
          object LCampo6: TLFLabel
            Left = 478
            Top = 413
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 6'
            FocusControl = DBECampo6
          end
          object LCampo7: TLFLabel
            Left = 478
            Top = 436
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 7'
            FocusControl = DBECampo7
          end
          object LCampo8: TLFLabel
            Left = 478
            Top = 458
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 8'
            FocusControl = DBECampo8
          end
          object LProyecto: TLFLabel
            Left = 593
            Top = 306
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object DBEAcreedor: TLFDbedit
            Left = 135
            Top = 16
            Width = 66
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ACREEDOR'
            DataSource = DMAcreedores.DSQMAcreedores
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 135
            Top = 38
            Width = 66
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 3
            Accion = ANewTercero
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS                   '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
          end
          object DBETituloTercero: TLFDbedit
            Left = 202
            Top = 38
            Width = 383
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMAcreedores.DSxTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            OnDblClick = SBATerceroDblClick
            OnEnter = DBETituloTerceroEnter
          end
          object DBEDiaPago1: TLFDbedit
            Left = 135
            Top = 214
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_1'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 19
          end
          object DBEDtoPP: TLFDbedit
            Left = 361
            Top = 214
            Width = 65
            Height = 21
            DataField = 'DESCUENTO_PP'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 22
          end
          object DBEFormaPagoTit: TLFDbedit
            Left = 202
            Top = 82
            Width = 383
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxFormasPago
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
            Left = 341
            Top = 16
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CUENTA'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 1
            OnKeyDown = DBECuentaKeyDown
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 135
            Top = 60
            Width = 66
            Height = 21
            DataField = 'TIPO'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 5
            OnChange = DBEFTipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ACREEDOR    '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloTipo: TLFDbedit
            Left = 202
            Top = 60
            Width = 383
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxTipos
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
          object DBETituloModoIva: TLFDbedit
            Left = 202
            Top = 148
            Width = 383
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxIvaModos
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
          object DBEFTipoIRPF: TLFDBEditFind2000
            Left = 135
            Top = 302
            Width = 30
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 30
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_IRPF'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TIPO'
              'TITULO'
              'P_IRPF'
              'BASE')
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEPIRPF: TLFDbedit
            Left = 166
            Top = 302
            Width = 51
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_IRPF'
            DataSource = DMAcreedores.DSxIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
          end
          object DBETituloIRPF: TLFDbedit
            Left = 218
            Top = 302
            Width = 107
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 32
          end
          object DBCBAnticipos: TLFDBCheckBox
            Left = 607
            Top = 40
            Width = 230
            Height = 17
            Caption = 'Usar Anticipos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 40
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'USAR_ANTICIPOS'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 135
            Top = 82
            Width = 66
            Height = 21
            DataField = 'FORMA_PAGO'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'FORMA_PAGO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFModoIva: TLFDBEditFind2000
            Left = 135
            Top = 148
            Width = 66
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 13
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODO_IVA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MODO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MODO')
            Filtros = []
          end
          object DBEDiaPago2: TLFDbedit
            Left = 175
            Top = 214
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_2'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 20
          end
          object DBCBEvalFebSi: TLFDBCheckBox
            Left = 607
            Top = 150
            Width = 230
            Height = 17
            Caption = 'Obliga al d'#237'a 28 de Feb. en d'#237'a de pago siempre'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 45
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB_SI'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBEvalFeb: TLFDBCheckBox
            Left = 607
            Top = 172
            Width = 230
            Height = 17
            Caption = 'Evaluar Febrero en los d'#237'as de pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 46
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 135
            Top = 126
            Width = 66
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 11
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
          end
          object DBETituloMoneda: TLFDbedit
            Left = 202
            Top = 126
            Width = 383
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxMoneda
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
          object DBETitCuenta: TLFDbedit
            Left = 247
            Top = 280
            Width = 338
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxCuentas
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
          object DBEFCtaGastos: TLFDBEditFind2000
            Left = 135
            Top = 280
            Width = 111
            Height = 21
            DataField = 'CUENTA_GASTOS'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 28
            OnKeyDown = DBEFCtaGastosKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCBFinanciacion: TLFDBCheckBox
            Left = 607
            Top = 62
            Width = 230
            Height = 17
            Caption = 'Financiaci'#243'n por L'#237'quido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 41
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FINANCIACION'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPor_Financiacion: TLFDbedit
            Left = 520
            Top = 214
            Width = 65
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 23
          end
          object DBETitCtaDtoPP: TLFDbedit
            Left = 247
            Top = 236
            Width = 338
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxCuentaDto
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
          object DBEFCuentaDtoPP: TLFDBEditFind2000
            Left = 135
            Top = 236
            Width = 111
            Height = 21
            DataField = 'CUENTA_DTOPP'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 24
            OnKeyDown = ExpandirCadenaCtaTk
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCHTransportistaRapidoKri: TLFDBCheckBox
            Left = 607
            Top = 195
            Width = 230
            Height = 17
            Caption = 'Transportista R'#225'pido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 47
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TRANSPORTE_RAPIDO_KRI'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBGeneraTalones: TLFDBCheckBox
            Left = 607
            Top = 128
            Width = 230
            Height = 17
            Hint = 
              'Si est'#225' marcado se generaran talones automaticamente de los reci' +
              'bos de este acreedor'
            Caption = 'Genera talones autom'#225'ticos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 44
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GENERA_TALONES'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKBaja: TLFDBCheckBox
            Left = 59
            Top = 370
            Width = 89
            Height = 17
            Caption = 'Baja'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 36
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKBajaChange
            DataField = 'BAJA'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEMotivoBaja: TLFDbedit
            Left = 238
            Top = 368
            Width = 347
            Height = 21
            DataField = 'MOTIVO_BAJA'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 38
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 151
            Top = 368
            Width = 87
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = DMAcreedores.DSQMAcreedores
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 37
          end
          object DBLCBTipoNCF: TDBLookupComboBox
            Left = 135
            Top = 346
            Width = 190
            Height = 21
            DataField = 'TIPO_NCF'
            DataSource = DMAcreedores.DSQMAcreedores
            KeyField = 'TIPO_NCF'
            ListField = 'TITULO'
            ListSource = DMAcreedores.DSxTipoNCF
            TabOrder = 35
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 135
            Top = 324
            Width = 66
            Height = 21
            DataField = 'IDIOMA'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 33
            OnChange = DBEFIdiomaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IDIOMAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'IDIOMA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DEFECTO DESC, IDIOMA')
            Filtros = []
          end
          object ETituloIdioma: TLFEdit
            Left = 202
            Top = 324
            Width = 383
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
            TabOrder = 34
          end
          object DBChkBRECC: TLFDBCheckBox
            Left = 607
            Top = 105
            Width = 230
            Height = 18
            Caption = 'R'#233'gimen Especial de Criterio de Caja'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 43
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECC'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFBancoParaPagos: TLFDBEditFind2000
            Left = 135
            Top = 104
            Width = 66
            Height = 21
            Hint = 'Banco de la empresa a travez del cual se realizan los pagos.'
            CharCase = ecUpperCase
            DataField = 'BANCO_PAGOS'
            DataSource = DMAcreedores.DSQMAcreedores
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            OnChange = DBEFBancoParaPagosChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = False
            Plan.Strings = (
              'BANCO')
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloBancoParaPagos: TLFEdit
            Left = 202
            Top = 104
            Width = 383
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 10
          end
          object DBEFTipoTrans: TLFDBEditFind2000
            Left = 135
            Top = 192
            Width = 66
            Height = 21
            DataField = 'INTRA_TRANS'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 17
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPOS_TRANSPORTE'
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
          object DBETipoTrans: TLFDbedit
            Left = 202
            Top = 192
            Width = 247
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxTipoTrans
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object DBChkBIntra: TLFDBCheckBox
            Left = 607
            Top = 84
            Width = 230
            Height = 17
            Caption = 'Acreedor para INTRASTAT'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 42
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'INTRA'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 135
            Top = 170
            Width = 66
            Height = 21
            DataField = 'PAIS_C2'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 15
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS_C2'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PAIS_C2')
            Filtros = []
          end
          object DBEPais: TLFDbedit
            Left = 202
            Top = 170
            Width = 383
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAcreedores.DSxPais
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object DBCHTransportistaCreaRuta: TLFDBCheckBox
            Left = 607
            Top = 217
            Width = 230
            Height = 17
            Hint = 'El transportista crea ruta'
            Caption = 'Transportista Crea Ruta'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 48
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TRANSPORTISTA_CREA_RUTA'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBBloqueo: TDBComboBoxValue
            Left = 640
            Top = 258
            Width = 215
            Height = 21
            Hint = 'Tipo de bloqueo'
            Style = csDropDownList
            DataField = 'BLOQUEO'
            DataSource = DMAcreedores.DSQMAcreedores
            ItemHeight = 13
            Items.Strings = (
              'Sin mensaje'
              'Avisar'
              'Bloquear')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 50
          end
          object DBEMotivoBloqueo: TLFDbedit
            Left = 640
            Top = 280
            Width = 215
            Height = 21
            Hint = 'Motivo del bloqueo o aviso'
            DataField = 'MOTIVO_BLOQUEO'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 51
          end
          object DBCHTransportistaGeneraEnvio: TLFDBCheckBox
            Left = 607
            Top = 238
            Width = 230
            Height = 17
            Hint = 'El transportista crea ruta'
            Caption = 'Transportista Genera Env'#237'o Autom'#225'tico'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 49
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GENERA_ENVIO'
            DataSource = DMAcreedores.DSQMAcreedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCuentaIRPF: TLFDBEditFind2000
            Left = 135
            Top = 258
            Width = 111
            Height = 21
            DataField = 'CUENTA_IRPF'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 26
            OnChange = DBEFCuentaIRPFChange
            OnKeyDown = ExpandirCadenaCtaTk
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCuentaIRPF: TLFEdit
            Left = 247
            Top = 258
            Width = 338
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 27
            Text = 'Segun configuracion'
          end
          object DBENIF: TLFDbedit
            Left = 485
            Top = 16
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMAcreedores.DSQMAcreedores
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
          object DBEDiaPago3: TLFDbedit
            Left = 215
            Top = 214
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_3'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 21
          end
          object DBEFechaAlta: TLFDbedit
            Left = 712
            Top = 16
            Width = 112
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMAcreedores.DSQMAcreedores
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 39
          end
          object DBECampo1: TLFDbedit
            Left = 135
            Top = 390
            Width = 325
            Height = 21
            DataField = 'ALFA_1'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 54
          end
          object DBECampo2: TLFDbedit
            Left = 135
            Top = 412
            Width = 325
            Height = 21
            DataField = 'ALFA_2'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 55
          end
          object DBECampo3: TLFDbedit
            Left = 135
            Top = 434
            Width = 325
            Height = 21
            DataField = 'ALFA_3'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 56
          end
          object DBECampo4: TLFDbedit
            Left = 135
            Top = 456
            Width = 325
            Height = 21
            DataField = 'ALFA_4'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 57
          end
          object DBECampo5: TLFDbedit
            Left = 527
            Top = 389
            Width = 325
            Height = 21
            DataField = 'ALFA_5'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 58
          end
          object DBECampo6: TLFDbedit
            Left = 527
            Top = 411
            Width = 325
            Height = 21
            DataField = 'ALFA_6'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 59
          end
          object DBECampo7: TLFDbedit
            Left = 527
            Top = 433
            Width = 325
            Height = 21
            DataField = 'ALFA_7'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 60
          end
          object DBECampo8: TLFDbedit
            Left = 527
            Top = 455
            Width = 325
            Height = 21
            DataField = 'ALFA_8'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 61
          end
          object EProyecto: TLFEdit
            Left = 681
            Top = 302
            Width = 173
            Height = 21
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 53
          end
          object DBEFProyecto: TDBEditFind2000
            Left = 640
            Top = 302
            Width = 40
            Height = 21
            DataField = 'PROYECTO'
            DataSource = DMAcreedores.DSQMAcreedores
            TabOrder = 52
            OnChange = DBEFProyectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            CampoADevolver = 'PROYECTO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PNLENotas: TLFPanel
          Left = 0
          Top = 22
          Width = 908
          Height = 457
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object DBMMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 908
            Height = 457
            Align = alClient
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMAcreedores.DSQMAcreedores
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 908
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLDatosNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 369
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBECodNotas: TLFDbedit
              Left = 1
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'ACREEDOR'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEDesNotas: TLFDbedit
              Left = 68
              Top = 1
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 369
            Top = 0
            Width = 8
            Action = AAdjuntosAcreedor
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 377
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMAcreedores.DSQMAcreedores
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Align = alRight
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton2: TToolButton
            Left = 465
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtImprimirNotas: TToolButton
            Left = 473
            Top = 0
            Action = AImprimirNotas
          end
        end
      end
      object TSFacturaElectronica: TTabSheet [2]
        Caption = 'Fact. Elect.'
        ImageIndex = 8
        object TBTipoGiro: TLFToolBar
          Left = 0
          Top = 0
          Width = 917
          Height = 24
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavTipoGiro: THYMNavigator
            Left = 0
            Top = 2
            Width = 220
            Height = 22
            DataSource = DMAcreedores.DSxTipoGiro
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFTipoGiro
            InsertaControl = DBGFTipoGiro
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavMainClickAfterAdjust
          end
        end
        object DBGFTipoGiro: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 917
          Height = 392
          Align = alClient
          DataSource = DMAcreedores.DSxTipoGiro
          TabOrder = 1
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
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'CODIGO_GIRO')
          CamposAMostrar.Strings = (
            'CODIGO_GIRO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'DEFECTO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODIGO')
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tablas.Strings = (
            'SYS_TIPO_GIRO')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CODIGO'
            'DIRECCION')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_GIRO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 761
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 43
              Visible = True
            end>
        end
      end
      object TSEstadisticas: TTabSheet [3]
        Caption = 'Estad'#237'sticas'
        OnHide = TSEstadisticasHide
        OnShow = TSEstadisticasShow
        object TBEstado: TLFToolBar
          Left = 0
          Top = 0
          Width = 908
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLDatosEstadisticas: TLFPanel
            Left = 0
            Top = 0
            Width = 369
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object LFEstadAcr: TLFDbedit
              Left = 1
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'ACREEDOR'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              TabOrder = 0
            end
            object LFEstadAcrTitulo: TLFDbedit
              Left = 68
              Top = 1
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              TabOrder = 1
            end
          end
        end
        object LFPCEstadisticas: TLFPageControl
          Left = 0
          Top = 22
          Width = 908
          Height = 457
          ActivePage = TSDocumentos
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSDocumentos: TTabSheet
            Caption = 'Documentos'
            object FPDocumentos: TFlatPanel
              Left = 3
              Top = 11
              Width = 768
              Height = 54
              ParentColor = True
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              TabOrder = 0
              object LFLFactPend: TLFLabel
                Left = 134
                Top = 27
                Width = 97
                Height = 13
                Alignment = taRightJustify
                Caption = 'Facturas Pendientes'
              end
              object LNum: TLFLabel
                Left = 239
                Top = 8
                Width = 49
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Num.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LBaseImponible: TLFLabel
                Left = 291
                Top = 8
                Width = 113
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Base Imponible'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LLiquido: TLFLabel
                Left = 407
                Top = 8
                Width = 121
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'L'#237'quido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object SBVerFacPend: TSpeedButton
                Left = 48
                Top = 24
                Width = 23
                Height = 22
                Action = AFactPendDet
                OnDblClick = AFactPendDetExecute
              end
              object LFEFactPend: TLFEdit
                Left = 532
                Top = 24
                Width = 52
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
                TabOrder = 0
              end
              object LFDEFactPendLIQUIDO: TLFDbedit
                Left = 408
                Top = 24
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'T_FAC_PEND'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
                OnDblClick = AATerceroExecute
              end
              object LFDEFactPendBASE: TLFDbedit
                Left = 291
                Top = 24
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_FAC_PEND'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 2
              end
              object LFDEFactPendNUMERO: TLFDbedit
                Left = 239
                Top = 24
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_FAC_PEND'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 3
              end
            end
            object FPImpagados: TFlatPanel
              Left = 2
              Top = 62
              Width = 769
              Height = 134
              ParentColor = True
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              TabOrder = 1
              object LRecPend: TLFLabel
                Left = 136
                Top = 85
                Width = 95
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Pendientes'
              end
              object LRecPendRetraso: TLFLabel
                Left = 327
                Top = 111
                Width = 76
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dias de Retraso'
              end
              object LRecPendPlazo: TLFLabel
                Left = 157
                Top = 109
                Width = 74
                Height = 13
                Alignment = taRightJustify
                Caption = 'Plazo  de cobro'
              end
              object LRecNoCob: TLFLabel
                Left = 127
                Top = 61
                Width = 104
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos No Cobrados'
              end
              object LRecImp: TLFLabel
                Left = 137
                Top = 37
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Impagados'
              end
              object SBVerImpagados: TSpeedButton
                Left = 48
                Top = 40
                Width = 23
                Height = 22
                Action = ARecibosImpagados
                OnDblClick = ARecibosImpagadosExecute
              end
              object SBVerNoCob: TSpeedButton
                Left = 49
                Top = 67
                Width = 23
                Height = 22
                Action = ARecibosPendientesNoCob
                OnDblClick = ARecibosPendientesNoCobExecute
              end
              object SBVerPendientes: TSpeedButton
                Left = 51
                Top = 94
                Width = 23
                Height = 22
                Action = ARecibosPendientesPend
                OnDblClick = ARecibosPendientesPendExecute
              end
              object SBVerFacCob: TSpeedButton
                Left = 48
                Top = 11
                Width = 23
                Height = 22
                Action = AFactCobDet
                OnDblClick = AFactCobDetExecute
              end
              object LFFactCobr: TLFLabel
                Left = 142
                Top = 14
                Width = 89
                Height = 13
                Alignment = taRightJustify
                Caption = 'Facturas Cobradas'
              end
              object LFEEstadoRecPend: TLFEdit
                Left = 408
                Top = 83
                Width = 52
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
                TabOrder = 0
              end
              object LFDERecImpagadosIMPORTE: TLFDbedit
                Left = 291
                Top = 35
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_IMPAGADO'
                DataSource = DMAcreedores.DSxfactPend
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
              object LFEEstadoRecImp: TLFEdit
                Left = 408
                Top = 59
                Width = 52
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
              object LFEEstadoRecNoCob: TLFEdit
                Left = 408
                Top = 35
                Width = 52
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
              object LFDERecImpagadosNUMERO: TLFDbedit
                Left = 239
                Top = 35
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_IMPAGADO'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                TabOrder = 4
              end
              object LFDERecNoCobradosIMPORTE: TLFDbedit
                Left = 292
                Top = 59
                Width = 112
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_COBRAR'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object LFDERecPendIMPORTE: TLFDbedit
                Left = 292
                Top = 83
                Width = 112
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_RECIBIR'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object LFDERecNoCobradosNUMERO: TLFDbedit
                Left = 239
                Top = 59
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_COBRAR'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                TabOrder = 7
              end
              object LFDERecPendNUMERO: TLFDbedit
                Left = 239
                Top = 83
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_RECIBIR'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                TabOrder = 8
              end
              object LFDERecPendRetraso: TLFDbedit
                Left = 408
                Top = 107
                Width = 52
                Height = 21
                Color = clInfoBk
                DataField = 'MEDIA_DIAS_REC'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                TabOrder = 9
              end
              object LFDEREcPendPLazo: TLFDbedit
                Left = 239
                Top = 107
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'MEDIA_DIAS_PAGO'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                TabOrder = 10
              end
              object LFDFactCobrNUMERO: TLFDbedit
                Left = 239
                Top = 11
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PAGADO'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                TabOrder = 11
              end
              object LFDFactCobrBASE: TLFDbedit
                Left = 291
                Top = 11
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PAGADO'
                DataSource = DMAcreedores.DSxfactPend
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object LFEFactCobr: TLFEdit
                Left = 408
                Top = 11
                Width = 52
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
                TabOrder = 13
              end
            end
            object FlatPanel1: TFlatPanel
              Left = 3
              Top = 209
              Width = 768
              Height = 103
              ParentColor = True
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              TabOrder = 2
              object LPPRecibir: TLFLabel
                Left = 146
                Top = 8
                Width = 84
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pendiente Recibir'
              end
              object LAntCuenta: TLFLabel
                Left = 196
                Top = 83
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta'
              end
              object LPPCobrar: TLFLabel
                Left = 148
                Top = 31
                Width = 82
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pendiente Cobrar'
              end
              object LAnticipo: TLFLabel
                Left = 192
                Top = 59
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Caption = 'Anticipo'
              end
              object LFDEPPRecibirNUMERO: TLFDbedit
                Left = 239
                Top = 4
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_RECIBIR'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 0
              end
              object LFDEPPRecibirIMPORTE: TLFDbedit
                Left = 291
                Top = 4
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_RECIBIR'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 1
              end
              object LFEPPRecibir: TLFEdit
                Left = 408
                Top = 5
                Width = 52
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
              object LFEPPCobrar: TLFEdit
                Left = 408
                Top = 29
                Width = 52
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
              object LFDEAntCuenta: TLFDbedit
                Left = 239
                Top = 78
                Width = 165
                Height = 21
                Color = clInfoBk
                DataField = 'CUENTA_ANTICIPO'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 4
              end
              object LFEAnticipo: TLFEdit
                Left = 408
                Top = 53
                Width = 52
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
                TabOrder = 5
              end
              object LFDEPPCobrarIMPORTE: TLFDbedit
                Left = 291
                Top = 29
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_COBRAR'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 6
              end
              object LFDEPPCobrarNUMERO: TLFDbedit
                Left = 239
                Top = 29
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_COBRAR'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 7
              end
              object LFDEAnticipo: TLFDbedit
                Left = 239
                Top = 53
                Width = 165
                Height = 21
                Color = clInfoBk
                DataField = 'T_PAGADO'
                DataSource = DMAcreedores.DSxDocumentos
                Enabled = False
                TabOrder = 8
              end
            end
          end
          object TSGraficos: TTabSheet
            Caption = 'Gr'#225'ficos'
            ImageIndex = 1
            OnShow = TSGraficosShow
            object LFestadisticas: TLFPanel
              Left = 0
              Top = 0
              Width = 486
              Height = 431
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object LEnero: TLFLabel
                Left = 6
                Top = 77
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ene'
              end
              object LFebrero: TLFLabel
                Left = 7
                Top = 98
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Feb'
              end
              object LMarzo: TLFLabel
                Left = 7
                Top = 120
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Mar'
              end
              object LAbril: TLFLabel
                Left = 9
                Top = 143
                Width = 16
                Height = 13
                Alignment = taRightJustify
                Caption = 'Abr'
              end
              object LMayo: TLFLabel
                Left = 5
                Top = 167
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'May'
              end
              object LJunio: TLFLabel
                Left = 8
                Top = 187
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'Jun'
              end
              object LJulio: TLFLabel
                Left = 12
                Top = 209
                Width = 13
                Height = 13
                Alignment = taRightJustify
                Caption = 'Jul'
              end
              object LAgosto: TLFLabel
                Left = 6
                Top = 231
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ago'
              end
              object LSeptiembre: TLFLabel
                Left = 6
                Top = 252
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Sep'
              end
              object LOctubre: TLFLabel
                Left = 8
                Top = 274
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oct'
              end
              object LNoviembre: TLFLabel
                Left = 5
                Top = 297
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nov'
              end
              object LDiciembre: TLFLabel
                Left = 9
                Top = 319
                Width = 16
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dic'
              end
              object LFComparar: TLFLabel
                Left = 28
                Top = 46
                Width = 150
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '2004'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LFActual: TLFLabel
                Left = 180
                Top = 46
                Width = 150
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = '2005'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LFPrevision: TLFLabel
                Left = 332
                Top = 46
                Width = 149
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'PREVISI'#211'N 2005'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LTotal: TLFLabel
                Left = 1
                Top = 341
                Width = 26
                Height = 13
                Alignment = taRightJustify
                Caption = 'TOT'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LEstadisticasBaseEjercicio: TLFLabel
                Left = 28
                Top = 59
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LEstadisticasBaseEjercicioSig: TLFLabel
                Left = 180
                Top = 59
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LEstadisticasBasePrevision: TLFLabel
                Left = 332
                Top = 59
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Base'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LPorcentajeEstimacion: TLFLabel
                Left = 115
                Top = 4
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'Estimaci'#243'n  (%)'
              end
              object LFLEjercicioActual: TLFLabel
                Left = 0
                Top = 3
                Width = 61
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ejercicio 1'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LFLEjercicioComparar: TLFLabel
                Left = 0
                Top = 27
                Width = 61
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ejercicio 2'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LTipoDoc: TLFLabel
                Left = 247
                Top = 4
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo documento'
              end
              object LEstadisticasMoneda: TLFLabel
                Left = 285
                Top = 27
                Width = 39
                Height = 13
                Alignment = taRightJustify
                Caption = 'Moneda'
              end
              object LEstadisticasLiquidoEjercicio: TLFLabel
                Left = 104
                Top = 59
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'L'#237'quido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LEstadisticasLiquidoEjercicioSig: TLFLabel
                Left = 256
                Top = 59
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'L'#237'quido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LEstadisticasLiquidoPrevision: TLFLabel
                Left = 408
                Top = 59
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'L'#237'quido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEFBaseEneroAC: TLFDbedit
                Left = 180
                Top = 74
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEFBaseFebreroAC: TLFDbedit
                Left = 180
                Top = 96
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBEFBaseMarzoAC: TLFDbedit
                Left = 180
                Top = 118
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBEFBaseAbrilAC: TLFDbedit
                Left = 180
                Top = 140
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBEFBaseMayoAC: TLFDbedit
                Left = 180
                Top = 162
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBEFBaseJunioAC: TLFDbedit
                Left = 180
                Top = 184
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBEFBaseJulioAC: TLFDbedit
                Left = 180
                Top = 206
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object DBEFBaseAgostoAC: TLFDbedit
                Left = 180
                Top = 228
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEFBaseSeptiembreAC: TLFDbedit
                Left = 180
                Top = 250
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBEFBaseOctubreAC: TLFDbedit
                Left = 180
                Top = 272
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBEFBaseNoviembreAC: TLFDbedit
                Left = 180
                Top = 294
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object DBEFBaseDiciembreAC: TLFDbedit
                Left = 180
                Top = 316
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBEFBaseEneroCOMP: TLFDbedit
                Left = 28
                Top = 74
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
              object DBEFBaseFebreroCOMP: TLFDbedit
                Left = 28
                Top = 96
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 13
              end
              object DBEFBaseMarzoCOMP: TLFDbedit
                Left = 28
                Top = 118
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
              end
              object DBEFBaseAbrilCOMP: TLFDbedit
                Left = 28
                Top = 140
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 15
              end
              object DBEFBaseMayoCOMP: TLFDbedit
                Left = 28
                Top = 162
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 16
              end
              object DBEFBaseJunioCOMP: TLFDbedit
                Left = 28
                Top = 184
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 17
              end
              object DBEFBaseJulioCOMP: TLFDbedit
                Left = 28
                Top = 206
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object DBEFBaseAgostoCOMP: TLFDbedit
                Left = 28
                Top = 228
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 19
              end
              object DBEFBaseSeptiembreCOMP: TLFDbedit
                Left = 28
                Top = 250
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 20
              end
              object DBEFBaseOctubreCOMP: TLFDbedit
                Left = 28
                Top = 272
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 21
              end
              object DBEFBaseNoviembreCOMP: TLFDbedit
                Left = 28
                Top = 294
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 22
              end
              object DBEFBaseDiciembreCOMP: TLFDbedit
                Left = 28
                Top = 316
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 23
              end
              object DBEFBaseEneroPREV: TLFDbedit
                Left = 332
                Top = 74
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 24
              end
              object DBEFBaseFebreroPREV: TLFDbedit
                Left = 332
                Top = 96
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 25
              end
              object DBEFBaseMarzoPREV: TLFDbedit
                Left = 332
                Top = 118
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 26
              end
              object DBEFBaseAbrilPREV: TLFDbedit
                Left = 332
                Top = 140
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 27
              end
              object DBEFBaseMayoPREV: TLFDbedit
                Left = 332
                Top = 162
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 28
              end
              object DBEFBaseJunioPREV: TLFDbedit
                Left = 332
                Top = 184
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 29
              end
              object DBEFBaseJulioPREV: TLFDbedit
                Left = 332
                Top = 206
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 30
              end
              object DBEFBaseAgostoPREV: TLFDbedit
                Left = 332
                Top = 228
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 31
              end
              object DBEFBaseSeptiembrePREV: TLFDbedit
                Left = 332
                Top = 250
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 32
              end
              object DBEFBaseOctubrePREV: TLFDbedit
                Left = 332
                Top = 272
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 33
              end
              object DBEFBaseNoviembrePREV: TLFDbedit
                Left = 332
                Top = 294
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 34
              end
              object DBEFBaseDiciembrePREV: TLFDbedit
                Left = 332
                Top = 316
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 35
              end
              object DBEFTotalBaseAC: TLFDbedit
                Left = 180
                Top = 338
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMAcreedores.DSxFacturasAnual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 36
              end
              object DBEFTotalBaseCOMP: TLFDbedit
                Left = 28
                Top = 338
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMAcreedores.DSxFacturasAnualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 37
              end
              object DBEFTotalBasePREV: TLFDbedit
                Left = 332
                Top = 338
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMAcreedores.DSxPrevisionAnual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 38
              end
              object DBEFLiquidoEneroAC: TLFDbedit
                Left = 256
                Top = 74
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 39
              end
              object DBEFLiquidoFebreroAC: TLFDbedit
                Left = 256
                Top = 96
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 40
              end
              object DBEFLiquidoMarzoAC: TLFDbedit
                Left = 256
                Top = 118
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 41
              end
              object DBEFLiquidoAbrilAC: TLFDbedit
                Left = 256
                Top = 140
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 42
              end
              object DBEFLiquidoMayoAC: TLFDbedit
                Left = 256
                Top = 162
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 43
              end
              object DBEFLiquidoJunioAC: TLFDbedit
                Left = 256
                Top = 184
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 44
              end
              object DBEFLiquidoJulioAC: TLFDbedit
                Left = 256
                Top = 206
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JULIO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 45
              end
              object DBEFLiquidoAgostoAC: TLFDbedit
                Left = 256
                Top = 228
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 46
              end
              object DBEFLiquidoSeptiembreAC: TLFDbedit
                Left = 256
                Top = 250
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 47
              end
              object DBEFLiquidoOctubreAC: TLFDbedit
                Left = 256
                Top = 272
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 48
              end
              object DBEFLiquidoNoviembreAC: TLFDbedit
                Left = 256
                Top = 294
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 49
              end
              object DBEFLiquidoDiciembreAC: TLFDbedit
                Left = 256
                Top = 316
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 50
              end
              object DBEFTotalLiquidoAC: TLFDbedit
                Left = 256
                Top = 338
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMAcreedores.DSxFacturasAnual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 51
              end
              object DBEFLiquidoEneroCOMP: TLFDbedit
                Left = 104
                Top = 74
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 52
              end
              object DBEFLiquidoFebreroCOMP: TLFDbedit
                Left = 104
                Top = 96
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 53
              end
              object DBEFLiquidoMarzoCOMP: TLFDbedit
                Left = 104
                Top = 118
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 54
              end
              object DBEFLiquidoAbrilCOMP: TLFDbedit
                Left = 104
                Top = 140
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 55
              end
              object DBEFLiquidoMayoCOMP: TLFDbedit
                Left = 104
                Top = 162
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 56
              end
              object DBEFLiquidoJunioCOMP: TLFDbedit
                Left = 104
                Top = 184
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 57
              end
              object DBEFLiquidoJulioCOMP: TLFDbedit
                Left = 104
                Top = 206
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JULIO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 58
              end
              object DBEFLiquidoAgostoCOMP: TLFDbedit
                Left = 104
                Top = 228
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 59
              end
              object DBEFLiquidoSeptiembreCOMP: TLFDbedit
                Left = 104
                Top = 250
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 60
              end
              object DBEFLiquidoOctubreCOMP: TLFDbedit
                Left = 104
                Top = 272
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 61
              end
              object DBEFLiquidoNoviembreCOMP: TLFDbedit
                Left = 104
                Top = 294
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 62
              end
              object DBEFLiquidoDiciembreCOMP: TLFDbedit
                Left = 104
                Top = 316
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMAcreedores.DSxFacturasMensualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 63
              end
              object DBEFTotalLiquidoCOMP: TLFDbedit
                Left = 104
                Top = 338
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMAcreedores.DSxFacturasAnualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 64
              end
              object DBEFLiquidoEneroPREV: TLFDbedit
                Left = 408
                Top = 74
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 65
              end
              object DBEFLiquidoFebreroPREV: TLFDbedit
                Left = 408
                Top = 96
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 66
              end
              object DBEFLiquidoMarzoPREV: TLFDbedit
                Left = 408
                Top = 118
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 67
              end
              object DBEFLiquidoAbrilPREV: TLFDbedit
                Left = 408
                Top = 140
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 68
              end
              object DBEFLiquidoMayoPREV: TLFDbedit
                Left = 408
                Top = 162
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 69
              end
              object DBEFLiquidoJunioPREV: TLFDbedit
                Left = 408
                Top = 184
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 70
              end
              object DBEFLiquidoJulioPREV: TLFDbedit
                Left = 408
                Top = 206
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'B_JULIO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 71
              end
              object DBEFLiquidoAgostoPREV: TLFDbedit
                Left = 408
                Top = 228
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 72
              end
              object DBEFLiquidoSeptiembrePREV: TLFDbedit
                Left = 408
                Top = 250
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 73
              end
              object DBEFLiquidoOctubrePREV: TLFDbedit
                Left = 408
                Top = 272
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 74
              end
              object DBEFLiquidoNoviembrePREV: TLFDbedit
                Left = 408
                Top = 294
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 75
              end
              object DBEFLiquidoDiciembrePREV: TLFDbedit
                Left = 408
                Top = 316
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMAcreedores.DSxPrevisionMensual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 76
              end
              object DBEFTotalLiquidoPREV: TLFDbedit
                Left = 408
                Top = 338
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMAcreedores.DSxPrevisionAnual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -8
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 77
              end
              object EPorcentajeEstimacion: TLFEdit
                Left = 190
                Top = 0
                Width = 40
                Height = 21
                TabOrder = 80
              end
              object BBEjercicioComparar: TBitBtn
                Left = 401
                Top = 0
                Width = 71
                Height = 21
                Action = ACalculaEstadisticas
                Caption = 'Calcula ->'
                TabOrder = 83
              end
              object EEjercicio2: TLFEdit
                Left = 64
                Top = 23
                Width = 40
                Height = 21
                TabOrder = 79
              end
              object EEjercicio: TLFEdit
                Left = 64
                Top = 0
                Width = 40
                Height = 21
                TabOrder = 78
              end
              object CBTipoDoc: TLFComboBox
                Left = 329
                Top = 0
                Width = 61
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 81
                Text = 'FCR'
                Items.Strings = (
                  'FCR')
              end
              object BBMultiSelect: TBitBtn
                Left = 401
                Top = 23
                Width = 71
                Height = 21
                Caption = 'Multi-Selec'
                TabOrder = 84
                OnClick = BBMultiSelectClick
              end
              object CBMonedas: TLFComboBox
                Left = 329
                Top = 23
                Width = 61
                Height = 21
                ItemHeight = 13
                TabOrder = 82
              end
            end
            object LFGraficos: TLFPanel
              Left = 486
              Top = 0
              Width = 414
              Height = 431
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBCAnual: TDBChart
                Left = 0
                Top = 0
                Width = 423
                Height = 142
                Hint = 'Doble Click para Ampliar'
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                Title.Text.Strings = (
                  'VENTAS ANUALES')
                BottomAxis.LabelStyle = talNone
                LeftAxis.LabelStyle = talValue
                LeftAxis.TickInnerLength = 4
                Align = alTop
                BevelOuter = bvNone
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnDblClick = DBCAnualDblClick
                object Series7: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasAnualC_3
                  SeriesColor = clWhite
                  Title = 'Comparado -3'
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 'TOTAL_BASE'
                end
                object Series6: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasAnualC_2
                  SeriesColor = clBlue
                  Title = 'Comparado -2'
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 'TOTAL_BASE'
                end
                object Series5: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasAnualC_1
                  SeriesColor = clYellow
                  Title = 'Comparado -1'
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 'TOTAL_BASE'
                end
                object Series2: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasAnualCompara
                  SeriesColor = clRed
                  Title = 'Comparado'
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 'TOTAL_BASE'
                end
                object Series1: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasAnual
                  SeriesColor = clGreen
                  Title = 'Actual'
                  XLabelsSource = 'TOTAL_BASE'
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  XValues.ValueSource = 'TOTAL_BASE'
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 'TOTAL_BASE'
                end
              end
              object DBCPrevision: TDBChart
                Left = 0
                Top = 238
                Width = 423
                Height = 130
                Hint = 'Doble Click para Ampliar'
                AllowPanning = pmNone
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                MarginBottom = 0
                MarginLeft = 0
                MarginRight = 2
                MarginTop = 0
                Title.Text.Strings = (
                  'PREVISI'#211'N MENSUAL')
                BottomAxis.LabelsSeparation = 0
                BottomAxis.LabelStyle = talNone
                Legend.ColorWidth = 10
                Align = alBottom
                BevelOuter = bvNone
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
                Locked = True
                OnDblClick = DBCPrevisionDblClick
                object BarSeries2: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxPrevisionMensual
                  SeriesColor = clRed
                  Title = 'Prev'
                  BarWidthPercent = 60
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 
                    'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
                    'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
                end
                object BarSeries1: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasMensual
                  SeriesColor = clGreen
                  Title = 'Actual'
                  BarWidthPercent = 60
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 
                    'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
                    'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
                end
              end
              object DBCMensual: TDBChart
                Left = 0
                Top = 142
                Width = 423
                Height = 96
                Hint = 'Doble Click para Ampliar'
                AllowZoom = False
                BackWall.Brush.Color = clWhite
                BackWall.Brush.Style = bsClear
                Title.Text.Strings = (
                  'VENTAS MENSUALES')
                BottomAxis.LabelStyle = talNone
                Align = alClient
                BevelOuter = bvNone
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
                OnDblClick = DBCMensualDblClick
                object BarSeries4: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasMensualCompara
                  SeriesColor = clRed
                  Title = 'Comparado'
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 
                    'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
                    'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
                end
                object BarSeries3: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMAcreedores.DSxFacturasMensual
                  SeriesColor = 4227072
                  Title = 'Actual'
                  XValues.DateTime = False
                  XValues.Name = 'X'
                  XValues.Multiplier = 1
                  XValues.Order = loAscending
                  YValues.DateTime = False
                  YValues.Name = 'Bar'
                  YValues.Multiplier = 1
                  YValues.Order = loNone
                  YValues.ValueSource = 
                    'B_ENERO;B_FEBRERO;B_MARZO;B_ABRIL;B_MAYO;B_JUNIO;B_JULIO;B_AGOST' +
                    'O;B_SEPTIEMBRE;B_OCTUBRE;B_NOVIEMBRE;B_DICIEMBRE'
                end
              end
            end
          end
        end
      end
      object TSCompras: TTabSheet [4]
        Caption = 'Compras'
        ImageIndex = 7
        OnHide = TSComprasHide
        OnShow = TSComprasShow
        object PCCompras: TLFPageControl
          Left = 0
          Top = 44
          Width = 908
          Height = 435
          ActivePage = TSComrasDocumentos
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSComrasDocumentos: TTabSheet
            Caption = 'Documentos'
            OnShow = TSComrasDocumentosShow
            object DBGComprasDocumento: THYTDBGrid
              Left = 0
              Top = 0
              Width = 900
              Height = 407
              Align = alClient
              Color = clInfoBk
              DataSource = DMAcreedores.DSxCompras
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGComprasDocumentoCellClick
              OnDrawColumnCell = DBGComprasDocumentoDrawColumnCell
              OnDblClick = DBGComprasDocumentoDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'AGENTE'
                'ALMACEN'
                'B_COMISION'
                'B_DTO_LINEAS'
                'BRUTO'
                'BULTOS'
                'C_TOTAL'
                'CAMPANYA'
                'CANAL'
                'CHG_MONEDA'
                'CLIENTE'
                'DIRECCION'
                'DTO_CIAL'
                'DTO_PP'
                'EJERCICIO'
                'EMPRESA'
                'ENTRADA'
                'ESTADO'
                'FECHA'
                'FORMA_PAGO'
                'I_COMISION'
                'I_DTO_CIAL'
                'I_DTO_LINEAS'
                'I_DTO_PP'
                'I_FINANCIACION'
                'I_FINANCIACION_CANAL'
                'LINEAS'
                'LIQUIDO'
                'LIQUIDO_CANAL'
                'M_BRUTO'
                'MONEDA'
                'NOTAS'
                'POR_FINANCIACION'
                'PORTES'
                'PROCESO_AUTO'
                'RIG'
                'S_BASES'
                'S_BASES_CANAL'
                'S_CUOTA_IVA'
                'S_CUOTA_IVA_CANAL'
                'S_CUOTA_RE'
                'S_CUOTA_RE_CANAL'
                'SERIE'
                'SU_REFERENCIA'
                'TARIFA'
                'TERCERO'
                'TIPO')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Width = 48
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 37
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MONEDA'
                  Width = 49
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LIQUIDO_CANAL'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SU_REFERENCIA'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NUM_DOCUMENTO'
                  Width = 150
                  Visible = True
                end>
            end
          end
          object TSComprasDetalle: TTabSheet
            Caption = 'Detalle'
            ImageIndex = 1
            OnShow = TSComprasDetalleShow
            object DBGComprasDetalle: THYTDBGrid
              Left = 0
              Top = 0
              Width = 900
              Height = 407
              Align = alClient
              Color = clInfoBk
              DataSource = DMAcreedores.DSxComprasDetalle
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDrawColumnCell = DBGComprasDetalleDrawColumnCell
              OnDblClick = DBGComprasDetalleDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'ALMACEN'
                'ALMACEN_DET'
                'APLICA_UNIDADES_SECUNDARIAS'
                'ARTICULO'
                'B_DTO_LINEA'
                'B_DTO_LINEAS'
                'B_IMPONIBLE'
                'BRUTO'
                'BULTOS'
                'BULTOS_DET'
                'C_IVA'
                'C_RECARGO'
                'CAMBIO_FIJO'
                'CANAL'
                'CHG_MONEDA'
                'CODIGO_PROVEEDOR'
                'CRC_NOTAS'
                'CRC_NOTAS_DET2'
                'CUENTA'
                'DESCUENTO'
                'DESCUENTO_2'
                'DESCUENTO_3'
                'DTO_CIAL'
                'DTO_PP'
                'EJERCICIO'
                'EMPRESA'
                'ENTRADA'
                'ESTADO'
                'FECHA'
                'FECHA_ENTREGA'
                'FORMA_DE_PAGO'
                'I_DESCUENTO'
                'I_DTO_CIAL'
                'I_DTO_LINEAS'
                'I_DTO_PP'
                'I_FINANCIACION'
                'I_FINANCIACION_CANAL'
                'I_PORTES'
                'I_PORTES_CANAL'
                'LINEA'
                'LINEAS'
                'LIQUIDO'
                'LIQUIDO_CANAL'
                'M_BRUTO'
                'MODIFICA_DOC'
                'MONEDA'
                'NSERIE'
                'ORDEN'
                'P_COSTE'
                'P_IVA'
                'P_RECARGO'
                'PERMITIR_SUPERAR_IMPORTE_KRI'
                'POR_FINANCIACION'
                'POR_PORTES'
                'PRECIO'
                'PROCESO_AUTO'
                'PROVEEDOR'
                'PROYECTO'
                'PROYECTO_DET'
                'RIG'
                'S_BASES'
                'S_BASES_CANAL'
                'S_CUOTA_IVA'
                'S_CUOTA_IVA_CANAL'
                'S_CUOTA_RE'
                'S_CUOTA_RE_CANAL'
                'SERIE'
                'SU_REFERENCIA'
                'T_COSTE'
                'TERCERO'
                'TIPO'
                'TIPO_IVA'
                'TIPO_PORTES'
                'TITULO'
                'UNIDADES'
                'UNIDADES_SEC'
                'VALOR_CAMB_FIJO')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 242
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_COSTE'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'B_DTO_LINEA'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'C_IVA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN_DET'
                  Width = 44
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MONEDA'
                  Width = 70
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
                  FieldName = 'SU_REFERENCIA'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FORMA_PAGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTADO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'S_BASES'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'S_CUOTA_IVA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO_PP'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO_CIAL'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LIQUIDO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CUENTA'
                  Width = 90
                  Visible = True
                end>
            end
          end
        end
        object TBCompras: TLFToolBar
          Left = 0
          Top = 0
          Width = 908
          Height = 22
          AutoSize = True
          Caption = 'Informacion Comercial'
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLComprasAcreedor: TLFPanel
            Left = 0
            Top = 0
            Width = 361
            Height = 22
            Enabled = False
            TabOrder = 0
            object DBEComprasAcreedor: TLFDbedit
              Left = 2
              Top = 1
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'ACREEDOR'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              TabOrder = 0
            end
            object DBEComprasTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 293
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              TabOrder = 1
            end
          end
          object TB: TToolButton
            Left = 361
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavCompras: THYMNavigator
            Left = 369
            Top = 0
            Width = 145
            Height = 22
            DataSource = DMProveedores.DSxCompras
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLFltroCompras: TLFPanel
          Left = 0
          Top = 22
          Width = 908
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LTipoDocumento: TLFLabel
            Left = 16
            Top = 5
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LSerieCompras: TLFLabel
            Left = 107
            Top = 4
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LFechaCompras: TLFLabel
            Left = 291
            Top = 4
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LArticuloCompras: TLFLabel
            Left = 524
            Top = 3
            Width = 16
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art.'
          end
          object LDescripcion: TLFLabel
            Left = 648
            Top = 4
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desc.'
          end
          object CBTipoDocumento: TLFComboBox
            Left = 44
            Top = 1
            Width = 53
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'FCR'
            OnChange = FiltroComprasChange
            Items.Strings = (
              'Todos'
              'FCR')
          end
          object CBSerieCompra: TLFComboBox
            Left = 136
            Top = 0
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            OnChange = FiltroComprasChange
          end
          object DEFechaComprasDesde: TLFDateEdit
            Left = 326
            Top = 0
            Width = 89
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
            OnChange = FiltroComprasChange
          end
          object DEFechaComprasHasta: TLFDateEdit
            Left = 416
            Top = 0
            Width = 90
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
            OnChange = FiltroComprasChange
          end
          object EFArticuloCompras: TLFEditFind2000
            Left = 543
            Top = 0
            Width = 93
            Height = 21
            TabOrder = 4
            OnChange = FiltroComprasChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object CBSoloFacturasAbiertas: TLFCheckBox
            Left = 808
            Top = 2
            Width = 105
            Height = 17
            Caption = 'Solo Abiertas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            OnChange = FiltroComprasChange
          end
          object EDescripcion: TLFEdit
            Left = 680
            Top = 0
            Width = 121
            Height = 21
            TabOrder = 6
            OnChange = FiltroComprasChange
          end
        end
      end
      object TSIncidencias: TTabSheet [5]
        Caption = '&Incidencias'
        ImageIndex = 3
        object Splitter1: TSplitter
          Left = 0
          Top = 308
          Width = 917
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object DBGIncidencias: THYTDBGrid
          Left = 0
          Top = 22
          Width = 917
          Height = 286
          Align = alClient
          Color = clInfoBk
          DataSource = DMAcreedores.DSxIncidencias
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
          OnDrawColumnCell = DBGIncidenciasDrawColumnCell
          OnDblClick = DBGIncidenciasDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          PermutaPaneles = True
          CamposAMarcar.Strings = (
            'FINALIZADO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'AGENTE'
            'COD_CLI_PRO'
            'CONTACTO'
            'CONTACTO2'
            'CONTACTO3'
            'DIR_NOMBRE'
            'DIRECCION'
            'DOC_EJERCICIO'
            'DOC_RIG'
            'DOC_SERIE'
            'DOC_TIPO'
            'FECHA'
            'FECHA_RECEPCION'
            'FECHA_RESPUESTA'
            'FINALIZADO'
            'HORAS'
            'INCIDENCIA'
            'NOMBRE_USUARIO'
            'TIPO_INCIDENCIA_KRI'
            'TIT_AGENTE'
            'TIT_CONTACTO'
            'TIT_CONTACTO2'
            'TIT_CONTACTO3'
            'TIT_TIPO_INCIDENCIA_KRI'
            'TITULO_TERCERO'
            'USUARIO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_INCIDENCIA_KRI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIT_TIPO_INCIDENCIA_KRI'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_INCIDENCIA'
              Width = 439
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RESPUESTA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FINALIZADO'
              Width = 50
              Visible = True
            end>
        end
        object TBIncidencias: TLFToolBar
          Left = 0
          Top = 0
          Width = 917
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLDatosIncidencias: TLFPanel
            Left = 0
            Top = 0
            Width = 369
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBAcrIn: TLFDbedit
              Left = 1
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'ACREEDOR'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBTitAcrIn: TLFDbedit
              Left = 68
              Top = 1
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAcreedores.DSQMAcreedores
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
        end
        object DBMMDatosIncidencia: TLFDBMemo
          Left = 0
          Top = 316
          Width = 917
          Height = 100
          Align = alBottom
          BevelInner = bvNone
          Color = clInfoBk
          Constraints.MinHeight = 21
          DataField = 'DATOS_INCIDENCIA'
          DataSource = DMAcreedores.DSxIncidencias
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object TSComunicaciones: TTabSheet [6]
        Caption = '&Comunicaciones'
        OnHide = TSComunicacionesHide
        OnShow = TSComunicacionesShow
        object DBGComunicaciones: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 917
          Height = 394
          Align = alClient
          DataSource = DMAcreedores.DSxComunicaciones
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGComunicacionesCellClick
          OnDrawColumnCell = DBGComunicacionesDrawColumnCell
          OnDblClick = DBGComunicacionesDblClick
          Insercion = False
          ColumnaInicial = 2
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ID'
            'FECHA_MODIFICACION'
            'FECHA_CREACION'
            'DESCRIPCION'
            'ARCHIVO')
          CamposNoAccesibles.Strings = (
            'FECHA_CREACION'
            'FECHA_MODIFICACION'
            'ID')
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
              FieldName = 'FECHA_CREACION'
              ReadOnly = True
              Width = 110
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_MODIFICACION'
              ReadOnly = True
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 345
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARCHIVO'
              Width = 145
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Width = 30
              Visible = True
            end>
        end
        object TBComunicaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 917
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLDatosComunicaciones: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEComunicacionesCod: TLFDbedit
              Left = 1
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'ACREEDOR'
              DataSource = DMAcreedores.DSQMAcreedores
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
            object DBEComunicacionesTitulo: TLFDbedit
              Left = 68
              Top = 1
              Width = 260
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMAcreedores.DSxTerceros
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
          object ToolButton9: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavComunicaciones: THYMNavigator
            Left = 336
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMAcreedores.DSxComunicaciones
            Flat = True
            ParentShowHint = False
            PopupMenu = CEComunicacionesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGComunicaciones
            InsertaControl = DBGComunicaciones
            Exclusivo = False
            ControlEdit = CEComunicaciones
            OrdenAscendente = True
            OnChangeState = NavComunicacionesChangeState
            InsertaUltimo = False
          end
          object ToolButton10: TToolButton
            Left = 536
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtEnviarComunicacionXMail: TToolButton
            Left = 544
            Top = 0
            Action = AEnviarComunicacionXMail
          end
          object TButtImportarArchivoComunicacion: TToolButton
            Left = 567
            Top = 0
            Action = AImportarArchivoComunicacion
          end
          object TButtPlantillaComunicacion: TToolButton
            Left = 590
            Top = 0
            Hint = 'Plantillas para nueva comunicaci'#243'n'
            Caption = 'Plantilla Comunicacion'
            ImageIndex = 32
            Style = tbsDropDown
          end
          object LComunicacionesBusqueda: TLFLabel
            Left = 626
            Top = 0
            Width = 67
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Busqueda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object EFComunicacionesBusqueda: TLFEditFind2000
            Left = 693
            Top = 0
            Width = 77
            Height = 22
            TabOrder = 2
            OnChange = EFComunicacionesBusquedaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            Campos_Desplegar.Strings = (
              'ARCHIVO')
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'EMP_COMUNICACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFComunicacionesBusquedaBusqueda
            OrdenadoPor.Strings = (
              'DESCRIPCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
      object TSTarifaPortes: TTabSheet [7]
        Caption = 'Tarifa Portes'
        ImageIndex = 6
        object TBTarifaPortes: TLFToolBar
          Left = 0
          Top = 0
          Width = 917
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLDatosTarifaPortes: TLFPanel
            Left = 0
            Top = 0
            Width = 369
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBETarifaPortesCod: TLFDbedit
              Left = 1
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'ACREEDOR'
              DataSource = DMAcreedores.DSQMAcreedores
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
            object DBETarifaPortesTitulo: TLFDbedit
              Left = 68
              Top = 1
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMAcreedores.DSxTerceros
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
          object ToolButton3: TToolButton
            Left = 369
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavTarifaPortes: THYMNavigator
            Left = 377
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMAcreedores.DSxTarifaPortes
            Flat = True
            ParentShowHint = False
            PopupMenu = CETarifaPortesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGTarifaPortes
            InsertaControl = DBGTarifaPortes
            Exclusivo = False
            ControlEdit = CETarifaPortes
            OrdenAscendente = True
            OnChangeState = NavComunicacionesChangeState
            InsertaUltimo = False
          end
        end
        object DBGTarifaPortes: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 917
          Height = 394
          Align = alClient
          DataSource = DMAcreedores.DSxTarifaPortes
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGComunicacionesCellClick
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
          BuscarNums = False
          Campos.Strings = (
            'ZONA'
            'PAIS'
            'CODIGO_POSTAL_INI'
            'CODIGO_POSTAL_FIN')
          CamposAMostrar.Strings = (
            'ZONA'
            '0'
            'PAIS'
            '0'
            'CODIGO_POSTAL_INI'
            '0'
            'CODIGO_POSTAL_FIN'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ID'
            'FECHA_MODIFICACION'
            'FECHA_CREACION'
            'DESCRIPCION'
            'ARCHIVO'
            'CODIGO_POSTAL_FIN'
            'CODIGO_POSTAL_INI'
            'PAIS'
            'IMPORTE'
            'IMPORTE_RMB'
            'TITULO'
            'TITULO_PAIS'
            'ZONA')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ZONA'
            'PAIS'
            'CODIGO_POSTAL'
            'CODIGO_POSTAL')
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tablas.Strings = (
            'SYS_ZONAS'
            'SYS_PAISES'
            'SYS_LOCALIDADES'
            'SYS_LOCALIDADES')
          Acciones.Strings = (
            ''
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGTarifaPortesBusqueda
          Planes.Strings = (
            ''
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ZONA'
            'PAIS'
            'CODIGO_POSTAL'
            'CODIGO_POSTAL')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ZONA'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 200
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
              FieldName = 'CODIGO_POSTAL_INI'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_POSTAL_FIN'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_RMB'
              Visible = True
            end>
        end
      end
      object TSAvisos: TTabSheet [8]
        Caption = 'Avisos'
        ImageIndex = 9
        object TBAvisos: TLFToolBar
          Left = 0
          Top = 0
          Width = 908
          Height = 22
          AutoSize = True
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLAvisosAcreedor: TLFPanel
            Left = 0
            Top = 0
            Width = 369
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEAvisosProveedor: TLFDbedit
              Left = 1
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'ACREEDOR'
              DataSource = DMAcreedores.DSQMAcreedores
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
            object DBEAvisosNombre: TLFDbedit
              Left = 68
              Top = 1
              Width = 300
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMAcreedores.DSxTerceros
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
          object TBSep1: TToolButton
            Left = 369
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAvisos: THYMNavigator
            Left = 377
            Top = 0
            Width = 96
            Height = 22
            DataSource = DMAcreedores.DSxAvisos
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAvisosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMAvisoFCR
            InsertaControl = DBMAvisoFCR
            Exclusivo = False
            ControlEdit = CEAvisos
            OrdenAscendente = True
            OnChangeState = NavComunicacionesChangeState
            InsertaUltimo = False
          end
        end
        object PNLAvisos: TLFPanel
          Left = 0
          Top = 22
          Width = 908
          Height = 457
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          DesignSize = (
            908
            457)
          object DBCBAvisoActivoFCR: TLFDBCheckBox
            Left = 56
            Top = 7
            Width = 338
            Height = 17
            Caption = 'Activo en Facturas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_FCR'
            DataSource = DMAcreedores.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoFCR: TLFDBMemo
            Left = 64
            Top = 24
            Width = 791
            Height = 477
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'MENSAJE_FCR'
            DataSource = DMAcreedores.DSxAvisos
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 908
          Height = 479
          DataSource = DMAcreedores.DSQMAcreedores
          CamposAOrdenar.Strings = (
            'ACREEDOR'
            'ALFA_1'
            'ALFA_2'
            'ALFA_3'
            'ALFA_4'
            'ALFA_5'
            'ALFA_6'
            'ALFA_7'
            'ALFA_8'
            'BAJA'
            'BANCO_PAGOS'
            'BLOQUEO'
            'CODIGO_POSTAL'
            'CUENTA'
            'CUENTA_DTOPP'
            'CUENTA_GASTOS'
            'CUENTA_IRPF'
            'DESCUENTO_PP'
            'DIA_PAGO_1'
            'DIA_PAGO_2'
            'DIA_PAGO_3'
            'EVAL_FEB'
            'EVAL_FEB_SI'
            'FECHA_ALTA'
            'FECHA_BAJA'
            'FINANCIACION'
            'FORMA_PAGO'
            'IDIOMA'
            'INTRA'
            'INTRA_TRANS'
            'MODO_IVA'
            'MONEDA'
            'NIF'
            'NOMBRE_R_SOCIAL'
            'PAIS'
            'PAIS_C2'
            'POR_FINANCIACION'
            'RECC'
            'TERCERO'
            'TIPO'
            'TIPO_IRPF'
            'TIPO_NCF'
            'TIT_LOCALIDAD'
            'TITULO'
            'TRANSPORTE_RAPIDO_KRI'
            'TRANSPORTISTA_CREA_RUTA'
            'USAR_ANTICIPOS')
          Columns = <
            item
              Expanded = False
              FieldName = 'ACREEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 302
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 100
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 537
    Width = 920
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 596
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 632
    Top = 8
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosTercero: TMenuItem
      Action = AATercero
    end
  end
  inherited ALMain: TLFActionList
    Left = 342
    Top = 6
    object AVisualizarListadoAcreedores: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Acreedores'
      Hint = 'Visualizar Listado Acreedores'
      ImageIndex = 14
      OnExecute = AVisualizarListadoAcreedoresExecute
    end
    object AImprimirListadoAcreedores: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado Acreedores'
      Hint = 'Imprimir Listado Acreedores'
      ImageIndex = 14
      OnExecute = AImprimirListadoAcreedoresExecute
    end
    object AVisualizarDatosFiscales: TAction
      Category = 'Listados'
      Caption = 'Visualizar Datos Fiscales'
      Hint = 'Visualizar Datos Fiscales'
      ImageIndex = 14
      OnExecute = AVisualizarDatosFiscalesExecute
    end
    object AImprimirDatosFiscales: TAction
      Category = 'Listados'
      Caption = 'Imprimir Datos Fiscales'
      Hint = 'Imprimir Datos Fiscales'
      ImageIndex = 14
      OnExecute = AImprimirDatosFiscalesExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AListadoDirecciones: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado de Direcciones'
      Hint = 'Visualizar Listado de Direcciones'
      ImageIndex = 125
      OnExecute = AListadoDireccionesExecute
    end
    object AImprimirLstDirecciones: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado de Direcciones'
      Hint = 'Imprimir Listado de Direcciones'
      ImageIndex = 14
      OnExecute = AImprimirLstDireccionesExecute
    end
    object ALstCargaTransportista: TAction
      Category = 'Listados'
      Caption = 'Listado de Carga de Transportistas'
      Hint = 'Listado de Carga de Transportistas'
      ImageIndex = 14
      OnExecute = ALstCargaTransportistaExecute
    end
    object ASep2: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfAcreedores: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Acreedores'
      Hint = 'Listados de Acreedores'
      ImageIndex = 77
      OnExecute = AConfAcreedoresExecute
    end
    object AConfAcreedoresFiscal: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Datos Fiscales de Acreedores'
      Hint = 'Listados de Datos Fiscales de Acreedores'
      ImageIndex = 77
      OnExecute = AConfAcreedoresFiscalExecute
    end
    object AConfListDirecciones: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Direcciones'
      Hint = 'Listado de Direcciones'
      ImageIndex = 77
      OnExecute = AConfListDireccionesExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AIncidencias: TAction
      Category = 'Otros'
      Caption = 'Incidencias'
      ImageIndex = 6
      OnExecute = AIncidenciasExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosAcreedor: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Acreedor'
      ImageIndex = 59
      OnExecute = AAdjuntosAcreedorExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AImprimirNotas: TAction
      Category = 'Listados'
      Caption = 'Imprime Notas'
      Hint = 'Imprime Notas'
      ImageIndex = 14
      OnExecute = AImprimirNotasExecute
    end
    object AConfigCircularizacion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuracion Circularizacion'
      Hint = 'Configuracion Circularizacion'
      ImageIndex = 77
      OnExecute = AConfigCircularizacionExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Listados;"Circularizacion"'
      Caption = 'Circularizacion'
      ImageIndex = 14
    end
    object AVisualizarCartaCircularizacion: TAction
      Category = 'Listados;"Circularizacion"'
      Caption = 'Visualizar Carta Circularizacion'
      Hint = 'Visualizar Carta Circularizacion'
      ImageIndex = 125
      OnExecute = AVisualizarCartaCircularizacionExecute
    end
    object AImprimirCartaCircularizacion: TAction
      Category = 'Listados;"Circularizacion"'
      Caption = 'Imprimir Carta Circularizacion'
      Hint = 'Imprimir Carta Circularizacion'
      ImageIndex = 14
      OnExecute = AImprimirCartaCircularizacionExecute
    end
    object AEnviarEmailCartaCircularizacion: TAction
      Category = 'Listados;"Circularizacion"'
      Caption = 'Enviar Email Carta Circularizacion (Directo)'
      Hint = 'Enviar Email Carta Circularizacion (Directo)'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaCircularizacionExecute
    end
    object AEnviarEmailCartaCircularizacion2: TAction
      Category = 'Listados;"Circularizacion"'
      Caption = 'Enviar Email Carta Circularizacion (Mensaje)'
      Hint = 'Enviar Email Carta Circularizacion (Mensaje)'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaCircularizacion2Execute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DEFechaComprasDesde.Text'
      'DEFechaComprasHasta.Text')
    Left = 392
    Top = 6
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLENotas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 596
    Top = 40
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 632
    Top = 40
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
  object ALAcreedores: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 439
    Top = 5
    object ANewTercero: TAction
      Caption = 'ANewTercero'
      OnExecute = ANewTerceroExecute
    end
    object AATercero: TAction
      Caption = 'Ver Datos Tercero'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
      ShortCut = 49236
      OnExecute = AATerceroExecute
    end
    object ACalculaEstadisticas: TAction
      Caption = 'ACalculaEstadisticas'
      OnExecute = ACalculaEstadisticasExecute
    end
    object ARecibosPendientesNoCob: TAction
      Caption = 'ARecibosPendientes'
      OnExecute = ARecibosPendientesNoCobExecute
    end
    object AFactPendDet: TAction
      Caption = 'AFactPendDet'
      OnExecute = AFactPendDetExecute
    end
    object AFactCobDet: TAction
      Caption = 'AFactCobDet'
      OnExecute = AFactCobDetExecute
    end
    object ARecibosImpagados: TAction
      Caption = 'ARecibosImpagados'
      OnExecute = ARecibosImpagadosExecute
    end
    object ARecibosPendientesPend: TAction
      Caption = 'ARecibosPendientesPend'
      OnExecute = ARecibosPendientesPendExecute
    end
    object AEnviarComunicacionXMail: TAction
      Caption = 'Enviar Comunicacion por e-mail'
      Hint = 'Enviar Comunicacion por e-mail'
      ImageIndex = 34
      OnExecute = AEnviarComunicacionXMailExecute
    end
    object AImportarArchivoComunicacion: TAction
      Caption = 'Importar Archivo a Comunicaciones'
      Hint = 'Importar Archivo a Comunicaciones'
      ImageIndex = 49
      OnExecute = AImportarArchivoComunicacionExecute
    end
    object AContaExtracto: TAction
      Caption = 'Extracto Contable'
      Hint = 'Doble click para ver extracto contable'
      ImageIndex = 30
      OnExecute = AContaExtractoExecute
    end
  end
  object CEComunicaciones: TControlEdit
    EnlazadoA = CEMain
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEComunicacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 596
    Top = 72
  end
  object CEComunicacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 632
    Top = 72
    object CEComunicacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEComunicacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEComunicacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEComunicacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEComunicacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEComunicacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEComunicacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEComunicacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEComunicacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEComunicacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object PMPlantillasComunicaciones: TPopupMenu
    AutoHotkeys = maManual
    Left = 632
    Top = 104
  end
  object CETarifaPortes: TControlEdit
    PopUpMenu = CETarifaPortesPMEdit
    Teclas = DMMain.Teclas
    Left = 596
    Top = 104
  end
  object CETarifaPortesPMEdit: TPopUpTeclas
    Left = 632
    Top = 8
    object CETarifaPortesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CETarifaPortesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CETarifaPortessMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CETarifaPortesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CETarifaPortesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CETarifaPortesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CETarifaPortesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETarifaPortesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETarifaPortesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETarifaPortesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEAvisos: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PNLAvisos
    Complementario = TBMain
    PopUpMenu = CEAvisosPMEdit
    Teclas = DMMain.Teclas
    Left = 597
    Top = 136
  end
  object CEAvisosPMEdit: TPopUpTeclas
    Left = 632
    Top = 136
    object CEAvisosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEAvisosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEAvisossMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEAvisosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEAvisosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAvisosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAvisosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEAvisosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEAvisosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEAvisosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
