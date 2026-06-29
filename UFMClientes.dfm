inherited FMClientes: TFMClientes
  Left = 264
  Top = 149
  Width = 1015
  Height = 774
  HelpContext = 43
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Clientes'
  FormStyle = fsNormal
  PopupMenu = CEConsumoPMEdit
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1005
    Height = 721
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 1001
      DesignSize = (
        997
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMClientes.DSQMClientes
        Hints.Strings = ()
        EditaControl = DBEFTipoCliente
        InsertaControl = DBEFTipoCliente
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMClientes.DSQMClientes
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
        ImageIndex = 1
        OnClick = TButtInfoComercialKriClick
      end
      object TButtDocumentos: TToolButton
        Left = 362
        Top = 0
        Action = ADocumentos
      end
      object ToolButton7: TToolButton
        Left = 385
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LNombCom_Social: TLFLabel
        Left = 393
        Top = 0
        Width = 109
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Raz'#243'n Social '
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
        Left = 502
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
        Campos_Desplegar.Strings = (
          'TELEFONO'
          'NIF')
        CampoNum = 'CLIENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_CLIENTES_EF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'cliente')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ToolButton8: TToolButton
        Left = 579
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LBNotas: TLFLabel
        Left = 587
        Top = 0
        Width = 69
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
      Width = 1001
      Height = 691
      OnChange = PCMainChange
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBATercero: TSpeedButton [0]
          Left = 204
          Top = 80
          Width = 153
          Height = 20
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
        object SBAContaExtracto: TSpeedButton [2]
          Left = 204
          Top = 80
          Width = 153
          Height = 20
          Hint = 'Doble click para ver extracto contable'
          GroupIndex = -1
          OnDblClick = SBAContaExtractoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 993
          Height = 663
          inherited G2KTableLoc: TG2KTBLoc
            Left = 10
            Top = 33
            Plan.Strings = (
              
                'PLAN SORT (JOIN (VER_CLIENTES_CUENTAS CLI INDEX (EMP_CLIENTES_CL' +
                'I_TER),VER_CLIENTES_CUENTAS DI INDEX (PK_SYS_TERCEROS_DIRECCIONE' +
                'S),VER_CLIENTES_CUENTAS LOC INDEX (ID_LOCALIDADES),VER_CLIENTES_' +
                'CUENTAS GCLI INDEX (PK_CON_CUENTAS_GES_CLI),VER_CLIENTES_CUENTAS' +
                ' TER INDEX (PK_SYS_TERCEROS)))')
            CamposADesplegar.Strings = (
              'NOMBRE_COMERCIAL'
              'TELEFONO'
              'NIF')
            DataSource = DMClientes.DSQMClientes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CLIENTES_CUENTAS'
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CLIENTE')
          end
          object LBLClienteFicha: TLFLabel
            Left = 76
            Top = 5
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
            FocusControl = DBECliente
          end
          object LBLTercero: TLFLabel
            Left = 71
            Top = 49
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLAgente: TLFLabel
            Left = 74
            Top = 93
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LBLTarifa: TLFLabel
            Left = 81
            Top = 137
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LBLFormaPago: TLFLabel
            Left = 54
            Top = 159
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Foma Pago'
          end
          object LBLModoIVA: TLFLabel
            Left = 46
            Top = 225
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo de IVA'
          end
          object LBLDtoPP: TLFLabel
            Left = 60
            Top = 247
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = '% Dto. PP'
            FocusControl = DBEDtoPP
          end
          object LBLCuenta: TLFLabel
            Left = 261
            Top = 5
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
            FocusControl = DBECliente
          end
          object LBLPerfil: TLFLabel
            Left = 583
            Top = 5
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perfil'
            FocusControl = DBEDtoPP
          end
          object LBLTipoCliente: TLFLabel
            Left = 52
            Top = 27
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Cliente'
          end
          object LBLDtoCial: TLFLabel
            Left = 57
            Top = 269
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = '% Dto. Cial'
          end
          object LBLSuProveedor: TLFLabel
            Left = 43
            Top = 291
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Proveedor'
          end
          object LBMoneda: TLFLabel
            Left = 69
            Top = 203
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLTransportista: TLFLabel
            Left = 59
            Top = 379
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'S.Transpt.'
            FocusControl = DBEDtoPP
          end
          object LBLDiasPagos: TLFLabel
            Left = 57
            Top = 313
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Pago'
            FocusControl = DBEDiaPago1
          end
          object LBLSuReferencia: TLFLabel
            Left = 242
            Top = 291
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Referencia'
          end
          object LRiesgoKri: TLFLabel
            Left = 566
            Top = 446
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Riesgo Autorizado'
            FocusControl = DBERiesgoAutorizadoKri
          end
          object LUltimaCompra: TLFLabel
            Left = 399
            Top = 312
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = #218'lt. Compra'
          end
          object LBLPotencialDeCompra: TLFLabel
            Left = 574
            Top = 467
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prev. de Compra'
          end
          object LblPais: TLFLabel
            Left = 86
            Top = 335
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LblTipoTrans: TLFLabel
            Left = 33
            Top = 401
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Transporte'
          end
          object LCuentaDtoPP: TLFLabel
            Left = 174
            Top = 247
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.'
            FocusControl = DBEDtoPP
          end
          object LBLDiasEntrega: TLFLabel
            Left = 288
            Top = 313
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as entrega'
          end
          object LIdioma: TLFLabel
            Left = 77
            Top = 357
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
          end
          object LBTipoPortes: TLFLabel
            Left = 65
            Top = 446
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Portes'
          end
          object LBPorPortes: TLFLabel
            Left = 68
            Top = 468
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = '% Portes'
          end
          object LBIPortes: TLFLabel
            Left = 195
            Top = 467
            Width = 39
            Height = 13
            Caption = 'I. Portes'
          end
          object LBRangos: TLFLabel
            Left = 77
            Top = 467
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rango'
          end
          object LBIndice: TLFLabel
            Left = 317
            Top = 466
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Indice'
          end
          object LZona: TLFLabel
            Left = 83
            Top = 489
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Zona'
          end
          object LBloqueo: TLFLabel
            Left = 578
            Top = 335
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bloqueo'
          end
          object LMotivoBloqueo: TLFLabel
            Left = 585
            Top = 357
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo'
          end
          object LCodigoIncoterm: TLFLabel
            Left = 32
            Top = 423
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo Incoterm'
          end
          object LCtaDtoCial: TLFLabel
            Left = 174
            Top = 269
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta.'
            FocusControl = DBEDtoPP
          end
          object LTipoNCF: TLFLabel
            Left = 572
            Top = 313
            Width = 45
            Height = 13
            Caption = 'Tipo NCF'
          end
          object LCuentaVenta: TLFLabel
            Left = 58
            Top = 555
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Venta'
          end
          object LCuentaCompra: TLFLabel
            Left = 50
            Top = 533
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. Compra'
          end
          object LDtoCialLinea: TLFLabel
            Left = 581
            Top = 489
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial. L'#237'nea'
          end
          object LBancoParaPagos: TLFLabel
            Left = 18
            Top = 181
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco para cobros'
          end
          object LBLClientePadre: TLFLabel
            Left = 45
            Top = 114
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente Padre'
            FocusControl = DBECliente
          end
          object LMotivoBaja: TLFLabel
            Left = 561
            Top = 401
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Baja'
          end
          object LGrupoCuentas: TLFLabel
            Left = 546
            Top = 511
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo Cuentas'
          end
          object LNIF: TLFLabel
            Left = 419
            Top = 5
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LCategoria: TLFLabel
            Left = 561
            Top = 27
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Categoria'
          end
          object LFechaAlta: TLFLabel
            Left = 564
            Top = 48
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Alta'
          end
          object LRuta: TLFLabel
            Left = 86
            Top = 511
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta'
          end
          object LRutaOrden: TLFLabel
            Left = 208
            Top = 511
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LCampo1: TLFLabel
            Left = 66
            Top = 577
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 1'
            FocusControl = DBECampo1
          end
          object LCampo2: TLFLabel
            Left = 66
            Top = 599
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 2'
            FocusControl = DBECampo2
          end
          object LCampo3: TLFLabel
            Left = 66
            Top = 621
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 3'
            FocusControl = DBECampo3
          end
          object LCampo4: TLFLabel
            Left = 66
            Top = 642
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 4'
            FocusControl = DBECampo4
          end
          object LCampo5: TLFLabel
            Left = 488
            Top = 577
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 5'
            FocusControl = DBECampo5
          end
          object LCampo6: TLFLabel
            Left = 488
            Top = 599
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 6'
            FocusControl = DBECampo6
          end
          object LCampo7: TLFLabel
            Left = 488
            Top = 621
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 7'
            FocusControl = DBECampo7
          end
          object LCampo8: TLFLabel
            Left = 488
            Top = 642
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo 8'
            FocusControl = DBECampo8
          end
          object LProyecto: TLFLabel
            Left = 574
            Top = 532
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object LNombreComercial: TLFLabel
            Left = 22
            Top = 71
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre Comercial'
          end
          object DBECliente: TLFDbedit
            Left = 114
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
            ReadOnly = True
            TabOrder = 0
          end
          object DBETituloTercero: TLFDbedit
            Left = 181
            Top = 45
            Width = 359
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMClientes.DSQMClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            OnDblClick = SBATerceroDblClick
            OnEnter = DBETituloTerceroEnter
          end
          object ETituloAgente: TLFEdit
            Left = 181
            Top = 89
            Width = 359
            Height = 21
            TabStop = False
            Color = clAqua
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            OnDblClick = SBAAgenteDblClick
            OnEnter = ETituloAgenteEnter
          end
          object DBEDtoPP: TLFDbedit
            Left = 114
            Top = 243
            Width = 54
            Height = 21
            DataField = 'DESCUENTO_PP'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 23
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 114
            Top = 45
            Width = 66
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 6
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
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFAgente: TLFDBEditFind2000
            Left = 114
            Top = 89
            Width = 66
            Height = 21
            DataField = 'AGENTE'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 9
            OnChange = DBEFAgenteChange
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
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloTarifa: TLFEdit
            Left = 181
            Top = 133
            Width = 359
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
          object ETituloFormaPago: TLFEdit
            Left = 181
            Top = 155
            Width = 359
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
            TabOrder = 16
          end
          object ETituloModoIva: TLFEdit
            Left = 181
            Top = 221
            Width = 359
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
            TabOrder = 22
          end
          object DBEFTarifa: TLFDBEditFind2000
            Left = 114
            Top = 133
            Width = 66
            Height = 21
            DataField = 'TARIFA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 13
            OnChange = DBEFTarifaChange
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
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFPerfil: TLFDBEditFind2000
            Left = 611
            Top = 1
            Width = 62
            Height = 21
            DataField = 'PERFIL'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 63
            OnChange = DBEFPerfilChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PERFILES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PERFIL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'PERFIL')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloPerfil: TLFEdit
            Left = 674
            Top = 1
            Width = 164
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
            TabOrder = 64
          end
          object ETituloTipoTercero: TLFEdit
            Left = 181
            Top = 23
            Width = 359
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
            TabOrder = 5
          end
          object DBEDtoCial: TLFDbedit
            Left = 114
            Top = 265
            Width = 54
            Height = 21
            DataField = 'DESCUENTO_CIAL'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 26
          end
          object DBCBAnticipos: TLFDBCheckBox
            Left = 583
            Top = 83
            Width = 220
            Height = 17
            Caption = 'Usar Anticipos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 69
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'USAR_ANTICIPOS'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFTipoCliente: TLFDBEditFind2000
            Left = 114
            Top = 23
            Width = 66
            Height = 21
            DataField = 'TIPO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 4
            OnChange = DBEFTipoClienteChange
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
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 114
            Top = 155
            Width = 66
            Height = 21
            DataField = 'FORMA_PAGO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 15
            OnChange = DBEFFormaPagoChange
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
            Left = 114
            Top = 221
            Width = 66
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 21
            OnChange = DBEFModoIvaChange
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
          object DBESuProveedor: TLFDbedit
            Left = 114
            Top = 287
            Width = 121
            Height = 21
            DataField = 'SU_PROVEEDOR'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 29
          end
          object DBCBEvalFebSi: TLFDBCheckBox
            Left = 583
            Top = 121
            Width = 220
            Height = 17
            Caption = '28 de Feb. en d'#237'a de pago siempre'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 71
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB_SI'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBEvalFeb: TLFDBCheckBox
            Left = 583
            Top = 140
            Width = 220
            Height = 17
            Caption = 'Evaluar Febrero en los d'#237'as de pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 72
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EVAL_FEB'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 114
            Top = 199
            Width = 66
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 19
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
          end
          object ETituloMoneda: TLFEdit
            Left = 181
            Top = 199
            Width = 359
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
            TabOrder = 20
          end
          object DBEFTransportista: TLFDBEditFind2000
            Left = 114
            Top = 375
            Width = 66
            Height = 21
            DataField = 'TRANSPORTISTA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 41
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
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloTransportista: TLFEdit
            Left = 181
            Top = 375
            Width = 359
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
            TabOrder = 42
          end
          object DBEDiaPago1: TLFDbedit
            Left = 114
            Top = 309
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_1'
            DataSource = DMClientes.DSQMClientes
            MaxLength = 2
            TabOrder = 31
          end
          object DBEDiaPago2: TLFDbedit
            Left = 154
            Top = 309
            Width = 39
            Height = 21
            DataField = 'DIA_PAGO_2'
            DataSource = DMClientes.DSQMClientes
            MaxLength = 2
            TabOrder = 32
          end
          object DBESuReferencia: TLFDbedit
            Left = 314
            Top = 287
            Width = 226
            Height = 21
            DataField = 'SU_REFERENCIA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 30
          end
          object ButUltimoCte: TBitBtn
            Left = 181
            Top = 1
            Width = 25
            Height = 21
            Hint = #218'ltimo Cliente'
            Enabled = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            Visible = False
            OnClick = ButUltimoCteClick
            NumGlyphs = 2
          end
          object DBCBCreditoYCaucion: TLFDBCheckBox
            Left = 574
            Top = 421
            Width = 97
            Height = 17
            Hint = 'Asegurado en Credito y Caucion'
            Caption = 'Cred. y Caucion'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            Layout = checkboxRight
            TabOrder = 87
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CREDITO_Y_CAUCION'
            DataSource = DMClientes.DSQMClientes
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBMoroso: TLFDBCheckBox
            Left = 583
            Top = 158
            Width = 220
            Height = 17
            Caption = 'Moroso'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 73
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'MOROSO'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBERiesgoAutorizadoKri: TLFDbedit
            Left = 658
            Top = 441
            Width = 120
            Height = 21
            Color = clInfoBk
            DataField = 'RIESGO_AUT'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            ReadOnly = True
            TabOrder = 89
          end
          object DBEPotencialDeCompraKri: TLFDbedit
            Left = 658
            Top = 463
            Width = 120
            Height = 21
            DataField = 'POTENCIAL_DE_COMPRA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 90
          end
          object DBChkBIntra: TLFDBCheckBox
            Left = 583
            Top = 102
            Width = 220
            Height = 17
            Caption = 'Cliente para el INTRASTAT'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 70
            TabStop = True
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'INTRA'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 114
            Top = 331
            Width = 66
            Height = 21
            DataField = 'PAIS_C2'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 37
            OnChange = DBEFPaisChange
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
          object ETituloPais: TLFEdit
            Left = 181
            Top = 331
            Width = 359
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
            TabOrder = 38
          end
          object DBEFTipoTrans: TLFDBEditFind2000
            Left = 114
            Top = 397
            Width = 66
            Height = 21
            DataField = 'INTRA_TRANS'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 43
            OnChange = DBEFTipoTransChange
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
          object ETituloTipoTrans: TLFEdit
            Left = 181
            Top = 397
            Width = 359
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
            TabOrder = 44
          end
          object DBEFCuentaDtoPP: TLFDBEditFind2000
            Left = 196
            Top = 243
            Width = 82
            Height = 21
            DataField = 'CUENTA_DTOPP'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 24
            OnChange = DBEFCuentaDtoPPChange
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
          object DBEDiasEntrega: TLFDbedit
            Left = 354
            Top = 309
            Width = 39
            Height = 21
            DataField = 'DIAS_ENTREGA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 35
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 114
            Top = 353
            Width = 66
            Height = 21
            DataField = 'IDIOMA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 39
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
            Left = 181
            Top = 353
            Width = 359
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
            TabOrder = 40
          end
          object DBCKPtoVerde: TLFDBCheckBox
            Left = 583
            Top = 65
            Width = 220
            Height = 17
            Caption = 'Aplicar Pto. Verde'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 68
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'APLICAR_PTO_VERDE'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBECodCreditoYCaucion: TLFDbedit
            Left = 675
            Top = 419
            Width = 103
            Height = 21
            Color = clInfoBk
            DataField = 'COD_CREDITO_Y_CAUCION'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            ReadOnly = True
            TabOrder = 88
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 114
            Top = 441
            Width = 66
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 47
            OnChange = DBEFPortesChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_PORTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloPortes: TLFEdit
            Left = 181
            Top = 441
            Width = 359
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
            TabOrder = 48
          end
          object DBEPorPortes: TLFDbedit
            Left = 114
            Top = 463
            Width = 66
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 49
          end
          object DBEIPortes: TLFDbedit
            Left = 239
            Top = 463
            Width = 66
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 50
          end
          object DBEFRango: TLFDBEditFind2000
            Left = 114
            Top = 463
            Width = 66
            Height = 21
            DataField = 'RANGO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 51
            OnChange = DBEFRangoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_RANGOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RANGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFRangoBusqueda
            OrdenadoPor.Strings = (
              'RANGO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloRango: TLFDbedit
            Left = 181
            Top = 463
            Width = 124
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientes.DSxRangos
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
          object DBEFIndice: TLFDBEditFind2000
            Left = 350
            Top = 463
            Width = 66
            Height = 21
            DataField = 'INDICE'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 53
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_RANGOS_INDICES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'INDICE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFIndiceBusqueda
            OrdenadoPor.Strings = (
              'INDICE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloIndice: TLFDbedit
            Left = 416
            Top = 463
            Width = 124
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientes.DSxIndices
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 54
          end
          object DBEUltimaCompraKri: TLFDbedit
            Left = 456
            Top = 309
            Width = 84
            Height = 21
            Hint = 'Muestra la fecha del '#250'ltimo albar'#225'n'
            Color = clInfoBk
            DataField = 'FECHA_ULT_COMPRA_KRI'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 36
          end
          object DBEFZona: TLFDBEditFind2000
            Left = 114
            Top = 485
            Width = 66
            Height = 21
            DataField = 'ZONA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 55
            OnChange = DBEFZonaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_ZONAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ZONA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DEFECTO DESC, ZONA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloZona: TLFEdit
            Left = 181
            Top = 485
            Width = 359
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
            TabOrder = 56
          end
          object DBChkBValorarAlb: TLFDBCheckBox
            Left = 583
            Top = 215
            Width = 220
            Height = 18
            Caption = 'Valorar Albar'#225'n'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 76
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ALBARAN_VALORADO'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDtoCialLinea: TLFDbedit
            Left = 659
            Top = 485
            Width = 54
            Height = 21
            DataField = 'DTO_CIAL_LINEA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 91
          end
          object DBEMotivoBloqueo: TLFDbedit
            Left = 623
            Top = 353
            Width = 227
            Height = 21
            DataField = 'MOTIVO_BLOQUEO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 83
          end
          object DBCBBloqueo: TLFDBComboBoxValue
            Left = 623
            Top = 331
            Width = 227
            Height = 21
            Hint = 'Tipo de bloqueo'
            DataField = 'BLOQUEO'
            DataSource = DMClientes.DSQMClientes
            ItemHeight = 13
            Items.Strings = (
              'Sin mensaje'
              'Avisar'
              'Bloquear')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 82
            OnChange = DBCBBloqueoChange
          end
          object DBEFCodigoIncoterm: TLFDBEditFind2000
            Left = 114
            Top = 419
            Width = 66
            Height = 21
            DataField = 'CODIGO_INCOTERM'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 45
            OnChange = DBEFCodigoIncotermChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_CODIGO_INCOTERM'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ECodigoIncoterm: TLFEdit
            Left = 181
            Top = 419
            Width = 359
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
            TabOrder = 46
          end
          object DBCKSinDto: TLFDBCheckBox
            Left = 583
            Top = 177
            Width = 220
            Height = 17
            Caption = 'Sin Descuentos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 74
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SIN_DESCUENTOS'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBECuenta: TLFDBEditFind2000
            Left = 300
            Top = 1
            Width = 110
            Height = 21
            Color = clAqua
            DataField = 'CUENTA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 2
            OnKeyDown = DBECuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=4 and gestion=3'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCHKBaja: TLFDBCheckBox
            Left = 564
            Top = 376
            Width = 73
            Height = 17
            Caption = 'Baja'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 84
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKBajaChange
            DataField = 'BAJA'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFechaBaja: TLFDBDateEdit
            Left = 650
            Top = 375
            Width = 87
            Height = 21
            DataField = 'FECHA_BAJA'
            DataSource = DMClientes.DSQMClientes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 85
          end
          object DBEMotivoBaja: TLFDbedit
            Left = 623
            Top = 397
            Width = 227
            Height = 21
            DataField = 'MOTIVO_BAJA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 86
          end
          object EFCtaDtoCial: TLFDBEditFind2000
            Left = 196
            Top = 265
            Width = 82
            Height = 21
            DataField = 'CUENTA_DTOCIAL'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 27
            OnChange = EFCtaDtoCialChange
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
          object DBLCBTipoNCF: TDBLookupComboBox
            Left = 623
            Top = 309
            Width = 227
            Height = 21
            DataField = 'TIPO_NCF'
            DataSource = DMClientes.DSQMClientes
            KeyField = 'TIPO_NCF'
            ListField = 'TITULO'
            ListSource = DMClientes.DSxTipoNCF
            TabOrder = 81
          end
          object DBEFCuentaVenta: TLFDBEditFind2000
            Left = 114
            Top = 551
            Width = 88
            Height = 21
            DataField = 'CUENTA_VENTA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 61
            OnChange = DBEFCuentaVentaChange
            OnKeyDown = ExpandirCadenaCtaTk
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFCuentaCompra: TLFDBEditFind2000
            Left = 114
            Top = 529
            Width = 88
            Height = 21
            DataField = 'CUENTA_COMPRA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 59
            OnChange = DBEFCuentaCompraChange
            OnKeyDown = ExpandirCadenaCtaTk
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitCtaDtoPP: TLFEdit
            Left = 279
            Top = 243
            Width = 261
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 25
          end
          object ECtaDtoCial: TLFEdit
            Left = 279
            Top = 265
            Width = 261
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 28
          end
          object ETitCtaVenta: TLFEdit
            Left = 203
            Top = 551
            Width = 337
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 62
          end
          object ETitCtaCompra: TLFEdit
            Left = 203
            Top = 529
            Width = 337
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 60
          end
          object DBChkBRECC: TLFDBCheckBox
            Left = 583
            Top = 233
            Width = 220
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
            TabOrder = 77
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECC'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBExportar: TLFDBCheckBox
            Left = 583
            Top = 252
            Width = 220
            Height = 18
            Caption = 'Exportar'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 78
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EXPORTAR'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFBancoParaPagos: TLFDBEditFind2000
            Left = 114
            Top = 177
            Width = 66
            Height = 21
            DataField = 'BANCO_PAGOS'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 17
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
            Left = 181
            Top = 177
            Width = 359
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 18
          end
          object DBChkBValorarPed: TLFDBCheckBox
            Left = 583
            Top = 196
            Width = 220
            Height = 18
            Caption = 'Valorar Pedido'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 75
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PEDIDO_VALORADO'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFClientePadre: TLFDBEditFind2000
            Left = 114
            Top = 111
            Width = 66
            Height = 21
            DataField = 'CLIENTE_PADRE'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 11
            OnChange = DBEFClientePadreChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloClientePadre: TLFEdit
            Left = 181
            Top = 111
            Width = 359
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBEFGrupoCuentas: TLFDBEditFind2000
            Left = 623
            Top = 507
            Width = 44
            Height = 21
            DataField = 'GRUPO_CUENTAS'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 94
            OnChange = DBEFGrupoCuentasChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GRUPO_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'GRUPO_CUENTAS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'GRUPO_CUENTAS')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitGrupoCuentas: TLFEdit
            Left = 668
            Top = 507
            Width = 182
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 95
          end
          object DBENif: TLFDbedit
            Left = 440
            Top = 1
            Width = 100
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEDtoCialLinea2: TLFDbedit
            Left = 714
            Top = 485
            Width = 54
            Height = 21
            DataField = 'DTO_CIAL_LINEA_2'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 92
          end
          object DBEDtoCialLinea3: TLFDbedit
            Left = 769
            Top = 485
            Width = 54
            Height = 21
            DataField = 'DTO_CIAL_LINEA_3'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 93
          end
          object DBCBSepararApunteDescuento: TLFDBCheckBox
            Left = 583
            Top = 271
            Width = 220
            Height = 18
            Caption = 'Separar Apunte Descuento Comercial'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 79
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SEPARAR_DTO_CIAL'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBDiaSemanaPago: TLFDBComboBoxValue
            Left = 235
            Top = 309
            Width = 41
            Height = 21
            Hint = 'Tipo de bloqueo'
            DataField = 'DIA_SEMANA_PAGO'
            DataSource = DMClientes.DSQMClientes
            ItemHeight = 13
            Items.Strings = (
              '*'
              'L'
              'M'
              'X'
              'J'
              'V'
              'S'
              'D')
            Values.Strings = (
              ''
              'L'
              'M'
              'X'
              'J'
              'V'
              'S'
              'D')
            TabOrder = 34
            OnChange = DBCBBloqueoChange
          end
          object DBEFCategoria: TLFDBEditFind2000
            Left = 611
            Top = 23
            Width = 62
            Height = 21
            DataField = 'CATEGORIA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 65
            OnChange = DBEFCategoriaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_CATEGORIA_CLIENTE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ECategoria: TLFEdit
            Left = 674
            Top = 23
            Width = 164
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 66
          end
          object DBEDiaPago3: TLFDbedit
            Left = 194
            Top = 309
            Width = 40
            Height = 21
            DataField = 'DIA_PAGO_3'
            DataSource = DMClientes.DSQMClientes
            MaxLength = 2
            TabOrder = 33
          end
          object DBEFechaAlta: TLFDbedit
            Left = 611
            Top = 45
            Width = 112
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA_ALTA'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            ReadOnly = True
            TabOrder = 67
          end
          object DBERuta: TLFDbedit
            Left = 114
            Top = 507
            Width = 66
            Height = 21
            DataField = 'RUTA'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 57
          end
          object DBERutaOrden: TLFDbedit
            Left = 241
            Top = 507
            Width = 66
            Height = 21
            DataField = 'RUTA_ORDEN'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 58
          end
          object DBECampo1: TLFDbedit
            Left = 114
            Top = 573
            Width = 335
            Height = 21
            DataField = 'ALFA_1'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 98
          end
          object DBECampo2: TLFDbedit
            Left = 114
            Top = 595
            Width = 335
            Height = 21
            DataField = 'ALFA_2'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 99
          end
          object DBECampo3: TLFDbedit
            Left = 114
            Top = 617
            Width = 335
            Height = 21
            DataField = 'ALFA_3'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 100
          end
          object DBECampo4: TLFDbedit
            Left = 114
            Top = 639
            Width = 335
            Height = 21
            DataField = 'ALFA_4'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 101
          end
          object DBECampo5: TLFDbedit
            Left = 537
            Top = 573
            Width = 335
            Height = 21
            DataField = 'ALFA_5'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 102
          end
          object DBECampo6: TLFDbedit
            Left = 537
            Top = 595
            Width = 335
            Height = 21
            DataField = 'ALFA_6'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 103
          end
          object DBECampo7: TLFDbedit
            Left = 537
            Top = 617
            Width = 335
            Height = 21
            DataField = 'ALFA_7'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 104
          end
          object DBECampo8: TLFDbedit
            Left = 537
            Top = 639
            Width = 335
            Height = 21
            DataField = 'ALFA_8'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 105
          end
          object DBEFProyecto: TDBEditFind2000
            Left = 623
            Top = 528
            Width = 44
            Height = 21
            DataField = 'PROYECTO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 96
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
            Left = 668
            Top = 528
            Width = 182
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 97
          end
          object DBENombreComercial: TLFDbedit
            Left = 114
            Top = 67
            Width = 426
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMClientes.DSQMClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
            OnDblClick = SBATerceroDblClick
            OnEnter = DBETituloTerceroEnter
          end
          object DBCBEnviarConfirmacionPedido: TLFDBCheckBox
            Left = 583
            Top = 290
            Width = 220
            Height = 18
            Hint = 
              'Enviar conf. pedido automaticamente al marcar el pedido como "Li' +
              'sta para Preparacion"'
            Caption = 'Enviar conf. pedido automaticamente'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 80
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ENVIAR_CONFIRMACION_PEDIDO'
            DataSource = DMClientes.DSQMClientes
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
          Width = 993
          Height = 23
          EdgeBorders = [ebBottom]
          Flat = True
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoNotasCliente: TLFDbedit
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
              ReadOnly = True
              TabOrder = 0
            end
            object DBEInfoNotasTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
              ReadOnly = True
              TabOrder = 1
            end
          end
          object TBSep2: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 427
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientes.DSQMClientes
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
          object ToolButton15: TToolButton
            Left = 515
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtLinea: TToolButton
            Left = 523
            Top = 0
            Caption = '%13% = Nueva Linea '
            OnClick = TButtLineaClick
          end
          object ToolButton14: TToolButton
            Left = 546
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtImprimirNotas: TToolButton
            Left = 554
            Top = 0
            Action = AImprimirNotas
          end
        end
        object PNLEditNotas: TLFPanel
          Left = 0
          Top = 23
          Width = 993
          Height = 640
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 993
            Height = 492
            Align = alClient
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMClientes.DSQMClientes
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object PNLEditNotasFac: TLFPanel
            Left = 0
            Top = 492
            Width = 993
            Height = 148
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object LNotasFacturacionKri: TLFLabel
              Left = 0
              Top = 0
              Width = 993
              Height = 13
              Align = alTop
              Caption = 'Notas de Facturaci'#243'n'
            end
            object DBMNotasFacturacion: TLFDBMemo
              Left = 0
              Top = 13
              Width = 993
              Height = 135
              Align = alClient
              DataField = 'NOTAS_FACTURACION_KRI'
              DataSource = DMClientes.DSQMClientes
              ScrollBars = ssVertical
              TabOrder = 0
            end
          end
        end
      end
      object TSAgrupaciones: TTabSheet [2]
        Caption = '&Agrup.'
        ImageIndex = 3
        OnResize = TSAgrupacionesResize
        OnShow = TSAgrupacionesShow
        object TBProv: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 24
          ButtonWidth = 22
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLInfoAgrupaciones: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoAgrupacionesTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
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
            object DBEInfoAgrupacionesCliente: TLFDbedit
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
          object TBSep7: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAgrupaciones: THYMNavigator
            Left = 427
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientes.DSxAgrupSon
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
            Left = 515
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAgrupacionesDisp: THYMNavigator
            Left = 523
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientes.DSxAgrupDisp
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
        object DBCGDisponibles: TLFDBCtrlGrid
          Left = 0
          Top = 206
          Width = 993
          Height = 457
          Align = alClient
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMClientes.DSxAgrupDisp
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 45
          PanelWidth = 977
          ParentColor = False
          ParentFont = False
          TabOrder = 1
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
            DataSource = DMClientes.DSxAgrupDisp
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
            DataSource = DMClientes.DSxAgrupDisp
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
          Width = 993
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
          TabOrder = 2
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
        object PPertenece: TLFPanel
          Left = 0
          Top = 24
          Width = 993
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
          TabOrder = 3
        end
        object DBCGPertenece: TLFDBCtrlGrid
          Left = 0
          Top = 43
          Width = 993
          Height = 144
          Align = alTop
          AllowDelete = False
          AllowInsert = False
          ColCount = 1
          Color = clBtnFace
          DataSource = DMClientes.DSxAgrupSon
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          PanelHeight = 24
          PanelWidth = 977
          ParentColor = False
          ParentFont = False
          TabOrder = 4
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
            DataSource = DMClientes.DSxAgrupSon
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
            DataSource = DMClientes.DSxAgrupSon
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
      object TSArticulos: TTabSheet [3]
        Caption = 'Articulos'
        ImageIndex = 18
        OnShow = TSArticulosShow
        object PNLArticulos: TPanel
          Left = 0
          Top = 0
          Width = 993
          Height = 663
          Align = alClient
          TabOrder = 0
          object TBCodCli: TLFToolBar
            Left = 1
            Top = 1
            Width = 991
            Height = 23
            ButtonWidth = 8
            EdgeBorders = []
            Flat = True
            TabOrder = 0
            Separators = True
            object PNLTBCodCli: TLFPanel
              Left = 0
              Top = 0
              Width = 419
              Height = 22
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object DBEInfoArticuloCliente: TLFDbedit
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
                TabOrder = 0
              end
              object DBEInfoArticuloTitulo: TLFDbedit
                Left = 67
                Top = 1
                Width = 350
                Height = 21
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
                TabOrder = 1
              end
            end
            object TBSep5: TToolButton
              Left = 419
              Top = 0
              Width = 8
              ImageIndex = 0
              Style = tbsSeparator
            end
            object NavArticulo: THYMNavigator
              Left = 427
              Top = 0
              Width = 240
              Height = 22
              DataSource = DMClientes.DSQMCliArt
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
          object DBGCodCli: TDBGridFind2000
            Left = 1
            Top = 24
            Width = 991
            Height = 638
            Align = alClient
            DataSource = DMClientes.DSQMCliArt
            Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGCodCliCellClick
            OnDrawColumnCell = DBGCodCliDrawColumnCell
            OnDblClick = DBGCodCliDblClick
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
              'CLIENTE'
              'NOMBRE_CLIENTE'
              'TITULO_ART'
              'CODIGO_CLIENTE'
              'NOTAS_PREPARACION'
              'TITULO')
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
            OnBusqueda = DBGCodCliBusqueda
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
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ARTICULO'
                ReadOnly = True
                Width = 268
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CODIGO_CLIENTE'
                Width = 164
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_ARTICULO_CLIENTE'
                Width = 300
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOTAS_PREPARACION'
                Width = 300
                Visible = True
              end>
          end
        end
      end
      object TSVacaciones: TTabSheet [4]
        Caption = '&Vacaciones'
        OnShow = TSVacacionesShow
        object TBVacaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoVacaciones: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoVacacionesCliente: TLFDbedit
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
              TabOrder = 0
            end
            object DBEInfoVacacionesTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
              TabOrder = 1
            end
          end
          object TBSep6: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavVacaciones: THYMNavigator
            Left = 427
            Top = 0
            Width = 110
            Height = 22
            DataSource = DMClientes.DSQMVacaciones
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEVacacionesPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFVacaciones
            InsertaControl = DBGFVacaciones
            Exclusivo = True
            ControlEdit = CEVacaciones
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNVacaciones: TLFPanel
          Left = 0
          Top = 22
          Width = 993
          Height = 641
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFVacaciones: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 993
            Height = 641
            Align = alClient
            DataSource = DMClientes.DSQMVacaciones
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
              'FECHA_PAGO'
              'FIN_VACACIONES'
              'INICIO_VACACIONES')
            ColumnasCheckBoxes.Strings = (
              'MES_VENCIMIENTO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
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
                FieldName = 'INICIO_VACACIONES'
                Width = 139
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FIN_VACACIONES'
                Width = 168
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_PAGO'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MES_VENCIMIENTO'
                Width = 38
                Visible = True
              end>
          end
        end
      end
      object TSFiltros: TTabSheet [5]
        Caption = '&Datos Fact.'
        OnShow = TSFiltrosShow
        object PFiltro_Fac: TLFPanel
          Left = 0
          Top = 24
          Width = 993
          Height = 639
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LClientePrestashop: TLFLabel
            Left = 32
            Top = 471
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente Prestashop'
          end
          object LUltSincronizacion: TLFLabel
            Left = 253
            Top = 471
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = #218'lt. Sincronizaci'#243'n'
          end
          object LPeriodoFacturacion: TLFLabel
            Left = 23
            Top = 449
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = 'Per'#237'odo Facturaci'#243'n'
          end
          object LBLRetencion: TLFLabel
            Left = 70
            Top = 406
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retenci'#243'n'
            FocusControl = DBEDtoPP
          end
          object LPorFinanciacion: TLFLabel
            Left = 48
            Top = 384
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = '% Financiaci'#243'n'
          end
          object LCuentaIRPF: TLFLabel
            Left = 73
            Top = 428
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. IRPF'
            FocusControl = DBEDtoPP
          end
          object LDestinoTraspasoPedido: TLFLabel
            Left = 80
            Top = 320
            Width = 187
            Height = 13
            Caption = 'Destino Trasaso automatico de pedidos'
          end
          object LSerieDstPedido: TLFLabel
            Left = 156
            Top = 340
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LCanalDstPedido: TLFLabel
            Left = 49
            Top = 340
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LTipoDstPedido: TLFLabel
            Left = 279
            Top = 340
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LImporteMinimoPorte: TLFLabel
            Left = 49
            Top = 362
            Width = 71
            Height = 13
            Hint = 'Importe minimo (base imponible) para eliminar portes'
            Alignment = taRightJustify
            Caption = 'Imp. Min. Porte'
            ParentShowHint = False
            ShowHint = True
          end
          object DBCHKAdmin: TLFDBCheckBox
            Left = 73
            Top = 179
            Width = 338
            Height = 17
            Caption = 'Facturar siempre a la Direcci'#243'n Administrativa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURA_DIRECCION_ADMTVA'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKEnvio: TLFDBCheckBox
            Left = 73
            Top = 200
            Width = 338
            Height = 17
            Caption = 'Albaranes siempre a la Direcci'#243'n de Env'#237'o'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ALBARAN_DIRECCION_ENVIO'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBNo_alb_fac: TLFDBCheckBox
            Left = 73
            Top = 222
            Width = 338
            Height = 17
            Caption = 
              'No permitir realizar ni modificar Albaranes y Facturas a este Cl' +
              'iente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_ALB_FAC'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox2: TLFDBCheckBox
            Left = 73
            Top = 244
            Width = 338
            Height = 17
            Caption = 'No permitir superar el riesgo a este Cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_VENTA_RIESGO'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBFacSerie: TLFDBCheckBox
            Left = 73
            Top = 288
            Width = 151
            Height = 17
            Caption = 'Facturar siempre a la Serie'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURAR_SERIE'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFSeries: TLFDBEditFind2000
            Left = 229
            Top = 286
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE_A_FACTURAR'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 13
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
          object DBCBFacturarAlmacen: TLFDBCheckBox
            Left = 73
            Top = 135
            Width = 338
            Height = 17
            Caption = 'No considerar el Almac'#233'n a la hora facturar los Albaranes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURAR_ALMACEN'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBFacturarTarifa: TLFDBCheckBox
            Left = 73
            Top = 157
            Width = 338
            Height = 17
            Caption = 'No considerar la Tarifa a la hora de facturar los Albaranes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURAR_TARIFA'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBDireccion: TLFDBComboBoxValue
            Left = 73
            Top = 28
            Width = 560
            Height = 21
            DataField = 'FACTURAR_DIRECCION'
            DataSource = DMClientes.DSQMClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'Considerar la direcci'#243'n a la hora de separar los albaranes.'
              
                'No Considerar la direcci'#243'n a la hora de separar los albaranes y ' +
                'elegir defecto.'
              
                'No Considerar la direcci'#243'n a la hora de separar los albaranes, b' +
                'uscar la com'#250'n.')
            Values.Strings = (
              '0'
              '1'
              '2')
            ParentFont = False
            TabOrder = 0
          end
          object DBCBAgente: TLFDBComboBoxValue
            Left = 73
            Top = 50
            Width = 560
            Height = 21
            DataField = 'FACTURAR_AGENTE'
            DataSource = DMClientes.DSQMClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'Considerar el agente al separar albaranes.'
              
                'No considerar el agente a la hora de separar albaranes, utilizar' +
                ' el defecto.'
              
                'No considerar el agente a la hora de separar albaranes, buscar e' +
                'l com'#250'n.')
            Values.Strings = (
              '0'
              '1'
              '2')
            ParentFont = False
            TabOrder = 1
          end
          object DBCBTransportista: TLFDBComboBoxValue
            Left = 73
            Top = 72
            Width = 560
            Height = 21
            DataField = 'FACTURAR_TRANSPORTISTA'
            DataSource = DMClientes.DSQMClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'Considerar el transportista a la hora de separar albaranes.'
              
                'No considerar el transportista a la hora de separar albaranes, u' +
                'sar el defecto.'
              
                'No considerar el transportista a la hora de separar albaranes, b' +
                'uscar el com'#250'n.')
            Values.Strings = (
              '0'
              '1'
              '2')
            ParentFont = False
            TabOrder = 2
          end
          object DBCBReferencia: TLFDBComboBoxValue
            Left = 73
            Top = 94
            Width = 560
            Height = 21
            DataField = 'FACTURAR_REFERENCIA'
            DataSource = DMClientes.DSQMClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              
                'Considerar la referencia del albar'#225'n, a la hora de separar albar' +
                'anes.'
              
                'No considerar la referencia del albar'#225'n a la hora de separar alb' +
                'aranes, usar defecto.'
              
                'No considerar la referencia del albar'#225'n a la hora de separar alb' +
                'aranes, buscar com'#250'n.')
            Values.Strings = (
              '0'
              '1'
              '2')
            ParentFont = False
            TabOrder = 3
          end
          object DBChkNoCalcularDescuentosKri: TLFDBCheckBox
            Left = 437
            Top = 135
            Width = 392
            Height = 17
            Caption = 'No calcular descuentos sobre factura'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_CALC_DESC_KRI'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBChkNO_AGRUPAR_PED: TLFDBCheckBox
            Left = 437
            Top = 157
            Width = 392
            Height = 17
            Caption = 'Impedir que se agrupen diferentes pedidos en una misma factura'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_AGRUPAR_PED_KRI'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBEnviarFactrurasEmail: TLFDBCheckBox
            Left = 437
            Top = 200
            Width = 392
            Height = 17
            Caption = 'Enviar Facturas por email en la impresi'#243'n autom'#225'tica de facturas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURAS_POR_EMAIL_KRI'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBDirDefectoVentas: TLFDBCheckBox
            Left = 437
            Top = 222
            Width = 175
            Height = 17
            Caption = 'Direcci'#243'n por defecto en ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 18
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DIR_DEFECTO_VENTAS'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBCalcFechaEntrega: TLFDBCheckBox
            Left = 437
            Top = 244
            Width = 392
            Height = 17
            Caption = 'C'#225'lculo de fecha de entrega'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 20
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FECHA_ENTREGA_X_STOCK'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDireccionDefecto: TLFDBEditFind2000
            Left = 619
            Top = 219
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'DIRECCION_DEFECTO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 19
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'DIR_NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEDireccionDefectoBusqueda
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
          end
          object CBUtilizaFormaPagoAlternativa: TLFDBCheckBox
            Left = 437
            Top = 266
            Width = 392
            Height = 17
            Caption = 'Utiliza Forma de Pago Alternativa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 21
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'UTILIZA_F_PAGO_ALTERNATIVA'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEClientePrestashop: TLFDbedit
            Left = 125
            Top = 468
            Width = 96
            Height = 21
            Color = clInfoBk
            DataField = 'ID_CUSTOMER'
            DataSource = DMClientes.DSQMPrestaShop
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 34
          end
          object DEUltSincronizacion: TLFDBDateEdit
            Left = 347
            Top = 468
            Width = 87
            Height = 21
            DataField = 'ULT_SINCRONIZACION'
            DataSource = DMClientes.DSQMPrestaShop
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            NumGlyphs = 2
            TabOrder = 35
          end
          object DBEFPeriodoFacturacion: TLFDBEditFind2000
            Left = 125
            Top = 446
            Width = 63
            Height = 21
            CharCase = ecUpperCase
            DataField = 'PERIODO_FACTURACION'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 33
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PERIODOS_FACTURACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PERIODO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'PERIODO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFTipoIRPF: TLFDBEditFind2000
            Left = 125
            Top = 402
            Width = 30
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 28
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
            Left = 156
            Top = 402
            Width = 50
            Height = 21
            Color = clInfoBk
            DataField = 'P_IRPF'
            DataSource = DMClientes.DSxIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 29
          end
          object DBETituloIRPF: TLFDbedit
            Left = 207
            Top = 402
            Width = 226
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClientes.DSxIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
          end
          object DBEPor_Financion: TLFDbedit
            Left = 125
            Top = 380
            Width = 54
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 27
          end
          object DBCBFinanciacion: TLFDBCheckBox
            Left = 437
            Top = 288
            Width = 392
            Height = 17
            Caption = 'Financiaci'#243'n por L'#237'quido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FINANCIACION'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCuentaIRPF: TLFDBEditFind2000
            Left = 125
            Top = 424
            Width = 111
            Height = 21
            DataField = 'CUENTA_IRPF'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 31
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
            SalirSiVacio = False
            OnVerificacion = ExpandirCadenaCta
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCuentaIRPF: TLFEdit
            Left = 237
            Top = 424
            Width = 338
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 32
            Text = 'Segun configuracion'
          end
          object DBEFCanalDstPedido: TLFDBEditFind2000
            Left = 80
            Top = 336
            Width = 65
            Height = 21
            DataField = 'CANAL_DST_PEC'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 23
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFSerieDstPedido: TLFDBEditFind2000
            Left = 184
            Top = 336
            Width = 65
            Height = 21
            DataField = 'SERIE_DST_PEC'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 24
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SERIES'
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
          object DBEFTipoDstPedido: TLFDBEditFind2000
            Left = 304
            Top = 336
            Width = 65
            Height = 21
            DataField = 'TIPO_DST_PEC'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 25
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_MOVIMIENTOS_VENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'TIPO in ('#39'OFC'#39', '#39'PEC'#39', '#39'ALB'#39', '#39'FAC'#39')'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEImporteMinimoPorte: TLFDbedit
            Left = 125
            Top = 358
            Width = 83
            Height = 21
            Hint = 'Importe minimo (base imponible) para eliminar portes'
            DataField = 'IMPORTE_MINIMO_PORTE'
            DataSource = DMClientes.DSQMClientes
            ParentShowHint = False
            ShowHint = True
            TabOrder = 26
          end
          object DBCBAlbaranarSerie: TLFDBCheckBox
            Left = 73
            Top = 266
            Width = 151
            Height = 17
            Caption = 'Albaranar siempre a la Serie'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ALBARANAR_SERIE'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFSerieAAlbaranar: TLFDBEditFind2000
            Left = 229
            Top = 264
            Width = 65
            Height = 21
            CharCase = ecUpperCase
            DataField = 'SERIE_A_ALBARANAR'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 11
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
          object DBCBNoAgruparAlbaranes: TLFDBCheckBox
            Left = 437
            Top = 179
            Width = 392
            Height = 17
            Caption = 'No agrupar albaranes al facturar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 16
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_AGRUPAR_ALBARANES'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object TBFiltros: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 24
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLInfoDatosFacturacion: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object DBEInfoDatosFacturacionCliente: TLFDbedit
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
              TabOrder = 0
            end
            object DBEInfoDatosFacturacionTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
              TabOrder = 1
            end
          end
          object TBSep3: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavDatosFacturacion: THYMNavigator
            Left = 427
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientes.DSQMClientes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFiltrosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEFiltros
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSFacturaElectronica: TTabSheet [6]
        Caption = 'Fact. Elect.'
        ImageIndex = 17
        OnShow = TSFacturaElectronicaShow
        object PCPaisFacturaElectronica: TLFPageControl
          Left = 0
          Top = 24
          Width = 993
          Height = 639
          ActivePage = TSEspana
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSEspana: TTabSheet
            Caption = 'Espa'#241'a'
            object TBCentrosAdministrativosFaclElectronicaES: TLFToolBar
              Left = 0
              Top = 0
              Width = 912
              Height = 24
              AutoSize = True
              EdgeBorders = [ebBottom]
              EdgeInner = esNone
              EdgeOuter = esNone
              TabOrder = 0
              Separators = True
              object NavCentrosAdministrativosFaclElectronicaES: THYMNavigator
                Left = 0
                Top = 2
                Width = 220
                Height = 22
                DataSource = DMClientes.DSQMCentroAdministrativo
                Flat = True
                ParentShowHint = False
                PopupMenu = CECentrosAdministrativosPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                EditaControl = DBGCentrosAdministrativosFaclElectronicaES
                InsertaControl = DBGCentrosAdministrativosFaclElectronicaES
                Exclusivo = True
                ControlEdit = CECentrosAdministrativos
                OrdenAscendente = True
                InsertaUltimo = False
                OnClickAfterAdjust = NavMainClickAfterAdjust
              end
            end
            object PNLCentroAdmFacElectronicaES: TLFPanel
              Left = 0
              Top = 24
              Width = 912
              Height = 562
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object LNotasFactruraElectronica: TLFLabel
                Left = 0
                Top = 497
                Width = 114
                Height = 65
                Hint = 'Descripci'#243'n de roles.'
                Align = alBottom
                Caption = 
                  'Descripci'#243'n de Roles:'#13#10'01- Oficina Contable'#13#10'02 - Organo Gestor'#13 +
                  #10'03 - Unidad Tramitadora'#13#10'04 - '#211'rgano Proponente'
              end
              object DBGCentrosAdministrativosFaclElectronicaES: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 912
                Height = 497
                Align = alClient
                DataSource = DMClientes.DSQMCentroAdministrativo
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
                BuscarNums = False
                Campos.Strings = (
                  'ROL_CENTRO_ADMINISTRATIVO'
                  'DIRECCION')
                CamposAMostrar.Strings = (
                  'ROL_CENTRO_ADMINISTRATIVO'
                  '0'
                  'DIRECCION'
                  '1'
                  'COD_POSTAL')
                CamposAMostrarAnchos.Strings = (
                  '0'
                  '0')
                CamposADevolver.Strings = (
                  ''
                  '')
                CamposDesplegar.Strings = (
                  '1'
                  '1')
                CampoAOrdenarColor = clInfoBk
                MensajeNoExiste = False
                Numericos.Strings = (
                  'ROL'
                  'DIRECCION')
                SalirSiVacio = False
                SalirSiNoExiste = True
                Tablas.Strings = (
                  'SYS_ROLES_CENTRO_ADM'
                  'VER_DIRECCIONES')
                Acciones.Strings = (
                  ''
                  '')
                Titulos.Strings = (
                  'TITULO'
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGCentrosAdministrativosFaclElectronicaESBusqueda
                Planes.Strings = (
                  ''
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  'ROL'
                  'DIRECCION')
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'DIRECCION'
                    Width = 50
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TITULO_DIRECCION'
                    ReadOnly = True
                    Width = 340
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ROL_CENTRO_ADMINISTRATIVO'
                    Width = 35
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'TITULO_ROL'
                    ReadOnly = True
                    Width = 150
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CENTRO_ADMINISTRATIVO'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE'
                    Width = 210
                    Visible = True
                  end>
              end
            end
          end
          object TSChile: TTabSheet
            Caption = 'Chile'
            ImageIndex = 1
            object TBTipoGiro: TLFToolBar
              Left = 0
              Top = 0
              Width = 910
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
                DataSource = DMClientes.DSxTipoGiro
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
              Width = 910
              Height = 479
              Align = alClient
              DataSource = DMClientes.DSxTipoGiro
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
              OnBusqueda = DBGCentrosAdministrativosFaclElectronicaESBusqueda
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
        end
        object TBFactElectronica: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 24
          AutoSize = True
          ButtonHeight = 24
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLInfoFactElectronica: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 24
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEIntoFactElectronicaTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
            object DBEInfoFactElectronicaCliente: TLFDbedit
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
        end
      end
      object TSRiesgos: TTabSheet [7]
        Caption = 'Riesgos'
        ImageIndex = 6
        OnShow = TSRiesgosShow
        object TBRiesgos: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoRiegos: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object DBEInfoRiesgosTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
            object DBEInfoRiesgosCliente: TLFDbedit
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
          object TBSep8: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavRiesgos: THYMNavigator
            Left = 427
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMClientes.DSQMClientes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CERiesgosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBERiesgoAutEmpresa
            Exclusivo = True
            ControlEdit = CERiesgos
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavRiesgosClickAfterAdjust
          end
          object TBSep17: TToolButton
            Left = 515
            Top = 0
            Width = 8
            ImageIndex = 0
            Style = tbsSeparator
          end
          object TBActualizaRiesgoCliente: TToolButton
            Left = 523
            Top = 0
            Action = AActualizaRiesgoCliente
          end
        end
        object PNLRiesgos: TLFPanel
          Left = 0
          Top = 22
          Width = 993
          Height = 641
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 1
          Enabled = False
          TabOrder = 1
          object LRiesgoAut: TLFLabel
            Left = 107
            Top = 112
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizado'
            FocusControl = DBERiesgoAut
          end
          object LRiesgoActual: TLFLabel
            Left = 127
            Top = 167
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Actual'
            FocusControl = DBERiesgoAct
          end
          object LBLRiesgoVencido: TLFLabel
            Left = 91
            Top = 397
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Vencido (+10)'
            FocusControl = DBERiesgoVencido
          end
          object LBLRiesgoAutCan: TLFLabel
            Left = 615
            Top = 360
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizado Canal'
            FocusControl = DBERiesgoAutCan
            Visible = False
          end
          object LBLRiesgoActualCan: TLFLabel
            Left = 635
            Top = 382
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Actual Canal'
            FocusControl = DBERiesgoActCan
            Visible = False
          end
          object LBLRiesgoFacturas: TLFLabel
            Left = 116
            Top = 284
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Facturas'
            FocusControl = DBERiesgoFacturas
          end
          object LBLRiesgoAlbaranes: TLFLabel
            Left = 110
            Top = 261
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Albaranes'
            FocusControl = DBERiesgoAlbaranes
          end
          object LBLRiesgoCartera: TLFLabel
            Left = 123
            Top = 306
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cartera'
            FocusControl = DBERiesgoCartera
          end
          object LBLRiesgoRemesas: TLFLabel
            Left = 113
            Top = 329
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Remesas'
            FocusControl = DBERiesgoRemesas
          end
          object LBLRiesgoDescuento: TLFLabel
            Left = 105
            Top = 352
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuento'
            FocusControl = DBERiesgoDescuento
          end
          object LBLRiesgoPendiente: TLFLabel
            Left = 108
            Top = 211
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Disponible'
            FocusControl = DBERiesgoPendiente
          end
          object LRiesgoFactor: TLFLabel
            Left = 128
            Top = 90
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factor'
            FocusControl = DBEFactorRiesgoKri
          end
          object LRiesgoPedidos: TLFLabel
            Left = 118
            Top = 239
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedidos'
            FocusControl = DBERiesgoPedidos
          end
          object LRiesgoTotalKri: TLFLabel
            Left = 378
            Top = 167
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Actual + Pedidos'
            FocusControl = DBERiesgoAct
          end
          object LRiesgoPendienteTotalKri: TLFLabel
            Left = 359
            Top = 211
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'Disponible + Pedidos'
            FocusControl = DBERiesgoPendiente
          end
          object LImpagados: TLFLabel
            Left = 108
            Top = 419
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Impagados'
            FocusControl = DBERiesgoPendiente
          end
          object LDescuentoPag: TLFLabel
            Left = 80
            Top = 374
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuento Pag.'
          end
          object LBAnticipadoCanal: TLFLabel
            Left = 617
            Top = 406
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Anticipado Canal'
            FocusControl = DBERiesgoActCan
            Visible = False
          end
          object LAnticipado: TLFLabel
            Left = 109
            Top = 189
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Anticipado '
            FocusControl = DBERiesgoActCan
          end
          object LFecPropuesta: TLFLabel
            Left = 599
            Top = 68
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Propuesta'
            FocusControl = DBERiesgoPendiente
          end
          object LRiesgoAutEmpresa: TLFLabel
            Left = 63
            Top = 46
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizado Empresa'
            FocusControl = DBERiesgoAutEmpresa
          end
          object LRiesgoAutCyC: TLFLabel
            Left = 29
            Top = 68
            Width = 128
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizado Cred. y Cuacion'
            FocusControl = DBERiesgoAutoCyC
          end
          object LRiesgoPedidoLineaPendiente: TLFLabel
            Left = 360
            Top = 239
            Width = 95
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedidos (Lin. Pend.)'
            FocusControl = DBERiesgoPedidoLineaPendiente
          end
          object DBERiesgoAut: TLFDbedit
            Left = 163
            Top = 108
            Width = 122
            Height = 21
            Color = clInfoBk
            DataField = 'RIESGO_AUT'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            TabOrder = 6
          end
          object EDTRiesgoAutEmp: TLFEdit
            Left = 286
            Top = 108
            Width = 46
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
          object EDTRiesgoActEmp: TLFEdit
            Left = 286
            Top = 163
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBERiesgoAct: TLFDbedit
            Left = 163
            Top = 163
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_ACT'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBERiesgoVencido: TLFDbedit
            Left = 163
            Top = 393
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGOVENCIDO'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object EDTRiesgoVenCan: TLFEdit
            Left = 286
            Top = 393
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBERiesgoActCan: TLFDbedit
            Left = 702
            Top = 378
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_ACT_CANAL'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
            Visible = False
          end
          object EDTRiesgoActCanal: TLFEdit
            Left = 825
            Top = 378
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 30
            Visible = False
          end
          object EDTRiesgoAutCanal: TLFEdit
            Left = 825
            Top = 356
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
            Visible = False
          end
          object DBERiesgoAutCan: TLFDbedit
            Left = 702
            Top = 356
            Width = 122
            Height = 21
            Color = clInfoBk
            DataField = 'RIESGO_AUT_CANAL'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
            Visible = False
          end
          object DBERiesgoFacturas: TLFDbedit
            Left = 163
            Top = 280
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_FAC'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object EDTRiesgoFacEmp: TLFEdit
            Left = 286
            Top = 280
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object DBERiesgoAlbaranes: TLFDbedit
            Left = 163
            Top = 257
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_ALB'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object EDTRiesgoAlbEmp: TLFEdit
            Left = 286
            Top = 257
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
          end
          object DBERiesgoCartera: TLFDbedit
            Left = 163
            Top = 302
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_CAR'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object EDTRiesgoCarEmp: TLFEdit
            Left = 286
            Top = 302
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBERiesgoRemesas: TLFDbedit
            Left = 163
            Top = 325
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_REM'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
          end
          object EDTRiesgoRemEmp: TLFEdit
            Left = 286
            Top = 325
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 24
          end
          object DBERiesgoDescuento: TLFDbedit
            Left = 163
            Top = 348
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGODESCUENTO'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 35
          end
          object EDTRiesgoDescuentoCan: TLFEdit
            Left = 286
            Top = 348
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 36
          end
          object DBERiesgoPendiente: TLFDbedit
            Left = 163
            Top = 207
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_PENDIENTE'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
            OnChange = DBERiesgoPendienteChange
          end
          object EDTRiesgoPenEmp: TLFEdit
            Left = 286
            Top = 207
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 28
          end
          object DBEFactorRiesgoKri: TLFDbedit
            Left = 163
            Top = 86
            Width = 122
            Height = 21
            DataField = 'RIESGO_FACTOR'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 5
          end
          object DBERiesgoPedidos: TLFDbedit
            Left = 163
            Top = 235
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_PEC'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object EDTRiesgoPedEmp: TLFEdit
            Left = 286
            Top = 235
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBERiesgoDescuentoPagares: TLFDbedit
            Left = 163
            Top = 370
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGOREMPAG'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 25
          end
          object EDRiesgoDescuentoPagares: TLFEdit
            Left = 286
            Top = 370
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 26
          end
          object DBEAnticipado: TLFDbedit
            Left = 163
            Top = 185
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ANTICIPO_EMP'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
          end
          object EDAnticipadoEmpresa: TLFEdit
            Left = 286
            Top = 185
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 32
          end
          object DBEAnticipadoCanal: TLFDbedit
            Left = 702
            Top = 401
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ANTICIPO_CAN'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 33
            Visible = False
          end
          object EDAnticipadoCanal: TLFEdit
            Left = 825
            Top = 401
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 34
            Visible = False
          end
          object DBEImpagadosKri: TLFDbedit
            Left = 163
            Top = 415
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'IMPAGADOS_KRI'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 37
          end
          object DBERiesgoPendienteTotalKri: TLFDbedit
            Left = 462
            Top = 207
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_PENDIENTE_PED'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 38
            OnChange = DBERiesgoPendienteTotalKriChange
          end
          object DBERiesgoTotalKri: TLFDbedit
            Left = 462
            Top = 163
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_ACT_PED'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 39
          end
          object EDRiesgoTotalKri: TLFEdit
            Left = 585
            Top = 163
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 40
          end
          object EDRiesgoPendienteTotalKri: TLFEdit
            Left = 585
            Top = 207
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 41
          end
          object EDImpagadosKri: TLFEdit
            Left = 286
            Top = 415
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 42
          end
          object DBECodCreditoYCaucionRiesgos: TLFDbedit
            Left = 462
            Top = 64
            Width = 122
            Height = 21
            DataField = 'COD_CREDITO_Y_CAUCION'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 3
          end
          object DBCBCreditoYCaucionRiesgos: TLFDBCheckBox
            Left = 362
            Top = 66
            Width = 97
            Height = 17
            Hint = 'Asegurado en Credito y Caucion'
            Caption = 'Cred. y Caucion'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CREDITO_Y_CAUCION'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFecPropuestaCredCauc: TLFDBDateEdit
            Left = 662
            Top = 64
            Width = 87
            Height = 21
            DataField = 'FEC_PROP_CREDITO_Y_CAUCION'
            DataSource = DMClientes.DSQMClientes
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DBERiesgoAutEmpresa: TLFDbedit
            Left = 163
            Top = 42
            Width = 122
            Height = 21
            DataField = 'RIESGO_EMP'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 0
          end
          object ERiesgoAutEmpresaMoneda: TLFEdit
            Left = 286
            Top = 42
            Width = 46
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
            TabOrder = 43
          end
          object DBERiesgoAutoCyC: TLFDbedit
            Left = 163
            Top = 64
            Width = 122
            Height = 21
            DataField = 'RIESGO_CYC'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 1
          end
          object ERiesgoAutoCyCMoneda: TLFEdit
            Left = 286
            Top = 64
            Width = 46
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
            TabOrder = 44
          end
          object DBCBNoVentaRiesgo: TLFDBCheckBox
            Left = 163
            Top = 132
            Width = 338
            Height = 17
            Caption = 'No permitir superar el riesgo a este Cliente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_VENTA_RIESGO'
            DataSource = DMClientes.DSQMClientes
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EDTRiesgoPedLinEmp: TLFEdit
            Left = 585
            Top = 235
            Width = 46
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 45
          end
          object DBERiesgoPedidoLineaPendiente: TLFDbedit
            Left = 462
            Top = 235
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIESGO_PED'
            DataSource = DMClientes.DSQMClientes
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 46
          end
        end
      end
      object TSEstadisticas: TTabSheet [8]
        Caption = 'Estad'#237'sticas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ImageIndex = 8
        ParentFont = False
        OnHide = TSEstadisticasHide
        OnShow = TSEstadisticasShow
        object TBEstadisticas: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 24
          AutoSize = True
          ButtonHeight = 24
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoEstadistica: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 24
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoEstadisticasTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
            object DBEInfoEstadisticasCliente: TLFDbedit
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
        end
        object LFPCEstadisticas: TLFPageControl
          Left = 0
          Top = 24
          Width = 993
          Height = 639
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
            object SBAlbPend: TSpeedButton
              Left = 592
              Top = 120
              Width = 23
              Height = 22
              Action = AAlbPend
              OnDblClick = AAlbPendExecute
            end
            object SBFacPend: TSpeedButton
              Left = 592
              Top = 144
              Width = 23
              Height = 22
              Action = AFacPend
              OnDblClick = AFacPendExecute
            end
            object SBPedPend: TSpeedButton
              Left = 592
              Top = 96
              Width = 23
              Height = 22
              Action = APedPend
              OnDblClick = APedPendExecute
            end
            object SBFacCob: TSpeedButton
              Left = 472
              Top = 2
              Width = 23
              Height = 22
              Action = AFacCob
              OnDblClick = AFacCobExecute
            end
            object SBVerRecImp: TSpeedButton
              Left = 472
              Top = 26
              Width = 23
              Height = 22
              Action = AMuestraImpagados
              OnDblClick = AMuestraImpagadosExecute
            end
            object SBVerRecPenCob: TSpeedButton
              Left = 472
              Top = 50
              Width = 23
              Height = 22
              Action = ARecibosPendCob
              OnDblClick = ARecibosPendCobExecute
            end
            object SBVerRecPenRec: TSpeedButton
              Left = 472
              Top = 74
              Width = 23
              Height = 22
              Action = ARecibosPendRec
              OnDblClick = ARecibosPendRecExecute
            end
            object FPDocumentos: TFlatPanel
              Left = 0
              Top = 0
              Width = 985
              Height = 170
              ParentColor = True
              Enabled = False
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              Align = alTop
              TabOrder = 0
              object LFLPesupPend: TLFLabel
                Left = 114
                Top = 28
                Width = 120
                Height = 13
                Alignment = taRightJustify
                Caption = 'Presupuestos Pendientes'
              end
              object LFLPresupAceptados: TLFLabel
                Left = 117
                Top = 51
                Width = 118
                Height = 13
                Alignment = taRightJustify
                Caption = 'Presupuestos Aceptados'
              end
              object LPresupuestosDenegados: TLFLabel
                Left = 114
                Top = 74
                Width = 122
                Height = 13
                Alignment = taRightJustify
                Caption = 'Presupuestos Denegados'
              end
              object LPedidosPendientes: TLFLabel
                Left = 142
                Top = 99
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pedidos Pendientes'
              end
              object LFLAlbPend: TLFLabel
                Left = 133
                Top = 123
                Width = 103
                Height = 13
                Alignment = taRightJustify
                Caption = 'Albaranes Pendientes'
              end
              object LFLFactPend: TLFLabel
                Left = 120
                Top = 147
                Width = 116
                Height = 13
                Alignment = taRightJustify
                Caption = 'Facturas Sin Contabilizar'
              end
              object LNum: TLFLabel
                Left = 242
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
                Left = 296
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
                Left = 414
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
              object LFEPresupPend: TLFEdit
                Left = 538
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
                TabOrder = 3
              end
              object LFEPresupAcept: TLFEdit
                Left = 538
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
                TabOrder = 7
              end
              object LFEPresupDeni: TLFEdit
                Left = 538
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
                TabOrder = 11
              end
              object LFEPedPend: TLFEdit
                Left = 538
                Top = 96
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
                TabOrder = 15
              end
              object LFEAlbPend: TLFEdit
                Left = 538
                Top = 120
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
                TabOrder = 19
              end
              object LFEFactPend: TLFEdit
                Left = 538
                Top = 144
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
                TabOrder = 23
              end
              object LFDEFactPendLIQUIDO: TLFDbedit
                Left = 414
                Top = 144
                Width = 121
                Height = 21
                Color = clAqua
                DataField = 'T_FAC_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 22
              end
              object LFDEAlbPendLIQUIDO: TLFDbedit
                Left = 414
                Top = 120
                Width = 121
                Height = 21
                Color = clAqua
                DataField = 'T_ALB_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 18
              end
              object LFDEPedPendLIQUIDO: TLFDbedit
                Left = 414
                Top = 96
                Width = 121
                Height = 21
                Color = clAqua
                DataField = 'T_PED_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 14
              end
              object LFDEPresupDeniLIQUIDO: TLFDbedit
                Left = 414
                Top = 72
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'T_PRESUP_DENI'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 10
              end
              object LFDEPresupAceptLIQUIDO: TLFDbedit
                Left = 414
                Top = 48
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'T_PRESUP_ACEPT'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 6
              end
              object LFDEPresupAceptBASE: TLFDbedit
                Left = 296
                Top = 48
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_PRESUP_ACEPT'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 5
              end
              object LFDEPresupDeniBASE: TLFDbedit
                Left = 296
                Top = 72
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_PRESUP_DENI'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 9
              end
              object LFDEPedPendBASE: TLFDbedit
                Left = 296
                Top = 96
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_PED_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 13
              end
              object LFDEAlbPendBASE: TLFDbedit
                Left = 296
                Top = 120
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_ALB_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 17
              end
              object LFDEFactPendBASE: TLFDbedit
                Left = 296
                Top = 144
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_FAC_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 21
              end
              object LFDEFactPendNUMERO: TLFDbedit
                Left = 242
                Top = 144
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_FAC_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 20
              end
              object LFDEAlbPendNUMERO: TLFDbedit
                Left = 242
                Top = 120
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_ALB_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 16
              end
              object LFDEPedPendNUMERO: TLFDbedit
                Left = 242
                Top = 96
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PED_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 12
              end
              object LFDEPresupDenNUMERO: TLFDbedit
                Left = 242
                Top = 72
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PRESUP_DENI'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 8
              end
              object LFDEPresupAceptNUMERO: TLFDbedit
                Left = 242
                Top = 48
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PRESUP_ACEPT'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 4
              end
              object LFDEPresupPendLIQUIDO: TLFDbedit
                Left = 414
                Top = 24
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'T_PRESUP_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 2
              end
              object LFDEPresupPendBASE: TLFDbedit
                Left = 296
                Top = 24
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'B_PRESUP_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 1
              end
              object LFDEPresupPendNUMERO: TLFDbedit
                Left = 242
                Top = 24
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PRESUP_PEND'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 0
              end
            end
            object FPImpagados: TFlatPanel
              Left = 0
              Top = 170
              Width = 985
              Height = 128
              ParentColor = True
              Enabled = False
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              Align = alTop
              TabOrder = 1
              object LRecPend: TLFLabel
                Left = 128
                Top = 79
                Width = 106
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Pend. Recibir'
              end
              object LRecPendRetraso: TLFLabel
                Left = 302
                Top = 103
                Width = 102
                Height = 13
                Alignment = taRightJustify
                Caption = 'Plz. Medio de Recep.'
              end
              object LRecPendPlazo: TLFLabel
                Left = 127
                Top = 103
                Width = 107
                Height = 13
                Alignment = taRightJustify
                Caption = 'Plazo  Medio de Cobro'
              end
              object LRecNoCob: TLFLabel
                Left = 130
                Top = 55
                Width = 104
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Pend. Cobrar'
              end
              object LRecImp: TLFLabel
                Left = 140
                Top = 31
                Width = 94
                Height = 13
                Alignment = taRightJustify
                Caption = 'Recibos Impagados'
              end
              object LFLFactCob: TLFLabel
                Left = 145
                Top = 9
                Width = 89
                Height = 13
                Alignment = taRightJustify
                Caption = 'Facturas Cobradas'
              end
              object LFERiesgosRecPend: TLFEdit
                Left = 414
                Top = 76
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
                TabOrder = 11
              end
              object LFDERecImpagadosIMPORTE: TLFDbedit
                Left = 295
                Top = 28
                Width = 113
                Height = 21
                Color = clAqua
                DataField = 'T_IMPAGADO'
                DataSource = DMClientes.DSxFactCobrada
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
              object LFERiesgosRecImp: TLFEdit
                Left = 414
                Top = 52
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
              object LFERiesgosRecNoCob: TLFEdit
                Left = 414
                Top = 28
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
              object LFDERecImpagadosNUMERO: TLFDbedit
                Left = 242
                Top = 28
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_IMPAGADO'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                TabOrder = 3
              end
              object LFDERecNoCobradosIMPORTE: TLFDbedit
                Left = 295
                Top = 52
                Width = 113
                Height = 21
                Color = clAqua
                DataField = 'T_PEND_COBRAR'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object LFDERecPendIMPORTE: TLFDbedit
                Left = 295
                Top = 76
                Width = 113
                Height = 21
                Color = clAqua
                DataField = 'T_PEND_RECIBIR'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object LFDERecNoCobradosNUMERO: TLFDbedit
                Left = 242
                Top = 52
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_COBRAR'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                TabOrder = 6
              end
              object LFDERecPendNUMERO: TLFDbedit
                Left = 242
                Top = 76
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_RECIBIR'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                TabOrder = 9
              end
              object LFDERecPendRetraso: TLFDbedit
                Left = 414
                Top = 100
                Width = 52
                Height = 21
                Color = clInfoBk
                DataField = 'MEDIA_DIAS_REC'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                TabOrder = 13
              end
              object LFDEREcPendPLazo: TLFDbedit
                Left = 242
                Top = 100
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'MEDIA_DIAS_PAGO'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                TabOrder = 12
              end
              object LFDEFactCobNUMERO: TLFDbedit
                Left = 242
                Top = 4
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PAGADO'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                TabOrder = 0
              end
              object LFDEFactCobLIQUIDO: TLFDbedit
                Left = 295
                Top = 4
                Width = 113
                Height = 21
                Color = clAqua
                DataField = 'T_PAGADO'
                DataSource = DMClientes.DSxFactCobrada
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object LFEFactCob: TLFEdit
                Left = 414
                Top = 4
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
            end
            object FPCartera: TFlatPanel
              Left = 0
              Top = 298
              Width = 985
              Height = 290
              ParentColor = True
              Enabled = False
              ColorHighLight = clBtnFace
              ColorShadow = clBtnFace
              Align = alClient
              TabOrder = 2
              object LPPRecibir: TLFLabel
                Left = 149
                Top = 12
                Width = 84
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pendiente Recibir'
              end
              object LPPCobrar: TLFLabel
                Left = 151
                Top = 34
                Width = 82
                Height = 13
                Alignment = taRightJustify
                Caption = 'Pendiente Cobrar'
              end
              object LAnticipo: TLFLabel
                Left = 193
                Top = 58
                Width = 38
                Height = 13
                Alignment = taRightJustify
                Caption = 'Anticipo'
              end
              object LAntCuenta: TLFLabel
                Left = 197
                Top = 82
                Width = 34
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cuenta'
              end
              object LFDEPPRecibirNUMERO: TLFDbedit
                Left = 242
                Top = 7
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_RECIBIR'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 0
              end
              object LFDEPPRecibirIMPORTE: TLFDbedit
                Left = 296
                Top = 7
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_RECIBIR'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 1
              end
              object LFEPPRecibir: TLFEdit
                Left = 414
                Top = 7
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
                Left = 414
                Top = 31
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
                Left = 296
                Top = 31
                Width = 113
                Height = 21
                Color = clInfoBk
                DataField = 'T_PEND_COBRAR'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 4
              end
              object LFDEPPCobrarNUMERO: TLFDbedit
                Left = 242
                Top = 31
                Width = 49
                Height = 21
                Color = clInfoBk
                DataField = 'N_PEND_COBRAR'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 3
              end
              object LFDEAnticipo: TLFDbedit
                Left = 242
                Top = 55
                Width = 167
                Height = 21
                Color = clInfoBk
                DataField = 'T_PAGADO'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 6
              end
              object LFEAnticipo: TLFEdit
                Left = 414
                Top = 56
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
              object LFDEAntCuenta: TLFDbedit
                Left = 242
                Top = 79
                Width = 167
                Height = 21
                Color = clInfoBk
                DataField = 'CUENTA_ANTICIPO'
                DataSource = DMClientes.DSxDocumentos
                Enabled = False
                TabOrder = 8
              end
            end
          end
          object TSGraficos: TTabSheet
            Caption = 'Gr'#225'ficos'
            ImageIndex = 1
            OnShow = TSGraficosShow
            object PNLEstadisticas: TLFPanel
              Left = 0
              Top = 0
              Width = 486
              Height = 613
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object LEstadisticasEnero: TLFLabel
                Left = 6
                Top = 96
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ene'
              end
              object LEstadisticasFebrero: TLFLabel
                Left = 7
                Top = 120
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Feb'
              end
              object LEstadisticasMarzo: TLFLabel
                Left = 7
                Top = 144
                Width = 18
                Height = 13
                Alignment = taRightJustify
                Caption = 'Mar'
              end
              object LEstadisticasAbril: TLFLabel
                Left = 9
                Top = 167
                Width = 16
                Height = 13
                Alignment = taRightJustify
                Caption = 'Abr'
              end
              object LEstadisticasMayo: TLFLabel
                Left = 5
                Top = 191
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'May'
              end
              object LEstadisticasJunio: TLFLabel
                Left = 8
                Top = 216
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'Jun'
              end
              object LEstadisticasJulio: TLFLabel
                Left = 12
                Top = 240
                Width = 13
                Height = 13
                Alignment = taRightJustify
                Caption = 'Jul'
              end
              object LEstadisticasAgosto: TLFLabel
                Left = 6
                Top = 264
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ago'
              end
              object LEstadisticasSeptiempre: TLFLabel
                Left = 6
                Top = 288
                Width = 19
                Height = 13
                Alignment = taRightJustify
                Caption = 'Sep'
              end
              object LEstadisticasOctubre: TLFLabel
                Left = 8
                Top = 312
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'Oct'
              end
              object LEstadisticasNoviembre: TLFLabel
                Left = 5
                Top = 336
                Width = 20
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nov'
              end
              object LEstadisticasDiciembre: TLFLabel
                Left = 9
                Top = 360
                Width = 16
                Height = 13
                Alignment = taRightJustify
                Caption = 'Dic'
              end
              object LFComparar: TLFLabel
                Left = 28
                Top = 64
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
                Top = 64
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
                Top = 64
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
                Left = -1
                Top = 384
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
              object LPorcentajeEstimacion: TLFLabel
                Left = 118
                Top = 11
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'Estimaci'#243'n  (%)'
              end
              object LFLEjercicioActual: TLFLabel
                Left = 9
                Top = 10
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ejercicio '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LFLEjercicioComparar: TLFLabel
                Left = 9
                Top = 34
                Width = 54
                Height = 13
                Alignment = taRightJustify
                Caption = 'Ejercicio '
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LBaseComp: TLFLabel
                Left = 28
                Top = 77
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Base'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LBaseAct: TLFLabel
                Left = 180
                Top = 77
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Base'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LBasePrev: TLFLabel
                Left = 332
                Top = 77
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Base'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LTipoDoc: TLFLabel
                Left = 242
                Top = 11
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo documento'
              end
              object LEstadisticasMoneda: TLFLabel
                Left = 280
                Top = 34
                Width = 39
                Height = 13
                Alignment = taRightJustify
                Caption = 'Moneda'
              end
              object LLiquidoComp: TLFLabel
                Left = 104
                Top = 77
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Liquido'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LLiquidoAct: TLFLabel
                Left = 256
                Top = 77
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Liquido'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LLiquidoPrev: TLFLabel
                Left = 408
                Top = 77
                Width = 75
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Liquido'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clRed
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object DBEFBaseEneroAC: TLFDbedit
                Left = 180
                Top = 92
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 0
              end
              object DBEFBaseFebreroAC: TLFDbedit
                Left = 180
                Top = 116
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 1
              end
              object DBEFBaseMarzoAC: TLFDbedit
                Left = 180
                Top = 140
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 2
              end
              object DBEFBaseAbrilAC: TLFDbedit
                Left = 180
                Top = 164
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 3
              end
              object DBEFBaseMayoAC: TLFDbedit
                Left = 180
                Top = 188
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 4
              end
              object DBEFBaseJunioAC: TLFDbedit
                Left = 180
                Top = 212
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 5
              end
              object DBEFBaseJulioAC: TLFDbedit
                Left = 180
                Top = 236
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 6
              end
              object DBEFBaseAgostoAC: TLFDbedit
                Left = 180
                Top = 260
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 7
              end
              object DBEFBaseSeptiembreAC: TLFDbedit
                Left = 180
                Top = 284
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 8
              end
              object DBEFBaseOctubreAC: TLFDbedit
                Left = 180
                Top = 308
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 9
              end
              object DBEFBaseNoviembreAC: TLFDbedit
                Left = 180
                Top = 332
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 10
              end
              object DBEFBaseDiciembreAC: TLFDbedit
                Left = 180
                Top = 356
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 11
              end
              object DBEFBaseEneroCOMP: TLFDbedit
                Left = 28
                Top = 92
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 12
              end
              object DBEFBaseFebreroCOMP: TLFDbedit
                Left = 28
                Top = 116
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 13
              end
              object DBEFBaseMarzoCOMP: TLFDbedit
                Left = 28
                Top = 140
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 14
              end
              object DBEFBaseAbrilCOMP: TLFDbedit
                Left = 28
                Top = 164
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 15
              end
              object DBEFBaseMayoCOMP: TLFDbedit
                Left = 28
                Top = 188
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 16
              end
              object DBEFBaseJunioCOMP: TLFDbedit
                Left = 28
                Top = 212
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 17
              end
              object DBEFBaseJulioCOMP: TLFDbedit
                Left = 28
                Top = 236
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 18
              end
              object DBEFBaseAgostoCOMP: TLFDbedit
                Left = 28
                Top = 260
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 19
              end
              object DBEFBaseSeptiembreCOMP: TLFDbedit
                Left = 28
                Top = 284
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 20
              end
              object DBEFBaseOctubreCOMP: TLFDbedit
                Left = 28
                Top = 308
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 21
              end
              object DBEFBaseNoviembreCOMP: TLFDbedit
                Left = 28
                Top = 332
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 22
              end
              object DBEFBaseDiciembreCOMP: TLFDbedit
                Left = 28
                Top = 356
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 23
              end
              object DBEFBaseEneroPREV: TLFDbedit
                Left = 332
                Top = 92
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ENERO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 24
              end
              object DBEFBaseFebreroPREV: TLFDbedit
                Left = 332
                Top = 116
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_FEBRERO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 25
              end
              object DBEFBaseMarzoPREV: TLFDbedit
                Left = 332
                Top = 140
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MARZO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 26
              end
              object DBEFBaseAbrilPREV: TLFDbedit
                Left = 332
                Top = 164
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_ABRIL'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 27
              end
              object DBEFBaseMayoPREV: TLFDbedit
                Left = 332
                Top = 188
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_MAYO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 28
              end
              object DBEFBaseJunioPREV: TLFDbedit
                Left = 332
                Top = 212
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JUNIO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 29
              end
              object DBEFBaseJulioPREV: TLFDbedit
                Left = 332
                Top = 236
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_JULIO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 30
              end
              object DBEFBaseAgostoPREV: TLFDbedit
                Left = 332
                Top = 260
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_AGOSTO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 31
              end
              object DBEFBaseSeptiembrePREV: TLFDbedit
                Left = 332
                Top = 284
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_SEPTIEMBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 32
              end
              object DBEFBaseOctubrePREV: TLFDbedit
                Left = 332
                Top = 308
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_OCTUBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 33
              end
              object DBEFBaseNoviembrePREV: TLFDbedit
                Left = 332
                Top = 332
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_NOVIEMBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 34
              end
              object DBEFBaseDiciembrePREV: TLFDbedit
                Left = 332
                Top = 356
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'B_DICIEMBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 35
              end
              object DBEFTotalBaseAC: TLFDbedit
                Left = 180
                Top = 380
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMClientes.DSxFacturasAnual
                Enabled = False
                TabOrder = 36
              end
              object DBEFTotalBaseCOMP: TLFDbedit
                Left = 28
                Top = 380
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMClientes.DSxFacturasAnualCompara
                Enabled = False
                TabOrder = 37
              end
              object DBEFTotalBasePREV: TLFDbedit
                Left = 332
                Top = 380
                Width = 75
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL_BASE'
                DataSource = DMClientes.DSxPrevisionAnual
                Enabled = False
                TabOrder = 38
              end
              object DBEFLiquidoEneroAC: TLFDbedit
                Left = 256
                Top = 92
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 39
              end
              object DBEFLiquidoFebreroAC: TLFDbedit
                Left = 256
                Top = 116
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 40
              end
              object DBEFLiquidoMarzoAC: TLFDbedit
                Left = 256
                Top = 140
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 41
              end
              object DBEFLiquidoAbrilAC: TLFDbedit
                Left = 256
                Top = 164
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 42
              end
              object DBEFLiquidoMayoAC: TLFDbedit
                Left = 256
                Top = 188
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 43
              end
              object DBEFLiquidoJunioAC: TLFDbedit
                Left = 256
                Top = 212
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 44
              end
              object DBEFLiquidoJulioAC: TLFDbedit
                Left = 256
                Top = 236
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JULIO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 45
              end
              object DBEFLiquidoAgostoAC: TLFDbedit
                Left = 256
                Top = 260
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 46
              end
              object DBEFLiquidoSeptiembreAC: TLFDbedit
                Left = 256
                Top = 284
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 47
              end
              object DBEFLiquidoOctubreAC: TLFDbedit
                Left = 256
                Top = 308
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 48
              end
              object DBEFLiquidoNoviembreAC: TLFDbedit
                Left = 256
                Top = 332
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 49
              end
              object DBEFLiquidoDiciembreAC: TLFDbedit
                Left = 256
                Top = 356
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMClientes.DSxFacturasMensual
                Enabled = False
                TabOrder = 50
              end
              object DBEFTotalLiquidoAC: TLFDbedit
                Left = 256
                Top = 380
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMClientes.DSxFacturasAnual
                Enabled = False
                TabOrder = 51
              end
              object DBEFLiquidoEneroCOMP: TLFDbedit
                Left = 104
                Top = 92
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 52
              end
              object DBEFLiquidoFebreroCOMP: TLFDbedit
                Left = 104
                Top = 116
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 53
              end
              object DBEFLiquidoMarzoCOMP: TLFDbedit
                Left = 104
                Top = 140
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 54
              end
              object DBEFLiquidoAbrilCOMP: TLFDbedit
                Left = 104
                Top = 164
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 55
              end
              object DBEFLiquidoMayoCOMP: TLFDbedit
                Left = 104
                Top = 188
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 56
              end
              object DBEFLiquidoJunioCOMP: TLFDbedit
                Left = 104
                Top = 212
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 57
              end
              object DBEFLiquidoJulioCOMP: TLFDbedit
                Left = 104
                Top = 236
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JULIO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 58
              end
              object DBEFLiquidoAgostoCOMP: TLFDbedit
                Left = 104
                Top = 260
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 59
              end
              object DBEFLiquidoSeptiembreCOMP: TLFDbedit
                Left = 104
                Top = 284
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 60
              end
              object DBEFLiquidoOctubreCOMP: TLFDbedit
                Left = 104
                Top = 308
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 61
              end
              object DBEFLiquidoNoviembreCOMP: TLFDbedit
                Left = 104
                Top = 332
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 62
              end
              object DBEFLiquidoDiciembreCOMP: TLFDbedit
                Left = 104
                Top = 356
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMClientes.DSxFacturasMensualCompara
                Enabled = False
                TabOrder = 63
              end
              object DBEFTotalLiquidoCOMP: TLFDbedit
                Left = 104
                Top = 380
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMClientes.DSxFacturasAnualCompara
                Enabled = False
                TabOrder = 64
              end
              object DBEFLiquidoEneroPREV: TLFDbedit
                Left = 408
                Top = 92
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ENERO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 65
              end
              object DBEFLiquidoFebreroPREV: TLFDbedit
                Left = 408
                Top = 116
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_FEBRERO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 66
              end
              object DBEFLiquidoMarzoPREV: TLFDbedit
                Left = 408
                Top = 140
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MARZO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 67
              end
              object DBEFLiquidoAbrilPREV: TLFDbedit
                Left = 408
                Top = 164
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_ABRIL'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 68
              end
              object DBEFLiquidoMayoPREV: TLFDbedit
                Left = 408
                Top = 188
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_MAYO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 69
              end
              object DBEFLiquidoJunioPREV: TLFDbedit
                Left = 408
                Top = 212
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_JUNIO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 70
              end
              object DBEFLiquidoJulioPREV: TLFDbedit
                Left = 408
                Top = 236
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'B_JULIO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 71
              end
              object DBEFLiquidoAgostoPREV: TLFDbedit
                Left = 408
                Top = 260
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_AGOSTO'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 72
              end
              object DBEFLiquidoSeptiembrePREV: TLFDbedit
                Left = 408
                Top = 284
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_SEPTIEMBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 73
              end
              object DBEFLiquidoOctubrePREV: TLFDbedit
                Left = 408
                Top = 308
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_OCTUBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 74
              end
              object DBEFLiquidoNoviembrePREV: TLFDbedit
                Left = 408
                Top = 332
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_NOVIEMBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 75
              end
              object DBEFLiquidoDiciembrePREV: TLFDbedit
                Left = 408
                Top = 356
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'L_DICIEMBRE'
                DataSource = DMClientes.DSxPrevisionMensual
                Enabled = False
                TabOrder = 76
              end
              object DBEFTotalLiquidoPREV: TLFDbedit
                Left = 408
                Top = 380
                Width = 75
                Height = 21
                Color = clYellow
                DataField = 'TOTAL_LIQUIDO'
                DataSource = DMClientes.DSxPrevisionAnual
                Enabled = False
                TabOrder = 77
              end
              object EPorcentajeEstimacion: TLFEdit
                Left = 196
                Top = 6
                Width = 40
                Height = 21
                TabOrder = 80
              end
              object BBEjercicioComparar: TBitBtn
                Left = 402
                Top = 7
                Width = 71
                Height = 21
                Caption = 'Calcula ->'
                TabOrder = 83
                OnClick = ACalculaEstadisticasExecute
              end
              object EEjercicio2: TLFEdit
                Left = 67
                Top = 30
                Width = 40
                Height = 21
                TabOrder = 79
              end
              object EEjercicio: TLFEdit
                Left = 67
                Top = 7
                Width = 40
                Height = 21
                TabOrder = 78
              end
              object CBTipoDoc: TLFComboBox
                Left = 330
                Top = 7
                Width = 61
                Height = 21
                Style = csDropDownList
                ItemHeight = 13
                ItemIndex = 0
                TabOrder = 81
                Text = 'FAC'
                Items.Strings = (
                  'FAC'
                  'ALB'
                  'PEC'
                  'OFC')
              end
              object BBMultiSelect: TBitBtn
                Left = 402
                Top = 30
                Width = 71
                Height = 21
                Caption = 'Multi-Selec'
                TabOrder = 84
                OnClick = BBMultiSelectClick
              end
              object CBMonedas: TLFComboBox
                Left = 330
                Top = 30
                Width = 61
                Height = 21
                ItemHeight = 13
                TabOrder = 82
              end
            end
            object PNLGraficos: TLFPanel
              Left = 486
              Top = 0
              Width = 499
              Height = 613
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBCAnual: TDBChart
                Left = 0
                Top = 0
                Width = 426
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
                  DataSource = DMClientes.DSxFacturasAnualC_3
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
                  DataSource = DMClientes.DSxFacturasAnualC_2
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
                  DataSource = DMClientes.DSxFacturasAnualC_1
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
                  DataSource = DMClientes.DSxFacturasAnualCompara
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
                  DataSource = DMClientes.DSxFacturasAnual
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
                Width = 426
                Height = 316
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
                  DataSource = DMClientes.DSxFacturasMensualCompara
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
                  DataSource = DMClientes.DSxFacturasMensual
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
              object DBCPrevision: TDBChart
                Left = 0
                Top = 458
                Width = 426
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
                  DataSource = DMClientes.DSxPrevisionMensual
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
                  DataSource = DMClientes.DSxFacturasMensual
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
      object TSVentas: TTabSheet [9]
        Caption = 'Ventas'
        OnHide = TSVentasHide
        OnShow = TSVentasShow
        object PCVentas: TLFPageControl
          Left = 0
          Top = 44
          Width = 993
          Height = 619
          ActivePage = TSVentasDocumentos
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSVentasDocumentos: TTabSheet
            Caption = 'Documentos'
            OnShow = TSVentasDocumentosShow
            object DBGVentasDocumento: THYTDBGrid
              Left = 0
              Top = 0
              Width = 985
              Height = 591
              Align = alClient
              Color = clInfoBk
              DataSource = DMClientes.DSxVentas
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
              OnCellClick = DBGCellClick
              OnDrawColumnCell = DBGVentasDocumentoDrawColumnCell
              OnDblClick = DBGVentasDocumentoDblClick
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
                'TIPO'
                'Z_OBSERVACION'
                'PEDIDO_CLIENTE')
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
                  Width = 60
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
                  FieldName = 'MONEDA'
                  Width = 60
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
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'I_PORTES'
                  Width = 70
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NIF'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DIR_NOMBRE'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'C_POSTAL'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOCALIDAD'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PROVINCIA'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PAIS'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TELEFONO01'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TELEFONO02'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TELEFAX'
                  Width = 90
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMAIL'
                  Width = 150
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NOMBRE_CONTACTO'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMO_NOS_CONOCIERON'
                  Width = 120
                  Visible = True
                end>
            end
          end
          object TSVentasDetalle: TTabSheet
            Caption = 'Detalle'
            ImageIndex = 1
            OnShow = TSVentasDetalleShow
            object DBGVentasDetalle: THYTDBGrid
              Left = 0
              Top = 0
              Width = 985
              Height = 591
              Align = alClient
              Color = clInfoBk
              DataSource = DMClientes.DSxVentasDetalle
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
              OnCellClick = DBGCellClick
              OnDrawColumnCell = DBGVentasDetalleDrawColumnCell
              OnDblClick = DBGVentasDetalleDblClick
              OnTitleClick = DBGVentasDetalleTitleClick
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
                'ARTICULO'
                'B_COMISION'
                'B_DTO_LINEA'
                'B_DTO_LINEAS'
                'B_IMPONIBLE'
                'BRUTO'
                'BULTOS'
                'CAMPANYA'
                'CUENTA'
                'DESCUENTO'
                'DESCUENTO_2'
                'DESCUENTO_3'
                'DIRECCION'
                'DTO_CIAL'
                'DTO_PP'
                'FECHA'
                'FECHA_CREACION_KRI'
                'FECHA_ENTREGA'
                'FORMA_PAGO'
                'LIQUIDO'
                'LOTE_SIMPLE'
                'NSERIE'
                'P_COSTE'
                'PRECIO'
                'PRO_NUM_PLANO'
                'PROYECTO'
                'RIG'
                'SERIE'
                'SU_REFERENCIA'
                'TARIFA'
                'TIPO'
                'TITULO'
                'TITULO_IDIOMA'
                'UNIDADES'
                'Z_CONTACTO'
                'Z_OBSERVACION'
                'PEDIDO_CLIENTE')
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
                  Width = 60
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
                  FieldName = 'U_PENDIENTES'
                  Width = 65
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO'
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
                  Width = 66
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
                  FieldName = 'ALMACEN'
                  Width = 44
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MONEDA'
                  Width = 40
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
                  FieldName = 'DIRECCION'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SU_REFERENCIA'
                  Width = 90
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
                  FieldName = 'AGENTE'
                  Width = 50
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
                  FieldName = 'TARIFA'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODIGO_CLIENTE'
                  Width = 105
                  Visible = True
                end>
            end
          end
          object TSVentasMargenes: TTabSheet
            Caption = 'Margenes'
            ImageIndex = 2
            OnShow = TSVentasMargenesShow
            object DBGVentasMargenes: THYTDBGrid
              Left = 0
              Top = 0
              Width = 985
              Height = 591
              Align = alClient
              Color = clInfoBk
              DataSource = DMClientes.DSxVentasMargenes
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
              OnCellClick = DBGCellClick
              OnDrawColumnCell = DBGVentasDocumentoDrawColumnCell
              OnDblClick = DBGVentasDocumentoDblClick
              OnTitleClick = DBGVentasMargenesTitleClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = False
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'ALFA_1'
                'ARTICULO'
                'MARGEN'
                'P_COSTE_ARTICULO'
                'TITULO'
                'ULTIMA_FECHA_ALB'
                'ULTIMO_P_COSTE_ALB'
                'ULTIMO_PRECIO_ALB')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Width = 100
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
                  FieldName = 'ULTIMA_FECHA_DOC'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ULTIMO_P_COSTE_DOC'
                  Width = 88
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ULTIMO_PRECIO_DOC'
                  Width = 88
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'P_COSTE_ARTICULO'
                  Width = 88
                  Visible = True
                end
                item
                  Color = clYellow
                  Expanded = False
                  FieldName = 'MARGEN_P_COSTE_ART_PRECIO'
                  Width = 130
                  Visible = True
                end
                item
                  Color = clYellow
                  Expanded = False
                  FieldName = 'MARGEN_P_COSTE_ART_B_IMP'
                  Width = 130
                  Visible = True
                end
                item
                  Color = clYellow
                  Expanded = False
                  FieldName = 'MARGEN_P_COSTE_DOC_PRECIO'
                  Width = 130
                  Visible = True
                end
                item
                  Color = clYellow
                  Expanded = False
                  FieldName = 'MARGEN_P_COSTE_DOC_B_IMP'
                  Width = 130
                  Visible = True
                end
                item
                  Color = clLime
                  Expanded = False
                  FieldName = 'MARGEN_V_P_COSTE_ART_PRECIO'
                  Width = 130
                  Visible = True
                end
                item
                  Color = clLime
                  Expanded = False
                  FieldName = 'MARGEN_V_P_COSTE_ART_B_IMP'
                  Width = 130
                  Visible = True
                end
                item
                  Color = clLime
                  Expanded = False
                  FieldName = 'MARGEN_V_P_COSTE_DOC_PRECIO'
                  Width = 130
                  Visible = True
                end
                item
                  Color = clLime
                  Expanded = False
                  FieldName = 'MARGEN_V_P_COSTE_DOC_B_IMP'
                  Width = 130
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_1'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_2'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_3'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_4'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_5'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_6'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_7'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALFA_8'
                  Width = 200
                  Visible = True
                end>
            end
          end
        end
        object TBVentas: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 22
          AutoSize = True
          Caption = 'Informacion Comercial'
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLInfoVentas: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            Enabled = False
            TabOrder = 0
            object DBEInfoVentasCliente: TLFDbedit
              Left = 2
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = DMClientes.DSQMClientes
              Enabled = False
              TabOrder = 0
              OnChange = DBEInfoVentasClienteChange
            end
            object DBEInfoVentasTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMClientes.DSQMClientes
              Enabled = False
              TabOrder = 1
            end
          end
          object TBSep9: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavVentas: THYMNavigator
            Left = 427
            Top = 0
            Width = 145
            Height = 22
            DataSource = DMClientes.DSxVentas
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBENroDeEmpleados
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep4: TToolButton
            Left = 572
            Top = 0
            Width = 8
            ImageIndex = 0
            Style = tbsSeparator
          end
          object CBCalculaMargenVenta: TLFCheckBox
            Left = 580
            Top = 0
            Width = 135
            Height = 22
            Hint = 'Calcula Margen Venta a partir de albaranes'
            Caption = 'Calcula Marg. Venta'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            OnChange = FiltroVentasChange
          end
        end
        object PNLFltroVentas: TLFPanel
          Left = 0
          Top = 22
          Width = 993
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
          object LSerieVenta: TLFLabel
            Left = 107
            Top = 4
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LFechaVentas: TLFLabel
            Left = 291
            Top = 4
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LArticuloVentas: TLFLabel
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
            OnChange = FiltroVentasChange
            Items.Strings = (
              'Todos'
              'OFC'
              'PEC'
              'ALB'
              'FAC')
          end
          object CBSerieVenta: TLFComboBox
            Left = 136
            Top = 0
            Width = 145
            Height = 21
            ItemHeight = 13
            TabOrder = 1
            OnChange = FiltroVentasChange
          end
          object DEFechaVentasDesde: TLFDateEdit
            Left = 326
            Top = 0
            Width = 89
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
            OnChange = FiltroVentasChange
          end
          object DEFechaVentasHasta: TLFDateEdit
            Left = 416
            Top = 0
            Width = 90
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
            OnChange = FiltroVentasChange
          end
          object EFArticuloVentas: TLFEditFind2000
            Left = 543
            Top = 0
            Width = 93
            Height = 21
            TabOrder = 4
            OnChange = FiltroVentasChange
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
          object CBPendientes: TLFCheckBox
            Left = 808
            Top = 2
            Width = 105
            Height = 17
            Caption = 'Pendientes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            OnChange = FiltroVentasChange
          end
          object EDescripcion: TLFEdit
            Left = 680
            Top = 0
            Width = 121
            Height = 21
            TabOrder = 6
            OnChange = FiltroVentasChange
          end
        end
      end
      object TSIso: TTabSheet [10]
        Caption = 'Iso'
        OnShow = TSIsoShow
        object PNLISO: TLFPanel
          Left = 0
          Top = 22
          Width = 920
          Height = 616
          Align = alClient
          TabOrder = 0
          object DBGIso: TDBGridFind2000
            Left = 1
            Top = 1
            Width = 918
            Height = 614
            Align = alClient
            DataSource = DMClientes.DSxIsoCli
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
            BaseDeDatos = DMMain.DataBase
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
        object TBInfoISO: TLFToolBar
          Left = 0
          Top = 0
          Width = 920
          Height = 22
          AutoSize = True
          Caption = 'Informacion Comercial'
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLInfoISO: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            TabOrder = 0
            object DBEInfoISOCliente: TLFDbedit
              Left = 2
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = DMClientes.DSQMClientes
              Enabled = False
              TabOrder = 0
            end
            object DBEInfoISOTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMClientes.DSQMClientes
              Enabled = False
              TabOrder = 1
            end
          end
          object TBSep10: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavISO: THYMNavigator
            Left = 427
            Top = 0
            Width = 100
            Height = 22
            DataSource = DMClientes.DSxIsoCli
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBENroDeEmpleados
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSInfoComercial: TTabSheet [11]
        Caption = 'Info Com.'
        ImageIndex = 7
        object PNLInfoComercial: TLFPanel
          Left = 0
          Top = 22
          Width = 993
          Height = 641
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LNroEmpleados: TLFLabel
            Left = 34
            Top = 31
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
            Top = 96
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedores Habituales'
            FocusControl = DBEProveedoresHabituales
          end
          object LTipoCliente: TLFLabel
            Left = 53
            Top = 142
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo de Cliente'
            FocusControl = DBETipoCliente
          end
          object LFrecuencia: TLFLabel
            Left = 71
            Top = 185
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Frecuencia'
          end
          object LAgente2: TLFLabel
            Left = 42
            Top = 213
            Width = 80
            Height = 13
            Alignment = taRightJustify
            Caption = 'Segundo Agente'
          end
          object DBENroDeEmpleados: TLFDbedit
            Left = 128
            Top = 26
            Width = 64
            Height = 21
            DataField = 'NRO_EMPLEADOS'
            DataSource = DMClientes.DSQMClientes2
            TabOrder = 0
          end
          object DBEFacturacionTotal: TLFDbedit
            Left = 128
            Top = 48
            Width = 64
            Height = 21
            DataField = 'FACTURACION_TOTAL'
            DataSource = DMClientes.DSQMClientes2
            TabOrder = 1
          end
          object DBEConsumoMaterial: TLFDbedit
            Left = 128
            Top = 70
            Width = 64
            Height = 21
            DataField = 'CONSUMO_MATERIAL'
            DataSource = DMClientes.DSQMClientes2
            TabOrder = 2
          end
          object DBEProveedoresHabituales: TLFDbedit
            Left = 128
            Top = 92
            Width = 394
            Height = 21
            DataField = 'PROVEEDORES_HABITUALES'
            DataSource = DMClientes.DSQMClientes2
            TabOrder = 3
          end
          object DBETipoCliente: TLFDbedit
            Left = 282
            Top = 137
            Width = 154
            Height = 21
            DataField = 'TIPO_CLIENTE'
            DataSource = DMClientes.DSQMClientes2
            TabOrder = 6
            Visible = False
          end
          object DBChkClientePotecial: TLFDBCheckBox
            Left = 16
            Top = 119
            Width = 125
            Height = 17
            Caption = 'Cliente Pot. Prioritario'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CLIENTE_POTENCIAL'
            DataSource = DMClientes.DSQMClientes2
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBTipoCliente: TLFDBComboBoxValue
            Left = 128
            Top = 137
            Width = 153
            Height = 21
            DataField = 'TIPO_CLIENTE'
            DataSource = DMClientes.DSQMClientes2
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
            TabOrder = 5
          end
          object DBEFrecuencia: TLFDbedit
            Left = 128
            Top = 181
            Width = 121
            Height = 21
            DataField = 'FRECUENCIA'
            DataSource = DMClientes.DSQMClientes2
            TabOrder = 7
          end
          object DBEFAgente2: TLFDBEditFind2000
            Left = 128
            Top = 209
            Width = 66
            Height = 21
            DataField = 'AGENTE2'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 8
            OnChange = DBEFAgente2Change
            Accion = ANewAgente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES                    '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAgente2: TLFEdit
            Left = 195
            Top = 209
            Width = 359
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
        end
        object TBInfoComercial: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 22
          AutoSize = True
          Caption = 'Informacion Comercial'
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLInfoInfoComercial: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            TabOrder = 0
            object DBEInfoInfoComercialCliente: TLFDbedit
              Left = 2
              Top = 1
              Width = 66
              Height = 21
              Color = clInfoBk
              DataField = 'CLIENTE'
              DataSource = DMClientes.DSQMClientes
              Enabled = False
              TabOrder = 0
            end
            object DBEInfoInfoComercialTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMClientes.DSQMClientes
              Enabled = False
              TabOrder = 1
            end
          end
          object TBSep11: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavInfoComercial: THYMNavigator
            Left = 427
            Top = 0
            Width = 100
            Height = 22
            DataSource = DMClientes.DSQMClientes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            ParentShowHint = False
            PopupMenu = CEInfoComrecialPMEdit
            ShowHint = True
            TabOrder = 1
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
      object TSPrecios: TTabSheet [12]
        Caption = 'Precios'
        ImageIndex = 6
        OnShow = TSPreciosShow
        object TBPrecios: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 23
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object PNLInfoPrecios: TLFPanel
            Left = 0
            Top = 2
            Width = 419
            Height = 21
            TabOrder = 2
            object DBEInfoPreciosCliente: TLFDbedit
              Left = 0
              Top = 0
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
              ReadOnly = True
              TabOrder = 0
            end
            object DBEInfoPreciosTitulo: TLFDbedit
              Left = 67
              Top = 0
              Width = 350
              Height = 21
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
              ReadOnly = True
              TabOrder = 1
            end
          end
          object TBSep12: TToolButton
            Left = 419
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavPreciosProtocolo: THYMNavigator
            Left = 427
            Top = 2
            Width = 80
            Height = 21
            DataSource = DMClientes.DSQMClientes
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            ParentShowHint = False
            PopupMenu = CEPreciosProtocoloPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFProtocolo
            OnClickBefore = NavPreciosProtocoloClickBefore
            Exclusivo = True
            ControlEdit = CEPreciosProtocolo
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavPreciosProtocoloClickAfterAdjust
          end
          object ToolButton12: TToolButton
            Left = 507
            Top = 2
            Width = 6
            Style = tbsSeparator
          end
          object NavPrecios: THYMNavigator
            Left = 513
            Top = 2
            Width = 135
            Height = 21
            DataSource = DMClientes.DSQMPrecios
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
        object PNLPreciosProtocolo: TLFPanel
          Left = 0
          Top = 23
          Width = 993
          Height = 29
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LProtocolo: TLFLabel
            Left = 19
            Top = 8
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Protocolo'
          end
          object DBEFProtocolo: TLFDBEditFind2000
            Left = 67
            Top = 4
            Width = 54
            Height = 21
            DataField = 'PROTOCOLO'
            DataSource = DMClientes.DSQMClientes
            TabOrder = 0
            OnChange = DBEFProtocoloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PROTOCOLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROTOCOLO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROTOCOLO')
            Filtros = []
          end
          object EProtocolo: TLFEdit
            Left = 122
            Top = 4
            Width = 246
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
        end
        object PNLPrecios: TLFPanel
          Left = 0
          Top = 52
          Width = 993
          Height = 611
          Align = alClient
          TabOrder = 2
          object DBGPrecios: THYTDBGrid
            Left = 1
            Top = 1
            Width = 991
            Height = 609
            Align = alClient
            Color = clInfoBk
            DataSource = DMClientes.DSQMPrecios
            DefaultDrawing = False
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
            OnDrawColumnCell = DBGPreciosDrawColumnCell
            OnDblClick = DBGPreciosDblClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            PermutaPaneles = True
            CamposAMarcar.Strings = (
              'ACTIVO')
            CamposChecked.Strings = (
              '1')
            CamposNoChecked.Strings = (
              '0')
            CamposAOrdenar.Strings = (
              'ACTIVO'
              'AGRUPACION'
              'ALFA_1'
              'ALFA_2'
              'ALFA_3'
              'ALFA_4'
              'ALFA_5'
              'ALFA_6'
              'ALFA_7'
              'ALFA_8'
              'ALTA'
              'ARTICULO'
              'BAJA'
              'DESCUENTO'
              'DESCUENTO_2'
              'DESCUENTO_3'
              'FAMILIA'
              'LINEA'
              'MARGEN_PC'
              'MARGEN_PV'
              'P_COSTE'
              'PERFIL'
              'PRECIO'
              'RIG'
              'TIPO'
              'TITULO_ARTICULO'
              'TITULO_FAMILIA')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_ARTICULO'
                Width = 192
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FAMILIA'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_FAMILIA'
                Width = 142
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PERFIL'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AGRUPACION'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNID_MINIMAS'
                Width = 58
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNID_MAXIMAS'
                Width = 65
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_2'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESCUENTO_3'
                Width = 40
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEN_PV'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MARGEN_PC'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ACTIVO'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ALTA'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BAJA'
                Width = 80
                Visible = True
              end>
          end
        end
      end
      object TSDescuentos: TTabSheet [13]
        Caption = 'Desc.'
        ImageIndex = -1
        OnShow = TSDescuentosShow
        object TBDescuentosKri: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoDescuentos: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoDescuentosCliente: TLFDbedit
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
              TabOrder = 0
            end
            object DBEInfoDescuentosTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
              TabOrder = 1
            end
          end
          object TBSep13: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavDescuentosKri: THYMNavigator
            Left = 427
            Top = 0
            Width = 110
            Height = 22
            DataSource = DMClientes.DSQMDescuentosKri
            VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDescuentosKRI
            InsertaControl = DBGFDescuentosKRI
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGFDescuentosKRI: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 993
          Height = 641
          Align = alClient
          DataSource = DMClientes.DSQMDescuentosKri
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
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
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
              FieldName = 'DTO_CIAL'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 83
              Visible = True
            end>
        end
      end
      object TSIncidencias: TTabSheet [14]
        Caption = '&Incidencias'
        ImageIndex = 7
        OnHide = TSIncidenciasHide
        OnShow = TSIncidenciasShow
        object Splitter1: TSplitter
          Left = 0
          Top = 447
          Width = 918
          Height = 8
          Cursor = crVSplit
          Align = alBottom
        end
        object DBGIncidencias: THYTDBGrid
          Left = 0
          Top = 22
          Width = 918
          Height = 425
          Align = alClient
          Color = clInfoBk
          DataSource = DMClientes.DSxIncidencias
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
          CamposAMarcar.Strings = (
            'FINALIZADO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '2')
          CamposAOrdenar.Strings = (
            'AGENTE'
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
            'INCIDENCIA'
            'NOMBRE_USUARIO'
            'TIPO_INCIDENCIA_KRI'
            'TIT_AGENTE'
            'TIT_CONTACTO'
            'TIT_CONTACTO2'
            'TIT_CONTACTO3'
            'TIT_TIPO_INCIDENCIA_KRI'
            'TITULO_INCIDENCIA'
            'TITULO_TERCERO')
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
              Width = 425
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
          Width = 918
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLInfoIncidencias: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoIncidenciasTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
            object DBEInfoIncidenciasCliente: TLFDbedit
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
          object PNLDireccionClienteIncidencia: TLFPanel
            Left = 419
            Top = 0
            Width = 449
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LDireccionIncidencia: TLFLabel
              Left = 15
              Top = 4
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'Direcci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object EFDireccionIncidencia: TLFEditFind2000
              Left = 74
              Top = 0
              Width = 83
              Height = 21
              TabOrder = 0
              OnChange = EFDireccionIncidenciaChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              Campos_Desplegar.Strings = (
                'TITULO_LOCALIDAD')
              CampoNum = 'DIRECCION'
              CampoStr = 'DIR_COMPLETA'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_TERCEROS_DIRECCION_TODAS'
              Tabla_asociada.DesplegarBusqueda = False
              OnBusqueda = EFDireccionIncidenciaBusqueda
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = []
            end
            object EDireccionIncidencia: TLFEdit
              Left = 158
              Top = 0
              Width = 291
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
            end
          end
        end
        object DBMMDatosIncidencia: TLFDBMemo
          Left = 0
          Top = 455
          Width = 918
          Height = 100
          Align = alBottom
          BevelInner = bvNone
          Color = clInfoBk
          Constraints.MinHeight = 21
          DataField = 'DATOS_INCIDENCIA'
          DataSource = DMClientes.DSxIncidencias
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
      end
      object TSComunicaciones: TTabSheet [15]
        Caption = '&Comunic.'
        ImageIndex = -1
        OnHide = TSComunicacionesHide
        OnShow = TSComunicacionesShow
        object TBComunicaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 918
          Height = 24
          AutoSize = True
          EdgeBorders = [ebBottom]
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoComunicaciones: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoComunicacionesCliente: TLFDbedit
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
              ReadOnly = True
              TabOrder = 0
            end
            object DBEInfoComunicacionesTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
              ReadOnly = True
              TabOrder = 1
            end
          end
          object TBSep14: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavComunicaciones: THYMNavigator
            Left = 427
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMClientes.DSxComunicaciones
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
            Left = 627
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtEnviarComunicacionXMail: TToolButton
            Left = 635
            Top = 0
            Action = AEnviarComunicacionXMail
          end
          object TButtImportarArchivoComunicacion: TToolButton
            Left = 658
            Top = 0
            Action = AImportarArchivoComunicacion
          end
          object TButtPlantillaComunicacion: TToolButton
            Left = 681
            Top = 0
            Hint = 'Plantillas para nueva comunicaci'#243'n'
            Caption = 'Plantilla Comunicacion'
            DropdownMenu = PMPlantillasComunicaciones
            ImageIndex = 57
            Style = tbsDropDown
          end
          object LComunicacionesBusqueda: TLFLabel
            Left = 717
            Top = 0
            Width = 68
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
            OnClick = LNombCom_SocialClick
          end
          object EFComunicacionesBusqueda: TLFEditFind2000
            Left = 785
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
        object DBGComunicaciones: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 918
          Height = 531
          Align = alClient
          DataSource = DMClientes.DSxComunicaciones
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGCellClick
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
      end
      object TSConsumo: TTabSheet [16]
        Caption = 'Consumo'
        ImageIndex = 14
        OnShow = TSConsumoShow
        object PNLConsumo: TLFPanel
          Left = 0
          Top = 0
          Width = 993
          Height = 663
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBConsumo: TLFToolBar
            Left = 0
            Top = 0
            Width = 993
            Height = 24
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 0
            Separators = True
            object PNLInfoConsumo: TLFPanel
              Left = 0
              Top = 0
              Width = 419
              Height = 22
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 1
              object DBEInfoConsumoCliente: TLFDbedit
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
                TabOrder = 0
              end
              object DBEInfoConsumoTitulo: TLFDbedit
                Left = 67
                Top = 1
                Width = 350
                Height = 21
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
                TabOrder = 1
              end
            end
            object TBSep15: TToolButton
              Left = 419
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object NavConsumo: THYMNavigator
              Left = 427
              Top = 0
              Width = 240
              Height = 22
              DataSource = DMClientes.DSDetConsumo
              Flat = True
              ParentShowHint = False
              PopupMenu = CEConsumoPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGConsumo
              InsertaControl = DBGConsumo
              Exclusivo = True
              ControlEdit = CEConsumo
              OrdenAscendente = True
              InsertaUltimo = True
            end
          end
          object DBGConsumo: TDBGridFind2000
            Left = 0
            Top = 24
            Width = 993
            Height = 639
            Align = alClient
            DataSource = DMClientes.DSDetConsumo
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
              'AGRUPACION')
            CamposAMostrar.Strings = (
              'AGRUPACION'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CondicionBusqueda = 'TIPO='#39'T'#39
            MensajeNoExiste = False
            Numericos.Strings = (
              'AGRUPACION')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_AGRUPACIONES')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              '')
            Filtros = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AGRUPACION'
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DescAgrupacion'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CONSUMO'
                Visible = True
              end>
          end
        end
      end
      object TSAvisos: TTabSheet [17]
        Caption = 'Avisos'
        ImageIndex = 17
        OnShow = TSAvisosShow
        object TBAvisos: TLFToolBar
          Left = 0
          Top = 0
          Width = 993
          Height = 22
          AutoSize = True
          EdgeBorders = [ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoAvisos: TLFPanel
            Left = 0
            Top = 0
            Width = 419
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEInfoAvisosCliente: TLFDbedit
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
              TabOrder = 0
            end
            object DBEInfoAvisosTitulo: TLFDbedit
              Left = 67
              Top = 1
              Width = 350
              Height = 21
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
              TabOrder = 1
            end
          end
          object TBSep1: TToolButton
            Left = 419
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavAvisos: THYMNavigator
            Left = 427
            Top = 0
            Width = 87
            Height = 22
            DataSource = DMClientes.DSxAvisos
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEAvisosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMAvisoOFC
            InsertaControl = DBMAvisoOFC
            Exclusivo = True
            ControlEdit = CEAvisos
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLAvisos: TLFPanel
          Left = 0
          Top = 22
          Width = 993
          Height = 641
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          OnResize = PNLAvisosResize
          DesignSize = (
            993
            641)
          object DBCBAvisoActivoOFC: TLFDBCheckBox
            Left = 64
            Top = 7
            Width = 338
            Height = 17
            Caption = 'Activo en Ofertas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_OFC'
            DataSource = DMClientes.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoOFC: TLFDBMemo
            Left = 64
            Top = 24
            Width = 886
            Height = 89
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_OFC'
            DataSource = DMClientes.DSxAvisos
            TabOrder = 1
          end
          object DBCBAvisoActivoPEC: TLFDBCheckBox
            Left = 64
            Top = 127
            Width = 338
            Height = 17
            Caption = 'Activo en Pedidos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_PEC'
            DataSource = DMClientes.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoPEC: TLFDBMemo
            Left = 64
            Top = 144
            Width = 886
            Height = 89
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_PEC'
            DataSource = DMClientes.DSxAvisos
            TabOrder = 3
          end
          object DBCBAvisoActivoALB: TLFDBCheckBox
            Left = 64
            Top = 247
            Width = 338
            Height = 17
            Caption = 'Activo en Albaranes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_ALB'
            DataSource = DMClientes.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoALB: TLFDBMemo
            Left = 64
            Top = 264
            Width = 886
            Height = 89
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_ALB'
            DataSource = DMClientes.DSxAvisos
            TabOrder = 5
          end
          object DBCBAvisoActivoFAC: TLFDBCheckBox
            Left = 64
            Top = 367
            Width = 338
            Height = 17
            Caption = 'Activo en Facturas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO_FAC'
            DataSource = DMClientes.DSxAvisos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMAvisoFAC: TLFDBMemo
            Left = 64
            Top = 384
            Width = 886
            Height = 89
            Anchors = [akLeft, akTop, akRight]
            DataField = 'MENSAJE_FAC'
            DataSource = DMClientes.DSxAvisos
            TabOrder = 7
          end
        end
      end
      object TSRedesSociales: TTabSheet [18]
        Caption = 'Redes Sociales'
        ImageIndex = 19
        OnShow = TSRedesSocialesShow
        object PNLRedesSociales: TLFPanel
          Left = 0
          Top = 0
          Width = 993
          Height = 663
          Align = alClient
          TabOrder = 0
          object TBRedesSociales: TLFToolBar
            Left = 1
            Top = 1
            Width = 991
            Height = 29
            TabOrder = 0
            Separators = True
            object PNLInfoRedesSociales: TLFPanel
              Left = 0
              Top = 2
              Width = 419
              Height = 22
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 1
              object DBEclienteRedesSociales: TLFDbedit
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
                TabOrder = 0
              end
              object DBETituloRedesSociales: TLFDbedit
                Left = 67
                Top = 1
                Width = 350
                Height = 21
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
                TabOrder = 1
              end
            end
            object TBSep16: TToolButton
              Left = 419
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object NavRedesSociales: THYMNavigator
              Left = 427
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMClientes.DSQMRedesSociales
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGRedesSociales
              InsertaControl = DBGRedesSociales
              Exclusivo = True
              ControlEdit = CERedesSociales
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGRedesSociales: TDBGridFind2000
            Left = 1
            Top = 30
            Width = 991
            Height = 632
            Align = alClient
            DataSource = DMClientes.DSQMRedesSociales
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGRedesSocialesCellClick
            OnDrawColumnCell = DBGRedesSocialesDrawColumnCell
            OnDblClick = DBGRedesSocialesDblClick
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
              'ID_RED_SOCIAL')
            CamposAMostrar.Strings = (
              'ID_RED_SOCIAL'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              'ID_RED_SOCIAL')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'ID_RED_SOCIAL')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_REDES_SOCIALES')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'NOMBRE')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ID_RED_SOCIAL')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_RED_SOCIAL'
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HANDLE'
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'URL'
                ReadOnly = True
                Width = 500
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 993
          Height = 663
          DataSource = DMClientes.DSQMClientes
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'ALBARAN_DIRECCION_ENVIO'
            'ALBARAN_VALORADO'
            'ALBARANAR_SERIE'
            'APLICAR_PTO_VERDE'
            'BAJA'
            'BLOQUEO'
            'CLIENTE_POTENCIAL'
            'CREDITO_Y_CAUCION'
            'DIR_DEFECTO_VENTAS'
            'EVAL_FEB'
            'EVAL_FEB_SI'
            'EXPORTAR'
            'FACTURA_DIRECCION_ADMTVA'
            'FACTURAR_AGENTE'
            'FACTURAR_ALMACEN'
            'FACTURAR_DIRECCION'
            'FACTURAR_REFERENCIA'
            'FACTURAR_SERIE'
            'FACTURAR_TARIFA'
            'FACTURAR_TRANSPORTISTA'
            'FACTURAS_POR_EMAIL_KRI'
            'FINANCIACION'
            'INTRA'
            'MOROSO'
            'NO_AGRUPAR_ALBARANES'
            'NO_AGRUPAR_PED_KRI'
            'NO_ALB_FAC'
            'NO_CALC_DESC_KRI'
            'NO_VENTA_RIESGO'
            'PEDIDO_VALORADO'
            'PORTES'
            'RECC'
            'SEPARAR_DTO_CIAL'
            'SIN_DESCUENTOS'
            'USAR_ANTICIPOS'
            'UTILIZA_F_PAGO_ALTERNATIVA')
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
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'AGENTE'
            'ALFA_1'
            'ALFA_2'
            'ALFA_3'
            'ALFA_4'
            'ALFA_5'
            'ALFA_6'
            'ALFA_7'
            'ALFA_8'
            'BAJA'
            'BLOQUEO'
            'CATEGORIA'
            'CLIENTE'
            'CLIENTE_PADRE'
            'COD_CREDITO_Y_CAUCION'
            'CODIGO_INCOTERM'
            'CODIGO_POSTAL'
            'CREDITO_Y_CAUCION'
            'CUENTA'
            'CUENTA_COMPRA'
            'CUENTA_DTOCIAL'
            'CUENTA_DTOPP'
            'CUENTA_IRPF'
            'CUENTA_VENTA'
            'DESCUENTO_CIAL'
            'DESCUENTO_PP'
            'DIA_PAGO_1'
            'DIA_PAGO_2'
            'DIA_PAGO_3'
            'DIA_SEMANA_PAGO'
            'DTO_CIAL_LINEA'
            'DTO_CIAL_LINEA_2'
            'DTO_CIAL_LINEA_3'
            'EXPORTAR'
            'FECHA_ALTA'
            'FECHA_BAJA'
            'FECHA_ENTREGA_X_STOCK'
            'FORMA_PAGO'
            'GRUPO_CUENTAS'
            'IDIOMA'
            'INTRA_TRANS'
            'MODO_IVA'
            'MONEDA'
            'MOROSO'
            'NIF'
            'NOMBRE_COMERCIAL'
            'NRO_EMPLEADOS'
            'PERFIL'
            'PERIODO_FACTURACION'
            'POR_FINANCIACION'
            'POR_PORTES'
            'PORTES'
            'PROTOCOLO'
            'RECC'
            'RIESGO_ACT'
            'RIESGO_ALB'
            'RIESGO_AUT'
            'RIESGO_CAR'
            'RIESGO_CYC'
            'RIESGO_EMP'
            'RIESGO_FAC'
            'RIESGO_FACTOR'
            'RIESGO_REM'
            'RUTA'
            'RUTA_ORDEN'
            'SIN_DESCUENTOS'
            'SU_PROVEEDOR'
            'SU_REFERENCIA'
            'TARIFA'
            'TELEFAX'
            'TELEFONO'
            'TELEFONO02'
            'TERCERO'
            'TIPO'
            'TIPO_CLIENTE'
            'TIPO_DOC_IDENT'
            'TIPO_DST_PEC'
            'TIPO_IRPF'
            'TIPO_NCF'
            'TIPO_PORTES'
            'TIT_LOCALIDAD'
            'TITULO'
            'TRANSPORTISTA'
            'ZONA')
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
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 175
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 721
    Width = 1005
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    DataSource = DMClientes.DSQMClientes
    EnlazadoA = CENotas
    Left = 6
    Top = 74
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 36
    Top = 74
    inherited CEMainMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 16460
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 16499
    end
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
      Action = ATercero
    end
    object MIVerDatosAgente: TMenuItem
      Action = AAAgente
    end
  end
  inherited ALMain: TLFActionList
    Left = 536
    Top = 8
    object AEtiquetasCliente: TAction
      Category = 'Listados'
      Caption = 'Etiquetas de Clientes'
      Hint = 'Mantenimiento de Etiquetas de Clientes'
      ImageIndex = 95
      OnExecute = AEtiquetasClienteExecute
    end
    object AVentaArticulosCli: TAction
      Category = 'Otros'
      Caption = 'Ventas de Art'#237'culos al Cliente'
      Hint = 'Ventas de Art'#237'culos al Cliente'
      ImageIndex = 109
      OnExecute = AVentaArticulosCliExecute
    end
    object AActualizaVacaciones: TAction
      Category = 'Especiales'
      Caption = 'Actualiza Vacaciones a este Ejercicio de todos los Clientes'
      Hint = 'Actualiza Vacaciones a este Ejercicio de todos los Clientes'
      ImageIndex = 26
      OnExecute = AActualizaVacacionesExecute
    end
    object AActualizarRiesgos: TAction
      Category = 'Especiales'
      Caption = 'Actualiza el riesgo de todos los Clientes de la Empresa actual'
      Hint = 'Actualiza el riesgo de todos los Clientes de la Empresa actual'
      ImageIndex = 39
      OnExecute = AActualizarRiesgosExecute
    end
    object AOfertasClienteTodas: TAction
      Category = 'Documentos;Ofertas'
      Caption = 'Todas'
      ImageIndex = 72
      OnExecute = AOfertasClienteExecute
    end
    object AFiltradoAgrup: TAction
      Category = 'Procesos'
      Caption = 'Filtrado de Clientes por Agrupaci'#243'n'
      Hint = 'Filtrado de Clientes por Agrupaci'#243'n'
      ImageIndex = 5
      OnExecute = AFiltradoAgrupExecute
    end
    object AAdjuntosCliente: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Cliente'
      Hint = 'Visualiza los adjuntos del cliente'
      ImageIndex = 59
      OnExecute = AAdjuntosClienteExecute
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AActualizaRiesgoCliente: TAction
      Category = 'Especiales'
      Caption = 'Actualiza el riesgo del Cliente actual'
      Hint = 'Actualiza el riesgo del Cliente actual'
      ImageIndex = 3
      OnExecute = AActualizaRiesgoClienteExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Especiales'
      Caption = 'Especiales'
      ImageIndex = 58
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
      ImageIndex = 14
      OnExecute = AEtiquetasFiltradosExecute
    end
    object ASep2: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object ALstConsumo: TAction
      Category = 'Listados'
      Caption = 'Listado Consumo'
      ImageIndex = 14
      OnExecute = ALstConsumoExecute
    end
    object AListadoCuotas: TAction
      Category = 'Listados'
      Caption = 'Listado de Cuotas'
      ImageIndex = 14
      OnExecute = AListadoCuotasExecute
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
    object ACopiaConfEnNuevoCliente: TAction
      Category = 'Procesos'
      Caption = 'Copia configuraci'#243'n de otro cliente'
      Hint = 
        'Copia configuraci'#243'n de otro cliente (Datos Facturaci'#243' y algunos ' +
        'otros par'#225'metros)'
      ImageIndex = 37
      OnExecute = ACopiaConfEnNuevoClienteExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AClienteCuota: TAction
      Category = 'Otros'
      Caption = 'Cuotas al cliente'
      Hint = 'Cuotas al cliente'
      ImageIndex = 42
      OnExecute = AClienteCuotaExecute
    end
    object AIncidencias: TAction
      Category = 'Otros'
      Caption = 'Incidencias'
      Hint = 'Incidencias '
      ImageIndex = 6
      OnExecute = AIncidenciasExecute
    end
    object APedidosClienteTodas: TAction
      Category = 'Documentos;Pedidos'
      Caption = 'Todas'
      ImageIndex = 62
      OnExecute = APedidosClienteExecute
    end
    object AAlbaranesClienteTodas: TAction
      Category = 'Documentos;Albaranes'
      Caption = 'Todas'
      ImageIndex = 60
      OnExecute = AAlbaranesClienteExecute
    end
    object AFacturasClienteTodas: TAction
      Category = 'Documentos;Facturas'
      Caption = 'Todas'
      ImageIndex = 61
      OnExecute = AFacturasClienteExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      Hint = 'Visualiza los adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AAdjuntosAgente: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Agente'
      Hint = 'Visualiza los adjuntos del Agente'
      ImageIndex = 59
      OnExecute = AAdjuntosAgenteExecute
    end
    object AAdjuntosTransportista: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Transportista'
      ImageIndex = 59
      OnExecute = AAdjuntosTransportistaExecute
    end
    object AContLstConsum: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Consumo'
      ImageIndex = 77
      OnExecute = AContLstConsumExecute
    end
    object AConfListadoCuotas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Cuotas'
      Hint = 'Listado de Cuotas'
      ImageIndex = 77
      OnExecute = AConfListadoCuotasExecute
    end
    object AImprimirNotas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Notas'
      Hint = 'Imprimir Notas'
      ImageIndex = 14
      OnExecute = AImprimirNotasExecute
    end
    object AClientesFac: TAction
      Category = 'Otros'
      Caption = 'Clientes con factura mas reciente'
      ImageIndex = 61
      OnExecute = AClientesFacExecute
    end
    object ExportarClientesFiltrados: TAction
      Category = 'Otros'
      Caption = 'Exportar Clientes Filtrados'
      Hint = 'Exportar Clientes Filtrados'
      ImageIndex = 36
      OnExecute = ExportarClientesFiltradosExecute
    end
    object AExportarDirCliFiltrados: TAction
      Category = 'Otros'
      Caption = 'Exportar Dir. Clientes Filtrados'
      Hint = 'Exportar Dir. Clientes Filtrados'
      ImageIndex = 36
      OnExecute = AExportarDirCliFiltradosExecute
    end
    object ADocumentos: TAction
      Category = 'Otros'
      Caption = 'Documentos de Cliente'
      Hint = 'Documentos asociados al cliente'
      ImageIndex = 87
      OnExecute = ADocumentosExecute
    end
    object AOfertasClienteActivas: TAction
      Tag = 1
      Category = 'Documentos;Ofertas'
      Caption = 'Activas'
      ImageIndex = 72
      OnExecute = AOfertasClienteExecute
    end
    object AOfertasClienteCerradas: TAction
      Tag = 2
      Category = 'Documentos;Ofertas'
      Caption = 'Cerradas'
      ImageIndex = 72
      OnExecute = AOfertasClienteExecute
    end
    object LFCategoryAction7: TLFCategoryAction
      Category = 'Documentos;Ofertas'
      Caption = 'Filtra Ofertas'
      ImageIndex = 72
    end
    object APedidosClienteAbiertas: TAction
      Tag = 1
      Category = 'Documentos;Pedidos'
      Caption = 'Activas'
      ImageIndex = 62
      OnExecute = APedidosClienteExecute
    end
    object APedidosClienteCerradas: TAction
      Tag = 2
      Category = 'Documentos;Pedidos'
      Caption = 'Cerradas'
      ImageIndex = 62
      OnExecute = APedidosClienteExecute
    end
    object LFCategoryAction8: TLFCategoryAction
      Category = 'Documentos;Pedidos'
      Caption = 'Filtra pedidos'
      ImageIndex = 62
    end
    object AAlbaranessClienteAbiertas: TAction
      Tag = 1
      Category = 'Documentos;Albaranes'
      Caption = 'Abiertas'
      ImageIndex = 60
      OnExecute = AAlbaranesClienteExecute
    end
    object AAlbaranessClienteCerradas: TAction
      Tag = 2
      Category = 'Documentos;Albaranes'
      Caption = 'Cerradas'
      ImageIndex = 60
      OnExecute = AAlbaranesClienteExecute
    end
    object LFCategoryAction9: TLFCategoryAction
      Category = 'Documentos;Albaranes'
      Caption = 'Filtra Albaranes'
      ImageIndex = 60
    end
    object AFacturasClienteAbiertas: TAction
      Tag = 1
      Category = 'Documentos;Facturas'
      Caption = 'Abiertas'
      ImageIndex = 61
      OnExecute = AFacturasClienteExecute
    end
    object AFacturasClienteCerradas: TAction
      Tag = 2
      Category = 'Documentos;Facturas'
      Caption = 'Cerradas'
      ImageIndex = 61
      OnExecute = AFacturasClienteExecute
    end
    object LFCategoryAction10: TLFCategoryAction
      Category = 'Documentos;Facturas'
      Caption = 'Filtra Facturas'
      ImageIndex = 61
    end
    object LFCategoryAction11: TLFCategoryAction
      Category = 'Documentos'
      Caption = 'Documentos'
      ImageIndex = 87
    end
    object AVisualizarCartaLOPD: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Visualizar Carta LOPD'
      Hint = 'Visualizar Carta LOPD'
      ImageIndex = 125
      OnExecute = AVisualizarCartaLOPDExecute
    end
    object AImprimirCartaLOPD: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Imprimir Carta LOPD'
      Hint = 'Imprimir Carta LOPD'
      ImageIndex = 14
      OnExecute = AImprimirCartaLOPDExecute
    end
    object AEnviarEmailCartaLOPD: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Enviar Email Carta LOPD (Directo)'
      Hint = 'Enviar Email Carta LOPD (Directo)'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaLOPDExecute
    end
    object AEnviarEmailCartaLOPD2: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Enviar Email Carta LOPD (Mensaje)'
      Hint = 'Enviar Email Carta LOPD (Mensaje)'
      ImageIndex = 34
      OnExecute = AEnviarEmailCartaLOPD2Execute
    end
    object APedirFirma: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Pedir Firma LOPD'
      Hint = 'Pedir Firma'
      ImageIndex = 124
      OnExecute = APedirFirmaExecute
    end
    object ABorrarFirma: TAction
      Category = 'Listados;"LOPD"'
      Caption = 'Borrar Firma LOPD'
      Hint = 'Borrar Firma'
      ImageIndex = 124
      OnExecute = ABorrarFirmaExecute
    end
    object LFCategoryAction12: TLFCategoryAction
      Category = 'Listados;"LOPD"'
      Caption = 'LOPD'
      ImageIndex = 125
    end
    object AListConfigCartaLOPD: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuracion Carta LOPD'
      Hint = 'Configuracion Carta LOPD'
      ImageIndex = 77
      OnExecute = AListConfigCartaLOPDExecute
    end
    object LFCategoryAction13: TLFCategoryAction
      Category = 'Listados;"Circularizacion"'
      Caption = 'Circularizacion'
      ImageIndex = 125
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
    object AConfigCircularizacion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuracion Circularizacion'
      Hint = 'Configuracion Circularizacion'
      ImageIndex = 77
      OnExecute = AConfigCircularizacionExecute
    end
    object AAccesoDirecto: TAction
      Category = 'Otros'
      Caption = 'Crear Acceso Directo'
      ImageIndex = 102
      OnExecute = AAccesoDirectoExecute
    end
    object ACreaContactoCRM: TAction
      Category = 'Otros'
      Caption = 'Crea Contacto CRM'
      Hint = 'Crea Contacto CRM asociado a este cliente'
      ImageIndex = 54
      OnExecute = ACreaContactoCRMExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DEFechaVentasDesde.Text'
      'DEFechaVentasHasta.Text'
      'CBCalculaMargenVenta.Checked')
    Left = 586
    Top = 26
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
    Left = 6
    Top = 103
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 103
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
    Left = 712
    Top = 6
  end
  object CEAgrupaciones: TControlEdit
    EnlazadoA = CEAgrupacionesDisp
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 132
  end
  object CEAgrupacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 132
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
  object CEVacaciones: TControlEdit
    EnlazadoA = CEFiltros
    FichaEdicion = TSVacaciones
    FichaExclusiva = TSVacaciones
    PanelEdicion = PNVacaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEVacacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 191
  end
  object CEVacacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 191
    object CEVacacionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEVacacionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEVacacionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEVacacionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEVacacionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEVacacionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEVacacionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEVacacionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEVacacionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEVacacionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object ALClientes: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 647
    Top = 11
    object ANewAgente: TAction
      Caption = 'Agente nuevo'
      OnExecute = ANewAgenteExecute
    end
    object ANewTercero: TAction
      Caption = 'Tercero nuevo'
      OnExecute = ANewTerceroExecute
    end
    object AAAgente: TAction
      Caption = 'Ver Datos Agente'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
      ShortCut = 49217
      OnExecute = AAAgenteExecute
    end
    object ATercero: TAction
      Caption = 'Ver Datos Tercero'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Tercero'
      ShortCut = 49236
      OnExecute = ATerceroExecute
    end
    object AMuestraImpagados: TAction
      Caption = 'Muestra Impagados'
      OnExecute = AMuestraImpagadosExecute
    end
    object ARecibosPendCob: TAction
      Caption = 'Muestra Recibos'
      OnExecute = ARecibosPendCobExecute
    end
    object APedPend: TAction
      Caption = 'Pedidos de Clientes'
      OnExecute = APedPendExecute
    end
    object AAlbPend: TAction
      Caption = 'Albaranes Pendientes'
      OnExecute = AAlbPendExecute
    end
    object AFacPend: TAction
      Caption = 'Facturas Pendientes'
      OnExecute = AFacPendExecute
    end
    object AFacCob: TAction
      Caption = 'Facturas Cobradas'
      OnExecute = AFacCobExecute
    end
    object ACalculaEstadisticas: TAction
      Caption = 'Calcular Estad'#237'sticas'
      OnExecute = ACalculaEstadisticasExecute
    end
    object AMultiSeleccion: TAction
      Caption = 'MultiSelecci'#243'n de Canales'
      ImageIndex = 132
      OnExecute = AMultiSeleccionExecute
    end
    object ARecibosPendRec: TAction
      OnExecute = ARecibosPendRecExecute
    end
    object AEnviarComunicacionXMail: TAction
      Caption = 'Enviar Comunicacion por mail'
      Hint = 'Envia Comunicacion por e-mail'
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
  object CEAgrupacionesDisp: TControlEdit
    EnlazadoA = CEVacaciones
    FichaEdicion = TSAgrupaciones
    FichaExclusiva = TSAgrupaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEAgrupacionesDispPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 162
  end
  object CEAgrupacionesDispPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 162
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
  object CEFiltros: TControlEdit
    EnlazadoA = CECentrosAdministrativos
    FichaEdicion = TSFiltros
    FichaExclusiva = TSFiltros
    PanelEdicion = PFiltro_Fac
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEFiltrosPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 221
  end
  object CEFiltrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 221
    object CEFiltrosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEFiltrosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEFiltrosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEFiltrosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEFiltrosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEFiltrosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEFiltrosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFiltrosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFiltrosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFiltrosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CERiesgos: TControlEdit
    EnlazadoA = CEInfoComrecial
    FichaEdicion = TSRiesgos
    FichaExclusiva = TSRiesgos
    PanelEdicion = PNLRiesgos
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CERiesgosPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 250
  end
  object CERiesgosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 250
    object CERiesgosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CERiesgosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CERiesgosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CERiesgosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CERiesgosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CERiesgosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CERiesgosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CERiesgosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CERiesgosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CERiesgosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEInfoComrecial: TControlEdit
    EnlazadoA = CEPreciosProtocolo
    FichaEdicion = TSInfoComercial
    FichaExclusiva = TSInfoComercial
    PanelEdicion = PNLInfoComercial
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEInfoComrecialPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 279
  end
  object CEInfoComrecialPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 279
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
  object CEComunicaciones: TControlEdit
    EnlazadoA = CEMain
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEComunicacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 309
  end
  object CEComunicacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 36
    Top = 309
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
    Left = 36
    Top = 400
  end
  object CEPreciosProtocolo: TControlEdit
    EnlazadoA = CEComunicaciones
    PanelEdicion = PNLPreciosProtocolo
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEPreciosProtocoloPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 338
  end
  object CEPreciosProtocoloPMEdit: TPopUpTeclas
    Left = 36
    Top = 338
    object CEPreciosProtocoloMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEPreciosProtocoloMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEPreciosProtocoloMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEPreciosProtocoloMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEPreciosProtocoloMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEPreciosProtocoloMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEPreciosProtocoloMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPreciosProtocoloMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPreciosProtocoloMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPreciosProtocoloMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CECentrosAdministrativos: TControlEdit
    EnlazadoA = CETipoGiros
    Complementario = TBMain
    SubComplementario = CEFiltros
    PopUpMenu = CECentrosAdministrativosPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 368
  end
  object CECentrosAdministrativosPMEdit: TPopUpTeclas
    Left = 36
    Top = 368
    object CECentrosAdministrativosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECentrosAdministrativosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECentrosAdministrativosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECentrosAdministrativosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECentrosAdministrativosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECentrosAdministrativosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECentrosAdministrativosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECentrosAdministrativosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECentrosAdministrativosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECentrosAdministrativosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CETipoGiros: TControlEdit
    EnlazadoA = CECentrosAdministrativos
    Complementario = TBMain
    PopUpMenu = CETipoGirosPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 431
  end
  object CETipoGirosPMEdit: TPopUpTeclas
    Left = 36
    Top = 431
  end
  object CEAvisos: TControlEdit
    PanelEdicion = PNLAvisos
    Complementario = TBMain
    PopUpMenu = CEAvisosPMEdit
    Teclas = DMMain.Teclas
    Left = 6
    Top = 462
  end
  object CEAvisosPMEdit: TPopUpTeclas
    Left = 36
    Top = 462
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
      Visible = False
    end
  end
  object CEArticulos: TControlEdit
    DataSource = DMClientes.DSQMCliArt
    PanelEdicion = PNLArticulos
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
      Action = ATercero
    end
    object MenuItem24: TMenuItem
      Action = AAAgente
    end
  end
  object CEConsumo: TControlEdit
    DataSource = DMClientes.DSDetConsumo
    EnlazadoA = CEMain
    FichaEdicion = TSConsumo
    PopUpMenu = CEConsumoPMEdit
    Teclas = DMMain.Teclas
    Left = 272
    Top = 256
  end
  object CEConsumoPMEdit: TPopUpTeclas
    Left = 304
    Top = 256
    object CEConsumoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEConsumoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEConsumoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEConsumoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEConsumoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEConsumoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEConsumoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEConsumoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEConsumoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEConsumoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CERedesSocialesPMEdit: TPopUpTeclas
    Left = 304
    Top = 296
  end
  object CERedesSociales: TControlEdit
    DataSource = DMClientes.DSQMRedesSociales
    EnlazadoA = CEMain
    FichaEdicion = TSRedesSociales
    Left = 272
    Top = 296
  end
  object TPopUpTeclas
  end
end
