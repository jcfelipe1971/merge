inherited FMEmpBancos: TFMEmpBancos
  Left = 575
  Top = 241
  Width = 819
  Height = 531
  HelpContext = 267
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Bancos de Empresa'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 809
    Height = 478
    inherited TBMain: TLFToolBar
      Width = 805
      inherited NavMain: THYMNavigator
        DataSource = DMEmpBancos.DSQMEmp_Bancos
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBEDescripcion
      end
      inherited TSepNav: TToolButton
        Style = tbsDivider
      end
      inherited EPMain: THYMEditPanel
        Width = 69
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 297
      end
      inherited TbuttComp: TToolButton
        Left = 305
        Hint = 'Muestra la informaci'#243'n del tercero asociado al banco'
        ImageIndex = 54
        ParentShowHint = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 805
      Height = 448
      inherited TSFicha: TTabSheet
        PopupMenu = CEMainPMEdit
        object SBATercero: TSpeedButton [0]
          Left = 167
          Top = 59
          Width = 366
          Height = 19
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = AATerceroExecute
        end
        inherited PEdit: TLFPanel
          Width = 797
          Height = 420
          inherited G2KTableLoc: TG2KTBLoc
            Top = 62
          end
          object LBL_Banco: TLFLabel
            Left = 70
            Top = 4
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LBL_Riesgo_Con: TLFLabel
            Left = 592
            Top = 4
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'R. Concertado'
          end
          object LBL_Cuenta: TLFLabel
            Left = 67
            Top = 70
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LBL_Riesgo_Uti: TLFLabel
            Left = 607
            Top = 26
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'R. Utilizado'
          end
          object LBL_Riesgo_dis: TLFLabel
            Left = 598
            Top = 48
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'R. Disponible'
          end
          object LBLCuContableCC: TLFLabel
            Left = 44
            Top = 136
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta (CC)'
          end
          object LBLCuContable: TLFLabel
            Left = 44
            Top = 158
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta (CA)'
          end
          object LBLCuentaConfirming: TLFLabel
            Left = 36
            Top = 202
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta (CFM)'
          end
          object LBLRiesgoDescuento: TLFLabel
            Left = 595
            Top = 70
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'R. Descuento'
          end
          object LBLConfirmimg: TLFLabel
            Left = 598
            Top = 92
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'R. Confirming'
          end
          object LBLCif: TLFLabel
            Left = 64
            Top = 48
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LCuentaDesc: TLFLabel
            Left = 36
            Top = 180
            Width = 65
            Height = 13
            Alignment = taRightJustify
            BiDiMode = bdRightToLeft
            Caption = 'Cuenta Desc.'
            ParentBiDiMode = False
          end
          object LblGastos: TLFLabel
            Left = 40
            Top = 224
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Rem.'
          end
          object LBLGastosDes: TLFLabel
            Left = 37
            Top = 246
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Desc.'
          end
          object LBLDiaValor: TLFLabel
            Left = 611
            Top = 158
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Valor'
          end
          object LBLRiesgoDescPagares: TLFLabel
            Left = 585
            Top = 114
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'R.Descuento P.'
          end
          object LCuentaPagare: TLFLabel
            Left = 25
            Top = 268
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Pagar'#233's'
          end
          object LCuentaRemesaPagare: TLFLabel
            Left = 27
            Top = 290
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Rem. P.'
          end
          object LCuentaInteresesPagare: TLFLabel
            Left = 37
            Top = 312
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Int. P.'
          end
          object LFLIBAN: TLFLabel
            Left = 76
            Top = 92
            Width = 25
            Height = 13
            Hint = 'International Bank Account Number'
            Alignment = taRightJustify
            Caption = 'IBAN'
          end
          object LFLBIC: TLFLabel
            Left = 45
            Top = 114
            Width = 56
            Height = 13
            Hint = 
              'Bank Identification Code'#13#10'Society for Worldwide Interbank Financ' +
              'ial Telecommunication'
            Alignment = taRightJustify
            Caption = 'BIC/SWIFT'
          end
          object LContadorTalones: TLFLabel
            Left = 577
            Top = 181
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador Talones'
          end
          object LGastosImpagados: TLFLabel
            Left = 33
            Top = 334
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gastos Impag.'
          end
          object LCedenteConfirming: TLFLabel
            Left = 9
            Top = 377
            Width = 92
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cedente Confirming'
          end
          object LCodigoOrdenante: TLFLabel
            Left = 575
            Top = 246
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Ordenante'
          end
          object LAlfanumero: TLFLabel
            Left = 608
            Top = 268
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alfan'#250'mero'
          end
          object LPais: TLabel
            Left = 79
            Top = 25
            Width = 20
            Height = 13
            Caption = 'Pais'
          end
          object DBEEntidad: TLFDBEditFind2000
            Left = 107
            Top = 66
            Width = 45
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ENTIDAD'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 6
            OnChange = DBEEntidadChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_BANCOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ENTIDAD'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEEntidadBusqueda
            Filtros = []
          end
          object DBEDescripcion: TLFDbedit
            Left = 165
            Top = 0
            Width = 387
            Height = 21
            DataField = 'TITULO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 1
          end
          object DBERiesgo_Con: TLFDbedit
            Left = 667
            Top = 0
            Width = 100
            Height = 21
            DataField = 'RIESGO_CON'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 34
          end
          object DBEBanco: TLFDbedit
            Tag = 4
            Left = 107
            Top = 0
            Width = 57
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'BANCO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
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
          object DBEOficina: TLFDbedit
            Tag = 2
            Left = 153
            Top = 66
            Width = 41
            Height = 21
            DataField = 'SUCURSAL'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 7
            OnChange = DBEEntidadChange
          end
          object DBECC: TLFDbedit
            Tag = 10
            Left = 229
            Top = 66
            Width = 323
            Height = 21
            DataField = 'CUENTA_CORRIENTE'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 9
            OnChange = DBEEntidadChange
          end
          object DBERiesgo_Uti: TLFDbedit
            Left = 667
            Top = 22
            Width = 100
            Height = 21
            DataField = 'RIESGO_UTI'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 35
          end
          object DBCBActiva: TLFDBCheckBox
            Left = 667
            Top = 310
            Width = 63
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 45
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDC: TLFDbedit
            Tag = 2
            Left = 195
            Top = 66
            Width = 33
            Height = 21
            DataField = 'CONTROL'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 8
            OnChange = DBEEntidadChange
          end
          object DBERiesgo_dif: TLFDbedit
            Left = 667
            Top = 44
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_DIF'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 36
          end
          object DBEFCuentaCorriente: TLFDBEditFind2000
            Left = 107
            Top = 132
            Width = 100
            Height = 21
            DataField = 'CUENTA_CC'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 12
            OnChange = DBEFCuentaCorrienteChange
            OnExit = DBEFCuentaCorrienteExit
            OnKeyDown = DBEFCuentaCorrienteKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCuentaAhorro: TLFDBEditFind2000
            Left = 107
            Top = 154
            Width = 100
            Height = 21
            DataField = 'CUENTA_AHORRO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 14
            OnChange = DBEFCuentaAhorroChange
            OnExit = DBEFCuentaAhorroExit
            OnKeyDown = DBEFCuentaAhorroKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCBSepara: TLFDBCheckBox
            Left = 107
            Top = 354
            Width = 254
            Height = 17
            Hint = 
              'Separa apuntes de Abono y Gastos en Remesas'#13#10'Solo se puede modif' +
              'icar si no se han hecho remesas a este banco en este ejercicio.'
            Caption = 'Separar apuntes de Abono y Gastos en Remesas'
            ClicksDisabled = False
            ColorCheck = 57088
            ShowHint = True
            TabOrder = 32
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SEPARA_APUNTES'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            ParentShowHint = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCuentaConfirming: TLFDBEditFind2000
            Left = 107
            Top = 198
            Width = 100
            Height = 21
            DataField = 'CUENTA_CONFIRMING'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 18
            OnChange = DBEFCuentaConfirmingChange
            OnExit = DBEFCuentaConfirmingExit
            OnKeyDown = DBEFCuentaConfirmingKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBERConfirming: TLFDbedit
            Left = 667
            Top = 88
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_CFM'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 38
          end
          object DBERDescuento: TLFDbedit
            Left = 667
            Top = 66
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_DES'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 37
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 107
            Top = 44
            Width = 57
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 4
            OnChange = DBEFTerceroChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
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
          object DBECuentaDto: TLFDBEditFind2000
            Left = 107
            Top = 176
            Width = 100
            Height = 21
            DataField = 'CUENTA_DTO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 16
            OnChange = DBECuentaDtoChange
            OnExit = DBECuentaDtoExit
            OnKeyDown = DBECuentaDtoKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCuentaGastos: TLFDBEditFind2000
            Left = 107
            Top = 220
            Width = 100
            Height = 21
            DataField = 'CUENTA_GASTOS'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 20
            OnChange = DBEFCuentaGastosChange
            OnExit = DBEFCuentaGastosExit
            OnKeyDown = DBEFCuentaGastosKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCuentaGastosDes: TLFDBEditFind2000
            Left = 107
            Top = 242
            Width = 100
            Height = 21
            DataField = 'CUENTA_GASTOS_DESCUENTO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 22
            OnChange = DBEFCuentaGastosDesChange
            OnExit = DBEFCuentaGastosDesExit
            OnKeyDown = DBEFCuentaGastosDesKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBSEDiaValor: TDBSpinEdit
            Left = 667
            Top = 154
            Width = 45
            Height = 22
            MaxValue = 999
            MinValue = 0
            TabOrder = 40
            Value = 0
            DataField = 'DIA_VALOR'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
          end
          object DBERDescuentoPagares: TLFDbedit
            Left = 667
            Top = 110
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_DES_PAG'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
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
          object DBEFCuentaPagares: TLFDBEditFind2000
            Left = 107
            Top = 264
            Width = 100
            Height = 21
            DataField = 'CUENTA_PAGARES'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 24
            OnChange = DBEFCuentaPagaresChange
            OnExit = DBEFCuentaPagaresExit
            OnKeyDown = DBEFCuentaPagaresKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCuentaGastosPagares: TLFDBEditFind2000
            Left = 107
            Top = 286
            Width = 100
            Height = 21
            DataField = 'CUENTAS_GASTOS_PAGARES'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 26
            OnChange = DBEFCuentaGastosPagaresChange
            OnExit = DBEFCuentaGastosPagaresExit
            OnKeyDown = DBEFCuentaGastosPagaresKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCuentaIntereses: TLFDBEditFind2000
            Left = 107
            Top = 308
            Width = 100
            Height = 21
            DataField = 'CUENTA_INTERESES'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 28
            OnChange = DBEFCuentaInteresesChange
            OnExit = DBEFCuentaInteresesExit
            OnKeyDown = DBEFCuentaInteresesKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEIBAN: TLFDbedit
            Tag = 2
            Left = 107
            Top = 88
            Width = 445
            Height = 21
            DataField = 'IBAN'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 10
            OnChange = DBEIBANChange
            OnEnter = DBEIBANEnter
          end
          object DBEBIC: TLFDbedit
            Tag = 2
            Left = 107
            Top = 110
            Width = 445
            Height = 21
            DataField = 'BIC'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 11
          end
          object DBEContador: TLFDbedit
            Tag = 2
            Left = 667
            Top = 177
            Width = 100
            Height = 21
            DataField = 'CONTADOR_TALON'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 41
          end
          object DBCBAuto: TLFDBCheckBox
            Left = 667
            Top = 198
            Width = 98
            Height = 17
            Caption = 'Autom'#225'tico'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 42
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONTADOR_TALON_AUTOMATICO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCuentaGastosImpagados: TLFDBEditFind2000
            Left = 107
            Top = 330
            Width = 100
            Height = 21
            DataField = 'CUENTA_GASTOS_IMPAGADO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 30
            OnChange = DBEFCuentaGastosImpagadosChange
            OnExit = DBEFCuentaGastosImpagadosExit
            OnKeyDown = DBEFCuentaGastosImpagadosKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECedenteConfirming: TLFDbedit
            Tag = 2
            Left = 107
            Top = 374
            Width = 215
            Height = 21
            DataField = 'CEDENTE_CONFIRMING'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 33
          end
          object DBETituloCuentaCorriente: TLFEdit
            Left = 208
            Top = 132
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 13
          end
          object DBETituloCuentaAhorro: TLFEdit
            Left = 208
            Top = 154
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
          end
          object DBETituloCuentaDto: TLFEdit
            Left = 208
            Top = 176
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 17
          end
          object DBETituloCuentaConfirming: TLFEdit
            Left = 208
            Top = 198
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 19
          end
          object DBETituloCuentaGastos: TLFEdit
            Left = 208
            Top = 220
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 21
          end
          object DBETituloCuentaGastosDes: TLFEdit
            Left = 208
            Top = 242
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 23
          end
          object DBETituloCuentaPagares: TLFEdit
            Left = 208
            Top = 264
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 25
          end
          object DBETituloCuentaGastosPagares: TLFEdit
            Left = 208
            Top = 286
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 27
          end
          object DBETituloCuentaIntereses: TLFEdit
            Left = 208
            Top = 308
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 29
          end
          object DBETituloCuentaGastosImpagado: TLFEdit
            Left = 208
            Top = 330
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 31
          end
          object ETituloTercero: TLFEdit
            Left = 165
            Top = 44
            Width = 387
            Height = 21
            Color = clAqua
            Enabled = False
            TabOrder = 5
          end
          object DBECodigoOrdenante: TLFDbedit
            Tag = 2
            Left = 667
            Top = 242
            Width = 38
            Height = 21
            DataField = 'CODIGO_ORDENANTE'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 43
          end
          object DBEAlfanumero: TLFDbedit
            Tag = 2
            Left = 667
            Top = 264
            Width = 100
            Height = 21
            DataField = 'ALFANUMERO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 44
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 107
            Top = 22
            Width = 57
            Height = 21
            DataField = 'PAIS'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            TabOrder = 2
            OnChange = DBEFPaisChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            CampoADevolver = 'PAIS'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PAIS')
            Filtros = []
          end
          object ETituloPais: TEdit
            Left = 165
            Top = 22
            Width = 387
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      object TSCedente: TTabSheet [1]
        Caption = 'Cedente'
        ImageIndex = 1
        object PNLCedente: TLFPanel
          Left = 0
          Top = 0
          Width = 797
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Caption = 'PNLCedente'
          TabOrder = 0
          object LBancoCedente: TLFLabel
            Left = 20
            Top = 6
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object DBEBancoCedente: TLFDbedit
            Tag = 4
            Left = 55
            Top = 2
            Width = 57
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'BANCO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
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
          object ETituloBancoCedente: TLFDbedit
            Left = 113
            Top = 2
            Width = 304
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMEmpBancos.DSQMEmp_Bancos
            Enabled = False
            TabOrder = 1
          end
          object NavCedente: THYMNavigator
            Left = 421
            Top = 0
            Width = 160
            Height = 23
            DataSource = DMEmpBancos.DSQMCendentesPorMoneda
            VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGCedenteMoneda: TDBGridFind2000
          Left = 0
          Top = 25
          Width = 797
          Height = 395
          Align = alClient
          DataSource = DMEmpBancos.DSQMCendentesPorMoneda
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
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'MONEDA')
          CamposAMostrar.Strings = (
            'MONEDA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          Numericos.Strings = (
            'MONEDA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_MONEDAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'MONEDA')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'MONEDA'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEDENTE'
              Width = 257
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        ImageIndex = 2
        PopupMenu = CEMainPMEdit
        inherited DBGMain: THYTDBGrid
          Width = 797
          Height = 420
          DataSource = DMEmpBancos.DSQMEmp_Bancos
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'BANCO'
            'EMPRESA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'BANCO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 299
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIESGO_CON'
              Title.Alignment = taRightJustify
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIESGO_UTI'
              Title.Alignment = taRightJustify
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Title.Alignment = taCenter
              Width = 32
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 478
    Width = 809
    ParentColor = False
  end
  inherited CEMain: TControlEdit
    Left = 404
    Top = 6
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 440
    Top = 8
    inherited CEMainMibuscar: TMenuItem
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
    Left = 404
    Top = 70
    object AInfoTercero: TAction
      Caption = 'Informaci'#243'n del Tercero'
      Hint = 'Muestra la informaci'#243'n del Tercero asociado'
      ImageIndex = 54
      OnExecute = AInfoTerceroExecute
    end
    object AActualizaRiesgos: TAction
      Category = 'Procesos'
      Caption = 'Actualiza de forma manual los Riesgos de Confirming y Descontado'
      Hint = 'Actualiza de forma manual los Riesgos de Confirming y Descontado'
      ImageIndex = 119
      OnExecute = AActualizaRiesgosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfigCircularizacion: TAction
      Category = 'Listados;"Cofiguracion"'
      Caption = 'Configuracion Circularizacion'
      Hint = 'Configuracion Circularizacion'
      ImageIndex = 77
      OnExecute = AConfigCircularizacionExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Cofiguracion"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction4: TLFCategoryAction
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
    Left = 450
    Top = 72
  end
  object ALBancos: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 408
    Top = 104
    object AATercero: TAction
      Caption = 'Ver Datos Tercero'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
      ShortCut = 49236
      OnExecute = AATerceroExecute
    end
  end
end
