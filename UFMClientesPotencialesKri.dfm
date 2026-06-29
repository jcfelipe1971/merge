inherited FMClientesPotencialesKri: TFMClientesPotencialesKri
  Left = 339
  Top = 135
  Width = 768
  Height = 577
  HelpContext = 43
  ActiveControl = EFCliente
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Clientes Potenciales'
  PopupMenu = CEAgrupacionesDispPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 524
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 754
      DesignSize = (
        750
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMClientesPotencialesKri.DSQMClientes
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEFTipoCliente
        InsertaControl = DBEFTipoCliente
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Hint = 'Muestra la informaci'#243'n del tercero asociado al cliente'
        Visible = True
        OnClick = TbuttCompClick
      end
      object TButtInfoComercialKri: TToolButton
        Left = 339
        Top = 0
        Hint = 'Informaci'#243'n Comercial'
        Caption = 'Info Comercial'
        ImageIndex = 17
        OnClick = TButtInfoComercialKriClick
      end
      object ToolButton7: TToolButton
        Left = 362
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LNombCom_Social: TLFLabel
        Left = 370
        Top = 0
        Width = 109
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Raz'#243'n Social'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        OnClick = LNombCom_SocialClick
      end
      object EFCliente: TLFEditFind2000
        Left = 479
        Top = 0
        Width = 77
        Height = 22
        TabOrder = 2
        OnChange = EFClienteChange
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
        Tabla_a_buscar = 'VER_CLIENTES_POTENCIALES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'cliente')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object LBNotas: TLFLabel
        Left = 556
        Top = 0
        Width = 58
        Height = 22
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'Notas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 754
      Height = 494
      ActivePage = TSIncidencias
      TabIndex = 3
      inherited TSFicha: TTabSheet
        object SBATercero: TSpeedButton [0]
          Left = 208
          Top = 79
          Width = 149
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBATerceroDblClick
        end
        object SBAAgente: TSpeedButton [1]
          Left = 201
          Top = 102
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAAgenteDblClick
        end
        inherited PEdit: TLFPanel
          Width = 746
          Height = 466
          inherited G2KTableLoc: TG2KTBLoc
            Caption = 'Clientes'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CLIENTES_POTENCIALES'
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'cliente')
          end
          object LBLClienteFicha: TLFLabel
            Left = 132
            Top = 10
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
            FocusControl = DBECliente
          end
          object LBLTercero: TLFLabel
            Left = 127
            Top = 54
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLAgente: TLFLabel
            Left = 130
            Top = 76
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LBLTarifa: TLFLabel
            Left = 137
            Top = 98
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LBLFormaPago: TLFLabel
            Left = 110
            Top = 120
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Foma Pago'
          end
          object LBLDtoPP: TLFLabel
            Left = 127
            Top = 192
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP'
            FocusControl = DBEDtoPP
          end
          object LBLTipoCliente: TLFLabel
            Left = 108
            Top = 32
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Cliente'
          end
          object LBLDtoCial: TLFLabel
            Left = 124
            Top = 220
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial'
          end
          object LBLSuProveedor: TLFLabel
            Left = 99
            Top = 242
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Proveedor'
          end
          object LBMoneda: TLFLabel
            Left = 125
            Top = 142
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LPorcentajeFinanciacion: TLFLabel
            Left = 82
            Top = 170
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Por. Financiaci'#243'n'
          end
          object LBLTransportista: TLFLabel
            Left = 246
            Top = 219
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'S.Transpt.'
            FocusControl = DBEDtoPP
          end
          object LBLDiasPagos: TLFLabel
            Left = 113
            Top = 264
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Pago'
            FocusControl = DBEDiaPago1
          end
          object LBLSuReferencia: TLFLabel
            Left = 296
            Top = 242
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Referencia'
          end
          object LUltimaCompra: TLFLabel
            Left = 431
            Top = 263
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = #218'lt. Compra'
          end
          object LBLPotencialDeCompra: TLFLabel
            Left = 394
            Top = 352
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prev. de Compra'
          end
          object LblPais: TLFLabel
            Left = 142
            Top = 286
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LblTipoTrans: TLFLabel
            Left = 89
            Top = 308
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Transporte'
          end
          object LBLDiasEntrega: TLFLabel
            Left = 302
            Top = 264
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as entrega'
          end
          object LBIdioma: TLFLabel
            Left = 133
            Top = 330
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
          end
          object DBECliente: TLFDbedit
            Left = 168
            Top = 6
            Width = 66
            Height = 21
            Color = clInfoBk
            DataField = 'CLIENTE'
            DataSource = DMClientesPotencialesKri.DSQMClientes
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
          object DBETituloTercero: TLFDbedit
            Left = 235
            Top = 50
            Width = 363
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMClientesPotencialesKri.DSxTerceros
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
          object DBETituloAgente: TLFDbedit
            Left = 235
            Top = 72
            Width = 363
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxAgentes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            OnDblClick = SBAAgenteDblClick
            OnEnter = DBETituloAgenteEnter
          end
          object DBEDtoPP: TLFDbedit
            Left = 168
            Top = 188
            Width = 66
            Height = 21
            DataField = 'DESCUENTO_PP'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 14
          end
          object DBETercero: TLFDBEditFind2000
            Left = 168
            Top = 50
            Width = 66
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 3
            Accion = ANewTercero
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS                   '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TERCERO'
              'NOMBRE_R_SOCIAL')
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAgente: TLFDBEditFind2000
            Left = 168
            Top = 72
            Width = 66
            Height = 21
            DataField = 'AGENTE'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 5
            Accion = ANewAgente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES                    '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloTarifa: TLFDbedit
            Left = 235
            Top = 94
            Width = 363
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxTarifas
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
          object DBETituloFormaPago: TLFDbedit
            Left = 235
            Top = 116
            Width = 363
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxFormasPago
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
          object DBEFTarifa: TLFDBEditFind2000
            Left = 168
            Top = 94
            Width = 66
            Height = 21
            DataField = 'TARIFA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'activa=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETipoTercero: TLFDbedit
            Left = 235
            Top = 28
            Width = 363
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxTipoTercero
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBCKPortes: TLFDBCheckBox
            Left = 168
            Top = 385
            Width = 98
            Height = 17
            Caption = 'Portes Pagados'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PORTES'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDtoCial: TLFDbedit
            Left = 168
            Top = 216
            Width = 66
            Height = 21
            DataField = 'DESCUENTO_CIAL'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 15
          end
          object DBEFTipoCliente: TLFDBEditFind2000
            Left = 168
            Top = 28
            Width = 66
            Height = 21
            DataField = 'TIPO'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPOS_TERCERO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 168
            Top = 116
            Width = 66
            Height = 21
            DataField = 'FORMA_PAGO'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 9
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
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBESuProveedor: TLFDbedit
            Left = 168
            Top = 238
            Width = 121
            Height = 21
            DataField = 'SU_PROVEEDOR'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 18
          end
          object DBCBEvalFebSi: TLFDBCheckBox
            Left = 341
            Top = 385
            Width = 249
            Height = 17
            Caption = 'Obliga al d'#237'a 28 de Feb. en d'#237'a de pago siempre'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 32
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB_SI'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBEvalFeb: TLFDBCheckBox
            Left = 341
            Top = 401
            Width = 193
            Height = 17
            Caption = 'Evaluar Febrero en los d'#237'as de pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 33
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 168
            Top = 138
            Width = 66
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
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
            Filtros = []
          end
          object DBETituloMoneda: TLFDbedit
            Left = 235
            Top = 138
            Width = 363
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxMoneda
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
          object DBEPor_Financion: TLFDbedit
            Left = 168
            Top = 166
            Width = 66
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 13
          end
          object DBEFTransportista: TLFDBEditFind2000
            Left = 299
            Top = 216
            Width = 36
            Height = 21
            DataField = 'TRANSPORTISTA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 16
            OnChange = DBEFTransportistaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object HYDTransportista: TLFHYDBDescription
            Left = 336
            Top = 216
            Width = 262
            Height = 21
            Color = clInfoBk
            DataSource = DMClientesPotencialesKri.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'TRANSPORTISTA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'TRANSPORTISTA')
          end
          object DBEDiaPago1: TLFDbedit
            Left = 168
            Top = 260
            Width = 60
            Height = 21
            DataField = 'DIA_PAGO_1'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            MaxLength = 2
            TabOrder = 20
          end
          object DBEDiaPago2: TLFDbedit
            Left = 229
            Top = 260
            Width = 60
            Height = 21
            DataField = 'DIA_PAGO_2'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            MaxLength = 2
            TabOrder = 21
          end
          object DBESuReferencia: TLFDbedit
            Left = 368
            Top = 238
            Width = 230
            Height = 21
            DataField = 'SU_REFERENCIA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 19
          end
          object ButUltimoCte: TBitBtn
            Left = 243
            Top = 2
            Width = 30
            Height = 25
            Hint = 'Ultimo Cliente'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 36
            Visible = False
            OnClick = ButUltimoCteClick
            NumGlyphs = 2
          end
          object EUltimaCompra: TLFEdit
            Left = 490
            Top = 260
            Width = 108
            Height = 21
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 23
          end
          object DBEPotencialDeCompraKri: TLFDbedit
            Left = 477
            Top = 348
            Width = 121
            Height = 21
            DataField = 'POTENCIAL_DE_COMPRA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 30
          end
          object DBChkBIntra: TLFDBCheckBox
            Left = 168
            Top = 401
            Width = 151
            Height = 17
            Caption = 'Cliente para el INTRASTAT'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 34
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'INTRA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 168
            Top = 282
            Width = 66
            Height = 21
            DataField = 'PAIS_C2'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 24
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
            Filtros = []
          end
          object DBEPais: TLFDbedit
            Left = 235
            Top = 282
            Width = 363
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxPais
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
          object DBEFTipoTrans: TLFDBEditFind2000
            Left = 168
            Top = 304
            Width = 66
            Height = 21
            DataField = 'INTRA_TRANS'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 26
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
            Filtros = []
          end
          object DBETipoTrans: TLFDbedit
            Left = 235
            Top = 304
            Width = 363
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxTipoTrans
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
          object DBEDiasEntrega: TLFDbedit
            Left = 368
            Top = 260
            Width = 57
            Height = 21
            DataField = 'DIAS_ENTREGA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 22
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 168
            Top = 326
            Width = 66
            Height = 21
            DataField = 'IDIOMA'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            TabOrder = 28
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
            Filtros = []
          end
          object DBETituloIdioma: TLFDbedit
            Left = 235
            Top = 326
            Width = 363
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxIdiomas
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
          object DBCKPtoVerde: TLFDBCheckBox
            Left = 168
            Top = 416
            Width = 113
            Height = 17
            Caption = 'Aplicar Pto. Verde'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 35
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'APLICAR_PTO_VERDE'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 23
          ButtonWidth = 22
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNL_I_Info: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBE_I_cod: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = DMClientesPotencialesKri.DSQMClientes
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
            object DBE_I_Nom: TLFDbedit
              Left = 67
              Top = 1
              Width = 260
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMClientesPotencialesKri.DSxTerceros
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
          object TButtSep1: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 336
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientesPotencialesKri.DSQMClientes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
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
        end
        object PNLEditNotas: TLFPanel
          Left = 0
          Top = 23
          Width = 746
          Height = 443
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 746
            Height = 443
            Align = alClient
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMClientesPotencialesKri.DSQMClientes
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object TSAgrupaciones: TTabSheet [2]
        Caption = 'Agrupaciones'
        object TBProv: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 24
          ButtonWidth = 22
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLCabProveedores: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBExTit: TLFDbedit
              Left = 67
              Top = 1
              Width = 260
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMClientes.DSQMClientes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBExCli: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = DMClientes.DSQMClientes
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
          object ToolButton5: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAgrupaciones: THYMNavigator
            Left = 336
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientesPotencialesKri.DSxAgrupSon
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = False
            ControlEdit = CEAgrupaciones
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton2: TToolButton
            Left = 424
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object HYMNavDisp: THYMNavigator
            Left = 432
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientesPotencialesKri.DSxAgrupDisp
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAgrupacionesDispPMEdit
            ShowHint = True
            TabOrder = 2
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEAgrupacionesDisp
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBCGPertenece: TLFDBCtrlGrid
          Left = 0
          Top = 43
          Width = 746
          Height = 144
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMClientesPotencialesKri.DSxAgrupSon
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 24
          PanelWidth = 730
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          RowCount = 6
          SelectedColor = clHighlight
          OnDblClick = DBCGPerteneceDblClick
          object DBEAgDentro: TLFDbedit
            Left = 10
            Top = 2
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMClientesPotencialesKri.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDentro: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxAgrupSon
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object PPertenece: TLFPanel
          Left = 0
          Top = 24
          Width = 746
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones a las que pertenece'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object PDisponibles: TLFPanel
          Left = 0
          Top = 187
          Width = 746
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones disponibles'
          Color = clAppWorkSpace
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
        object DBCGDisponibles: TLFDBCtrlGrid
          Left = 0
          Top = 206
          Width = 746
          Height = 240
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMClientesPotencialesKri.DSxAgrupDisp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 24
          PanelWidth = 730
          ParentColor = False
          ParentFont = False
          TabOrder = 4
          RowCount = 10
          SelectedColor = clHighlight
          OnDblClick = DBCGDisponiblesDblClick
          object DBEAgCodDisp: TLFDbedit
            Left = 10
            Top = 1
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION'
            DataSource = DMClientesPotencialesKri.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEAgTitDisp: TLFDbedit
            Left = 100
            Top = 1
            Width = 377
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientesPotencialesKri.DSxAgrupDisp
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TSIncidencias: TTabSheet [3]
        Caption = '&Incidencias'
        ImageIndex = 7
        object Splitter1: TSplitter
          Left = 0
          Top = 358
          Width = 746
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object DBGIncidencias: THYTDBGrid
          Left = 0
          Top = 22
          Width = 746
          Height = 336
          Align = alClient
          Color = clInfoBk
          DataSource = DMClientesPotencialesKri.DSxIncidencias
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
          TabFicha = TSIncidencias
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'FECHA'
            'FECHA_RECEPCION'
            'FECHA_RESPUESTA'
            'TITULO_INCIDENCIA')
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
              Width = 311
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
          Width = 746
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
          object PNLCabIncidencias: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBCliTitIn: TLFDbedit
              Left = 67
              Top = 1
              Width = 260
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMClientesPotencialesKri.DSxTerceros
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBCliIn: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = DMClientesPotencialesKri.DSQMClientes
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
          Top = 366
          Width = 746
          Height = 100
          Align = alBottom
          BevelInner = bvNone
          Color = clInfoBk
          Constraints.MinHeight = 21
          DataField = 'DATOS_INCIDENCIA'
          DataSource = DMClientesPotencialesKri.DSxIncidencias
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object TSInfoComercial: TTabSheet [4]
        Caption = 'Info Com.'
        ImageIndex = 7
        object PNLInfoComercial: TLFPanel
          Left = 0
          Top = 29
          Width = 746
          Height = 437
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LNroEmpleados: TLFLabel
            Left = 34
            Top = 30
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. de Empleados'
            FocusControl = DBENroDeEmpleados
          end
          object LFacturacionTotal: TLFLabel
            Left = 41
            Top = 52
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Facturacion Total'
            FocusControl = DBEFacturacionTotal
          end
          object LConsumoMateriales: TLFLabel
            Left = 40
            Top = 74
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Consumo Material'
            FocusControl = DBEConsumoMaterial
          end
          object LProveedoresHabituales: TLFLabel
            Left = 11
            Top = 97
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedores Habituales'
            FocusControl = DBEProveedoresHabituales
          end
          object LRuta: TLFLabel
            Left = 101
            Top = 169
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta'
          end
          object LTipoCliente: TLFLabel
            Left = 53
            Top = 146
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Cliente'
            FocusControl = DBETipoCliente
          end
          object LFrecuencia: TLFLabel
            Left = 71
            Top = 191
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Frecuencia'
          end
          object DBENroDeEmpleados: TLFDbedit
            Left = 128
            Top = 26
            Width = 64
            Height = 21
            DataField = 'NRO_EMPLEADOS'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            TabOrder = 0
          end
          object DBEFacturacionTotal: TLFDbedit
            Left = 128
            Top = 48
            Width = 64
            Height = 21
            DataField = 'FACTURACION_TOTAL'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            TabOrder = 1
          end
          object DBEConsumoMaterial: TLFDbedit
            Left = 128
            Top = 70
            Width = 64
            Height = 21
            DataField = 'CONSUMO_MATERIAL'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            TabOrder = 2
          end
          object DBEProveedoresHabituales: TLFDbedit
            Left = 128
            Top = 92
            Width = 394
            Height = 21
            DataField = 'PROVEEDORES_HABITUALES'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            TabOrder = 3
          end
          object DBETipoCliente: TLFDbedit
            Left = 288
            Top = 142
            Width = 154
            Height = 21
            DataField = 'TIPO_CLIENTE'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            TabOrder = 5
            Visible = False
          end
          object DBERutaKri: TLFDbedit
            Left = 128
            Top = 164
            Width = 121
            Height = 21
            DataField = 'RUTA'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            TabOrder = 6
          end
          object DBCBTipoCliente: TDBComboBoxValue
            Left = 128
            Top = 142
            Width = 153
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_CLIENTE'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            ItemHeight = 13
            Items.Strings = (
              'NORMAL'
              'HABITUAL'
              'SEGUIMIENTO'
              'OCASIONAL')
            Values.Strings = (
              'NORMAL'
              'HABITUAL'
              'SEGUIMIENTO'
              'OCASIONAL')
            TabOrder = 4
          end
          object DBEFrecuencia: TLFDbedit
            Left = 128
            Top = 186
            Width = 121
            Height = 21
            DataField = 'FRECUENCIA'
            DataSource = DMClientesPotencialesKri.DSQMClientes2
            TabOrder = 7
          end
        end
        object TBInfoComercial: TLFToolBar
          Left = 0
          Top = 0
          Width = 746
          Height = 29
          Caption = 'Informacion Comercial'
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          Separators = True
          object PNLClienteInfoComercial: TLFPanel
            Left = 0
            Top = 2
            Width = 328
            Height = 22
            TabOrder = 1
            object DBEInfoComCliente: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = DMClientesPotencialesKri.DSQMClientes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEInfoComTituloCliente: TLFDbedit
              Left = 67
              Top = 1
              Width = 260
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMClientesPotencialesKri.DSxTerceros
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
            Left = 328
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavInfoComercial: THYMNavigator
            Left = 336
            Top = 2
            Width = 100
            Height = 22
            DataSource = DMClientesPotencialesKri.DSQMClientes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            ParentShowHint = False
            PopupMenu = CEInfoComrecialPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBENroDeEmpleados
            Exclusivo = True
            ControlEdit = CEInfoComrecial
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 746
          Height = 466
          DataSource = DMClientesPotencialesKri.DSQMClientes
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'CUENTA'
            'TERCERO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 410
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 524
    Width = 758
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 630
    Top = 82
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 692
    Top = 80
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosTercero: TMenuItem
      Action = AATercero
    end
    object MIVerDatosAgente: TMenuItem
      Action = AAAgente
    end
  end
  inherited ALMain: TLFActionList
    Left = 568
    Top = 0
    object AEtiquetasCliente: TAction
      Category = 'Listados'
      Caption = 'Etiquetas de Clientes'
      Hint = 'Mantenimiento de Etiquetas de Clientes'
      ImageIndex = 95
      OnExecute = AEtiquetasClienteExecute
    end
    object AVisualizarDatosClientes: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Clientes'
      Hint = 'Visualizar Listado Clientes'
      ImageIndex = 14
      OnExecute = AVisualizarDatosClientesExecute
    end
    object AImprimirDatosClientes: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado Clientes'
      Hint = 'Imprimir Listado Clientes'
      ImageIndex = 14
      OnExecute = AImprimirDatosClientesExecute
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
    object AVisualizarListadoDirecciones: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado de Direcciones'
      Hint = 'Visualizar Listado de Direcciones'
      ImageIndex = 14
      OnExecute = AVisualizarListadoDireccionesExecute
    end
    object AImprimirListadoDirecciones: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado de Direcciones'
      Hint = 'Imprimir Listado de Direcciones'
      ImageIndex = 14
      OnExecute = AImprimirListadoDireccionesExecute
    end
    object AClientesporAgrupacion: TAction
      Category = 'Listados'
      Caption = 'Listado de Clientes por Agrupaci'#243'n'
      Hint = 'Listado de Clientes por Agrupaci'#243'n'
      ImageIndex = 14
      OnExecute = AClientesporAgrupacionExecute
    end
    object AListadoDireccionesCP: TAction
      Category = 'Listados'
      Caption = 'Listado de Direcciones por C'#243'd. Postal'
      Hint = 'Listado de Direcciones por C'#243'd. Postal'
      ImageIndex = 14
      OnExecute = AListadoDireccionesCPExecute
    end
    object AVentasDetalladas: TAction
      Category = 'Listados'
      Caption = 'Ventas Detalladas'
      Hint = 'Ventas Detalladas'
      ImageIndex = 14
      OnExecute = AVentasDetalladasExecute
    end
    object AVentasAgenteClienteMes: TAction
      Category = 'Listados'
      Caption = 'Ventas por Agente - Cliente - Mes'
      Hint = 'Ventas por Agente - Cliente - Mes'
      ImageIndex = 14
      OnExecute = AVentasAgenteClienteMesExecute
    end
    object AEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Etiquetas'
      Hint = 'Etiquetas'
      ImageIndex = 95
      OnExecute = AEtiquetasExecute
    end
    object AEtiquetasFiltrados: TAction
      Category = 'Listados'
      Caption = 'Etiquetas de Clientes Filtrados'
      Hint = 'Etiquetas de los clientes filtrados'
      ImageIndex = 95
      OnExecute = AEtiquetasFiltradosExecute
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
    object AConfClientes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Clientes'
      Hint = 'Listados de Clientes'
      ImageIndex = 77
      OnExecute = MIConfClientesClick
    end
    object AConfClientesFiscal: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Datos Fiscales de Clientes'
      Hint = 'Listados de Datos Fiscales de Clientes'
      ImageIndex = 77
      OnExecute = AConfClientesFiscalExecute
    end
    object AConfAgrupClientes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Agrupaciones de Clientes'
      Hint = 'Listado de Agrupaciones de Clientes'
      ImageIndex = 77
      OnExecute = AConfAgrupClientesExecute
    end
    object AConfDireccionesCli: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Direcciones de Clientes'
      Hint = 'Listados de Direcciones de Clientes'
      ImageIndex = 77
      OnExecute = AConfDireccionesCliExecute
    end
    object AConfDireccionesCliCP: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Direcciones por C'#243'd. Postal'
      Hint = 'Listado de Direcciones por C'#243'd. Postal'
      ImageIndex = 77
      OnExecute = AConfDireccionesCliCPExecute
    end
    object AConfVentasDetalladas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Ventas Detalladas'
      Hint = 'Ventas Detalladas'
      ImageIndex = 77
      OnExecute = AConfVentasDetalladasExecute
    end
    object AConfEtiquetas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiquetas de Clientes'
      Hint = 'Etiquetas de Clientes'
      ImageIndex = 77
      OnExecute = AConfEtiquetasExecute
    end
    object AConfEtiquetasFiltrados: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiquetas de Clientes Filtrados'
      Hint = 'Configurar Etiquetas de Clientes Filtrados'
      ImageIndex = 77
      OnExecute = AConfEtiquetasFiltradosExecute
    end
    object AConfVentasAgenteClienteMes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Ventas por Agente - Cliente - Mes'
      Hint = 'Ventas por Agente - Cliente - Mes'
      ImageIndex = 77
      OnExecute = AConfVentasAgenteClienteMesExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AIncidencias: TAction
      Category = 'Otros'
      Caption = 'Incidencias'
      Hint = 'Incidencias '
      ImageIndex = 6
      OnExecute = AIncidenciasExecute
    end
    object ATraspasarACliente: TAction
      Category = 'Otros'
      Caption = 'Traspasar a Cliente'
      Hint = 
        'Traspasa el cliente potencial a cliente normal.'#13#10'Tambi'#233'n traspas' +
        'a las incidencias.'
      ImageIndex = 36
      OnExecute = ATraspasarAClienteExecute
    end
    object AAImportaClientePotencial: TAction
      Category = 'Otros'
      Caption = 'Importa Clientes Potenciales'
      ImageIndex = 49
      OnExecute = AAImportaClientePotencialExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 602
    Top = 2
  end
  object CENotas: TControlEdit
    EnlazadoA = CEAgrupaciones
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLEditNotas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 628
    Top = 132
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 695
    Top = 132
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
  object RelojNotas: TTimer
    Enabled = False
    OnTimer = RelojNotasTimer
    Left = 720
    Top = 6
  end
  object ALClientes: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 639
    Top = 3
    object ANewAgente: TAction
      Caption = 'ANewAgente'
      OnExecute = ANewAgenteExecute
    end
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
    object AAAgente: TAction
      Caption = 'Ver Datos Agente'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
      ShortCut = 49217
      OnExecute = AAAgenteExecute
    end
  end
  object CEInfoComrecial: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSInfoComercial
    FichaExclusiva = TSInfoComercial
    PanelEdicion = PNLInfoComercial
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEInfoComrecialPMEdit
    Teclas = DMMain.Teclas
    Left = 624
    Top = 416
  end
  object CEInfoComrecialPMEdit: TPopUpTeclas
    Left = 696
    Top = 416
    object CEInfoComrecialMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEInfoComrecialMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEInfoComrecialMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEInfoComrecialMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEInfoComrecialMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEInfoComrecialMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEInfoComrecialMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEInfoComrecialMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEInfoComrecialMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEInfoComrecialMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEAgrupaciones: TControlEdit
    EnlazadoA = CEAgrupacionesDisp
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 626
    Top = 176
  end
  object CEAgrupacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 696
    Top = 178
    object CEAgrupacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEAgrupacionesDisp: TControlEdit
    EnlazadoA = CEInfoComrecial
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesDispPMEdit
    Teclas = DMMain.Teclas
    Left = 625
    Top = 227
  end
  object CEAgrupacionesDispPMEdit: TPopUpTeclas
    Left = 696
    Top = 230
    object CEAgrupacionesDispMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEAgrupacionesDispMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEAgrupacionesDispMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEAgrupacionesDispMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEAgrupacionesDispMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEAgrupacionesDispMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEAgrupacionesDispMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEAgrupacionesDispMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEAgrupacionesDispMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEAgrupacionesDispMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
