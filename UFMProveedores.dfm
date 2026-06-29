inherited FMProveedores: TFMProveedores
  Left = 317
  Top = 191
  Width = 905
  Height = 665
  HelpContext = 53
  ActiveControl = EFProveedor
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Proveedores'
  FormStyle = fsNormal
  PopupMenu = CEArticulosPMEdit
  OnDestroy = FormDestroy
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 895
    Height = 612
    inherited TBMain: TLFToolBar
      Width = 891
      DesignSize = (
        887
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMProveedores.DSProveedores
        Hints.Strings = ()
        EditaControl = DBEFTipoTercero
        InsertaControl = DBEFTipoTercero
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBECuenta
        Busca02 = DBEProveedor
        Busca03 = DBEFTercero
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Hint = 'Muestra la informaci'#243'n del tercero asociado al proveedor'
        Visible = True
        OnClick = TbuttCompClick
      end
      object EFProveedor: TLFEditFind2000
        Left = 339
        Top = 0
        Width = 78
        Height = 22
        TabOrder = 2
        OnChange = EFProveedorChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoNum = 'PROVEEDOR'
        CampoStr = 'NOMBRE_R_SOCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'proveedor')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object LBNotas: TLFLabel
        Left = 417
        Top = 0
        Width = 72
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
      Width = 891
      Height = 582
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        object SBATercero: TSpeedButton [0]
          Left = 134
          Top = 64
          Width = 153
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
          GroupIndex = -1
          OnDblClick = SBATerceroDblClick
        end
        object SBAContaExtracto: TSpeedButton [1]
          Left = 134
          Top = 64
          Width = 153
          Height = 21
          Hint = 'Doble click para ver extracto contable'
          GroupIndex = -1
          OnDblClick = SBAContaExtractoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 883
          Height = 554
          inherited G2KTableLoc: TG2KTBLoc
            Left = 32
            Top = 5
            CamposADesplegar.Strings = (
              'NOMBRE_R_SOCIAL')
            Tabla_a_buscar = 'VER_PROVEEDORES_CUENTAS'
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'proveedor')
          end
          object LProveedor: TLFLabel
            Left = 80
            Top = 7
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
            FocusControl = DBEProveedor
          end
          object LTercero: TLFLabel
            Left = 92
            Top = 51
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LFormaPago: TLFLabel
            Left = 72
            Top = 73
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LDiasPago: TLFLabel
            Left = 78
            Top = 161
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Pago'
            FocusControl = DBEDiaPago1
          end
          object LDescuentoPP: TLFLabel
            Left = 92
            Top = 183
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP'
            FocusControl = DBEDtoPP
          end
          object LDtoComercial: TLFLabel
            Left = 225
            Top = 183
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Comercial'
          end
          object LCuenta: TLFLabel
            Left = 294
            Top = 7
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LModoIVA: TLFLabel
            Left = 82
            Top = 139
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object LTipoProveedor: TLFLabel
            Left = 56
            Top = 29
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Proveedor'
          end
          object LRetencion: TLFLabel
            Left = 292
            Top = 161
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retenci'#243'n'
          end
          object LBMoneda: TLFLabel
            Left = 90
            Top = 117
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLFecha9000: TLFLabel
            Left = 677
            Top = 148
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Vigencia'
            FocusControl = DBEDtoPP
          end
          object LPorcFinanciacion: TLFLabel
            Left = 428
            Top = 182
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Financiaci'#243'n'
          end
          object LblPais: TLFLabel
            Left = 107
            Top = 270
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LblTipoTrans: TLFLabel
            Left = 54
            Top = 314
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Transporte'
          end
          object LblDiasEntrega: TLFLabel
            Left = 454
            Top = 314
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Entr.'
          end
          object LCtaDtoPP: TLFLabel
            Left = 70
            Top = 205
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Dto. PP'
            FocusControl = DBEDtoPP
          end
          object LTransportistaKri: TLFLabel
            Left = 68
            Top = 380
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object LTransportistaRapiddoKri: TLFLabel
            Left = 31
            Top = 402
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista R'#225'pido'
          end
          object LDiasTransportistaKri: TLFLabel
            Left = 491
            Top = 380
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Entr.'
          end
          object LDiasTransportistaRapidoKri: TLFLabel
            Left = 491
            Top = 402
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Entr.'
          end
          object LDiasConfirmacionFechaKri: TLFLabel
            Left = 449
            Top = 358
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Conf. Fecha'
          end
          object LBTipoPortes: TLFLabel
            Left = 86
            Top = 336
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Portes'
          end
          object LBPorPortes: TLFLabel
            Left = 89
            Top = 358
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = '% Portes'
          end
          object LBIPortes: TLFLabel
            Left = 211
            Top = 358
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'I. Portes'
          end
          object LBloqueo: TLFLabel
            Left = 597
            Top = 292
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bloqueo'
          end
          object LMotivoBloqueo: TLFLabel
            Left = 606
            Top = 314
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo'
          end
          object LCodigoIncoterm: TLFLabel
            Left = 52
            Top = 424
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Incoterm'
          end
          object LTipoNCF: TLFLabel
            Left = 88
            Top = 446
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'TipoNCF'
          end
          object LIdioma: TLFLabel
            Left = 98
            Top = 292
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
          end
          object LBancoParaPagos: TLFLabel
            Left = 8
            Top = 95
            Width = 123
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco para realizar pagos'
            FocusControl = DBEDtoPP
          end
          object LProveedorPrestashop: TLFLabel
            Left = 637
            Top = 380
            Width = 105
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor Prestashop'
          end
          object LUltSincronizacion: TLFLabel
            Left = 654
            Top = 402
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = #218'lt. Sincronizacion'
          end
          object LMotivoBaja: TLFLabel
            Left = 582
            Top = 358
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Baja'
          end
          object LGrupoCuentas: TLFLabel
            Left = 540
            Top = 424
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo Cuentas'
          end
          object LCuentaIRPF: TLFLabel
            Left = 83
            Top = 227
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. IRPF'
            FocusControl = DBEDtoPP
          end
          object LNIF: TLFLabel
            Left = 452
            Top = 7
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LImporteMinimoPorte: TLFLabel
            Left = 594
            Top = 270
            Width = 99
            Height = 13
            Caption = 'Importe m'#237'nimo porte'
          end
          object LFechaAlta: TLFLabel
            Left = 683
            Top = 15
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Alta'
          end
          object LCuentaGastos: TLFLabel
            Left = 75
            Top = 249
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Gastos'
          end
          object LCampo1: TLFLabel
            Left = 87
            Top = 469
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 1'
            FocusControl = DBECampo1
          end
          object LCampo2: TLFLabel
            Left = 87
            Top = 489
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 2'
            FocusControl = DBECampo2
          end
          object LCampo3: TLFLabel
            Left = 87
            Top = 512
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 3'
            FocusControl = DBECampo3
          end
          object LCampo4: TLFLabel
            Left = 87
            Top = 533
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 4'
            FocusControl = DBECampo4
          end
          object LCampo5: TLFLabel
            Left = 473
            Top = 468
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 5'
            FocusControl = DBECampo5
          end
          object LCampo6: TLFLabel
            Left = 473
            Top = 489
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 6'
            FocusControl = DBECampo6
          end
          object LCampo7: TLFLabel
            Left = 473
            Top = 512
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 7'
            FocusControl = DBECampo7
          end
          object LCampo8: TLFLabel
            Left = 473
            Top = 534
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 8'
            FocusControl = DBECampo8
          end
          object LProyecto: TLFLabel
            Left = 568
            Top = 446
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object DBEProveedor: TLFDbedit
            Left = 135
            Top = 3
            Width = 66
            Height = 21
            Color = clInfoBk
            DataField = 'PROVEEDOR'
            DataSource = DMProveedores.DSProveedores
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object ETituloTercero: TLFEdit
            Left = 202
            Top = 47
            Width = 371
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
            OnDblClick = SBATerceroDblClick
            OnEnter = ETituloTerceroEnter
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 135
            Top = 47
            Width = 66
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 5
            OnChange = DBEFTerceroChange
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
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
          end
          object DBETituloFormaPago: TLFDbedit
            Left = 202
            Top = 69
            Width = 371
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSxFormasPago
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
          object DBEDiaPago2: TLFDbedit
            Left = 176
            Top = 157
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_2'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 16
          end
          object DBEDiaPago1: TLFDbedit
            Left = 135
            Top = 157
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_1'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 15
          end
          object DBEDtoPP: TLFDbedit
            Left = 135
            Top = 179
            Width = 66
            Height = 21
            DataField = 'DESCUENTO_PP'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 21
          end
          object DBEDto: TLFDbedit
            Left = 299
            Top = 179
            Width = 58
            Height = 21
            DataField = 'DESCUENTO'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 22
          end
          object DBETituloModoIva: TLFDbedit
            Left = 202
            Top = 135
            Width = 371
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSIvaModos
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
            Left = 347
            Top = 157
            Width = 26
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 18
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
            Left = 374
            Top = 157
            Width = 52
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_IRPF'
            DataSource = DMProveedores.DSIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 19
          end
          object DBETituloIRPF: TLFDbedit
            Left = 427
            Top = 157
            Width = 146
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 20
          end
          object DBETipoTercero: TLFDbedit
            Left = 202
            Top = 25
            Width = 371
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSxTipoTercero
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBCKPortes: TLFDBCheckBox
            Left = 325
            Top = 356
            Width = 96
            Height = 17
            Caption = 'Portes Pagados'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 41
            TabStop = True
            Visible = False
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'PORTES'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBAnticipos: TLFDBCheckBox
            Left = 591
            Top = 29
            Width = 260
            Height = 17
            Caption = 'Usar Anticipos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 53
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'USAR_ANTICIPOS'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 135
            Top = 69
            Width = 66
            Height = 21
            DataField = 'FORMA_PAGO'
            DataSource = DMProveedores.DSProveedores
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
            Top = 135
            Width = 66
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMProveedores.DSProveedores
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
          object DBEFTipoTercero: TLFDBEditFind2000
            Left = 135
            Top = 25
            Width = 66
            Height = 21
            DataField = 'TIPO'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 3
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
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBCBEvalFebSi: TLFDBCheckBox
            Left = 591
            Top = 167
            Width = 260
            Height = 17
            Caption = 'Obliga al d'#237'a 28 de Feb. en d'#237'a de pago siempre'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 62
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB_SI'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBEvalFeb: TLFDBCheckBox
            Left = 591
            Top = 186
            Width = 260
            Height = 17
            Caption = 'Evaluar Febrero en los d'#237'as de pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 63
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 135
            Top = 113
            Width = 66
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMProveedores.DSProveedores
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
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEMoneda: TLFDbedit
            Left = 202
            Top = 113
            Width = 371
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSxMoneda
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
          object DBCBISO9000: TLFDBCheckBox
            Left = 591
            Top = 147
            Width = 78
            Height = 17
            Caption = 'ISO 9000'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 60
            TabStop = True
            OnClick = DBCBISO9000Click
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'ISO9000'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 755
            Top = 145
            Width = 87
            Height = 21
            DataField = 'FECHA_ISO9000'
            DataSource = DMProveedores.DSProveedores
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 61
          end
          object DBCBFinanciacion: TLFDBCheckBox
            Left = 591
            Top = 48
            Width = 154
            Height = 17
            Caption = 'Financiaci'#243'n por L'#237'quido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 54
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FINANCIACION'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPor_Financiacion: TLFDbedit
            Left = 507
            Top = 179
            Width = 66
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 23
          end
          object DBFacSerie: TLFDBCheckBox
            Left = 591
            Top = 246
            Width = 150
            Height = 17
            Caption = 'Facturar siempre a la Serie'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 66
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'FACTURAR_SERIE'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFSeries: TLFDBEditFind2000
            Left = 754
            Top = 245
            Width = 87
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE_A_FACTURAR'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 67
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBFacAlmacen: TLFDBCheckBox
            Left = 591
            Top = 206
            Width = 260
            Height = 17
            Caption = 'No considerar el Almac'#233'n a la hora de facturar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 64
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'FACTURAR_ALMACEN'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 135
            Top = 267
            Width = 66
            Height = 21
            DataField = 'PAIS_C2'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 30
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
            Top = 267
            Width = 371
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSxPais
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
          end
          object DBChkBIntra: TLFDBCheckBox
            Left = 591
            Top = 68
            Width = 260
            Height = 17
            Caption = 'Proveedor para el INTRASTAT'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 56
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'INTRA'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFTipoTrans: TLFDBEditFind2000
            Left = 135
            Top = 311
            Width = 66
            Height = 21
            DataField = 'INTRA_TRANS'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 34
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
            Top = 311
            Width = 247
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSxTipoTrans
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 35
          end
          object DBEDiasEntrega: TLFDbedit
            Left = 507
            Top = 311
            Width = 66
            Height = 21
            DataField = 'DIAS_ENTREGA'
            DataSource = DMProveedores.DSProveedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 36
          end
          object DBEFCuentaDtoPP: TLFDBEditFind2000
            Left = 135
            Top = 201
            Width = 121
            Height = 21
            DataField = 'CUENTA_DTOPP'
            DataSource = DMProveedores.DSProveedores
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
          object DBETitCtaDtoPP: TLFDbedit
            Left = 257
            Top = 201
            Width = 316
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSxCuentas
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
          object DBEFTransportistaKri: TLFDBEditFind2000
            Left = 135
            Top = 377
            Width = 66
            Height = 21
            DataField = 'TRANSPORTISTA'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 43
            OnChange = DBEFTransportistaKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TRANSPORTE_RAPIDO_KRI=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = []
          end
          object ETransportistaKri: TLFEdit
            Left = 202
            Top = 377
            Width = 287
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 44
          end
          object ETransportistaRapidoKri: TLFEdit
            Left = 202
            Top = 399
            Width = 287
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 47
          end
          object DBEDiasTransportistaKri: TLFDbedit
            Left = 539
            Top = 377
            Width = 34
            Height = 21
            DataField = 'DIAS_TRANSPORTE'
            DataSource = DMProveedores.DSProveedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 45
          end
          object DBEDiasTransportistaRapidoKri: TLFDbedit
            Left = 539
            Top = 399
            Width = 34
            Height = 21
            DataField = 'DIAS_TRANSPORTE_RAPIDO'
            DataSource = DMProveedores.DSProveedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 48
          end
          object DBEDiasConfirmacionFechaKri: TLFDbedit
            Left = 539
            Top = 355
            Width = 34
            Height = 21
            DataField = 'DIAS_CONFIRM_TRANSPORTE'
            DataSource = DMProveedores.DSProveedores
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 42
          end
          object DBEFTransportistaRapidoKri: TLFDBEditFind2000
            Left = 135
            Top = 399
            Width = 66
            Height = 21
            DataField = 'TRANSPORTISTA_RAPIDO'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 46
            OnChange = DBEFTransportistaRapidoKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TRANSPORTE_RAPIDO_KRI=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = []
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 135
            Top = 333
            Width = 66
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 37
            OnChange = DBEFPortesChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_PORTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO<=4'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFTitPortes: TLFDbedit
            Left = 202
            Top = 333
            Width = 371
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProveedores.DSxPortes
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
          object DBEPorPortes: TLFDbedit
            Left = 135
            Top = 355
            Width = 66
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 39
          end
          object DBEIPortes: TLFDbedit
            Left = 255
            Top = 355
            Width = 66
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 40
          end
          object LFDBCheckBox1: TLFDBCheckBox
            Left = 591
            Top = 226
            Width = 260
            Height = 17
            Caption = 'Considerar referencia al recepcionar pedidos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 65
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'DISTINGUE_REFERENCIA'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBBloqueo: TDBComboBoxValue
            Left = 641
            Top = 289
            Width = 201
            Height = 21
            Hint = 'Tipo de bloqueo'
            Style = csDropDownList
            DataField = 'BLOQUEO'
            DataSource = DMProveedores.DSProveedores
            ItemHeight = 13
            Items.Strings = (
              'Sin mensaje'
              'Avisar'
              'Bloquear')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 69
            OnChange = DBCBBloqueoChange
          end
          object DBEMotivoBloqueo: TLFDbedit
            Left = 641
            Top = 311
            Width = 201
            Height = 21
            Hint = 'Motivo del bloqueo o aviso'
            DataField = 'MOTIVO_BLOQUEO'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 70
          end
          object DBEFCodigooIncoterm: TLFDBEditFind2000
            Left = 135
            Top = 421
            Width = 66
            Height = 21
            DataField = 'CODIGO_INCOTERM'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 49
            OnChange = DBEFCodigooIncotermChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_CODIGO_INCOTERM'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ECodigoIncoterm: TLFEdit
            Left = 202
            Top = 421
            Width = 287
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 50
          end
          object DBECuenta: TLFDBEditFind2000
            Left = 333
            Top = 3
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CUENTA'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 1
            OnKeyDown = DBECuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'tipo= 4 and gestion=4'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEMotivoBaja: TLFDbedit
            Left = 641
            Top = 355
            Width = 201
            Height = 21
            DataField = 'MOTIVO_BAJA'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 73
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 641
            Top = 333
            Width = 87
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = DMProveedores.DSProveedores
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 72
          end
          object DBCHKBaja: TLFDBCheckBox
            Left = 594
            Top = 334
            Width = 43
            Height = 17
            Caption = 'Baja'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 71
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKBajaChange
            DataField = 'BAJA'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBLCBTipoNCF: TDBLookupComboBox
            Left = 135
            Top = 443
            Width = 226
            Height = 21
            DataField = 'TIPO_NCF'
            DataSource = DMProveedores.DSProveedores
            KeyField = 'TIPO_NCF'
            ListField = 'TITULO'
            ListSource = DMProveedores.DSxTipoNCF
            TabOrder = 51
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 135
            Top = 289
            Width = 66
            Height = 21
            DataField = 'IDIOMA'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 32
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
            Top = 289
            Width = 371
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
            TabOrder = 33
          end
          object DBChkBRECC: TLFDBCheckBox
            Left = 591
            Top = 127
            Width = 260
            Height = 17
            Caption = 'R'#233'gimen Especial de Criterio de Caja'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 59
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECC'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFBancoParaPagos: TLFDBEditFind2000
            Left = 135
            Top = 91
            Width = 66
            Height = 21
            Hint = 'Banco de la empresa a travez del cual se realizan los pagos.'
            CharCase = ecUpperCase
            DataField = 'BANCO_PAGOS'
            DataSource = DMProveedores.DSProveedores
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
            Top = 91
            Width = 371
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 10
          end
          object DBEProveedorPrestashop: TLFDbedit
            Left = 746
            Top = 377
            Width = 96
            Height = 21
            Color = clInfoBk
            DataField = 'ID_SUPPLIER'
            DataSource = DMProveedores.DSQMPrestaShop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 74
          end
          object DEUltSincronizacion: TLFDBDateEdit
            Left = 746
            Top = 399
            Width = 96
            Height = 21
            DataField = 'ULT_SINCRONIZACION'
            DataSource = DMProveedores.DSQMPrestaShop
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            NumGlyphs = 2
            TabOrder = 75
          end
          object DBChkBValorarPed: TLFDBCheckBox
            Left = 591
            Top = 88
            Width = 260
            Height = 17
            Caption = 'Valorar Pedido'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 57
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PEDIDO_VALORADO'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBChkBValorarAlb: TLFDBCheckBox
            Left = 591
            Top = 107
            Width = 260
            Height = 17
            Caption = 'Valorar Albar'#225'n'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 58
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ALBARAN_VALORADO'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFGrupoCuentas: TLFDBEditFind2000
            Left = 615
            Top = 421
            Width = 44
            Height = 21
            DataField = 'GRUPO_CUENTAS'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 76
            OnChange = DBEFGrupoCuentasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GRUPO_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'GRUPO_CUENTAS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'GRUPO_CUENTAS')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitGrupoCuentas: TLFEdit
            Left = 660
            Top = 421
            Width = 182
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 77
          end
          object DBEFCuentaIRPF: TLFDBEditFind2000
            Left = 135
            Top = 223
            Width = 121
            Height = 21
            DataField = 'CUENTA_IRPF'
            DataSource = DMProveedores.DSProveedores
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
            Left = 257
            Top = 223
            Width = 316
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
            Text = 'Segun configuracion'
          end
          object DBENIF: TLFDbedit
            Left = 473
            Top = 3
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMProveedores.DSProveedores
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
          object DBEImporteMinimoPorte: TLFDbedit
            Left = 698
            Top = 267
            Width = 143
            Height = 21
            DataField = 'IMPORTE_MINIMO_PORTE'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 68
          end
          object DBEDiaPago3: TLFDbedit
            Left = 216
            Top = 157
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_3'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 17
          end
          object DBEFechaAlta: TLFDbedit
            Left = 729
            Top = 11
            Width = 112
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMProveedores.DSProveedores
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 52
          end
          object DBEFCuentaGastos: TLFDBEditFind2000
            Left = 135
            Top = 245
            Width = 121
            Height = 21
            DataField = 'CUENTA_GASTOS'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 28
            OnChange = DBEFCuentaGastosChange
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
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCuentaGastos: TLFEdit
            Left = 257
            Top = 245
            Width = 316
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
            Text = 'Segun configuracion'
          end
          object DBECampo1: TLFDbedit
            Left = 135
            Top = 465
            Width = 320
            Height = 21
            DataField = 'ALFA_1'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 80
          end
          object DBECampo2: TLFDbedit
            Left = 135
            Top = 487
            Width = 320
            Height = 21
            DataField = 'ALFA_2'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 81
          end
          object DBECampo3: TLFDbedit
            Left = 135
            Top = 509
            Width = 320
            Height = 21
            DataField = 'ALFA_3'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 82
          end
          object DBECampo4: TLFDbedit
            Left = 135
            Top = 531
            Width = 320
            Height = 21
            DataField = 'ALFA_4'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 83
          end
          object DBECampo5: TLFDbedit
            Left = 522
            Top = 465
            Width = 320
            Height = 21
            DataField = 'ALFA_5'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 84
          end
          object DBECampo6: TLFDbedit
            Left = 522
            Top = 487
            Width = 320
            Height = 21
            DataField = 'ALFA_6'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 85
          end
          object DBECampo7: TLFDbedit
            Left = 522
            Top = 509
            Width = 320
            Height = 21
            DataField = 'ALFA_7'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 86
          end
          object DBECampo8: TLFDbedit
            Left = 522
            Top = 531
            Width = 320
            Height = 21
            DataField = 'ALFA_8'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 87
          end
          object DBEFProyecto: TDBEditFind2000
            Left = 615
            Top = 443
            Width = 44
            Height = 21
            DataField = 'PROYECTO'
            DataSource = DMProveedores.DSProveedores
            TabOrder = 78
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
            OrdenadoPor.Strings = (
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EProyecto: TLFEdit
            Left = 660
            Top = 443
            Width = 182
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 79
          end
          object DBCBFactoring: TLFDBCheckBox
            Left = 754
            Top = 48
            Width = 87
            Height = 17
            Caption = 'Factoring'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 55
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTORING'
            DataSource = DMProveedores.DSProveedores
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PEditNotas: TLFPanel
          Left = 0
          Top = 23
          Width = 883
          Height = 531
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 883
            Height = 531
            Align = alClient
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMProveedores.DSProveedores
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 883
          Height = 23
          EdgeBorders = []
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PInfoNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEProveedorNotas: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
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
            object ETituloTerceroNotas: TLFEdit
              Left = 67
              Top = 1
              Width = 260
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
              TabOrder = 1
            end
          end
          object ToolButton4: TToolButton
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
            DataSource = DMProveedores.DSProveedores
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavNotasBeforeAction
            OnClick = NavNotasClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton6: TToolButton
            Left = 424
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtImprimirNotas: TToolButton
            Left = 432
            Top = 0
            Action = AImprimirNotas
          end
        end
      end
      object TSAgrupaciones: TTabSheet [2]
        Caption = '&Agrupaciones'
        OnResize = TSAgrupacionesResize
        OnShow = TSAgrupacionesShow
        object TBProv: TLFToolBar
          Left = 0
          Top = 0
          Width = 883
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLAgrupacionesProv: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEProveedorAgrupaciones: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
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
            object ETituloTerceroAgrupaciones: TLFEdit
              Left = 67
              Top = 1
              Width = 260
              Height = 21
              AutoSize = False
              Color = clInfoBk
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
            DataSource = DMProveedores.DSxAgrupSon
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
          object ToolButton5: TToolButton
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
            DataSource = DMProveedores.DSxAgrupDisp
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
        object PPertenece: TLFPanel
          Left = 0
          Top = 24
          Width = 883
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
          TabOrder = 1
        end
        object DBCGPertenece: TLFDBCtrlGrid
          Left = 0
          Top = 43
          Width = 883
          Height = 144
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMProveedores.DSxAgrupSon
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 24
          PanelWidth = 867
          ParentColor = False
          ParentFont = False
          TabOrder = 2
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
            DataSource = DMProveedores.DSxAgrupSon
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
            DataSource = DMProveedores.DSxAgrupSon
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
        object PDisponibles: TLFPanel
          Left = 0
          Top = 187
          Width = 883
          Height = 19
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Agrupaciones disponibles'
          Color = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          object EFiltroAgrupacion: TLFEdit
            Left = 0
            Top = -2
            Width = 300
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = EFiltroAgrupacionChange
          end
        end
        object DBCGDisponibles: TLFDBCtrlGrid
          Left = 0
          Top = 206
          Width = 883
          Height = 348
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMProveedores.DSxAgrupDisp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 34
          PanelWidth = 867
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
            DataSource = DMProveedores.DSxAgrupDisp
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
            DataSource = DMProveedores.DSxAgrupDisp
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
      object TSFacturaElectronica: TTabSheet [3]
        Caption = 'Fact. Elect.'
        ImageIndex = 11
        object TBTipoGiro: TLFToolBar
          Left = 0
          Top = 0
          Width = 934
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
            DataSource = DMProveedores.DSxTipoGiro
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
          Width = 934
          Height = 441
          Align = alClient
          DataSource = DMProveedores.DSxTipoGiro
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
      object TSRappel: TTabSheet [4]
        Caption = '&Rappel'
        ImageIndex = 3
        OnShow = TSRappelShow
        object PRappel: TLFPanel
          Left = 0
          Top = 0
          Width = 883
          Height = 532
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGDetalle: THYTDBGrid
            Left = 0
            Top = 0
            Width = 883
            Height = 532
            Align = alClient
            DataSource = DMProveedores.DSQMRappel
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
            AutoDeseleccionar = True
            ControlEdit = CERappelPMEdit
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'IMPORTE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Alignment = taRightJustify
                Width = 148
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RAPPEL'
                Title.Alignment = taRightJustify
                Width = 167
                Visible = True
              end>
          end
        end
        object TBRappel: TLFToolBar
          Left = 0
          Top = 532
          Width = 883
          Height = 22
          Align = alBottom
          ButtonWidth = 27
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NAVRappel: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            Hint = 'Navegador de los Rappels'
            DataSource = DMProveedores.DSQMRappel
            Align = alLeft
            Flat = True
            ParentShowHint = False
            PopupMenu = CERappelPMEdit
            ShowHint = True
            TabOrder = 0
            OnClick = NAVRappelClick
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGDetalle
            InsertaControl = DBGDetalle
            Exclusivo = True
            ControlEdit = CERappel
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NAVRappelClickAfterAdjust
          end
          object ToolButton2: TToolButton
            Left = 220
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object PNLRappel: TLFPanel
            Left = 228
            Top = 0
            Width = 283
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object LBLRappelAnual: TLFLabel
              Left = 28
              Top = 5
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Rappel Anual'
            end
            object ERappelAnual: THYGRightEdit
              Left = 96
              Top = 1
              Width = 121
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
      end
      object TSDescuentos: TTabSheet [5]
        Caption = '&Descuentos'
        ImageIndex = 8
        object TBDescuentos: TLFToolBar
          Left = 0
          Top = 0
          Width = 883
          Height = 23
          ButtonWidth = 22
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLDescuentosProv: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEProveedorDescuentos: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
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
            object ETituloTerceroDescuentos: TLFEdit
              Left = 67
              Top = 1
              Width = 260
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
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavDescuentos: THYMNavigator
            Left = 336
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMProveedores.DSQMDescuentosKri
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDescuentosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = False
            ControlEdit = CEDescuentos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLDescuentos: TLFPanel
          Left = 0
          Top = 23
          Width = 883
          Height = 531
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGDescuentos: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 883
            Height = 531
            Align = alClient
            DataSource = DMProveedores.DSQMDescuentosKri
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = False
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
            Transaction = DMProveedores.TLocal
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'DTO_CIAL'
              'IMPORTE')
            ColumnasCheckBoxes.Strings = (
              'ACTIVO'
              'APLICA_ALP'
              'APLICA_FAP'
              'APLICA_PEP')
            ColumnasChecked.Strings = (
              '1'
              '1'
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0'
              '0'
              '0')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'IMPORTE'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DTO_CIAL'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APLICA_PEP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APLICA_ALP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'APLICA_FAP'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ACTIVO'
                Visible = True
              end>
          end
        end
      end
      object TSEstadisticas: TTabSheet [6]
        Caption = 'Estad'#237'sticas'
        ImageIndex = 6
        OnHide = TSEstadisticasHide
        OnShow = TSEstadisticasShow
        object LFTEstadisticas: TLFToolBar
          Left = 0
          Top = 0
          Width = 883
          Height = 26
          ButtonWidth = 91
          EdgeBorders = []
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object DBEProveedorEstadisitcas: TLFDbedit
            Left = 0
            Top = 2
            Width = 66
            Height = 22
            Color = clInfoBk
            DataField = 'PROVEEDOR'
            DataSource = DMProveedores.DSProveedores
            Enabled = False
            TabOrder = 0
          end
          object ETituloTerceroEstadisticas: TLFEdit
            Left = 66
            Top = 2
            Width = 260
            Height = 22
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
        end
        object LFPCEstadisticas: TLFPageControl
          Left = 0
          Top = 26
          Width = 883
          Height = 528
          ActivePage = TSGrafico
          Align = alClient
          OwnerDraw = True
          TabIndex = 1
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSDocumentos: TTabSheet
            Caption = 'Documentos'
            object FPDocumentos: TFlatPanel
              Left = 0
              Top = 32
              Width = 734
              Height = 102
              ParentColor = True
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              TabOrder = 0
              object LPedidosPendientes: TLFLabel
                Left = 136
                Top = 27
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pedidos Pendientes'
              end
              object LFLAlbPend: TLFLabel
                Left = 127
                Top = 51
                Width = 103
                Height = 13
                Alignment = taRightJustify
                Caption = 'Albaranes Pendientes'
              end
              object LFLFactPend: TLFLabel
                Left = 115
                Top = 75
                Width = 116
                Height = 13
                Alignment = taRightJustify
                Caption = 'Facturas Sin Contabilizar'
              end
              object LNum: TLFLabel
                Left = 235
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
                Left = 288
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
                Left = 404
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
              object SBVerPedPend: TSpeedButton
                Left = 40
                Top = 8
                Width = 23
                Height = 22
                Action = APedPendDet
                OnDblClick = APedPendDetExecute
              end
              object SBVerAlbPend: TSpeedButton
                Left = 40
                Top = 32
                Width = 23
                Height = 22
                Action = AAlbaranesDet
                OnDblClick = AAlbaranesDetExecute
              end
              object SBVerFacPend: TSpeedButton
                Left = 40
                Top = 56
                Width = 23
                Height = 22
                Action = AFactPendDet
                OnDblClick = AFactPendDetExecute
              end
              object LFEPedPend: TLFEdit
                Left = 533
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
              object LFEAlbPend: TLFEdit
                Left = 533
                Top = 48
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
                TabOrder = 1
              end
              object LFEFactPend: TLFEdit
                Left = 533
                Top = 72
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
              object LFDEFactPendLIQUIDO: TLFDbedit
                Left = 408
                Top = 72
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'T_FAC_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object LFDEAlbPendLIQUIDO: TLFDbedit
                Left = 408
                Top = 48
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'T_ALB_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object LFDEPedPendLIQUIDO: TLFDbedit
                Left = 408
                Top = 24
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'T_PED_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object LFDEPedPendBASE: TLFDbedit
                Left = 291
                Top = 24
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_PED_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 6
              end
              object LFDEAlbPendBASE: TLFDbedit
                Left = 291
                Top = 48
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_ALB_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 7
              end
              object LFDEFactPendBASE: TLFDbedit
                Left = 291
                Top = 72
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_FAC_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 8
              end
              object LFDEFactPendNUMERO: TLFDbedit
                Left = 238
                Top = 72
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_FAC_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 9
              end
              object LFDEAlbPendNUMERO: TLFDbedit
                Left = 238
                Top = 48
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_ALB_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 10
              end
              object LFDEPedPendNUMERO: TLFDbedit
                Left = 238
                Top = 24
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PED_PEND'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 11
              end
            end
            object FPImpagados: TFlatPanel
              Left = 0
              Top = 131
              Width = 737
              Height = 129
              ParentColor = True
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              TabOrder = 1
              object LRecPend: TLFLabel
                Left = 124
                Top = 80
                Width = 106
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Pend. Recibir'
              end
              object LRecPendRetraso: TLFLabel
                Left = 303
                Top = 105
                Width = 99
                Height = 13
                Alignment = taRightJustify
                Caption = 'Plz. Medio de Env'#237'o.'
              end
              object LRecPendPlazo: TLFLabel
                Left = 144
                Top = 104
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Plazo Medio Pago'
              end
              object LRecNoCob: TLFLabel
                Left = 129
                Top = 56
                Width = 101
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Pend. Pagar'
              end
              object LRecImp: TLFLabel
                Left = 136
                Top = 32
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Impagados'
              end
              object LFFactCobr: TLFLabel
                Left = 144
                Top = 9
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Facturas Pagadas'
              end
              object SBVerFacPag: TSpeedButton
                Left = 48
                Top = 4
                Width = 23
                Height = 22
                Action = AFactCobDet
                OnDblClick = AFactCobDetExecute
              end
              object SBVerImpagados: TSpeedButton
                Left = 48
                Top = 27
                Width = 23
                Height = 22
                Action = ARecibosImpagados
                OnDblClick = ARecibosImpagadosExecute
              end
              object SBVerRecPendPag: TSpeedButton
                Left = 48
                Top = 51
                Width = 23
                Height = 22
                Action = ARecibosPenPag
                OnDblClick = ARecibosPenPagExecute
              end
              object SBVerRecPendRec: TSpeedButton
                Left = 48
                Top = 75
                Width = 23
                Height = 22
                Action = ARecibosPenRec
                OnDblClick = ARecibosPenRecExecute
              end
              object LFEEstadoRecPend: TLFEdit
                Left = 408
                Top = 78
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
                Top = 30
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_IMPAGADO'
                DataSource = DMProveedores.DSxFactPend
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
                Top = 54
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
                Top = 30
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
                Left = 238
                Top = 30
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_IMPAGADO'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                TabOrder = 4
              end
              object LFDERecNoCobradosIMPORTE: TLFDbedit
                Left = 291
                Top = 54
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_COBRAR'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object LFDERecNoCobradosNUMERO: TLFDbedit
                Left = 238
                Top = 54
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_COBRAR'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                TabOrder = 6
              end
              object LFDERecPendNUMERO: TLFDbedit
                Left = 238
                Top = 78
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_RECIBIR'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                TabOrder = 7
              end
              object LFDERecPendRetraso: TLFDbedit
                Left = 408
                Top = 102
                Width = 52
                Height = 21
                Color = clInfoBk
                DataField = 'MEDIA_DIAS_REC'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                TabOrder = 8
              end
              object LFDEREcPendPLazo: TLFDbedit
                Left = 238
                Top = 102
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'MEDIA_DIAS_PAGO'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                TabOrder = 9
              end
              object LFDERecPendIMPORTE: TLFDbedit
                Left = 291
                Top = 78
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_RECIBIR'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object LFDFactCobrNUMERO: TLFDbedit
                Left = 238
                Top = 6
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PAGADO'
                DataSource = DMProveedores.DSxFactPend
                Enabled = False
                TabOrder = 11
              end
              object LFDFactCobrLIQUIDO: TLFDbedit
                Left = 291
                Top = 6
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PAGADO'
                DataSource = DMProveedores.DSxFactPend
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
                Top = 6
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
              Left = 0
              Top = 258
              Width = 737
              Height = 113
              ParentColor = True
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              TabOrder = 2
              object LPPRecibir: TLFLabel
                Left = 147
                Top = 13
                Width = 84
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pendiente Recibir'
              end
              object LPPCobrar: TLFLabel
                Left = 152
                Top = 36
                Width = 79
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pendiente Pagar'
              end
              object LAnticipo: TLFLabel
                Left = 193
                Top = 63
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Caption = 'Anticipo'
              end
              object LAntCuenta: TLFLabel
                Left = 197
                Top = 87
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta'
              end
              object LFDEPPRecibirNUMERO: TLFDbedit
                Left = 238
                Top = 9
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_RECIBIR'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 0
              end
              object LFDEPPRecibirIMPORTE: TLFDbedit
                Left = 291
                Top = 9
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_RECIBIR'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 1
              end
              object LFDEPPCobrarNUMERO: TLFDbedit
                Left = 238
                Top = 34
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_COBRAR'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 2
              end
              object LFDEPPCobrarIMPORTE: TLFDbedit
                Left = 291
                Top = 34
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_COBRAR'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 3
              end
              object LFDEAnticipo: TLFDbedit
                Left = 238
                Top = 59
                Width = 166
                Height = 21
                Color = clInfoBk
                DataField = 'T_PAGADO'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 4
              end
              object LFEAnticipo: TLFEdit
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
                TabOrder = 5
              end
              object LFDEAntCuenta: TLFDbedit
                Left = 238
                Top = 83
                Width = 166
                Height = 21
                Color = clInfoBk
                DataField = 'CUENTA_ANTICIPO'
                DataSource = DMProveedores.DSxDocumentos
                Enabled = False
                TabOrder = 6
              end
              object LFEPPRecibir: TLFEdit
                Left = 408
                Top = 9
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
                TabOrder = 7
              end
              object LFEPPCobrar: TLFEdit
                Left = 408
                Top = 33
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
                TabOrder = 8
              end
            end
          end
          object TSGrafico: TTabSheet
            Caption = 'Gr'#225'ficos'
            ImageIndex = 1
            OnShow = TSGraficoShow
            object LFestadisticas: TLFPanel
              Left = 0
              Top = 0
              Width = 486
              Height = 502
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object LEstadisticasEnero: TLFLabel
                Left = 7
                Top = 99
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ene'
              end
              object LEstadisticasFebrero: TLFLabel
                Left = 8
                Top = 123
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Feb'
              end
              object LEstadisticasMarzo: TLFLabel
                Left = 8
                Top = 147
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Mar'
              end
              object LEstadisticasAbril: TLFLabel
                Left = 10
                Top = 170
                Width = 16
                Height = 13
                Alignment = taRightJustify
                Caption = 'Abr'
              end
              object LEstadisticasMayo: TLFLabel
                Left = 6
                Top = 194
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'May'
              end
              object LEstadisticasJunio: TLFLabel
                Left = 9
                Top = 217
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'Jun'
              end
              object LEstadisticasJulio: TLFLabel
                Left = 13
                Top = 242
                Width = 13
                Height = 13
                Alignment = taRightJustify
                Caption = 'Jul'
              end
              object LEstadisticasAgosto: TLFLabel
                Left = 7
                Top = 265
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ago'
              end
              object LEstadisticasSeptiembre: TLFLabel
                Left = 7
                Top = 289
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Sep'
              end
              object LEstadisticasOctubre: TLFLabel
                Left = 9
                Top = 313
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oct'
              end
              object LEstadisticasNoviembre: TLFLabel
                Left = 6
                Top = 337
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nov'
              end
              object LEstadisticasDiciembre: TLFLabel
                Left = 10
                Top = 361
                Width = 16
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dic'
              end
              object LFComparar: TLFLabel
                Left = 28
                Top = 67
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
                Top = 67
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
                Top = 67
                Width = 150
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
              object LEstadisticasTotal: TLFLabel
                Left = 0
                Top = 386
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
              object LEstadisticaBaseEjercicio: TLFLabel
                Left = 28
                Top = 80
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
              object LEstadisticaBaseEjercicioSig: TLFLabel
                Left = 180
                Top = 80
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
              object LEstadisticaBasePrevision: TLFLabel
                Left = 332
                Top = 80
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
                Left = 121
                Top = 11
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'Estimaci'#243'n  (%)'
              end
              object LFLEjercicioActual: TLFLabel
                Left = 13
                Top = 10
                Width = 50
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ejercicio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LFLEjercicioComparar: TLFLabel
                Left = 13
                Top = 34
                Width = 50
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ejercicio'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LTipoDoc: TLFLabel
                Left = 247
                Top = 11
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo documento'
              end
              object LEstadisticasMoneda: TLFLabel
                Left = 285
                Top = 34
                Width = 39
                Height = 13
                Alignment = taRightJustify
                Caption = 'Moneda'
              end
              object LEstadisticaLiquidoEjercicio: TLFLabel
                Left = 104
                Top = 80
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Liquido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LEstadisticaLiquidoEjercicioSig: TLFLabel
                Left = 256
                Top = 80
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Liquido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LEstadisticaLiquidoEjercicioPrevision: TLFLabel
                Left = 408
                Top = 80
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Liquido'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEFBaseEneroAC: TLFDbedit
                Left = 180
                Top = 95
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 0
              end
              object DBEFBaseFebreroAC: TLFDbedit
                Left = 180
                Top = 119
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 1
              end
              object DBEFBaseMarzoAC: TLFDbedit
                Left = 180
                Top = 143
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 2
              end
              object DBEFBaseAbrilAC: TLFDbedit
                Left = 180
                Top = 167
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 3
              end
              object DBEFBaseMayoAC: TLFDbedit
                Left = 180
                Top = 191
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 4
              end
              object DBEFBaseJunioAC: TLFDbedit
                Left = 180
                Top = 215
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 5
              end
              object DBEFBaseJulioAC: TLFDbedit
                Left = 180
                Top = 239
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 6
              end
              object DBEFBaseAgostoAC: TLFDbedit
                Left = 180
                Top = 263
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 7
              end
              object DBEFBaseSeptiembreAC: TLFDbedit
                Left = 180
                Top = 287
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 8
              end
              object DBEFBaseOctubreAC: TLFDbedit
                Left = 180
                Top = 311
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 9
              end
              object DBEFBaseNoviembreAC: TLFDbedit
                Left = 180
                Top = 335
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 10
              end
              object DBEFBaseDiciembreAC: TLFDbedit
                Left = 180
                Top = 359
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 11
              end
              object DBEFBaseEneroCOMP: TLFDbedit
                Left = 28
                Top = 95
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 12
              end
              object DBEFBaseFebreroCOMP: TLFDbedit
                Left = 28
                Top = 119
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 13
              end
              object DBEFBaseMarzoCOMP: TLFDbedit
                Left = 28
                Top = 143
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 14
              end
              object DBEFBaseAbrilCOMP: TLFDbedit
                Left = 28
                Top = 167
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 15
              end
              object DBEFBaseMayoCOMP: TLFDbedit
                Left = 28
                Top = 191
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 16
              end
              object DBEFBaseJunioCOMP: TLFDbedit
                Left = 28
                Top = 215
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 17
              end
              object DBEFBaseJulioCOMP: TLFDbedit
                Left = 28
                Top = 239
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 18
              end
              object DBEFBaseAgostoCOMP: TLFDbedit
                Left = 28
                Top = 263
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 19
              end
              object DBEFBaseSeptiembreCOMP: TLFDbedit
                Left = 28
                Top = 287
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 20
              end
              object DBEFBaseOctubreCOMP: TLFDbedit
                Left = 28
                Top = 311
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 21
              end
              object DBEFBaseNoviembreCOMP: TLFDbedit
                Left = 28
                Top = 335
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 22
              end
              object DBEFBaseDiciembreCOMP: TLFDbedit
                Left = 28
                Top = 359
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 23
              end
              object DBEFBaseEneroPREV: TLFDbedit
                Left = 332
                Top = 95
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 24
              end
              object DBEFBaseFebreroPREV: TLFDbedit
                Left = 332
                Top = 119
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 25
              end
              object DBEFBaseMarzoPREV: TLFDbedit
                Left = 332
                Top = 143
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 26
              end
              object DBEFBaseAbrilPREV: TLFDbedit
                Left = 332
                Top = 167
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 27
              end
              object DBEFBaseMayoPREV: TLFDbedit
                Left = 332
                Top = 191
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 28
              end
              object DBEFBaseJunioPREV: TLFDbedit
                Left = 332
                Top = 215
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 29
              end
              object DBEFBaseJulioPREV: TLFDbedit
                Left = 332
                Top = 239
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 30
              end
              object DBEFBaseAgostoPREV: TLFDbedit
                Left = 332
                Top = 263
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 31
              end
              object DBEFBaseSeptiembrePREV: TLFDbedit
                Left = 332
                Top = 287
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 32
              end
              object DBEFBaseOctubrePREV: TLFDbedit
                Left = 332
                Top = 311
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 33
              end
              object DBEFBaseNoviembrePREV: TLFDbedit
                Left = 332
                Top = 335
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 34
              end
              object DBEFBaseDiciembrePREV: TLFDbedit
                Left = 332
                Top = 359
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 35
              end
              object DBEFTotalBaseAC: TLFDbedit
                Left = 180
                Top = 383
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMProveedores.DSxFacturasAnual
                Enabled = False
                TabOrder = 36
              end
              object DBEFTotalBaseCOMP: TLFDbedit
                Left = 28
                Top = 383
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMProveedores.DSxFacturasAnualCompara
                Enabled = False
                TabOrder = 37
              end
              object DBEFTotalBasePREV: TLFDbedit
                Left = 332
                Top = 383
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMProveedores.DSxPrevisionAnual
                Enabled = False
                TabOrder = 38
              end
              object DBEFLiquidoEneroAC: TLFDbedit
                Left = 256
                Top = 95
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 39
              end
              object DBEFLiquidoFebreroAC: TLFDbedit
                Left = 256
                Top = 119
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 40
              end
              object DBEFLiquidoMarzoAC: TLFDbedit
                Left = 256
                Top = 143
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 41
              end
              object DBEFLiquidoAbrilAC: TLFDbedit
                Left = 256
                Top = 167
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 42
              end
              object DBEFLiquidoMayoAC: TLFDbedit
                Left = 256
                Top = 191
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 43
              end
              object DBEFLiquidoJunioAC: TLFDbedit
                Left = 256
                Top = 215
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 44
              end
              object DBEFLiquidoJulioAC: TLFDbedit
                Left = 256
                Top = 239
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JULIO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 45
              end
              object DBEFLiquidoAgostoAC: TLFDbedit
                Left = 256
                Top = 263
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 46
              end
              object DBEFLiquidoSeptiembreAC: TLFDbedit
                Left = 256
                Top = 287
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 47
              end
              object DBEFLiquidoOctubreAC: TLFDbedit
                Left = 256
                Top = 311
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 48
              end
              object DBEFLiquidoNoviembreAC: TLFDbedit
                Left = 256
                Top = 335
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 49
              end
              object DBEFLiquidoDiciembreAC: TLFDbedit
                Left = 256
                Top = 359
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensual
                Enabled = False
                TabOrder = 50
              end
              object DBEFTotalLiquidoAC: TLFDbedit
                Left = 256
                Top = 383
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMProveedores.DSxFacturasAnual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 51
              end
              object DBEFLiquidoEneroCOMP: TLFDbedit
                Left = 104
                Top = 95
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 52
              end
              object DBEFLiquidoFebreroCOMP: TLFDbedit
                Left = 104
                Top = 119
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 53
              end
              object DBEFLiquidoMarzoCOMP: TLFDbedit
                Left = 104
                Top = 143
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 54
              end
              object DBEFLiquidoAbrilCOMP: TLFDbedit
                Left = 104
                Top = 167
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 55
              end
              object DBEFLiquidoMayoCOMP: TLFDbedit
                Left = 104
                Top = 191
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 56
              end
              object DBEFLiquidoJunioCOMP: TLFDbedit
                Left = 104
                Top = 215
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 57
              end
              object DBEFLiquidoJulioCOMP: TLFDbedit
                Left = 104
                Top = 239
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JULIO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 58
              end
              object DBEFLiquidoAgostoCOMP: TLFDbedit
                Left = 104
                Top = 263
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 59
              end
              object DBEFLiquidoSeptiembreCOMP: TLFDbedit
                Left = 104
                Top = 287
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 60
              end
              object DBEFLiquidoOctubreCOMP: TLFDbedit
                Left = 104
                Top = 311
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 61
              end
              object DBEFLiquidoNoviembreCOMP: TLFDbedit
                Left = 104
                Top = 335
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 62
              end
              object DBEFLiquidoDiciembreCOMP: TLFDbedit
                Left = 104
                Top = 359
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMProveedores.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 63
              end
              object DBEFTotalLiquidoCOMP: TLFDbedit
                Left = 104
                Top = 383
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMProveedores.DSxFacturasAnualCompara
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 64
              end
              object DBEFLiquidoEneroPREV: TLFDbedit
                Left = 408
                Top = 95
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 65
              end
              object DBEFLiquidoFebreroPREV: TLFDbedit
                Left = 408
                Top = 119
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 66
              end
              object DBEFLiquidoMarzoPREV: TLFDbedit
                Left = 408
                Top = 143
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 67
              end
              object DBEFLiquidoAbrilPREV: TLFDbedit
                Left = 408
                Top = 167
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 68
              end
              object DBEFLiquidoMayoPREV: TLFDbedit
                Left = 408
                Top = 191
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 69
              end
              object DBEFLiquidoJunioPREV: TLFDbedit
                Left = 408
                Top = 215
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 70
              end
              object DBEFLiquidoJulioPREV: TLFDbedit
                Left = 408
                Top = 239
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'B_JULIO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 71
              end
              object DBEFLiquidoAgostoPREV: TLFDbedit
                Left = 408
                Top = 263
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 72
              end
              object DBEFLiquidoSeptiembrePREV: TLFDbedit
                Left = 408
                Top = 287
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 73
              end
              object DBEFLiquidoOctubrePREV: TLFDbedit
                Left = 408
                Top = 311
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 74
              end
              object DBEFLiquidoNoviembrePREV: TLFDbedit
                Left = 408
                Top = 335
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 75
              end
              object DBEFLiquidoDiciembrePREV: TLFDbedit
                Left = 408
                Top = 359
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMProveedores.DSxPrevisionMensual
                Enabled = False
                TabOrder = 76
              end
              object DBEFTotalLiquidoPREV: TLFDbedit
                Left = 408
                Top = 383
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMProveedores.DSxPrevisionAnual
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 77
              end
              object EPorcentajeEstimacion: TLFEdit
                Left = 202
                Top = 7
                Width = 40
                Height = 21
                TabOrder = 80
              end
              object BBEjercicioComparar: TBitBtn
                Left = 401
                Top = 7
                Width = 71
                Height = 21
                Caption = 'Calcula ->'
                TabOrder = 83
                OnClick = ACalculaEstadisticasExecute
              end
              object EEjercicio2: TLFEdit
                Left = 64
                Top = 30
                Width = 40
                Height = 21
                TabOrder = 79
              end
              object EEjercicio: TLFEdit
                Left = 64
                Top = 7
                Width = 40
                Height = 21
                TabOrder = 78
              end
              object CBTipoDoc: TLFComboBox
                Left = 329
                Top = 7
                Width = 61
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 81
                Text = 'FAP'
                Items.Strings = (
                  'FAP'
                  'ALP'
                  'PEP'
                  'OFP')
              end
              object BBMultiSelect: TBitBtn
                Left = 401
                Top = 30
                Width = 71
                Height = 21
                Caption = 'Multi-Selec'
                TabOrder = 84
                OnClick = BBMultiSelectClick
              end
              object CBMonedas: TLFComboBox
                Left = 329
                Top = 30
                Width = 61
                Height = 21
                ItemHeight = 13
                TabOrder = 82
              end
            end
            object LFGrafica: TLFPanel
              Left = 486
              Top = 0
              Width = 389
              Height = 502
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBCAnual: TDBChart
                Left = 0
                Top = 0
                Width = 440
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
                  DataSource = DMProveedores.DSxFacturasAnualC_3
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
                  DataSource = DMProveedores.DSxFacturasAnualC_2
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
                  DataSource = DMProveedores.DSxFacturasAnualC_1
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
                  DataSource = DMProveedores.DSxFacturasAnualCompara
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
                  DataSource = DMProveedores.DSxFacturasAnual
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
              object DBCMensual: TDBChart
                Left = 0
                Top = 142
                Width = 440
                Height = 141
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
                TabOrder = 1
                OnDblClick = DBCMensualDblClick
                object BarSeries4: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Style = smsValue
                  Marks.Visible = False
                  DataSource = DMProveedores.DSxFacturasMensualCompara
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
                  DataSource = DMProveedores.DSxFacturasMensual
                  SeriesColor = clGreen
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
              object DBCPrevision: TDBChart
                Left = 0
                Top = 283
                Width = 440
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
                TabOrder = 2
                Locked = True
                OnDblClick = DBCPrevisionDblClick
                object BarSeries2: TBarSeries
                  Marks.ArrowLength = 20
                  Marks.Visible = False
                  DataSource = DMProveedores.DSxPrevisionMensual
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
                  DataSource = DMProveedores.DSxFacturasMensual
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
            end
          end
        end
      end
      object TSCompras: TTabSheet [7]
        Caption = 'Compras'
        ImageIndex = 6
        OnHide = TSComprasHide
        OnShow = TSComprasShow
        object PNLFltroVentas: TLFPanel
          Left = 0
          Top = 22
          Width = 883
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
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
            Width = 56
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            Text = 'Todos'
            OnChange = FiltroComprasChange
            Items.Strings = (
              'Todos'
              'OFP'
              'OCP'
              'PEP'
              'ALP'
              'FAP')
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
          object CBPedidosPendientes: TLFCheckBox
            Left = 808
            Top = 2
            Width = 105
            Height = 17
            Caption = 'Ped. Pendientes'
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
        object TBVentas: TLFToolBar
          Left = 0
          Top = 0
          Width = 883
          Height = 22
          AutoSize = True
          Caption = 'Informacion Comercial'
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLVentasCliente: TLFPanel
            Left = 0
            Top = 0
            Width = 361
            Height = 22
            Enabled = False
            TabOrder = 0
            object DBEComprasProveedor: TLFDbedit
              Left = 2
              Top = 1
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
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
              DataSource = DMProveedores.DSProveedores
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
            Width = 110
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
        object PCCompras: TLFPageControl
          Left = 0
          Top = 44
          Width = 883
          Height = 510
          ActivePage = TSComrasDocumentos
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 2
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSComrasDocumentos: TTabSheet
            Caption = 'Documentos'
            OnShow = TSComrasDocumentosShow
            object DBGComprasDocumento: THYTDBGrid
              Left = 0
              Top = 0
              Width = 875
              Height = 482
              Align = alClient
              Color = clInfoBk
              DataSource = DMProveedores.DSxCompras
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
              UsaDicG2K = False
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
                  Width = 45
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
                  Width = 45
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LIQUIDO'
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
              Width = 875
              Height = 482
              Align = alClient
              Color = clInfoBk
              DataSource = DMProveedores.DSxComprasDetalle
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
                  Width = 50
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
                  Width = 70
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
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_POR_SERVIR'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_COSTE'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_2'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_3'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'B_DTO_LINEA'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'C_IVA'
                  Width = 66
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
                  Width = 65
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
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FORMA_PAGO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ESTADO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'S_BASES'
                  Width = 66
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'S_CUOTA_IVA'
                  Width = 66
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO_PP'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DTO_CIAL'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LIQUIDO'
                  Width = 66
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_PROVEEDOR'
                  Width = 90
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
      end
      object TSIso: TTabSheet [8]
        Caption = 'Iso'
        ImageIndex = 7
        object DBGIso: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 778
          Height = 517
          Hint = 'Iso'
          Align = alClient
          Color = clInfoBk
          DataSource = DMProveedores.DSxIsoPro
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGIsoDblClick
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
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'RIC'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SITUACION'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE_DOC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_DOC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INC'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_TOTAL'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NDEVOLUCION'
              Width = 90
              Visible = True
            end>
        end
      end
      object TSComunicaciones: TTabSheet [9]
        Caption = '&Comunicaciones'
        ImageIndex = 7
        OnHide = TSComunicacionesHide
        OnShow = TSComunicacionesShow
        object DBGComunicaciones: TDBGridFind2000
          Left = 0
          Top = 23
          Width = 934
          Height = 442
          Align = alClient
          DataSource = DMProveedores.DSxComunicaciones
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
          Width = 934
          Height = 23
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLComunicacionesProv: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEProveedorComunicaciones: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
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
            object ETituloTerceroComunicaciones: TLFEdit
              Left = 67
              Top = 1
              Width = 260
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
            DataSource = DMProveedores.DSxComunicaciones
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
            DropdownMenu = PMPlantillasComunicaciones
            ImageIndex = 57
            Style = tbsDropDown
          end
          object LComunicacionesBusqueda: TLFLabel
            Left = 626
            Top = 0
            Width = 67
            Height = 22
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Busqueda '
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
      object TSIncidencias: TTabSheet [10]
        Caption = '&Incidencias'
        object Splitter1: TSplitter
          Left = 0
          Top = 357
          Width = 934
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object DBGIncidencias: THYTDBGrid
          Left = 0
          Top = 23
          Width = 934
          Height = 334
          Align = alClient
          Color = clInfoBk
          DataSource = DMProveedores.DSxIncidencias
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
            'TITULO_INCIDENCIA'
            'TITULO_TERCERO'
            'USUARIO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_INCIDENCIA_KRI'
              Width = 60
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
              Width = 481
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
          Width = 934
          Height = 23
          ButtonWidth = 22
          EdgeBorders = []
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLIncidenciasProv: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEProveedorIncidencias: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
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
            object ETituloTerceroIncidencias: TLFEdit
              Left = 67
              Top = 1
              Width = 260
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
              TabOrder = 1
            end
          end
        end
        object DBMMDatosIncidencia: TLFDBMemo
          Left = 0
          Top = 365
          Width = 934
          Height = 100
          Align = alBottom
          BevelInner = bvNone
          Color = clInfoBk
          Constraints.MinHeight = 21
          DataField = 'DATOS_INCIDENCIA'
          DataSource = DMProveedores.DSxIncidencias
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object TSAvisos: TTabSheet [11]
        Caption = 'Avisos'
        ImageIndex = 12
        object TBAvisos: TLFToolBar
          Left = 0
          Top = 0
          Width = 883
          Height = 23
          ButtonWidth = 22
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLAvisosProveedor: TLFPanel
            Left = 0
            Top = 0
            Width = 328
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEProveedorAvisos: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
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
            object ETituloTerceroAvisos: TLFEdit
              Left = 67
              Top = 1
              Width = 260
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
              TabOrder = 1
            end
          end
          object TSep1: TToolButton
            Left = 328
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAvisos: THYMNavigator
            Left = 336
            Top = 0
            Width = 96
            Height = 22
            DataSource = DMProveedores.DSxAvisos
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAvisosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMAvisoOFP
            InsertaControl = DBMAvisoOFP
            Exclusivo = False
            ControlEdit = CEAvisos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLAvisos: TLFPanel
          Left = 0
          Top = 23
          Width = 883
          Height = 531
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          OnResize = PNLAvisosResize
          DesignSize = (
            883
            531)
          object DBCBAvisoActivoOCP: TLFDBCheckBox
            Left = 64
            Top = 87
            Width = 338
            Height = 17
            Caption = 'Activo en Propuestas Confirmadas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_OCP'
            DataSource = DMProveedores.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoOCP: TLFDBMemo
            Left = 64
            Top = 104
            Width = 707
            Height = 60
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_OCP'
            DataSource = DMProveedores.DSxAvisos
            TabOrder = 3
          end
          object DBCBAvisoActivoPEP: TLFDBCheckBox
            Left = 64
            Top = 167
            Width = 338
            Height = 17
            Caption = 'Activo en Pedidos a Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_PEP'
            DataSource = DMProveedores.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoPEP: TLFDBMemo
            Left = 64
            Top = 184
            Width = 707
            Height = 60
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_PEP'
            DataSource = DMProveedores.DSxAvisos
            TabOrder = 5
          end
          object DBCBAvisoActivoALP: TLFDBCheckBox
            Left = 64
            Top = 247
            Width = 338
            Height = 17
            Caption = 'Activo en Albaranes de Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_ALP'
            DataSource = DMProveedores.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoALP: TLFDBMemo
            Left = 64
            Top = 264
            Width = 707
            Height = 60
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_ALP'
            DataSource = DMProveedores.DSxAvisos
            TabOrder = 7
          end
          object DBCBAvisoActivoFAP: TLFDBCheckBox
            Left = 64
            Top = 327
            Width = 338
            Height = 17
            Caption = 'Activo en Facturas de Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_FAP'
            DataSource = DMProveedores.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoFAP: TLFDBMemo
            Left = 64
            Top = 344
            Width = 707
            Height = 60
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_FAP'
            DataSource = DMProveedores.DSxAvisos
            TabOrder = 9
          end
          object DBCBAvisoActivoOFP: TLFDBCheckBox
            Left = 64
            Top = 7
            Width = 338
            Height = 17
            Caption = 'Activo en Propuestas de Pedido a Proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_OFP'
            DataSource = DMProveedores.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoOFP: TLFDBMemo
            Left = 64
            Top = 24
            Width = 707
            Height = 60
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_OFP'
            DataSource = DMProveedores.DSxAvisos
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 883
          Height = 554
          DataSource = DMProveedores.DSProveedores
          CamposAOrdenar.Strings = (
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
            'CODIGO_INCOTERM'
            'CODIGO_POSTAL'
            'CUENTA'
            'CUENTA_DTOPP'
            'CUENTA_GASTOS'
            'CUENTA_IRPF'
            'DESCUENTO'
            'DESCUENTO_PP'
            'DIA_PAGO_1'
            'DIA_PAGO_2'
            'DIA_PAGO_3'
            'DIAS_CONFIRM_TRANSPORTE'
            'DIAS_ENTREGA'
            'DIAS_TRANSPORTE'
            'DIAS_TRANSPORTE_RAPIDO'
            'EVAL_FEB'
            'EVAL_FEB_SI'
            'FECHA_ALTA'
            'FECHA_BAJA'
            'FECHA_ISO9000'
            'FINANCIACION'
            'FORMA_PAGO'
            'GRUPO_CUENTAS'
            'IDIOMA'
            'INTRA'
            'INTRA_TRANS'
            'ISO9000'
            'MODO_IVA'
            'MONEDA'
            'NIF'
            'NOMBRE_R_SOCIAL'
            'PAIS'
            'PAIS_C2'
            'POR_FINANCIACION'
            'POR_PORTES'
            'PORTES'
            'PROVEEDOR'
            'RECC'
            'TERCERO'
            'TIPO'
            'TIPO_IRPF'
            'TIPO_NCF'
            'TIPO_PORTES'
            'TIT_LOCALIDAD'
            'TITULO'
            'TRANSPORTISTA'
            'TRANSPORTISTA_RAPIDO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 68
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 300
              Visible = True
            end>
        end
      end
      object TSArticulos: TTabSheet
        Caption = 'Art'#237'culos'
        ImageIndex = 13
        OnShow = TSArticulosShow
        object TBCodPro: TLFToolBar
          Left = 0
          Top = 0
          Width = 934
          Height = 26
          ButtonWidth = 91
          EdgeBorders = []
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLArticulosProveedor: TLFPanel
            Left = 0
            Top = 2
            Width = 328
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object ETituloTerceroArticulos: TLFEdit
              Left = 67
              Top = 1
              Width = 260
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 0
            end
            object DBEProveedorArticulos: TLFDbedit
              Left = 0
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'PROVEEDOR'
              DataSource = DMProveedores.DSProveedores
              Enabled = False
              TabOrder = 1
            end
          end
          object ToolButton7: TToolButton
            Left = 328
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavArticulo: THYMNavigator
            Left = 336
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMProveedores.DSQMProArt
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGProArt: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 934
          Height = 439
          Align = alClient
          DataSource = DMProveedores.DSQMProArt
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
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
            'ARTICULO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'CODIGO_PROVEEDOR'
            'TITULO_ART')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = True
          Tablas.Strings = (
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGProArtBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ARTICULO'
            'TITULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_PROVEEDOR'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ART'
              Width = 358
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 612
    Width = 895
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 8
    Top = 56
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 40
    Top = 56
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
  end
  inherited ALMain: TLFActionList
    Left = 504
    Top = 8
    object AEtiquetasProveedor: TAction
      Category = 'Listados'
      Caption = 'Etiquetas de Proveedores'
      Hint = 'Mantenimiento de Etiquetas de Proveedores'
      ImageIndex = 95
      OnExecute = AEtiquetasProveedorExecute
    end
    object AComprasArticulosProv: TAction
      Category = 'Otros'
      Caption = 'Compras de Art'#237'culos al Proveedor'
      Hint = 'Compras de Art'#237'culos al Proveedor'
      ImageIndex = 109
      OnExecute = AComprasArticulosProvExecute
    end
    object AFacturasProveedorTodas: TAction
      Category = 'Documentos;Facturas'
      Caption = 'Todas'
      ImageIndex = 61
      OnExecute = AFacturasProveedorTodasExecute
    end
    object ACalculoRappelAnual: TLFDatasetAction
      Category = 'Especiales'
      Caption = 'C'#225'lculo del Rappel Anual'
      Hint = 'C'#225'lculo del Rappel Anual'
      ImageIndex = 7
      OnExecute = ACalculoRappelAnualExecute
      DataSource = DMProveedores.DSQMRappel
    end
    object AAdjuntosProveedor: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Proveedor'
      ImageIndex = 59
      OnExecute = AAdjuntosProveedorExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Especiales'
      Caption = 'Especiales'
      ImageIndex = 58
    end
    object AVisualizarListadoProveedores: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Proveedores'
      Hint = 'Visualizar Listado Proveedores'
      ImageIndex = 14
      OnExecute = AVisualizarListadoProveedoresExecute
    end
    object AImprimirListadoProveedores: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado Proveedores'
      Hint = 'Imprimir Listado Proveedores'
      ImageIndex = 14
      OnExecute = AImprimirListadoProveedoresExecute
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
    object AVisualizarListDir: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado de Direcciones'
      Hint = 'Visualizar Listado de Direcciones'
      ImageIndex = 14
      OnExecute = AVisualizarListDirExecute
    end
    object AImprimirListDir: TAction
      Category = 'Listados'
      Caption = 'Imprimir Listado de Direcciones'
      Hint = 'Imprimir Listado de Direcciones'
      ImageIndex = 14
      OnExecute = AImprimirListDirExecute
    end
    object AProveedoresPorAgrupacion: TAction
      Category = 'Listados'
      Caption = 'Listado de Proveedores por Agrupacion'
      Hint = 'Listado de Proveedores por Agrupacion'
      ImageIndex = 14
      OnExecute = AProveedoresPorAgrupacionExecute
    end
    object AListadoDirporCPostal: TAction
      Category = 'Listados'
      Caption = 'Listado de Direcciones por C'#243'd. Postal'
      Hint = 'Listado de Direcciones por C'#243'd. Postal'
      ImageIndex = 14
      OnExecute = AListadoDirporCPostalExecute
    end
    object AComprasDetalladas: TAction
      Category = 'Listados'
      Caption = 'Compras Detalladas'
      Hint = 'Compras Detalladas'
      ImageIndex = 14
      OnExecute = AComprasDetalladasExecute
    end
    object AEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Etiquetas'
      Hint = 'Etiquetas'
      ImageIndex = 95
      OnExecute = AEtiquetasExecute
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
    object AConfProveedores: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Proveedores'
      Hint = 'Listados de Proveedores'
      ImageIndex = 77
      OnExecute = AConfProveedoresExecute
    end
    object AConfListadosDatosFiscalesProveedores: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Datos Fiscales de Proveedores'
      Hint = 'Listados de Datos Fiscales de Proveedores'
      ImageIndex = 77
      OnExecute = AConfListadosDatosFiscalesProveedoresExecute
    end
    object AConfListadosDir: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Direcciones de Proveedores'
      Hint = 'Listados de Direcciones de Proveedores'
      ImageIndex = 77
      OnExecute = AConfListadosDirExecute
    end
    object AConfListadoDirCPostal: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Direcciones por C'#243'd. Postal'
      Hint = 'Listado de Direcciones por C'#243'd. Postal'
      ImageIndex = 77
      OnExecute = AConfListadoDirCPostalExecute
    end
    object AConfComprasDetalladas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Compras Detalladas'
      Hint = 'Compras Detalladas'
      ImageIndex = 77
      OnExecute = AConfComprasDetalladasExecute
    end
    object AConfEtiquetas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiquetas de Proveedores'
      Hint = 'Etiquetas de Proveedores'
      ImageIndex = 77
      OnExecute = AConfEtiquetasExecute
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
      Hint = 'Incidencias'
      ImageIndex = 6
      OnExecute = AIncidenciasExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AAdjuntoTransportista: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Transportista'
      ImageIndex = 59
      OnExecute = AAdjuntoTransportistaExecute
    end
    object AAdjuntoTransportistaRapido: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Transportista Rapido'
      ImageIndex = 59
      OnExecute = AAdjuntoTransportistaRapidoExecute
    end
    object AImprimirNotas: TAction
      Category = 'Listados'
      Caption = 'Imprime Notas'
      Hint = 'Imprime Notas'
      ImageIndex = 14
      OnExecute = AImprimirNotasExecute
    end
    object LFCategoryAction7: TLFCategoryAction
      Category = 'Documentos;Facturas'
      Caption = 'Facturas'
      ImageIndex = 61
    end
    object AFacturasProveedorAbiertas: TAction
      Tag = 1
      Category = 'Documentos;Facturas'
      Caption = 'Abiertas'
      ImageIndex = 61
      OnExecute = AFacturasProveedorAbiertasExecute
    end
    object AFacturasProveedorCerradas: TAction
      Tag = 2
      Category = 'Documentos;Facturas'
      Caption = 'Cerradas'
      ImageIndex = 61
      OnExecute = AFacturasProveedorCerradasExecute
    end
    object LFCategoryAction8: TLFCategoryAction
      Category = 'Documentos;Albaranes'
      Caption = 'Albaranes'
      ImageIndex = 60
    end
    object AAlbaranesProveedorTodas: TAction
      Category = 'Documentos;Albaranes'
      Caption = 'Todos'
      ImageIndex = 60
      OnExecute = AAlbaranesProveedorTodasExecute
    end
    object AAlbaranesProveedorAbiertas: TAction
      Tag = 1
      Category = 'Documentos;Albaranes'
      Caption = 'Abiertos'
      ImageIndex = 60
      OnExecute = AAlbaranesProveedorAbiertasExecute
    end
    object AAlbaranesProveedorCerradas: TAction
      Tag = 2
      Category = 'Documentos;Albaranes'
      Caption = 'Cerrados'
      ImageIndex = 60
      OnExecute = AAlbaranesProveedorCerradasExecute
    end
    object LFCategoryAction10: TLFCategoryAction
      Category = 'Documentos;Pedidos'
      Caption = 'Pedidos'
      ImageIndex = 62
    end
    object APedidosProveedorTodas: TAction
      Category = 'Documentos;Pedidos'
      Caption = 'Todos'
      ImageIndex = 62
      OnExecute = APedidosProveedorTodasExecute
    end
    object APedidosProveedorAbiertas: TAction
      Tag = 1
      Category = 'Documentos;Pedidos'
      Caption = 'Abiertos'
      ImageIndex = 62
      OnExecute = APedidosProveedorAbiertasExecute
    end
    object APedidosProveedorCerradas: TAction
      Tag = 2
      Category = 'Documentos;Pedidos'
      Caption = 'Cerrados'
      ImageIndex = 62
      OnExecute = APedidosProveedorCerradasExecute
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Documentos'
      Caption = 'Documentos'
      ImageIndex = 87
    end
    object AConfigCircularizacion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuracion Circularizacion'
      Hint = 'Configuracion Circularizacion'
      ImageIndex = 77
      OnExecute = AConfigCircularizacionExecute
    end
    object LFCategoryAction9: TLFCategoryAction
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
    object AAccesoDirecto: TAction
      Category = 'Otros'
      Caption = 'Crear Acceso Directo'
      ImageIndex = 102
      OnExecute = AAccesoDirectoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DEFechaComprasDesde.Text'
      'DEFechaComprasHasta.Text')
    Left = 568
    Top = 8
  end
  object CENotas: TControlEdit
    EnlazadoA = CEAgrupaciones
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PEditNotas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 88
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 40
    Top = 88
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
    Left = 600
    Top = 8
  end
  object CERappel: TControlEdit
    EnlazadoA = CEDescuentos
    FichaEdicion = TSRappel
    FichaExclusiva = TSRappel
    SubComplementario = ALMain
    PopUpMenu = CERappelPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 184
  end
  object CERappelPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 40
    Top = 184
    object CERappelMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CERappelMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CERappelMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CERappelMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CERappelMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CERappelMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CERappelMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CERappelMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CERappelMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CERappelMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALProveedores: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 536
    Top = 8
    object ANewTercero: TAction
      Caption = 'Tercero nuevo'
      OnExecute = ANewTerceroExecute
    end
    object AATercero: TAction
      Caption = 'Ver Datos Tercero'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
      ShortCut = 49236
      OnExecute = AATerceroExecute
    end
    object ACalculaEstadisticas: TAction
      Caption = 'Calcula ->'
      OnExecute = ACalculaEstadisticasExecute
    end
    object APedPendDet: TAction
      Caption = 'APedPendDet'
      OnExecute = APedPendDetExecute
    end
    object AAlbaranesDet: TAction
      Caption = 'Albaranes pendientes'
      Hint = 'Albaranes pendientes'
      OnExecute = AAlbaranesDetExecute
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
    object ARecibosPenRec: TAction
      Caption = 'Recibos Pendientes de Recibir'
      Hint = 'Recibos Pendientes de Recibir'
      OnExecute = ARecibosPenRecExecute
    end
    object ARecibosPenPag: TAction
      Caption = 'Recibos Pendientes de Pago'
      Hint = 'Recibos Pendientes de Pago'
      OnExecute = ARecibosPenPagExecute
    end
    object AEnviarComunicacionXMail: TAction
      Caption = 'Enviar Comunicacion por e-mail'
      Hint = 'Enviar Comunicacion por e-mail'
      ImageIndex = 34
      OnExecute = AEnviarComunicacionXMailExecute
    end
    object AContaExtracto: TAction
      Caption = 'Extracto Contable'
      Hint = 'Doble click para ver extracto contable'
      ImageIndex = 30
      OnExecute = AContaExtractoExecute
    end
    object AImportarArchivoComunicacion: TAction
      Caption = 'Importar Archivo a Comunicaciones'
      Hint = 'Importar Archivo a Comunicaciones'
      ImageIndex = 49
      OnExecute = AImportarArchivoComunicacionExecute
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
    Left = 8
    Top = 120
  end
  object CEAgrupacionesPMEdit: TPopUpTeclas
    Left = 40
    Top = 120
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
    EnlazadoA = CERappel
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesDispPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 152
  end
  object CEAgrupacionesDispPMEdit: TPopUpTeclas
    Left = 40
    Top = 152
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
  object CEComunicaciones: TControlEdit
    EnlazadoA = CEAvisos
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEComunicacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 248
  end
  object CEComunicacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 40
    Top = 248
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
    Left = 664
    Top = 8
  end
  object CEDescuentos: TControlEdit
    EnlazadoA = CEComunicaciones
    FichaEdicion = TSDescuentos
    FichaExclusiva = TSDescuentos
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEDescuentosPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 216
  end
  object CEDescuentosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 40
    Top = 216
    object CEDescuentosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDescuentosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDescuentosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDescuentosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDescuentosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDescuentosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDescuentosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDescuentosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDescuentosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDescuentosMirefresh: TMenuItem
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
    Left = 8
    Top = 280
  end
  object CEAvisosPMEdit: TPopUpTeclas
    Left = 40
    Top = 280
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
    object CEAvisosMinext: TMenuItem
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
  object CEArticulos: TControlEdit
    DataSource = DMProveedores.DSQMProArt
    SubComplementario = ALMain
    PopUpMenu = CEArticulosPMEdit
    Teclas = DMMain.Teclas
    Left = 270
    Top = 226
  end
  object CEArticulosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 300
    Top = 226
    object MenuItem1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem11: TMenuItem
      Caption = '-'
    end
    object MenuItem12: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
    end
    object MenuItem13: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object MenuItem14: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object MenuItem15: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
    end
    object MenuItem16: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object MenuItem17: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object MenuItem18: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object MenuItem19: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object MenuItem20: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object MenuItem21: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
    object MenuItem22: TMenuItem
      Caption = '-'
    end
    object MenuItem23: TMenuItem
    end
    object MenuItem24: TMenuItem
    end
  end
end
