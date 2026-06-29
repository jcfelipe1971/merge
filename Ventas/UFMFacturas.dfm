inherited FMFacturas: TFMFacturas
  Left = 366
  Top = 165
  Width = 1294
  Height = 641
  HelpContext = 201
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturas a Clientes'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = CEProveedoresPMEdit
  Position = poDefault
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1284
    Height = 280
    BorderWidth = 3
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 1278
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        1274
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMFacturas.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        DelMessage = #191'Desea borrar la factura? '
        EditaControl = EFCliente
        InsertaControl = EFCliente
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMFacturas.DSQMCabecera
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TBSep1: TToolButton
        Left = 319
        Top = 0
        Width = 8
        ImageIndex = 48
        Style = tbsSeparator
      end
      object TBLocalizaFolio: TToolButton
        Left = 327
        Top = 0
        Action = ALocalizaFolio
      end
      object TSepBuscaFolio: TToolButton
        Left = 350
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimeFactura: TToolButton
        Left = 358
        Top = 0
        Action = AInformeFactura
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscaNIFKRI: TToolButton
        Left = 381
        Top = 0
        Action = ABuscaNIFKRI
      end
      object EFBuscaNIFKRI: TLFEditFind2000
        Left = 404
        Top = 0
        Width = 8
        Height = 22
        TabOrder = 3
        Visible = False
        OnChange = EFBuscaNIFKRIChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'EJERCICIO'
          'NIF'
          'TELEFONO01')
        CampoADevolver = 'ID_S'
        CampoNum = 'NOMBRE'
        CampoStr = 'RIG'
        CondicionBusqueda = 'TIPO='#39'FAC'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_S_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NOMBRE, EJERCICIO DESC, RIG')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMFacturas.EntornoDoc
      end
      object ToolButton3: TToolButton
        Left = 412
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBCambiarNombre: TToolButton
        Left = 420
        Top = 0
        Action = ACambiarNombre
        ParentShowHint = False
        ShowHint = True
      end
      object PNLTitSerie: TLFPanel
        Left = 443
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 11
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object ETitSerie: TLFEdit
          Left = 110
          Top = 0
          Width = 160
          Height = 21
          TabStop = False
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
          TabOrder = 0
        end
        object EFSerie: TLFEditFind2000
          Left = 39
          Top = 0
          Width = 70
          Height = 21
          TabStop = False
          TabOrder = 1
          OnChange = EFSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object TButtAbreCierra: TToolButton
        Left = 718
        Top = 0
        Action = AAbrirCerrar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscarNumSerie: TToolButton
        Left = 741
        Top = 0
        Action = ABuscarNumSerie
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object TButtTraspaso: TToolButton
        Left = 764
        Top = 0
        Hint = 'Traspaso de documentos'
        Caption = 'Traspaso'
        DropdownMenu = PMTraspaso
        ImageIndex = 86
        Style = tbsDropDown
      end
      object TBEnvioDTE: TToolButton
        Left = 800
        Top = 0
        Action = AEnviaDTECL
        ImageIndex = 46
      end
      object TBEnvioTBAI: TToolButton
        Left = 823
        Top = 0
        Action = AEnvioTBAI
      end
      object LTelefono: TLFLabel
        Left = 846
        Top = 0
        Width = 120
        Height = 22
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'Tel'#233'fono'
        Constraints.MinWidth = 120
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        OnClick = LTelefonoClick
      end
      object PNLRiesgo: TLFPanel
        Left = 966
        Top = 0
        Width = 112
        Height = 22
        BevelOuter = bvNone
        TabOrder = 4
        object LRiesgoAct: TDBText
          Left = 36
          Top = 0
          Width = 76
          Height = 22
          Align = alClient
          DataField = 'RIESGO_DISPONIBLE'
          DataSource = DMFacturas.DSxInfoActualizada
          ParentShowHint = False
          ShowHint = True
        end
        object LRiesgo: TLabel
          Left = 0
          Top = 0
          Width = 36
          Height = 22
          Align = alLeft
          Alignment = taRightJustify
          Caption = 'Riesgo:'
          ParentShowHint = False
          ShowHint = True
        end
      end
      object LNotas: TLFLabel
        Left = 1078
        Top = 0
        Width = 60
        Height = 22
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'Notas'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        Visible = False
        OnClick = LNotasClick
      end
      object LAdjuntos: TLFLabel
        Left = 1138
        Top = 0
        Width = 60
        Height = 22
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'Adjuntos'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
      object LEmail: TLFLabel
        Left = 1198
        Top = 0
        Width = 60
        Height = 22
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'E-mail'
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Left = 3
      Top = 29
      Width = 1278
      Height = 248
      ActivePage = TSProveedores
      TabIndex = 8
      TabOrder = 0
      inherited TSFicha: TTabSheet
        object SBVerRegistro: TSpeedButton [0]
          Left = 460
          Top = 24
          Width = 66
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
          GroupIndex = -1
          OnDblClick = SBVerRegistroDblClick
        end
        object SBVerAsientos: TSpeedButton [1]
          Left = 689
          Top = 24
          Width = 85
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          OnDblClick = SBVerAsientosDblClick
        end
        object SBACliente: TSpeedButton [2]
          Left = 122
          Top = 24
          Width = 160
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        object SBAAgente: TSpeedButton [3]
          Left = 122
          Top = 86
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAAgenteDblClick
        end
        object SBVerCartera: TSpeedButton [4]
          Left = 576
          Top = 24
          Width = 65
          Height = 17
          Hint = 'Doble click para ver el asiento generado'
          GroupIndex = -1
          Down = True
          OnDblClick = SBVerCarteraDblClick
        end
        object SBATercero: TSpeedButton [5]
          Left = 79
          Top = 175
          Width = 305
          Height = 22
          GroupIndex = -1
          OnDblClick = ATerceroExecute
        end
        inherited PEdit: TLFPanel
          Width = 1270
          Height = 220
          TabOrder = 1
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'SU_REFERENCIA'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMFacturas.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_FACTURA'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMFacturas.EntornoDoc
            OrdenadoPor.Strings = (
              'RIG')
          end
        end
        object PEdCabecera: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 220
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          DesignSize = (
            1270
            220)
          object LFactura: TLFLabel
            Left = 37
            Top = 2
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factura'
            FocusControl = DBERIG
          end
          object LEstado: TLFLabel
            Left = 148
            Top = 2
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LFecha: TLFLabel
            Left = 422
            Top = 3
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LReferencia: TLFLabel
            Left = 400
            Top = 46
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
            FocusControl = DBESuReferencia
          end
          object LCliente: TLFLabel
            Left = 41
            Top = 24
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LDireccion: TLFLabel
            Left = 28
            Top = 46
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LAgente: TLFLabel
            Left = 39
            Top = 90
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LTransportista: TLFLabel
            Left = 391
            Top = 90
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object LDtoPP: TLFLabel
            Left = 534
            Top = 25
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
          end
          object LDescuentoComercial: TLFLabel
            Left = 410
            Top = 24
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
          end
          object LAlmacen: TLFLabel
            Left = 32
            Top = 156
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LFormaPago: TLFLabel
            Left = 16
            Top = 112
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LNumeroAsiento: TLFLabel
            Left = 659
            Top = 179
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LblRegistroIVA: TLFLabel
            Left = 393
            Top = 179
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registro IVA'
          end
          object LTarifa: TLFLabel
            Left = 46
            Top = 134
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LFechaEntrega: TLFLabel
            Left = 625
            Top = 2
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'F.Entrega'
          end
          object LBPortes: TLFLabel
            Left = 422
            Top = 112
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object LBRango: TLFLabel
            Left = 420
            Top = 134
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rango'
          end
          object LBIndice: TLFLabel
            Left = 601
            Top = 134
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = #205'ndice'
          end
          object LContacto: TLFLabel
            Left = 30
            Top = 68
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LNCF: TLFLabel
            Left = 809
            Top = 156
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'NCF'
          end
          object LblCartera: TLFLabel
            Left = 532
            Top = 179
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cartera'
          end
          object LMonedaFicha: TLFLabel
            Left = 654
            Top = 24
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object DBTValorCambioFijo: TDBText
            Left = 765
            Top = 24
            Width = 64
            Height = 17
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMFacturas.DSQMCabecera
          end
          object LAutorizacion: TLabel
            Left = 772
            Top = 68
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizacion'
          end
          object LCodigoControl: TLabel
            Left = 772
            Top = 90
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Control'
          end
          object LNombreComercial: TLFLabel
            Left = 13
            Top = 179
            Width = 60
            Height = 13
            Caption = 'N. Comercial'
          end
          object DBTRectificacion: TDBText
            Left = 1206
            Top = 0
            Width = 101
            Height = 13
            AutoSize = True
            DataField = 'DESC_RECTIFICACION'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LFechaCon: TLFLabel
            Left = 776
            Top = 2
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cont'
          end
          object LTicketBAI: TLFLabel
            Left = 429
            Top = 157
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'TBAI'
            FocusControl = DBETicketBAI
          end
          object LPedidoCli: TLFLabel
            Left = 396
            Top = 68
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Pedido'
            FocusControl = DBEPedidoCli
          end
          object LObservaciones: TLFLabel
            Left = 4
            Top = 200
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones'
            FocusControl = DBEObservaciones
          end
          object LTipoIngresos: TLFLabel
            Left = 769
            Top = 178
            Width = 64
            Height = 13
            Caption = 'Tipo Ingresos'
          end
          object DBERIG: TLFDbedit
            Left = 79
            Top = 0
            Width = 64
            Height = 21
            DataField = 'RIG'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 0
            OnChange = DBERIGChange
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 458
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMFacturas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 19
            Weekends = [Sun, Sat]
            OnExit = DBDTPFechaExit
          end
          object DBESuReferencia: TLFDbedit
            Left = 458
            Top = 44
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'SU_REFERENCIA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 25
          end
          object EFCliente: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'CLIENTE'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 3
            OnChange = EFClienteChange
            Accion = ANewCliente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE_COMERCIAL'
              'TELEFONOS'
              'NIF'
              'LOCALIDAD')
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnExiste = EFClienteExiste
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMFacturas.EntornoDoc
          end
          object DBETituloCliente: TLFDbedit
            Left = 144
            Top = 22
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            OnDblClick = SBAClienteDblClick
            OnEnter = DBETituloClienteEnter
          end
          object EFDireccion: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES                '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'COD_POSTAL'
              'LOCALIDAD'
              'DIR_NOMBRE_3'
              'CLASE')
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLASE DESC, DIRECCION')
            Filtros = [obTercero]
            Entorno = DMFacturas.EntornoDoc
          end
          object DBETituloDireccion: TLFDbedit
            Left = 144
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSxDirecciones
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
          object EFAgente: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'AGENTE'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 9
            OnChange = EFAgenteChange
            Accion = ANewAgente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMFacturas.EntornoDoc
          end
          object ETituloAgente: TLFEdit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
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
          object EFTransportista: TLFDBEditFind2000
            Left = 458
            Top = 88
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TRANSPORTISTA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 27
            OnChange = EFTransportistaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS             '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMFacturas.EntornoDoc
          end
          object ETituloTransportistaFac: TLFEdit
            Left = 523
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 28
          end
          object DBEDtoPP: TLFDbedit
            Left = 578
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'DTO_PP'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 23
          end
          object DBEDtoCial: TLFDbedit
            Left = 458
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'DTO_CIAL'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 22
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 154
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 15
            OnChange = DBEFAlmacenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMFacturas.EntornoDoc
          end
          object ETituloAlmacen: TLFEdit
            Left = 144
            Top = 154
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 16
          end
          object DBCBForzarVencimientos: TLFDBCheckBox
            Left = 926
            Top = 21
            Width = 80
            Height = 17
            Caption = '&Forzar Venc.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 46
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FUERZA_VENCIMIENTOS'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'FORMA_PAGO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 11
            OnChange = DBEFFormaPagoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS_GES_FP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA_PAGO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ACTIVO=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'FORMA_PAGO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMFacturas.EntornoDoc
          end
          object ETituloFormaPago: TLFEdit
            Left = 144
            Top = 110
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 12
          end
          object DBCBDevolucion: TLFDBCheckBox
            Left = 926
            Top = 1
            Width = 75
            Height = 17
            Caption = 'Devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 43
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCBDevolucionChange
            DataField = 'DEVOLUCION'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBERic: TLFDbedit
            Left = 699
            Top = 176
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            DataField = 'RIC_FAC'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 41
          end
          object DBCHKAbono: TLFDBCheckBox
            Left = 1005
            Top = 1
            Width = 55
            Height = 17
            Caption = 'Abono'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 44
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SIN_DETALLE'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETituloEstado: TLFDbedit
            Left = 187
            Top = 0
            Width = 158
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMFacturas.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object DBERegistroIVA: TLFDbedit
            Left = 458
            Top = 176
            Width = 64
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'REGISTRO'
            DataSource = DMFacturas.DSQMCabecera
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
          object DBEFTarifa: TLFDBEditFind2000
            Left = 79
            Top = 132
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TARIFA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 13
            OnChange = DBEFTarifaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TARIFAS_ARTICULO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'propaga=1 and activa=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMFacturas.EntornoDoc
          end
          object ETitTarifa: TLFEdit
            Left = 144
            Top = 132
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 14
          end
          object DBDTPEntrega: TLFDBDateEdit
            Left = 676
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA_ENTREGA'
            DataSource = DMFacturas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 21
            Weekends = [Sun, Sat]
            OnExit = DBDTPEntregaExit
          end
          object DBCBRectificacion: TLFDBCheckBox
            Left = 1084
            Top = 1
            Width = 85
            Height = 17
            Caption = 'Rectificaci'#243'n'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            Enabled = False
            ParentColor = False
            TabOrder = 45
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECT'
            DataSource = DMFacturas.DSQMCabecera
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 458
            Top = 110
            Width = 24
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 29
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
            Entorno = DMFacturas.EntornoDoc
          end
          object ETituloPortes: TLFEdit
            Left = 483
            Top = 110
            Width = 152
            Height = 21
            TabStop = False
            Enabled = False
            ReadOnly = True
            TabOrder = 30
          end
          object DBEIPortes: TLFDbedit
            Left = 703
            Top = 110
            Width = 60
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 32
          end
          object DBEPorPortes: TLFDbedit
            Left = 636
            Top = 110
            Width = 66
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 31
          end
          object DBEFRango: TLFDBEditFind2000
            Left = 458
            Top = 132
            Width = 24
            Height = 21
            DataField = 'RANGO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 33
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
            SalirSiVacio = True
            OnBusqueda = DBEFRangoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obEmpresa]
            Entorno = DMAlbaranes.EntornoDoc
          end
          object DBERango: TLFDbedit
            Left = 483
            Top = 132
            Width = 102
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSxRangos
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
          object DBEIndice: TLFDbedit
            Left = 661
            Top = 132
            Width = 102
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSxIndices
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
          object DBEFIndice: TLFDBEditFind2000
            Left = 636
            Top = 132
            Width = 24
            Height = 21
            DataField = 'INDICE'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 35
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_RANGOS_INDICES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'INDICE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFIndiceBusqueda
            OrdenadoPor.Strings = (
              'INDICE')
            Filtros = [obEmpresa]
            Entorno = DMAlbaranes.EntornoDoc
          end
          object DBEFContacto: TLFDBEditFind2000
            Left = 79
            Top = 66
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'CONTACTO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_CONTACTOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'APELLIDOS')
            CampoNum = 'CONTACTO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFContactoBusqueda
            OrdenadoPor.Strings = (
              'contacto')
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object DBEContacto: TLFDbedit
            Left = 144
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIT_CONTACTO'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBTPHora: TDBDateTimePicker
            Left = 546
            Top = 0
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 46188.3871174653
            Time = 46188.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 20
            DataField = 'FECHA'
            DataSource = DMFacturas.DSQMCabecera
          end
          object DBEContadorNCF: TLFDbedit
            Left = 915
            Top = 154
            Width = 68
            Height = 21
            TabStop = False
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'Z_CONTADOR_NCF'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 52
          end
          object DBEFPrefijoNCF: TLFDbedit
            Left = 836
            Top = 154
            Width = 78
            Height = 21
            TabStop = False
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'Z_PREFIJO_NCF'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 51
          end
          object DBCBVTipoNCF: TDBLookupComboBox
            Left = 984
            Top = 154
            Width = 157
            Height = 21
            DataField = 'Z_TIPO_NCF'
            DataSource = DMFacturas.DSQMCabecera
            DropDownWidth = 250
            KeyField = 'TIPO_NCF'
            ListField = 'TITULO'
            ListSource = DMFacturas.DSxTipoNCF
            TabOrder = 53
          end
          object DBCHKListado: TLFDBCheckBox
            Left = 346
            Top = 2
            Width = 38
            Height = 17
            Hint = 'Documento impreso'
            Caption = 'List.'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 2
            TabStop = True
            OnClick = DBCHKListadoClick
            BiDiMode = bdLeftToRight
            ParentBiDiMode = False
            Alignment = taLeftJustify
            DataField = 'MODIFICA_DOC'
            DataSource = DMFacturas.DSxInfoActualizada
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBERegistroCartera: TLFDbedit
            Left = 571
            Top = 176
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            DataField = 'VENCIMIENTO'
            DataSource = DMFacturas.DSQMCabecera
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
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 699
            Top = 22
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
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
            Entorno = DMFacturas.EntornoDoc
          end
          object DBEFAutorizacion: TLFDBEditFind2000
            Left = 836
            Top = 66
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'SFV_AUTORIZACION'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 49
            Accion = ANewCliente
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SFV_AUTORIZACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AUTORIZACION'
            CampoStr = 'FECHA_DESDE'
            CondicionBusqueda = 'TIPO = '#39'E'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFAutorizacionBusqueda
            OrdenadoPor.Strings = (
              'FECHA_DESDE')
            Filtros = [obEmpresa]
            Entorno = DMFacturas.EntornoDoc
          end
          object DBECodigoControl: TLFDbedit
            Left = 836
            Top = 88
            Width = 305
            Height = 21
            Color = clInfoBk
            DataField = 'SFV_CODIGO_CONTROL'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            TabOrder = 50
          end
          object DBENombreComercial: TLFDbedit
            Left = 79
            Top = 176
            Width = 305
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
            OnDblClick = ATerceroExecute
          end
          object DBCBRec_Invisibles: TLFDBCheckBox
            Left = 1005
            Top = 21
            Width = 77
            Height = 16
            Caption = 'Sin Recibos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 47
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SIN_RECIBOS'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDFContable: TLFDBDateEdit
            Left = 836
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA_CON'
            DataSource = DMFacturas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 42
          end
          object DBETicketBAI: TLFDbedit
            Left = 458
            Top = 154
            Width = 305
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'CODIGO_IDENTIFICATIVO'
            DataSource = DMFacturas.DSxTicketBAI
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 37
          end
          object DBEPedidoCli: TLFDbedit
            Left = 458
            Top = 66
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'PEDIDO_CLIENTE'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 26
          end
          object DBCBEmpaquetadoEmpresa: TLFDBCheckBox
            Left = 1084
            Top = 19
            Width = 140
            Height = 17
            Caption = 'Empaquetado Empresa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 48
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EMPAQUETADO_EMPRESA'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBReciboPagado: TLFDBCheckBox
            Left = 636
            Top = 178
            Width = 19
            Height = 17
            Hint = 'Recibo(s) Cobrado(s)'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 40
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECIBO_PAGADO'
            DataSource = DMFacturas.DSQMCabecera
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEObservaciones: TLFDbedit
            Left = 79
            Top = 198
            Width = 684
            Height = 21
            AutoSize = False
            DataField = 'Z_OBSERVACION'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 18
          end
          object PNLAvisos: TLFPanel
            Left = 494
            Top = 40
            Width = 261
            Height = 177
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 55
            object LAvisos: TLFLabel
              Left = 0
              Top = 76
              Width = 261
              Height = 13
              Align = alTop
              Caption = 'Avisos'
            end
            object LNotasCliente: TLFLabel
              Left = 0
              Top = 89
              Width = 261
              Height = 13
              Align = alTop
              Caption = 'Notas Cliente'
            end
            object DBMAviso: TLFDBMemo
              Left = 0
              Top = 0
              Width = 261
              Height = 76
              Align = alTop
              Color = clInfoBk
              DataField = 'MENSAJE'
              DataSource = DMFacturas.DSxAvisos
              ReadOnly = True
              TabOrder = 0
            end
            object DBMNotaCliente: TLFDBMemo
              Left = 0
              Top = 102
              Width = 261
              Height = 75
              Align = alClient
              Color = clInfoBk
              DataField = 'NOTAS'
              DataSource = DMFacturas.DSxAvisos
              ReadOnly = True
              TabOrder = 1
            end
          end
          object PNLChile: TLFPanel
            Left = 765
            Top = 40
            Width = 380
            Height = 177
            BevelOuter = bvNone
            Constraints.MaxWidth = 380
            Constraints.MinWidth = 280
            TabOrder = 54
            object LTipoVenta: TLFLabel
              Left = 15
              Top = 46
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Venta'
            end
            object LFmaPagoSII: TLFLabel
              Left = 31
              Top = 24
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'F. Pago'
            end
            object LCodigoGiroCliente: TLFLabel
              Left = 6
              Top = 68
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cod. Giro Cli.'
            end
            object LCodigoGiroEmpresa: TLFLabel
              Left = 0
              Top = 90
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cod. Giro Emp.'
            end
            object LTipoDespacho: TLFLabel
              Left = 5
              Top = 112
              Width = 62
              Height = 13
              Caption = 'T. Despacho'
            end
            object LFSiiTrackID: TLFLabel
              Left = 221
              Top = 22
              Width = 10
              Height = 13
              Hint = 'TrackID'
              Caption = 'T.'
            end
            object LDocumento: TLFLabel
              Left = 13
              Top = 4
              Width = 55
              Height = 13
              Hint = 'TrackID'
              Alignment = taRightJustify
              Caption = 'Documento'
            end
            object LTipoDocumentoTributario: TLFLabel
              Left = -1
              Top = 134
              Width = 71
              Height = 13
              Caption = 'Tipo Doc. Trib.'
            end
            object LFolioSII: TLFLabel
              Left = 287
              Top = 135
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Folio'
            end
            object LValorUF: TLFLabel
              Left = 259
              Top = 24
              Width = 41
              Height = 13
              Caption = 'Valor UF'
            end
            object LServicio: TLFLabel
              Left = 231
              Top = 46
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'I. Serv.'
            end
            object LProyectoChile: TLFLabel
              Left = 26
              Top = 156
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Proyecto'
              FocusControl = DBEFProyectoChile
            end
            object DBEFTipoVenta: TLFDBEditFind2000
              Left = 72
              Top = 44
              Width = 64
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'TIPO_VENTA'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 5
              OnChange = DBEFTipoVentaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TIPO_COMPRA_VENTA'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'TIPO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'TIPO')
              Filtros = []
              Entorno = DMFacturas.EntornoDoc
            end
            object ETipoVenta: TLFEdit
              Left = 138
              Top = 44
              Width = 90
              Height = 21
              TabStop = False
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
              TabOrder = 6
            end
            object DBCBFmaPagoSII: TLFDBComboBoxValue
              Left = 72
              Top = 22
              Width = 83
              Height = 21
              Color = clInfoBk
              DataField = 'SII_FMA_PAGO'
              DataSource = DMFacturas.DSQMCabecera
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              Items.Strings = (
                '1: Contado'
                '2: Cr'#233'dito'
                '3: Sin costo (entrega gratuita)')
              Values.Strings = (
                '1'
                '2'
                '3')
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEFCodigoGiroCliente: TLFDBEditFind2000
              Left = 72
              Top = 66
              Width = 64
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'CODIGO_GIRO_CLIENTE'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 8
              OnChange = DBEFCodigoGiroClienteChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_EMP_CLIENTES_GIROS_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO_GIRO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'DEFECTO DESC, CODIGO_GIRO')
              Filtros = [obEmpresa, obCliente]
              Entorno = DMFacturas.EntornoDoc
            end
            object ECodigoGiroEmpresa: TLFEdit
              Left = 137
              Top = 88
              Width = 240
              Height = 21
              TabStop = False
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
              TabOrder = 11
            end
            object DBEFCodigoGiroEmpresa: TLFDBEditFind2000
              Left = 72
              Top = 88
              Width = 64
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'CODIGO_GIRO_EMPRESA'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 10
              OnChange = DBEFCodigoGiroEmpresaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_SYS_EMPRESAS_GIROS_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO_GIRO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'DEFECTO DESC, CODIGO_GIRO')
              Filtros = [obEmpresa]
              Entorno = DMFacturas.EntornoDoc
            end
            object ETipoDespachoTitulo: TLFEdit
              Left = 137
              Top = 110
              Width = 240
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
              TabOrder = 13
            end
            object DBETipoDespacho: TLFDBEditFind2000
              Left = 72
              Top = 110
              Width = 64
              Height = 21
              DataField = 'ID_TIPO_DESPACHO'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 12
              OnChange = DBETipoDespachoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SII_PARAMETROS_FACTURA_ELEC'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'PARAMETRO='#39'TIPO_DESPACHO'#39
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBETipoDespachoBusqueda
              OrdenadoPor.Strings = (
                'CODIGO')
              Filtros = []
            end
            object DBESiiTrackID: TLFDbedit
              Left = 156
              Top = 22
              Width = 221
              Height = 21
              Hint = 'TrackID'
              TabStop = False
              Color = clInfoBk
              DataField = 'SII_TRACKID'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBENIF: TLFDbedit
              Left = 137
              Top = 0
              Width = 240
              Height = 21
              Hint = 'TrackID'
              TabStop = False
              Color = clInfoBk
              DataField = 'NIF'
              DataSource = DMFacturas.DSxCliente
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBETipoDocIdentificacion: TLFDbedit
              Left = 72
              Top = 0
              Width = 64
              Height = 21
              Hint = 'TrackID'
              TabStop = False
              Color = clInfoBk
              DataField = 'TIPO_DOC_IDENT'
              DataSource = DMFacturas.DSxCliente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEFTipoDocumentoTributario: TLFDBEditFind2000
              Left = 72
              Top = 132
              Width = 64
              Height = 21
              DataField = 'TIPO_DOC_TRIBUTARIO'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 14
              OnChange = DBEFTipoDocumentoTributarioChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'VISIBLE_FAC=1'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'CODIGO')
              Filtros = []
            end
            object ETipoDocumentoTributario: TLFEdit
              Left = 137
              Top = 132
              Width = 147
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
              TabOrder = 15
            end
            object DBEFolio: TLFDbedit
              Left = 313
              Top = 132
              Width = 64
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'FOLIO'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 16
            end
            object DBEValorUF: TLFDbedit
              Left = 303
              Top = 22
              Width = 74
              Height = 21
              DataField = 'VALOR_UNIDAD_FOMENTO'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 4
            end
            object DBCBIndServicio: TLFDBComboBoxValue
              Left = 268
              Top = 44
              Width = 109
              Height = 21
              DataField = 'INDSERVICIO'
              DataSource = DMFacturas.DSQMCabecera
              ItemHeight = 13
              Items.Strings = (
                'No asignado'
                'Servicios peri'#243'dicos '
                'Servicios peri'#243'dicos domiciliarios'
                'Venta y servicios'
                'Serv. Hoteler'#237'a(Fac)-Espectaculos(Bol)'
                'Serv. de Transporte Terrestre Internacional(Fac)')
              Values.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5')
              TabOrder = 7
            end
            object DBEFProyectoChile: TLFDBEditFind2000
              Left = 72
              Top = 154
              Width = 64
              Height = 21
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'PROYECTO'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 17
              OnChange = DBEFProyectoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'EMP_PROYECTOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'PROYECTO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = True
              OnBusqueda = DBEFProyectoBusqueda
              OrdenadoPor.Strings = (
                'proyecto')
              Filtros = [obEmpresa]
              Entorno = DMFacturas.EntornoDoc
            end
            object EProyectoChile: TLFEdit
              Left = 137
              Top = 154
              Width = 240
              Height = 21
              TabStop = False
              AutoSelect = False
              AutoSize = False
              Color = clAqua
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
            object DBESIITituloCodigoGiroCliente: TLFDbedit
              Left = 137
              Top = 66
              Width = 240
              Height = 21
              DataField = 'TITULO_GIRO_CLIENTE'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 9
            end
          end
          object DBCBTipoIngresos: TDBComboBoxValue
            Left = 836
            Top = 176
            Width = 305
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_INGRESOS'
            DataSource = DMFacturas.DSQMCabecera
            ItemHeight = 13
            Items.Strings = (
              'Ingresos por operaciones (no financieros)'
              'Ingresos financieros'
              'Ingresos extraordinarios'
              'Ingresos por arrendamientos'
              'Ingresos por venta de activo depreciable'
              'Otros Ingresos')
            Values.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6')
            TabOrder = 56
          end
        end
      end
      object TSOtros: TTabSheet [1]
        Caption = '&Otros'
        ImageIndex = -1
        OnShow = TSOtrosShow
        object SBAProyecto: TSpeedButton
          Left = 130
          Top = 94
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAProyectoDblClick
        end
        object PCabOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLCabOtros: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LOtrosFecha: TLFLabel
              Left = 541
              Top = 2
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object LOtrosReferencia: TLFLabel
              Left = 344
              Top = 2
              Width = 52
              Height = 13
              Caption = 'Referencia'
            end
            object DBEOtrosFecha: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEOtrosSuRefernciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEOtrosClienteTituloCab: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMFacturas.DSxCliente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEOtrosRIG: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              OnChange = DBEFBancoDireccionChange
            end
          end
          object NavOtros: THYMNavigator
            Left = 655
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMFacturas.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEOtrosPMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFProyecto
            Exclusivo = True
            ControlEdit = CEOtros
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLEdOtros: TLFPanel
          Left = 0
          Top = 22
          Width = 1270
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          OnResize = PNLEdOtrosResize
          object LBIdioma: TLFLabel
            Left = 42
            Top = 24
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
          end
          object LMoneda: TLFLabel
            Left = 34
            Top = 46
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LTipoIRPF: TLFLabel
            Left = 13
            Top = 112
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo I.R.P.F.'
          end
          object LPorcentajeIRPF: TLFLabel
            Left = 26
            Top = 134
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = '% I.R.P.F.'
          end
          object LCampanya: TLFLabel
            Left = 415
            Top = 2
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campa'#241'a'
          end
          object LPorcentajeFinanciacion: TLFLabel
            Left = 803
            Top = 24
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Financ.'
          end
          object LValorCambio: TLFLabel
            Left = 171
            Top = 70
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Cambio'
            FocusControl = DBEValorCambio
          end
          object LTipoLineaKri: TLFLabel
            Left = 410
            Top = 24
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Linea'
          end
          object LFirma: TLFLabel
            Left = 437
            Top = 112
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Firma'
          end
          object LBancoDireccion: TLFLabel
            Left = 42
            Top = 91
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LPorRetencionGarantia: TLFLabel
            Tag = 10
            Left = 394
            Top = 69
            Width = 67
            Height = 13
            Hint = '% Retenci'#243'n Garant'#237'a'
            Alignment = taRightJustify
            Caption = '% R. Garant'#237'a'
            Color = clBtnFace
            ParentColor = False
            ParentShowHint = False
            ShowHint = True
          end
          object LImporteRetencionGarantia: TLFLabel
            Left = 541
            Top = 68
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Ret. Garant'#237'a'
          end
          object LFechaRetencionGarantia: TLFLabel
            Left = 541
            Top = 91
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Ret. Garant'#237'a'
          end
          object LFechaReparto: TLFLabel
            Left = 775
            Top = 47
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Reparto'
          end
          object LUsuarioCreacion: TLFLabel
            Left = 5
            Top = 157
            Width = 70
            Height = 13
            Hint = 'Usuario Creacion'
            Alignment = taRightJustify
            Caption = 'Usuario Creac.'
            FocusControl = DBESuReferencia
            ParentShowHint = False
            ShowHint = True
          end
          object LPeriodoFacturacionIni: TLFLabel
            Left = 774
            Top = 69
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodo Fact.'
          end
          object LPeriodoFacturacionFin: TLFLabel
            Left = 931
            Top = 69
            Width = 3
            Height = 13
            Alignment = taRightJustify
            Caption = '-'
          end
          object LLegalLiterals: TLFLabel
            Left = 765
            Top = 93
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Textos Legales'
          end
          object LMotivoAbono: TLFLabel
            Left = 771
            Top = 4
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Abono'
          end
          object LModoIVA: TLFLabel
            Left = 413
            Top = 48
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object LProyecto: TLFLabel
            Left = 33
            Top = 2
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = DBEFProyecto
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'IDIOMA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 2
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
              'IDIOMA')
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object ETitIdioma: TLFEdit
            Left = 144
            Top = 22
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 3
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
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
            Entorno = DMFacturas.EntornoDoc
          end
          object ETitMoneda: TLFEdit
            Left = 144
            Top = 44
            Width = 240
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
          object DBEFTipoLineaKri: TLFDBEditFind2000
            Left = 466
            Top = 22
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TIPO_LINEA_KRI'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 18
            OnChange = DBEFTipoLineaKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_LINEA_VENTA_KRI'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'id')
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object ETipoLineaKri: TLFEdit
            Left = 531
            Top = 22
            Width = 240
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
            TabOrder = 19
          end
          object EModoIva: TLFEdit
            Left = 531
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 21
          end
          object EFModoIva: TLFDBEditFind2000
            Left = 466
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 20
            OnChange = EFModoIvaChange
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
          object DBCBRECC: TLFDBCheckBox
            Left = 938
            Top = 24
            Width = 103
            Height = 17
            Caption = 'Criterio de Caja'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 28
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECC'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFTipoIRPF: TLFDBEditFind2000
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_IRPF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBERetencion: TLFDbedit
            Left = 79
            Top = 132
            Width = 64
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'P_RETENCION'
            DataSource = DMFacturas.DSQMCabecera
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
          object DBETitTIPOIRPF: TLFDbedit
            Left = 144
            Top = 110
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSxTipoIRPF
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
          object DBEAplicarIRPF: TLFDbedit
            Left = 144
            Top = 132
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'APLICA_IRPF'
            DataSource = DMFacturas.DSQMCabecera
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
          object EFCampanya: TLFDBEditFind2000
            Left = 466
            Top = 0
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CAMPANYA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 16
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CAMPANYAS_ACTIVAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CAMPANYA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CAMPANYA')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMFacturas.EntornoDoc
          end
          object DBETituloCampanya: TLFDbedit
            Left = 531
            Top = 0
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSxCampanyas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object DBEFinanciacion: TLFDbedit
            Left = 842
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'POR_FINANCIACION'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 27
          end
          object DBCHKCambio: TLFDBCheckBox
            Left = 79
            Top = 69
            Width = 73
            Height = 17
            Caption = 'Cambio Fijo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKCambioChange
            DataField = 'CAMBIO_FIJO'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorCambio: TLFDbedit
            Left = 237
            Top = 66
            Width = 64
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 7
          end
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 1170
            Top = 24
            Width = 111
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PNLFirma: TLFPanel
            Left = 466
            Top = 110
            Width = 185
            Height = 59
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 37
            DesignSize = (
              185
              59)
            object ImgFirma: TImage
              Left = 0
              Top = 0
              Width = 185
              Height = 59
              Align = alClient
              Center = True
              Proportional = True
              Stretch = True
            end
            object DBTFirmaNombre: TDBText
              Left = 0
              Top = 33
              Width = 185
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              Color = clBtnFace
              DataField = 'NOMBRE'
              DataSource = DMFacturas.DSQMFirmas
              ParentColor = False
              Transparent = True
            end
            object DBTNIFFirma: TDBText
              Left = 0
              Top = 46
              Width = 185
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              DataField = 'NIF'
              DataSource = DMFacturas.DSQMFirmas
              Transparent = True
            end
          end
          object DBEFBancoDireccion: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            DataField = 'BANCO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 8
            OnChange = DBEFBancoDireccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_BANCOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFBancoDireccionBusqueda
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EBancoDireccion: TLFEdit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 9
          end
          object PNLOtrosBolivia: TLFPanel
            Left = 1057
            Top = 43
            Width = 160
            Height = 21
            BevelOuter = bvNone
            TabOrder = 33
            object LPorcPropina: TLFLabel
              Left = 14
              Top = 4
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = '% Propina'
            end
            object DBEPorcPropina: TLFDbedit
              Left = 65
              Top = 0
              Width = 64
              Height = 21
              DataField = 'POR_PROPINA'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 0
            end
          end
          object DBDTPFechaRetencionGarantia: TLFDBDateEdit
            Left = 635
            Top = 88
            Width = 87
            Height = 21
            DataField = 'FECHA_RETENCION_GARANTIA'
            DataSource = DMFacturas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 24
            OnExit = DBDTPFechaExit
          end
          object DBEFPorRetencionGarantia: TLFDbedit
            Left = 465
            Top = 66
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'POR_RETENCION_GARANTIA'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            MaxLength = 2
            ParentFont = False
            TabOrder = 22
          end
          object DBEFImporteRetencionGarantia: TLFDbedit
            Left = 635
            Top = 66
            Width = 87
            Height = 21
            AutoSize = False
            DataField = 'I_RETENCION_GARANTIA'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 23
          end
          object DEFechaReparto: TLFDBDateEdit
            Left = 842
            Top = 44
            Width = 87
            Height = 21
            DataField = 'FECHA_ENTREGA_REPARTO'
            DataSource = DMFacturas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 31
            OnExit = DBDTPFechaExit
          end
          object DBDTPHoraReparto: TDBDateTimePicker
            Left = 930
            Top = 44
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 46188
            Time = 46188
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 32
            DataField = 'FECHA_ENTREGA_REPARTO'
            DataSource = DMFacturas.DSQMCabecera
          end
          object DBEFUsuarioCreacion: TLFDBEditFind2000
            Left = 79
            Top = 154
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'USUARIO_CREACION'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            TabOrder = 14
            OnChange = DBEFUsuarioCreacionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            CondicionBusqueda = 'ACTIVO = 1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'usuario')
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object EUsuarioCreacion: TLFEdit
            Left = 144
            Top = 154
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
          end
          object DBDEPeriodoFacturacionIni: TLFDBDateEdit
            Left = 842
            Top = 66
            Width = 87
            Height = 21
            DataField = 'PERIODO_FACTURACION_INI'
            DataSource = DMFacturas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 34
            OnExit = DBDTPFechaExit
          end
          object DBDEPeriodoFacturacionFin: TLFDBDateEdit
            Left = 938
            Top = 66
            Width = 87
            Height = 21
            DataField = 'PERIODO_FACTURACION_FIN'
            DataSource = DMFacturas.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 35
            OnExit = DBDTPFechaExit
          end
          object DBMLegalLiterals: TLFDBMemo
            Left = 842
            Top = 88
            Width = 439
            Height = 87
            DataField = 'LEGAL_LITERALS'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 36
          end
          object DBEFMotivoAbono: TLFDBEditFind2000
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'COD_MOTIVO_ABONO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 25
            OnChange = DBEFMotivoAbonoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MOTIVO_ABONO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object EMotivoAbono: TLFEdit
            Left = 907
            Top = 0
            Width = 240
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
            TabOrder = 26
          end
          object DBCBEmitidaPorTerceros: TLFDBCheckBox
            Left = 1042
            Top = 24
            Width = 120
            Height = 17
            Caption = 'Emitida por Terceros'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 29
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EMITIDA_POR_TERCEROS'
            DataSource = DMFacturas.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFProyecto: TLFDBEditFind2000
            Left = 79
            Top = 0
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 0
            OnChange = DBEFProyectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFProyectoBusqueda
            OrdenadoPor.Strings = (
              'proyecto')
            Filtros = [obEmpresa]
            Entorno = DMFacturas.EntornoDoc
          end
          object EProyecto: TLFEdit
            Left = 144
            Top = 0
            Width = 239
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clAqua
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
      object TSVerifactu: TTabSheet [2]
        Caption = 'Verifactu'
        ImageIndex = 8
        OnShow = TSVerifactuShow
        object PNLVerifactu: TLFPanel
          Left = 0
          Top = 22
          Width = 1270
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PNLQRVerifactu: TLFPanel
            Left = 0
            Top = 0
            Width = 209
            Height = 198
            Align = alLeft
            TabOrder = 0
            object ImgQRVerifactu: TImage
              Left = 1
              Top = 1
              Width = 207
              Height = 196
              Align = alClient
              Center = True
              Proportional = True
            end
          end
          object PNLDatosVerifactu: TLFPanel
            Left = 209
            Top = 0
            Width = 1061
            Height = 198
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            DesignSize = (
              1061
              198)
            object LVerifactuQR: TLFLabel
              Left = 187
              Top = 8
              Width = 16
              Height = 13
              Alignment = taRightJustify
              Caption = 'QR'
              FocusControl = DBEFProyecto
            end
            object LVerifactuEncadenamiento: TLFLabel
              Left = 8
              Top = 52
              Width = 100
              Height = 85
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Encadenamiento'
              Color = clAppWorkSpace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LVerifactuHuella: TLFLabel
              Left = 173
              Top = 29
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Huella'
            end
            object LVerifactuEncIdEmisorFactura: TLFLabel
              Left = 133
              Top = 56
              Width = 70
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id Emisor Fact.'
              FocusControl = DBEFProyecto
            end
            object LVerifactuEncNumSerieFactura: TLFLabel
              Left = 127
              Top = 78
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Num Serie Fact.'
              FocusControl = DBEFProyecto
            end
            object LVerifactuEncFechaExpedicionFactura: TLFLabel
              Left = 119
              Top = 100
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Exp.n Fac.'
              FocusControl = DBEFProyecto
            end
            object LVerifactuEncHuella: TLFLabel
              Left = 174
              Top = 121
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Huella'
            end
            object LVerifactuRegistro: TLFLabel
              Left = 8
              Top = 4
              Width = 100
              Height = 40
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Registro'
              Color = clAppWorkSpace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LVerifactuEstado: TLFLabel
              Left = 8
              Top = 145
              Width = 100
              Height = 44
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Estado'
              Color = clAppWorkSpace
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
              Layout = tlCenter
            end
            object LEstadoAltaVerifactu: TLFLabel
              Left = 185
              Top = 149
              Width = 18
              Height = 13
              Alignment = taRightJustify
              Caption = 'Alta'
              FocusControl = DBEFProyecto
            end
            object LEstadoAnulacionVerifactu: TLFLabel
              Left = 156
              Top = 171
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Anulacion'
              FocusControl = DBEFProyecto
            end
            object DBEQRVerifactu: TLFDbedit
              Left = 208
              Top = 4
              Width = 842
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'INFO_QR'
              DataSource = DMFacturas.DSxVerifactu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEHuella: TLFDbedit
              Left = 208
              Top = 26
              Width = 842
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'HUELLA'
              DataSource = DMFacturas.DSxVerifactu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEEncIdEmisorFactura: TLFDbedit
              Left = 208
              Top = 52
              Width = 842
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'ENC_RA_IDEMISORFACTURA'
              DataSource = DMFacturas.DSxVerifactu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEEncNumSerieFactura: TLFDbedit
              Left = 208
              Top = 74
              Width = 842
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'ENC_RA_NUMSERIEFACTURA'
              DataSource = DMFacturas.DSxVerifactu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEEncFechaExpedicionFactura: TLFDbedit
              Left = 208
              Top = 96
              Width = 842
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'ENC_RA_FECHAEXPEDICIONFACTURA'
              DataSource = DMFacturas.DSxVerifactu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEEncHuella: TLFDbedit
              Left = 208
              Top = 118
              Width = 842
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'ENC_RA_HUELLA'
              DataSource = DMFacturas.DSxVerifactu
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBEEstadoAltaVerifactu: TLFDbedit
              Left = 208
              Top = 145
              Width = 120
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'VF_ESTADO_REGISTRO_ALTA'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
              OnChange = DBEEstadoAltaVerifactuChange
            end
            object DBEEstadoAnulacionVerifactu: TLFDbedit
              Left = 208
              Top = 167
              Width = 120
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'VF_ESTADO_REGISTRO_ANULACION'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
              OnChange = DBEEstadoAnulacionVerifactuChange
            end
            object DBECodigoAltaVerifactu: TLFDbedit
              Left = 329
              Top = 145
              Width = 50
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'VF_CODIGO_ERROR_ALTA'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBECodigoAnulacionVerifactu: TLFDbedit
              Left = 329
              Top = 167
              Width = 50
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'VF_CODIGO_ERROR_ANULACION'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 10
            end
            object DBEDescAltaVerifactu: TLFDbedit
              Left = 380
              Top = 145
              Width = 670
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'VF_DESCRIPCION_ERROR_ALTA'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 8
            end
            object DBEDescAnulacionVerifactu: TLFDbedit
              Left = 380
              Top = 167
              Width = 670
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clInfoBk
              DataField = 'VF_DESCRIPCION_ERROR_ANULACION'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
            end
          end
        end
        object PNLCabVerifactu: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LVerifactuReferencia: TLFLabel
            Left = 344
            Top = 2
            Width = 52
            Height = 13
            Caption = 'Referencia'
          end
          object LVerifactuFecha: TLFLabel
            Left = 541
            Top = 2
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object DBEVerifactuClienteTituloCab: TLFDbedit
            Left = 70
            Top = 0
            Width = 267
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSxCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEVerifactuSuReferencia: TLFDbedit
            Left = 401
            Top = 0
            Width = 133
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SU_REFERENCIA'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEVerifactuRIG: TLFDbedit
            Left = 0
            Top = 0
            Width = 69
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            OnChange = DBEFBancoDireccionChange
          end
          object DBEVerifactuFecha: TLFDbedit
            Left = 577
            Top = 0
            Width = 71
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA'
            DataSource = DMFacturas.DSQMCabecera
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
      end
      object TSNotas: TTabSheet [3]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PEdNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 1270
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object splitter: TSplitter
            Left = 1062
            Top = 29
            Width = 8
            Height = 169
            Cursor = crHSplit
            Align = alRight
            Color = clAppWorkSpace
            ParentColor = False
          end
          object TBRichNotas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1270
            Height = 29
            EdgeInner = esNone
            EdgeOuter = esNone
            Images = DMMain.ToolbarImages
            TabOrder = 0
            Visible = False
            Separators = True
            object TButtNotasNegrita: TToolButton
              Left = 0
              Top = 2
              Action = FMain.RichEditBold1
            end
            object TButtNotasItalica: TToolButton
              Left = 23
              Top = 2
              Action = FMain.RichEditItalic1
            end
            object TButtNotasSubrayado: TToolButton
              Left = 46
              Top = 2
              Action = FMain.RichEditUnderline1
            end
            object ToolButton13: TToolButton
              Left = 69
              Top = 2
              Width = 8
              Style = tbsSeparator
              Visible = False
            end
            object TButtNotasAlinIzq: TToolButton
              Left = 77
              Top = 2
              Action = FMain.RichEditAlignLeft1
            end
            object TButtNotasAlinCent: TToolButton
              Left = 100
              Top = 2
              Action = FMain.RichEditAlignCenter1
            end
            object TButtNotasAlinDer: TToolButton
              Left = 123
              Top = 2
              Action = FMain.RichEditAlignRight1
            end
            object ToolButton17: TToolButton
              Left = 146
              Top = 2
              Width = 8
              Style = tbsSeparator
              Visible = False
            end
            object TButtNotasBullets: TToolButton
              Left = 154
              Top = 2
              Action = FMain.RichEditBullets1
            end
            object ToolButton19: TToolButton
              Left = 177
              Top = 2
              Width = 8
              Style = tbsSeparator
              Visible = False
            end
            object CBFontName: TLFComboBox
              Left = 185
              Top = 2
              Width = 192
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              OnChange = CBFontNameChange
            end
            object ToolButton12: TToolButton
              Left = 377
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object PNLTamano: TLFPanel
              Left = 385
              Top = 2
              Width = 40
              Height = 22
              TabOrder = 0
              object EFontSizeNotas: TLFEdit
                Left = 1
                Top = 0
                Width = 24
                Height = 21
                TabStop = False
                TabOrder = 0
                Text = '0'
                OnChange = EFontSizeNotasChange
              end
              object UpDown1: TUpDown
                Left = 25
                Top = 0
                Width = 15
                Height = 21
                Associate = EFontSizeNotas
                Min = 0
                Position = 0
                TabOrder = 1
                Wrap = True
              end
            end
          end
          object PNLNotas: TLFPanel
            Left = 0
            Top = 29
            Width = 1062
            Height = 169
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBRENotasInternasKri: TDBRichEdit
              Left = 0
              Top = 62
              Width = 1062
              Height = 107
              Align = alBottom
              Color = clMoneyGreen
              DataField = 'NOTAS_INTERNAS_KRI'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              PlainText = True
              TabOrder = 0
              OnEnter = DBRENotasEnter
              OnSelectionChange = DBRENotasSelectionChange
            end
            object DBRENotas: TDBRichEdit
              Left = 0
              Top = 0
              Width = 1062
              Height = 62
              Align = alClient
              DataField = 'NOTAS'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              PlainText = True
              TabOrder = 1
              OnEnter = DBRENotasEnter
              OnSelectionChange = DBRENotasSelectionChange
            end
          end
          object PNLOrtografia: TLFPanel
            Left = 1070
            Top = 29
            Width = 200
            Height = 169
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object TBOrtografia: TLFToolBar
              Left = 0
              Top = 0
              Width = 200
              Height = 23
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeOuter = esNone
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              Wrapable = False
              Separators = True
              object TBComprobar: TToolButton
                Left = 0
                Top = 0
                Hint = 'Comprobar'
                Caption = 'Comprobar'
                ImageIndex = 85
                OnClick = TBComprobarClick
              end
              object ToolButton2: TToolButton
                Left = 23
                Top = 0
                Width = 8
                ImageIndex = 1
                Style = tbsSeparator
              end
              object TBAgregarPalabra: TToolButton
                Left = 31
                Top = 0
                Hint = 'Agregar Palabra'
                Caption = 'Agregar Palabra'
                ImageIndex = 19
                OnClick = TBAgregarPalabraClick
              end
            end
            object LBPalabras: TListBox
              Left = 0
              Top = 23
              Width = 200
              Height = 146
              Align = alClient
              ItemHeight = 13
              TabOrder = 1
            end
          end
        end
        object PCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLCabNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LNotasFecha: TLFLabel
              Left = 541
              Top = 2
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object LNotasReferencia: TLFLabel
              Left = 344
              Top = 2
              Width = 52
              Height = 13
              Caption = 'Referencia'
            end
            object DBENotasFechaCab: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBENotasSuReferenciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMFacturas.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBENotasClienteTituloCab: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMFacturas.DSxCliente
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBENotasRIGCab: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMFacturas.DSQMCabecera
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
          object NavNotas: THYMNavigator
            Left = 655
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMFacturas.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavMainClickAfterAdjust
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1270
          Height = 220
          DataSource = DMFacturas.DSQMCabecera
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'CAMBIO_FIJO'
            'CENTRO_COSTE'
            'DEVOLUCION'
            'FUERZA_VENCIMIENTOS'
            'INVERSION_SUJETO_PASIVO'
            'MODIFICA_DOC'
            'RECC'
            'RECIBO_PAGADO'
            'RECT'
            'SIN_DETALLE'
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
            'A_IRPF'
            'AGENTE'
            'ALMACEN'
            'ASIENTO'
            'B_COMISION'
            'B_DTO_LINEAS'
            'BRUTO'
            'BULTOS'
            'C_TOTAL'
            'CAMBIO_FIJO'
            'CAMPANYA'
            'CLIENTE'
            'CODIGO_POSTAL'
            'CONTACTO'
            'DEVOLUCION'
            'DIR_COMPLETA'
            'DIRECCION'
            'DTO_CIAL'
            'DTO_PP'
            'EJERCICIO'
            'ESTADO'
            'FCHREF'
            'FECHA'
            'FECHA_ENTREGA'
            'FECHA_ENTREGA_MANUAL'
            'FECHA_ENTREGA_REPARTO'
            'FECHA_RECOGIDA_MANUAL'
            'FECHA_RETENCION_GARANTIA'
            'FOLIO'
            'FOLIOREF'
            'FORMA_PAGO'
            'I_BASE_RETENCION'
            'I_COMISION'
            'I_DTO_CIAL'
            'I_DTO_LINEAS'
            'I_DTO_PP'
            'I_FINANCIACION'
            'I_FINANCIACION_CANAL'
            'I_PORTES'
            'I_RETENCION'
            'I_RETENCION_GARANTIA'
            'ID_FICHA_TECNICA'
            'ID_S'
            'ID_TIPO_DESPACHO'
            'ID_TIPO_GIRO_CLIENTE'
            'ID_TIPO_GIRO_EMPRESA'
            'IDIOMA'
            'IMPORTE_ANTICIPO'
            'INVERSION_SUJETO_PASIVO'
            'LINEAS'
            'LIQUIDO'
            'LOCALIDAD'
            'M_BRUTO'
            'MATRICULA'
            'MATRICULA_ENTREGA'
            'MATRICULA_RECOGIDA'
            'MODO_IVA'
            'MONEDA'
            'NIF'
            'NOMBRE_COMERCIAL'
            'NROLINREF'
            'ORIGEN_DOCUMENTO'
            'P_RETENCION'
            'PERIODO_FACTURACION_FIN'
            'PERIODO_FACTURACION_INI'
            'POR_FINANCIACION'
            'POR_PORTES'
            'POR_PROPINA'
            'POR_RETENCION_GARANTIA'
            'PORTES'
            'PROYECTO'
            'RAZONREF'
            'RECC'
            'RECIBO_PAGADO'
            'RECT'
            'REGISTRO'
            'REGISTRO_CARTERA'
            'RIC'
            'RIG'
            'RUTOTR'
            'S_BASES'
            'S_CUOTA_IVA'
            'S_CUOTA_RE'
            'SFV_AUTORIZACION'
            'SFV_CODIGO_CONTROL'
            'SFV_CODIGO_RESPUESTA_RAPIDA'
            'SFV_NUM_DOSIFICACION'
            'SII_FMA_PAGO'
            'SII_ID_DOC_REF'
            'SIN_DETALLE'
            'SIN_RECIBOS'
            'SU_REFERENCIA'
            'TARIFA'
            'TERCERO'
            'TIPO'
            'TIPO_DOC_TRIBUTARIO'
            'TIPO_INGRESOS'
            'TIPO_IRPF'
            'TIPO_LINEA_KRI'
            'TIPO_PORTES'
            'TIPO_VENTA'
            'TIT_CONTACTO'
            'TITULO'
            'TITULO_GIRO_CLIENTE'
            'TOTAL_A_COBRAR'
            'TOTAL_ANTICIPADO'
            'TPODOCREF'
            'TRANSPORTISTA'
            'UNIDADES'
            'USUARIO_CREACION'
            'VALOR_UNIDAD_FOMENTO'
            'VENCIMIENTO'
            'Z_CONTADOR_NCF'
            'Z_OBSERVACION'
            'Z_PREFIJO_NCF'
            'PEDIDO_CLIENTE'
            'Z_TIPO_NCF')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Alignment = taCenter
              Width = 113
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 235
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              Title.Alignment = taRightJustify
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROYECTO'
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ESTADO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VF_ESTADO_REGISTRO'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECIBO_PAGADO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODIFICA_DOC'
              Width = 40
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Left = 206
        end
      end
      object TSDirManual: TTabSheet
        Caption = 'Dir. Manual'
        ImageIndex = 4
        OnResize = TSDirManualResize
        object PNLDirManual: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLDirManual2: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LDirEntregaFecha: TLFLabel
              Left = 543
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LDirEntregaReferencia: TLFLabel
              Left = 345
              Top = 3
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Referencia'
              Layout = tlCenter
            end
            object DBEDirEntregaFecha: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMFacturas.DSQMCabecera
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
            object DBEDirEntregaNombre: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMFacturas.DSQMCabecera
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
            object DBEDirEntregaRIG: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMFacturas.DSQMCabecera
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
            object DBEDirEntregaReferencia: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMFacturas.DSQMCabecera
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
          object NavDirEntrega: THYMNavigator
            Left = 655
            Top = 0
            Width = 66
            Height = 22
            DataSource = DMFacturas.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDirEntregaPMEdit
            ShowHint = True
            TabOrder = 1
            BeforeAction = NavNotasBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEEquipoRecogida
            Exclusivo = False
            ControlEdit = CEDirEntrega
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLDirManualDatos: TLFPanel
          Left = 0
          Top = 22
          Width = 1270
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object PNLDirRecogida: TLFPanel
            Left = 0
            Top = 0
            Width = 600
            Height = 198
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object PNLEdDirRecogida: TLFPanel
              Left = 0
              Top = 0
              Width = 600
              Height = 89
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LDirRecogida: TLFLabel
                Left = 0
                Top = 0
                Width = 600
                Height = 13
                Align = alTop
                Caption = 'Direccion de Recogida'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LEquipoRecogida: TLFLabel
                Left = 26
                Top = 21
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Equipo'
              end
              object LMatriculaRecogida: TLFLabel
                Left = 16
                Top = 41
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Matricula'
              end
              object LFechaRecogida: TLFLabel
                Left = 29
                Top = 64
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object DBEEquipoRecogida: TLFDbedit
                Left = 64
                Top = 17
                Width = 297
                Height = 21
                DataField = 'EQUIPO_RECOGIDA'
                DataSource = DMFacturas.DSQMCabecera
                TabOrder = 0
              end
              object DBEMatriculaRecogida: TLFDbedit
                Left = 64
                Top = 39
                Width = 297
                Height = 21
                DataField = 'MATRICULA_RECOGIDA'
                DataSource = DMFacturas.DSQMCabecera
                TabOrder = 1
              end
              object DBDEFechaRecogidaManual: TLFDBDateEdit
                Left = 64
                Top = 61
                Width = 121
                Height = 21
                DataField = 'FECHA_RECOGIDA_MANUAL'
                DataSource = DMFacturas.DSQMCabecera
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 2
              end
              object DBDTPFechaRecogidaManual: TDBDateTimePicker
                Left = 184
                Top = 61
                Width = 56
                Height = 21
                CalAlignment = dtaLeft
                Date = 46188.3871174653
                Format = 'HH:mm'
                Time = 46188.3871174653
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 3
                DataField = 'FECHA_RECOGIDA_MANUAL'
                DataSource = DMFacturas.DSQMCabecera
              end
            end
            object DBMDirRecogida: TLFDBMemo
              Left = 0
              Top = 89
              Width = 600
              Height = 109
              Align = alClient
              DataField = 'DIR_RECOGIDA_MANUAL'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 1
            end
          end
          object PNLDirEntrega: TLFPanel
            Left = 600
            Top = 0
            Width = 670
            Height = 198
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object PNLEdDirEntrega: TLFPanel
              Left = 0
              Top = 0
              Width = 670
              Height = 89
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LFLabel3: TLFLabel
                Left = 0
                Top = 0
                Width = 670
                Height = 13
                Align = alTop
                Caption = 'Direccion de Entrega'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object LEquipoEntrega: TLFLabel
                Left = 26
                Top = 21
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Equipo'
              end
              object LMatriculaEntrega: TLFLabel
                Left = 16
                Top = 41
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Matricula'
              end
              object LFechaEntregaManual: TLFLabel
                Left = 29
                Top = 64
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object DBEEquipoEntrega: TLFDbedit
                Left = 64
                Top = 17
                Width = 297
                Height = 21
                DataField = 'EQUIPO_ENTREGA'
                DataSource = DMFacturas.DSQMCabecera
                TabOrder = 0
              end
              object DBEMatriculaEntrega: TLFDbedit
                Left = 64
                Top = 39
                Width = 297
                Height = 21
                DataField = 'MATRICULA_ENTREGA'
                DataSource = DMFacturas.DSQMCabecera
                TabOrder = 1
              end
              object DBDEFechaEntregaManual: TLFDBDateEdit
                Left = 64
                Top = 61
                Width = 121
                Height = 21
                DataField = 'FECHA_ENTREGA_MANUAL'
                DataSource = DMFacturas.DSQMCabecera
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 2
              end
              object DBDTPFechaEntregaManual: TDBDateTimePicker
                Left = 184
                Top = 61
                Width = 56
                Height = 21
                CalAlignment = dtaLeft
                Date = 46188.3871174653
                Format = 'HH:mm'
                Time = 46188.3871174653
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkTime
                ParseInput = False
                TabOrder = 3
                DataField = 'FECHA_ENTREGA_MANUAL'
                DataSource = DMFacturas.DSQMCabecera
              end
            end
            object DBMDirEntrega: TLFDBMemo
              Left = 0
              Top = 89
              Width = 670
              Height = 109
              Align = alClient
              DataField = 'DIR_ENTREGA_MANUAL'
              DataSource = DMFacturas.DSQMCabecera
              TabOrder = 1
            end
          end
        end
      end
      object TSFEChile: TTabSheet
        Caption = 'F&E Chile'
        ImageIndex = 4
        object TBFEChile: TLFToolBar
          Left = 0
          Top = 0
          Width = 1270
          Height = 22
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavFEChile: THYMNavigator
            Left = 0
            Top = 0
            Width = 145
            Height = 22
            DataSource = DMFacturas.DSQMCabeceraFEChile
            VisibleButtons = [nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
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
        object PFEChile: TLFPanel
          Left = 0
          Top = 22
          Width = 1270
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object grpEmisor: TGroupBox
            Left = 366
            Top = 0
            Width = 235
            Height = 198
            Align = alLeft
            Caption = 'Emisor'
            TabOrder = 0
            object LRUTEmisor: TLFLabel
              Left = 6
              Top = 12
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'RUTEmisor'
            end
            object LRznSoc: TLFLabel
              Left = 22
              Top = 32
              Width = 38
              Height = 13
              Alignment = taRightJustify
              Caption = 'RznSoc'
            end
            object LGiroEmisor: TLFLabel
              Left = 10
              Top = 53
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'GiroEmisor'
            end
            object LTelefonoEmis: TLFLabel
              Left = 5
              Top = 73
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'TelefEmisor'
            end
            object LCorreoEmisor: TLFLabel
              Left = 4
              Top = 93
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'EmailEmisor'
            end
            object LActeco: TLFLabel
              Left = 26
              Top = 113
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Acteco'
            end
            object LSucursal: TLFLabel
              Left = 19
              Top = 132
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Sucursal'
            end
            object LCdgSIISucur: TLFLabel
              Left = 118
              Top = 12
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'CdgSIISucur'
            end
            object LFLabel1: TLFLabel
              Left = 134
              Top = 32
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'DirOrigen'
            end
            object LCmnaOrigen: TLFLabel
              Left = 120
              Top = 53
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'CmnaOrigen'
            end
            object LCiudadOrigen: TLFLabel
              Left = 114
              Top = 73
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'CiudadOrigen'
            end
            object LCdgVendedor: TLFLabel
              Left = 113
              Top = 93
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'CdgVendedor'
            end
            object DBERUTEmisor: TLFDbedit
              Left = 62
              Top = 9
              Width = 50
              Height = 21
              DataField = 'RUTEMISOR'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 0
            end
            object DBERznSoc: TLFDbedit
              Left = 62
              Top = 29
              Width = 50
              Height = 21
              DataField = 'RZNSOC'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 1
            end
            object DBEGiroEmis: TLFDbedit
              Left = 62
              Top = 49
              Width = 50
              Height = 21
              DataField = 'GIROEMIS'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 2
            end
            object DBETelefono: TLFDbedit
              Left = 62
              Top = 69
              Width = 50
              Height = 21
              DataField = 'TELEFONO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 3
            end
            object DBECorreoEmisor: TLFDbedit
              Left = 62
              Top = 89
              Width = 50
              Height = 21
              DataField = 'CORREOEMISOR'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 4
            end
            object DBEActeco: TLFDbedit
              Left = 62
              Top = 109
              Width = 50
              Height = 21
              DataField = 'ACTECO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 5
            end
            object DBESucursal: TLFDbedit
              Left = 62
              Top = 129
              Width = 50
              Height = 21
              DataField = 'SUCURSAL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 6
            end
            object DBECdgSIISucur: TLFDbedit
              Left = 180
              Top = 9
              Width = 50
              Height = 21
              Hint = 
                'C'#243'digo num'#233'rico entregado por el SII, que identifica a cada sucu' +
                'rsal que est'#225' identificada en el Servicio de Impuestos Internos.' +
                ' Si no hay sucursales se puede omitir.'
              DataField = 'CDGSIISUCUR'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 7
            end
            object DBEDirOrigen: TLFDbedit
              Left = 180
              Top = 29
              Width = 50
              Height = 21
              DataField = 'DIRORIGEN'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 8
            end
            object DBECmnaOrigen: TLFDbedit
              Left = 180
              Top = 49
              Width = 50
              Height = 21
              DataField = 'CMNAORIGEN'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 9
            end
            object DBECiudadOrigen: TLFDbedit
              Left = 180
              Top = 69
              Width = 50
              Height = 21
              DataField = 'CIUDADORIGEN'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 10
            end
            object DBECdgVendedor: TLFDbedit
              Left = 180
              Top = 89
              Width = 50
              Height = 21
              DataField = 'CDGVENDEDOR'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 11
            end
          end
          object grpReceptor: TGroupBox
            Left = 601
            Top = 0
            Width = 312
            Height = 198
            Align = alLeft
            Caption = 'Receptor'
            TabOrder = 1
            object LRUTRecep: TLFLabel
              Left = 4
              Top = 12
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'LRUTRecep'
            end
            object LCdgIntRecep: TLFLabel
              Left = 14
              Top = 32
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'CdgIntRcp'
            end
            object LRznSocRecep: TLFLabel
              Left = 7
              Top = 53
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'RznSocRcp'
            end
            object LGiroRecep: TLFLabel
              Left = 14
              Top = 73
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'GiroRecep'
            end
            object LContactoRecep: TLFLabel
              Left = 22
              Top = 93
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Contacto'
            end
            object LCorreoRecep: TLFLabel
              Left = 2
              Top = 113
              Width = 63
              Height = 13
              Alignment = taRightJustify
              Caption = 'CorreoRecep'
            end
            object LDirRecep: TLFLabel
              Left = 20
              Top = 133
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'DirRecep'
            end
            object LCmnaRecep: TLFLabel
              Left = 125
              Top = 12
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'CmnaRecep'
            end
            object LCiudadRecep: TLFLabel
              Left = 119
              Top = 32
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'CiudadRecep'
            end
            object LDirPostal: TLFLabel
              Left = 142
              Top = 53
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'DirPostal'
            end
            object LCmnaPostal: TLFLabel
              Left = 128
              Top = 73
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'CmnaPostal'
            end
            object LCiudadPostal: TLFLabel
              Left = 122
              Top = 93
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'CiudadPostal'
            end
            object DBERUTRecep: TLFDbedit
              Left = 67
              Top = 9
              Width = 50
              Height = 21
              DataField = 'RUTRECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 0
            end
            object DBECdgIntRecep: TLFDbedit
              Left = 67
              Top = 29
              Width = 50
              Height = 21
              DataField = 'CDGINTRECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 1
            end
            object DBERznSocRecep: TLFDbedit
              Left = 67
              Top = 49
              Width = 50
              Height = 21
              DataField = 'RZNSOCRECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 2
            end
            object DBEGiroRecep: TLFDbedit
              Left = 67
              Top = 69
              Width = 50
              Height = 21
              DataField = 'GIRORECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 3
            end
            object DBEContactoRecep: TLFDbedit
              Left = 67
              Top = 89
              Width = 50
              Height = 21
              DataField = 'CONTACTO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 4
            end
            object DBECorreoRecep: TLFDbedit
              Left = 67
              Top = 109
              Width = 50
              Height = 21
              DataField = 'CORREORECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 5
            end
            object DBEDirRecep: TLFDbedit
              Left = 67
              Top = 130
              Width = 50
              Height = 21
              DataField = 'DIRRECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 6
            end
            object DBECmnaRecep: TLFDbedit
              Left = 186
              Top = 9
              Width = 50
              Height = 21
              DataField = 'CMNARECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 7
            end
            object LCiudadRecep2: TLFFibDBEditFind
              Left = 186
              Top = 29
              Width = 50
              Height = 21
              DataField = 'CIUDADRECEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 8
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
            end
            object DBEDirPostal: TLFDbedit
              Left = 186
              Top = 49
              Width = 50
              Height = 21
              DataField = 'DIRPOSTAL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 9
            end
            object DBECmnaPostal: TLFDbedit
              Left = 186
              Top = 69
              Width = 50
              Height = 21
              DataField = 'CMNAPOSTAL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 10
            end
            object DBECiudadPostal: TLFDbedit
              Left = 186
              Top = 89
              Width = 50
              Height = 21
              DataField = 'CIUDADPOSTAL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 11
            end
            object grpExtranjero: TGroupBox
              Left = 238
              Top = 8
              Width = 71
              Height = 161
              Caption = 'Extranjero'
              TabOrder = 12
              object LNacionalidad: TLFLabel
                Left = 4
                Top = 48
                Width = 62
                Height = 13
                Caption = 'Nacionalidad'
              end
              object LTipoDocID: TLFLabel
                Left = 4
                Top = 82
                Width = 52
                Height = 13
                Caption = 'TipoDocID'
              end
              object LNumId: TLFLabel
                Left = 4
                Top = 15
                Width = 31
                Height = 13
                Caption = 'NumId'
              end
              object DBETipoDocID: TLFDbedit
                Left = 4
                Top = 97
                Width = 50
                Height = 21
                DataField = 'TIPODOCID'
                DataSource = DMFacturas.DSQMCabeceraFEChile
                TabOrder = 0
              end
              object DBENumId: TLFDbedit
                Left = 4
                Top = 28
                Width = 50
                Height = 21
                DataField = 'NUMID'
                DataSource = DMFacturas.DSQMCabeceraFEChile
                TabOrder = 1
              end
              object DBENacionalidad: TLFDbedit
                Left = 4
                Top = 61
                Width = 50
                Height = 21
                DataField = 'NACIONALIDAD'
                DataSource = DMFacturas.DSQMCabeceraFEChile
                TabOrder = 2
              end
            end
          end
          object grpTransporte: TGroupBox
            Left = 1119
            Top = 0
            Width = 114
            Height = 198
            Align = alLeft
            Caption = 'Transporte'
            TabOrder = 2
            object LPatente: TLFLabel
              Left = 14
              Top = 12
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'LPatente'
            end
            object LRUTTrans: TLFLabel
              Left = 7
              Top = 32
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'RUTTrans'
            end
            object LRUTChofer: TLFLabel
              Left = 3
              Top = 53
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'RUTChofer'
            end
            object LNombreChofer: TLFLabel
              Left = 4
              Top = 73
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'NomChofer'
            end
            object LDirDest: TLFLabel
              Left = 22
              Top = 93
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'DirDest'
            end
            object LCmnaDest: TLFLabel
              Left = 8
              Top = 113
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'CmnaDest'
            end
            object LCiudadDest: TLFLabel
              Left = 2
              Top = 132
              Width = 55
              Height = 13
              Alignment = taRightJustify
              Caption = 'CiudadDest'
            end
            object DBEPatente: TLFDbedit
              Left = 60
              Top = 9
              Width = 50
              Height = 21
              DataField = 'PATENTE'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 0
            end
            object DBERUTTrans: TLFDbedit
              Left = 60
              Top = 29
              Width = 50
              Height = 21
              DataField = 'RUTTRANS'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 1
            end
            object DBERUTChofer: TLFDbedit
              Left = 60
              Top = 49
              Width = 50
              Height = 21
              DataField = 'RUTCHOFER'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 2
            end
            object DBENombreChofer: TLFDbedit
              Left = 60
              Top = 69
              Width = 50
              Height = 21
              DataField = 'NOMBRECHOFER'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 3
            end
            object DBEDirDest: TLFDbedit
              Left = 60
              Top = 89
              Width = 50
              Height = 21
              DataField = 'DIRDEST'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 4
            end
            object DBECmnaDest: TLFDbedit
              Left = 60
              Top = 109
              Width = 50
              Height = 21
              DataField = 'CMNADEST'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 5
            end
            object DBECiudadDest: TLFDbedit
              Left = 60
              Top = 129
              Width = 50
              Height = 21
              DataField = 'CIUDADDEST'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 6
            end
          end
          object grpIdDoc: TGroupBox
            Left = 0
            Top = 0
            Width = 366
            Height = 198
            Align = alLeft
            Caption = 'IdDoc'
            TabOrder = 3
            object LIndServicio: TLFLabel
              Left = 12
              Top = 12
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ind Servicio'
            end
            object LMntBruto: TLFLabel
              Left = 22
              Top = 32
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'Mnt Bruto'
            end
            object LTpoTranCompra: TLFLabel
              Left = 0
              Top = 53
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'TpoTranComp'
            end
            object LTpoTranVenta: TLFLabel
              Left = -1
              Top = 73
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'TpoTranVenta'
            end
            object LFmaPago: TLFLabel
              Left = 23
              Top = 93
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'FmaPago'
            end
            object LFchCancel: TLFLabel
              Left = 14
              Top = 113
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fch Cancel'
            end
            object LMntCancel: TLFLabel
              Left = 17
              Top = 132
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'MntCancel'
            end
            object LSaldoInsol: TLFLabel
              Left = 138
              Top = 12
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'SaldoInsol'
            end
            object LMedioPago: TLFLabel
              Left = 133
              Top = 32
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'MedioPago'
            end
            object LTipoCtaPago: TLFLabel
              Left = 131
              Top = 53
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'TipCtaPago'
            end
            object LNumCtaPago: TLFLabel
              Left = 138
              Top = 73
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'NCtaPago'
            end
            object LBcoPago: TLFLabel
              Left = 143
              Top = 93
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'BcoPago'
            end
            object LTermPagoCdg: TLFLabel
              Left = 131
              Top = 113
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'TrmPagCdg'
            end
            object LTermPagoGlosa: TLFLabel
              Left = 123
              Top = 132
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'TrmPagGlosa'
            end
            object LTermPagoDias: TLFLabel
              Left = 251
              Top = 12
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'TrmPagDias'
            end
            object LFchVenc: TLFLabel
              Left = 266
              Top = 32
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'FchVenc'
            end
            object LTipoFactEsp: TLFLabel
              Left = 249
              Top = 53
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'TipoFactEsp'
            end
            object CBIndServicio: TLFDBComboBoxValue
              Left = 71
              Top = 9
              Width = 50
              Height = 21
              DataField = 'INDSERVICIO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                '1: Factura de servicios peri'#243'dicos domiciliarios2'
                '2: Factura de otros servicios peri'#243'dicos'
                
                  '3: Factura de Servicios. (en caso de Factura de Exportaci'#243'n: Ser' +
                  'vicios calificados como tal por Aduana)'
                '4: Servicios de Hoteler'#237'a'
                '5: Servicio de Transporte Terrestre Internacional')
              Values.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5')
              TabOrder = 0
            end
            object DBEMntBruto: TLFDbedit
              Left = 71
              Top = 29
              Width = 50
              Height = 21
              DataField = 'MNTBRUTO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 1
            end
            object CBTpoTranCompra: TLFDBComboBoxValue
              Left = 71
              Top = 49
              Width = 50
              Height = 21
              Hint = 
                '1: Compras del Giro'#13#10'2: Compras en Supermercados o similares'#13#10'3:' +
                ' Adquisici'#243'n Bien Ra'#237'z.'#13#10'4: Compra Activo Fijo'#13#10'5: Compra con IV' +
                'A Uso Com'#250'n'#13#10'6: Compra sin derecho a Cr'#233'dito'#13#10'7: Compra que no c' +
                'orresponde incluir'
              DataField = 'TPOTRANCOMPRA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                '1: Compras del Giro'
                '2: Compras en Supermercados o similares'
                '3: Adquisici'#243'n Bien Ra'#237'z.'
                '4: Compra Activo Fijo'
                '5: Compra con IVA Uso Com'#250'n'
                '6: Compra sin derecho a Cr'#233'dito'
                '7: Compra que no corresponde incluir')
              Values.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7')
              TabOrder = 2
            end
            object DBCBTipoTranVenta: TLFDBComboBoxValue
              Left = 71
              Top = 69
              Width = 50
              Height = 21
              Hint = '|1: Ventas del Giro'#13#10'2: Venta Activo Fijo'#13#10'3: Venta Bien Ra'#237'z'
              DataField = 'TPOTRANVENTA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                '1: Ventas del Giro'
                '2: Venta Activo Fijo'
                '3: Venta Bien Ra'#237'z')
              Values.Strings = (
                '1'
                '2'
                '3')
              TabOrder = 3
            end
            object CBFmaPago: TLFDBComboBoxValue
              Left = 71
              Top = 89
              Width = 50
              Height = 21
              Hint = '|1: Contado'#13#10'2: Cr'#233'dito'#13#10'3: Sin costo (entrega gratuita)'
              DataField = 'FMAPAGO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                '1: Contado'
                '2: Cr'#233'dito'
                '3: Sin costo (entrega gratuita)')
              Values.Strings = (
                '1'
                '2'
                '3')
              TabOrder = 4
            end
            object DBDFchCancel: TLFDBDateEdit
              Left = 71
              Top = 109
              Width = 50
              Height = 20
              Hint = 
                '|Campo Obligatorio para Factura de exportaci'#243'n cuando en'#13#10' '#8220'Form' +
                'a de Pago Exportaci'#243'n'#8221' se indique '#8220'anticipo'#8221
              DataField = 'FCHCANCEL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 5
            end
            object LFDbedit1: TLFDbedit
              Left = 71
              Top = 129
              Width = 50
              Height = 21
              DataField = 'MNTCANCEL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 6
            end
            object DESaldoInsol: TLFDbedit
              Left = 191
              Top = 9
              Width = 50
              Height = 21
              DataField = 'SALDOINSOL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 7
            end
            object CBMedioPago: TLFDBComboBoxValue
              Left = 191
              Top = 29
              Width = 50
              Height = 21
              DataField = 'MEDIOPAGO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                'CH: Cheque'
                'CF: Cheque a fecha '
                'LT:letra'
                'EF:Efectivo'
                'PE: Pago A Cta. Cte. '
                'TC:Tarjeta Cr'#233'dito '
                'OT:Otro')
              Values.Strings = (
                'CH'
                'CF'
                'LT'
                'EF'
                'PE'
                'TC'
                'OT')
              TabOrder = 8
            end
            object CBTipoCtaPago: TLFDBComboBoxValue
              Left = 191
              Top = 49
              Width = 50
              Height = 21
              DataField = 'TIPOCTAPAGO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                'CT: Cta.Cte'
                'AH:Ahorro'
                'OT:Otra')
              Values.Strings = (
                'CT'
                'AH'
                'OT')
              TabOrder = 9
            end
            object DBENumCtaPago: TLFDbedit
              Left = 191
              Top = 69
              Width = 50
              Height = 21
              DataField = 'NUMCTAPAGO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 10
            end
            object DBEBcoPago: TLFDbedit
              Left = 191
              Top = 89
              Width = 50
              Height = 21
              DataField = 'BCOPAGO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 11
            end
            object DBETermPagoCdg: TLFDbedit
              Left = 191
              Top = 109
              Width = 50
              Height = 21
              DataField = 'TERMPAGOCDG'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 12
            end
            object DBETermPagoGlosa: TLFDbedit
              Left = 191
              Top = 129
              Width = 50
              Height = 21
              DataField = 'TERMPAGOGLOSA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 13
            end
            object LFDbedit2: TLFDbedit
              Left = 312
              Top = 9
              Width = 50
              Height = 21
              DataField = 'TERMPAGODIAS'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 14
            end
            object DBDFchVenc: TLFDBDateEdit
              Left = 312
              Top = 29
              Width = 50
              Height = 21
              DataField = 'FCHVENC'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 15
            end
            object CBTipoFactEsp: TLFDBComboBoxValue
              Left = 312
              Top = 49
              Width = 50
              Height = 21
              DataField = 'TIPOFACTESP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9')
              Values.Strings = (
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7'
                '8'
                '9')
              TabOrder = 16
            end
            object pnlEncabezado: TPanel
              Left = 243
              Top = 89
              Width = 121
              Height = 57
              TabOrder = 17
              object LRUTMandante: TLFLabel
                Left = 6
                Top = 31
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'RUTMndnte'
              end
              object LRUTSolicita: TLFLabel
                Left = 8
                Top = 7
                Width = 57
                Height = 13
                Alignment = taRightJustify
                Caption = 'RUTSolicita'
              end
              object DBERUTMandante: TLFDbedit
                Left = 68
                Top = 28
                Width = 50
                Height = 21
                DataField = 'RUTMANDANTE'
                DataSource = DMFacturas.DSQMCabeceraFEChile
                TabOrder = 0
              end
              object DBERUTSolicita: TLFDbedit
                Left = 68
                Top = 4
                Width = 50
                Height = 21
                DataField = 'RUTSOLICITA'
                DataSource = DMFacturas.DSQMCabeceraFEChile
                TabOrder = 1
              end
            end
          end
          object grpTotales: TGroupBox
            Left = 913
            Top = 0
            Width = 206
            Height = 198
            Align = alLeft
            Caption = 'Totales'
            TabOrder = 4
            object LMntNeto: TLFLabel
              Left = 7
              Top = 12
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'MntNeto'
            end
            object MntExe: TLFLabel
              Left = 12
              Top = 32
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'MntExe'
            end
            object LMntBase: TLFLabel
              Left = 6
              Top = 53
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'MntBase'
            end
            object LMntMargCom: TLFLabel
              Left = 2
              Top = 73
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'MMrgnCo'
            end
            object LTasaIVA: TLFLabel
              Left = 7
              Top = 93
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'TasaIVA'
            end
            object LIVA: TLFLabel
              Left = 31
              Top = 113
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA'
            end
            object LIVAProp: TLFLabel
              Left = 9
              Top = 132
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVAProp'
            end
            object LIVATerc: TLFLabel
              Left = 109
              Top = 12
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVATerc'
            end
            object LCredEC: TLFLabel
              Left = 112
              Top = 32
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'CredEC'
            end
            object LGrntDep: TLFLabel
              Left = 108
              Top = 53
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'GrntDep'
            end
            object LMntTotal: TLFLabel
              Left = 106
              Top = 73
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'MntTotal'
            end
            object LMontoNF: TLFLabel
              Left = 104
              Top = 93
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'MontoNF'
            end
            object LMontoPeriodo: TLFLabel
              Left = 114
              Top = 113
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'MntPer'
            end
            object LSaldoAnterior: TLFLabel
              Left = 105
              Top = 132
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'SaldoAnt'
            end
            object LVlrPagar: TLFLabel
              Left = 107
              Top = 152
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'VlrPagar'
            end
            object DBEMntNeto: TLFDbedit
              Left = 51
              Top = 9
              Width = 50
              Height = 21
              DataField = 'MNTNETO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 0
            end
            object DBEMntExe: TLFDbedit
              Left = 51
              Top = 29
              Width = 50
              Height = 21
              DataField = 'MNTEXE'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 1
            end
            object DBEMntBase: TLFDbedit
              Left = 51
              Top = 49
              Width = 50
              Height = 21
              DataField = 'MNTBASE'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 2
            end
            object DBEMntMargenCom: TLFDbedit
              Left = 51
              Top = 69
              Width = 50
              Height = 21
              DataField = 'MNTMARGENCOM'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 3
            end
            object DBETasaIVA: TLFDbedit
              Left = 51
              Top = 89
              Width = 50
              Height = 21
              DataField = 'TASAIVA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 4
            end
            object DBEIVA: TLFDbedit
              Left = 51
              Top = 109
              Width = 50
              Height = 21
              DataField = 'IVA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 5
            end
            object DBEIVAProp: TLFDbedit
              Left = 51
              Top = 129
              Width = 50
              Height = 21
              DataField = 'VAPROP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 6
            end
            object DBEIVATerc: TLFDbedit
              Left = 150
              Top = 9
              Width = 50
              Height = 21
              DataField = 'IVATERC'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 7
            end
            object DBECredEC: TLFDbedit
              Left = 150
              Top = 29
              Width = 50
              Height = 21
              DataField = 'CREDEC'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 8
            end
            object DBEGrntDep: TLFDbedit
              Left = 150
              Top = 49
              Width = 50
              Height = 21
              DataField = 'GRNTDEP'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 9
            end
            object DBEMntTotal: TLFDbedit
              Left = 150
              Top = 69
              Width = 50
              Height = 21
              DataField = 'MNTTOTAL'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 10
            end
            object DBEMontoNF: TLFDbedit
              Left = 150
              Top = 89
              Width = 50
              Height = 21
              DataField = 'MONTONF'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 11
            end
            object DBEMontoPeriodo: TLFDbedit
              Left = 150
              Top = 109
              Width = 50
              Height = 21
              DataField = 'MONTOPERIODO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 12
            end
            object DBESaldoAnterior: TLFDbedit
              Left = 150
              Top = 129
              Width = 50
              Height = 21
              DataField = 'SALDOANTERIOR'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 13
            end
            object DBEVlrPagar: TLFDbedit
              Left = 150
              Top = 149
              Width = 50
              Height = 21
              DataField = 'VLRPAGAR'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 14
            end
          end
          object grpOtraMoneda: TGroupBox
            Left = 1233
            Top = 0
            Width = 225
            Height = 198
            Align = alLeft
            Caption = 'Otra Moneda'
            TabOrder = 5
            object LTpoMoneda: TLFLabel
              Left = 14
              Top = 12
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'TpoMnda'
            end
            object LTpoCambio: TLFLabel
              Left = 14
              Top = 32
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'TpoCamb'
            end
            object LMntNetoOtrMnda: TLFLabel
              Left = 14
              Top = 53
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'MtNOtMa'
            end
            object LMntExeOtrMnda: TLFLabel
              Left = 10
              Top = 73
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'MExOMda'
            end
            object LMntFaeCarneOtrMnda: TLFLabel
              Left = 6
              Top = 93
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'MFCrnOMa'
            end
            object LMntMargComOtrMnda: TLFLabel
              Left = 3
              Top = 113
              Width = 57
              Height = 13
              Alignment = taRightJustify
              Caption = 'MMrgCOMd'
            end
            object LIVAOtrMnda: TLFLabel
              Left = 2
              Top = 132
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVAOtrMnda'
            end
            object LIVANoRetOtrMnda: TLFLabel
              Left = 114
              Top = 12
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVANRtOM'
            end
            object LMntTotOtrMnda: TLFLabel
              Left = 122
              Top = 32
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'MTOMnd'
            end
            object CBTpoMoneda: TLFDBComboBoxValue
              Left = 63
              Top = 9
              Width = 50
              Height = 21
              DataField = 'TPOMONEDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              ItemHeight = 13
              Items.Strings = (
                'DOLAR USA'
                'EURO'
                'PESO CL')
              Values.Strings = (
                'DOLAR USA'
                'EURO'
                'PESO CL')
              TabOrder = 0
            end
            object DBETpoCambio: TLFDbedit
              Left = 63
              Top = 29
              Width = 50
              Height = 21
              DataField = 'TPOCAMBIO'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 1
            end
            object DBEMntNetoOtrMnda: TLFDbedit
              Left = 63
              Top = 49
              Width = 50
              Height = 21
              DataField = 'MNTNETOOTRMNDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 2
            end
            object DBEMntExeOtrMnda: TLFDbedit
              Left = 63
              Top = 69
              Width = 50
              Height = 21
              DataField = 'MNTEXEOTRMNDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 3
            end
            object DBEMntFaeCarneOtrMnda: TLFDbedit
              Left = 63
              Top = 89
              Width = 50
              Height = 21
              DataField = 'MNTFAECARNEOTRMNDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 4
            end
            object LFDbedit6: TLFDbedit
              Left = 63
              Top = 109
              Width = 50
              Height = 21
              DataField = 'MNTMARGCOMOTRMNDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 5
            end
            object DBEIVAOtrMnda: TLFDbedit
              Left = 63
              Top = 129
              Width = 50
              Height = 21
              DataField = 'IVAOTRMNDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 6
            end
            object DBEIVANoRetOtrMnda: TLFDbedit
              Left = 170
              Top = 9
              Width = 50
              Height = 21
              DataField = 'VANORETOTRMNDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 7
            end
            object LFDbedit9: TLFDbedit
              Left = 170
              Top = 29
              Width = 50
              Height = 21
              DataField = 'MNTTOTOTRMNDA'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              TabOrder = 8
            end
          end
        end
      end
      object TSOtrosChile: TTabSheet
        Caption = 'Otros Chile'
        ImageIndex = 5
        object PCabOtrosChile: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 24
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object NavOtrosChile: THYMNavigator
            Left = 8
            Top = 0
            Width = 87
            Height = 25
            DataSource = DMFacturas.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            ParentShowHint = False
            PopupMenu = CEOtrosChilePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFOtrosTipoDocumentoTributario
            Exclusivo = True
            ControlEdit = CEOtrosChile
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PEdOtrosChile: TLFPanel
          Left = 0
          Top = 24
          Width = 1270
          Height = 196
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LOtrosTipoVenta: TLFLabel
            Left = 21
            Top = 53
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Venta'
          end
          object LOtrosCodigoGiroCliente: TLFLabel
            Left = 12
            Top = 75
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Giro Cli.'
          end
          object LOtrosCodigoGiroEmpresa: TLFLabel
            Left = 2
            Top = 97
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Giro Emp.'
          end
          object LOtrosTipoDocumentoTributario: TLFLabel
            Left = 26
            Top = 141
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Doc. Trib.'
          end
          object LOtrosTipoDespacho: TLFLabel
            Left = 11
            Top = 119
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Despacho'
          end
          object LOtrosTipoDocIdentificacion: TLFLabel
            Left = 18
            Top = 11
            Width = 55
            Height = 13
            Hint = 'TrackID'
            Alignment = taRightJustify
            Caption = 'Documento'
          end
          object LOtrosFolio: TLFLabel
            Left = 298
            Top = 142
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Folio'
          end
          object LOtrosSiiTrackID: TLFLabel
            Left = 165
            Top = 31
            Width = 10
            Height = 13
            Hint = 'TrackID'
            Caption = 'T.'
          end
          object LOtrosFmaPagoSII: TLFLabel
            Left = 36
            Top = 31
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Pago'
          end
          object DBEFOtrosTipoVenta: TLFDBEditFind2000
            Left = 78
            Top = 51
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TIPO_VENTA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 4
            OnChange = DBEFOtrosTipoVentaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_COMPRA_VENTA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object EOtrosTipoVenta: TLFEdit
            Left = 143
            Top = 51
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 5
          end
          object DBEFOtrosCodigoGiroCliente: TLFDBEditFind2000
            Left = 78
            Top = 73
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CODIGO_GIRO_CLIENTE'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 6
            OnChange = DBEFOtrosCodigoGiroClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMP_CLIENTES_GIROS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO_GIRO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'DEFECTO DESC, CODIGO_GIRO')
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object EOtrosCodigoGiroCliente: TLFEdit
            Left = 143
            Top = 73
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 7
          end
          object EOtrosCodigoGiroEmpresa: TLFEdit
            Left = 143
            Top = 95
            Width = 240
            Height = 21
            TabStop = False
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
            TabOrder = 9
          end
          object DBEFOtrosCodigoGiroEmpresa: TLFDBEditFind2000
            Left = 78
            Top = 95
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CODIGO_GIRO_EMPRESA'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 8
            OnChange = DBEFOtrosCodigoGiroEmpresaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SYS_EMPRESAS_GIROS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO_GIRO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'DEFECTO DESC, CODIGO_GIRO')
            Filtros = [obEmpresa]
            Entorno = DMFacturas.EntornoDoc
          end
          object DBEFOtrosTipoDocumentoTributario: TLFDBEditFind2000
            Left = 78
            Top = 139
            Width = 64
            Height = 21
            DataField = 'TIPO_DOC_TRIBUTARIO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 12
            OnChange = DBEFOtrosTipoDocumentoTributarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'VISIBLE_FAC=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object EOtrosTipoDocumentoTributario: TLFEdit
            Left = 143
            Top = 139
            Width = 152
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
            TabOrder = 13
          end
          object EOtrosTipoDespachoTitulo: TLFEdit
            Left = 143
            Top = 117
            Width = 240
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
            TabOrder = 11
          end
          object DBEOtrosTipoDespacho: TLFDBEditFind2000
            Left = 78
            Top = 117
            Width = 64
            Height = 21
            DataField = 'ID_TIPO_DESPACHO'
            DataSource = DMFacturas.DSQMCabecera
            TabOrder = 10
            OnChange = DBEOtrosTipoDespachoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SII_PARAMETROS_FACTURA_ELEC'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'PARAMETRO='#39'TIPO_DESPACHO'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEOtrosTipoDespachoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBEOtrosNIF: TLFDbedit
            Left = 143
            Top = 7
            Width = 240
            Height = 21
            Hint = 'TrackID'
            TabStop = False
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMFacturas.DSxCliente
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEOtrosTipoDocIdentificacion: TLFDbedit
            Left = 78
            Top = 7
            Width = 64
            Height = 21
            Hint = 'TrackID'
            Color = clInfoBk
            DataField = 'TIPO_DOC_IDENT'
            DataSource = DMFacturas.DSxCliente
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEOtrosFolio: TLFDbedit
            Left = 322
            Top = 139
            Width = 61
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'FOLIO'
            DataSource = DMFacturas.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBEOtrosSiiTrackID: TLFDbedit
            Left = 179
            Top = 29
            Width = 204
            Height = 21
            Hint = 'TrackID'
            TabStop = False
            Color = clInfoBk
            DataField = 'SII_TRACKID'
            DataSource = DMFacturas.DSQMCabeceraFEChile
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBCBOtrosFmaPagoSII: TLFDBComboBoxValue
            Left = 78
            Top = 29
            Width = 83
            Height = 21
            DataField = 'SII_FMA_PAGO'
            DataSource = DMFacturas.DSQMCabecera
            ItemHeight = 13
            Items.Strings = (
              '1: Contado'
              '2: Cr'#233'dito'
              '3: Sin costo (entrega gratuita)')
            Values.Strings = (
              '1'
              '2'
              '3')
            TabOrder = 2
          end
          object GBReferenciasDte: TGroupBox
            Left = 400
            Top = 0
            Width = 481
            Height = 173
            Caption = 'Referencia(s)'
            TabOrder = 15
            object PNLReferenciasDte: TLFPanel
              Left = 2
              Top = 15
              Width = 477
              Height = 156
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LTpoDocRef: TLFLabel
                Left = 98
                Top = 33
                Width = 64
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Doc Ref'
              end
              object LFolioRef: TLFLabel
                Left = 235
                Top = 55
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Folio Ref.'
              end
              object LRUTOtr: TLFLabel
                Left = 116
                Top = 77
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'RUT Otro'
              end
              object LFchRef: TLFLabel
                Left = 298
                Top = 77
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Ref.'
              end
              object LCodRef: TLFLabel
                Left = 74
                Top = 99
                Width = 88
                Height = 13
                Alignment = taRightJustify
                Caption = 'C'#243'digo Referencia'
              end
              object LRazonRef: TLFLabel
                Left = 76
                Top = 121
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Raz'#243'n Referencia'
              end
              object LIdDocRef: TLFLabel
                Left = 102
                Top = 55
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'ID Doc. Ref.'
              end
              object DBGFReferenciasDte: TDBGridFind2000
                Left = 0
                Top = 29
                Width = 56
                Height = 127
                Align = alLeft
                DataSource = DMFacturas.DSQMSIIDteReferencia
                Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
                ReadOnly = True
                TabOrder = 9
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
                  'TPODOCREF')
                CamposAMostrar.Strings = (
                  'TPODOCREF'
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
                  'CODIGO')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SII_TIPO_DOCUMENTO_TRIBUTARIO')
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
                    Expanded = False
                    FieldName = 'NROLINREF'
                    Width = 30
                    Visible = True
                  end>
              end
              object DBERUTOtr: TLFDbedit
                Left = 168
                Top = 73
                Width = 117
                Height = 21
                DataField = 'RUTOTR'
                DataSource = DMFacturas.DSQMSIIDteReferencia
                TabOrder = 4
              end
              object DBERazonRef: TLFDbedit
                Left = 168
                Top = 117
                Width = 288
                Height = 21
                DataField = 'RAZONREF'
                DataSource = DMFacturas.DSQMSIIDteReferencia
                TabOrder = 7
              end
              object ETipoDocTribTitulo: TLFEdit
                Left = 209
                Top = 29
                Width = 247
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
                TabOrder = 1
                Text = 'ETipoDocTribTitulo'
              end
              object CBCodRef: TLFDBComboBoxValue
                Left = 168
                Top = 95
                Width = 288
                Height = 21
                DataField = 'CODREF'
                DataSource = DMFacturas.DSQMSIIDteReferencia
                ItemHeight = 13
                Items.Strings = (
                  'Anula Documento de Referencia'
                  'Corrige Texto Documento de Referencia'
                  'Corrige montos')
                Values.Strings = (
                  '1'
                  '2'
                  '3')
                TabOrder = 6
                OnChange = CBCodRefChange
              end
              object DBDFchRef: TLFDBDateEdit
                Left = 355
                Top = 73
                Width = 101
                Height = 21
                DataField = 'FCHREF'
                DataSource = DMFacturas.DSQMSIIDteReferencia
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 5
              end
              object DBETpoDocRef: TLFDBEditFind2000
                Left = 168
                Top = 29
                Width = 40
                Height = 21
                DataField = 'TPODOCREF'
                DataSource = DMFacturas.DSQMSIIDteReferencia
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnChange = DBETpoDocRefChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODIGO'
                CampoStr = 'TITULO'
                CampoADevolver = 'CODIGO'
                CondicionBusqueda = 'VISIBLE_FAC = 1'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'CODIGO')
                Filtros = []
              end
              object DBEIdDocRef: TLFDbedit
                Left = 168
                Top = 51
                Width = 60
                Height = 21
                Hint = 'ID de documento relacionado a la nota de cr'#233'dito o d'#233'bito'
                DataField = 'ID_S_REF'
                DataSource = DMFacturas.DSQMSIIDteReferencia
                TabOrder = 2
              end
              object DBEFolioRef: TLFDbedit
                Left = 284
                Top = 51
                Width = 172
                Height = 21
                DataField = 'FOLIOREF'
                DataSource = DMFacturas.DSQMSIIDteReferencia
                TabOrder = 3
              end
              object PNLReferenciasDteCab: TPanel
                Left = 0
                Top = 0
                Width = 477
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 8
                object NavReferenciasDte: THYMNavigator
                  Left = 0
                  Top = 1
                  Width = 240
                  Height = 25
                  DataSource = DMFacturas.DSQMSIIDteReferencia
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
            end
          end
          object GBFactoring: TGroupBox
            Left = 884
            Top = 0
            Width = 397
            Height = 67
            Caption = 'Factoring'
            TabOrder = 16
            object LFactoringStatus: TLFLabel
              Left = 11
              Top = 20
              Width = 33
              Height = 13
              Caption = 'Estado'
            end
            object LFactoringTrackID: TLFLabel
              Left = 3
              Top = 42
              Width = 42
              Height = 13
              Caption = 'Track ID'
            end
            object DBEFactoringStatus: TLFDbedit
              Left = 48
              Top = 16
              Width = 34
              Height = 21
              Color = clInfoBk
              DataField = 'STATUS'
              DataSource = DMFacturas.DSxFactoring
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = DBEFactoringStatusChange
            end
            object DBEFactoringTrackID: TLFDbedit
              Left = 48
              Top = 38
              Width = 346
              Height = 21
              Color = clInfoBk
              DataField = 'TRACKID'
              DataSource = DMFacturas.DSxFactoring
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object ETituloStatus: TLFEdit
              Left = 83
              Top = 16
              Width = 311
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object GBDTEEnvio: TGroupBox
            Left = 884
            Top = 64
            Width = 397
            Height = 109
            Caption = 'DTE Envio'
            TabOrder = 17
            object LDTETrackID: TLFLabel
              Left = 4
              Top = 19
              Width = 42
              Height = 13
              Caption = 'Track ID'
            end
            object DBEDTETrackID: TLFDbedit
              Left = 51
              Top = 16
              Width = 342
              Height = 21
              Color = clInfoBk
              DataField = 'SII_TRACKID'
              DataSource = DMFacturas.DSQMCabeceraFEChile
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
          end
        end
      end
      object TSProveedores: TTabSheet
        Caption = 'Proveedores'
        ImageIndex = 7
        OnShow = TSProveedoresShow
        object PNLProveedores: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 22
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          TabOrder = 0
          object PNLProveedoresCab: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LProveedoresFecha: TLFLabel
              Left = 543
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LProveedoresSuReferencia: TLFLabel
              Left = 345
              Top = 3
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Referencia'
              Layout = tlCenter
            end
            object DBEProveedoresFecha: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMFacturas.DSQMCabecera
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
            object DBEProveedoresTitulo: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMFacturas.DSQMCabecera
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
            object DBEProveedoresRIG: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMFacturas.DSQMCabecera
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
            object DBEProveedoresSuReferencia: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMFacturas.DSQMCabecera
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
          object NavProveedores: THYMNavigator
            Left = 655
            Top = 0
            Width = 160
            Height = 22
            DataSource = DMFacturas.DSxProveedores
            VisibleButtons = [nbPrior, nbNext, nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEProveedoresPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGProveedores
            InsertaControl = DBGProveedores
            Exclusivo = False
            ControlEdit = CEProveedores
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGProveedores: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1270
          Height = 198
          Align = alClient
          DataSource = DMFacturas.DSxProveedores
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
          Transaction = DMFacturas.TLocal
          BuscarNums = False
          Campos.Strings = (
            'PROVEEDOR'
            'ARTICULO')
          CamposAMostrar.Strings = (
            'PROVEEDOR'
            '1'
            'NOMBRE_R_SOCIAL'
            'ARTICULO'
            '0')
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
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'FECHA_ENTREGA'
            'NOMBRE_COMERCIAL'
            'NOMBRE_R_SOCIAL'
            'OBSERVACIONES'
            'PRECIO'
            'PROVEEDOR'
            'TITULO'
            'UTILIZAR_COSTE')
          ColumnasCheckBoxes.Strings = (
            'UTILIZAR_COSTE')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'PROVEEDOR'
            'ARTICULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_PROVEEDORES_CUENTAS'
            'VER_ARTICULOS_EF')
          Acciones.Strings = (
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'PROVEEDOR'
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMFacturas.EntornoDoc
          Columns = <
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UTILIZAR_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONES'
              Width = 300
              Visible = True
            end>
        end
      end
      object TSEnvioECF: TTabSheet
        Caption = 'Envio ECF'
        ImageIndex = 9
        OnShow = TSEnvioECFShow
        object PNLEnvioECF: TLFPanel
          Left = 209
          Top = 22
          Width = 560
          Height = 198
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object GBDatosConsultaECF: TGroupBox
            Left = 0
            Top = 88
            Width = 560
            Height = 110
            Align = alClient
            Caption = 'Datos Consulta ECF'
            TabOrder = 1
            object LENCF: TLFLabel
              Left = 61
              Top = 20
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'ENCF'
            end
            object LStatusConsulta: TLFLabel
              Left = 58
              Top = 42
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Status'
            end
            object LLegalStatusConsulta: TLFLabel
              Left = 361
              Top = 42
              Width = 59
              Height = 13
              Alignment = taRightJustify
              Caption = 'Legal Status'
            end
            object LTrackID: TLFLabel
              Left = 49
              Top = 65
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'TrackID'
            end
            object SBConsultaEstadoECF: TSpeedButton
              Left = 424
              Top = 60
              Width = 121
              Height = 22
              Caption = 'Consulta Estado ECF'
              OnClick = SBConsultaEstadoECFClick
            end
            object LMensajeErrCon: TLFLabel
              Left = 3
              Top = 87
              Width = 87
              Height = 13
              Caption = 'Mensaje Error Con'
            end
            object DBEENCF: TLFDbedit
              Left = 93
              Top = 16
              Width = 452
              Height = 21
              Color = clInfoBk
              DataField = 'ENCF'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEStatusConsulta: TLFDbedit
              Left = 93
              Top = 38
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'STATUS_CONSULTA'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBELegalStatusConsulta: TLFDbedit
              Left = 424
              Top = 38
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'LEGAL_STATUS_CONSULTA'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBETrackID: TLFDbedit
              Left = 93
              Top = 61
              Width = 324
              Height = 21
              Color = clInfoBk
              DataField = 'TRACK_ID'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object CBSeqConsumed: TLFDBCheckBox
              Left = 219
              Top = 39
              Width = 95
              Height = 17
              Caption = 'Seq. Consumed'
              ClicksDisabled = False
              ColorCheck = 57088
              Layout = checkboxRight
              TabOrder = 2
              TabStop = True
              BiDiMode = bdLeftToRight
              ParentBiDiMode = False
              Alignment = taLeftJustify
              DataField = 'SEQUENCE_CONSUMED'
              DataSource = DMFacturas.DSxFacturaDGII
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEMensajeErrCon: TFIBDBEditfind
              Left = 93
              Top = 83
              Width = 452
              Height = 21
              Color = clInfoBk
              DataField = 'MENSAJE_ERROR_CONSULTA_ECF'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
            end
          end
          object GBDatosEnvioECF: TGroupBox
            Left = 0
            Top = 0
            Width = 560
            Height = 88
            Align = alTop
            Caption = 'Datos Envio ECF'
            TabOrder = 0
            object LStatusEnvio: TLFLabel
              Left = 59
              Top = 42
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Status'
            end
            object LSecurityCode: TLFLabel
              Left = 353
              Top = 43
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'Security Code'
            end
            object LMMensajeErrorECF: TLFLabel
              Left = 4
              Top = 65
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Mensaje Error Env'
            end
            object LIDEnvio: TLFLabel
              Left = 48
              Top = 20
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'ID Envio'
            end
            object LCodigoErrorEnvio: TLFLabel
              Left = 218
              Top = 42
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cod. Error'
            end
            object DBEStatusEnvio: TLFDbedit
              Left = 93
              Top = 38
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'STATUS'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBESecurityCode: TLFDbedit
              Left = 424
              Top = 38
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'SECURITY_CODE'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEMMensajeErrorECF: TLFDbedit
              Left = 93
              Top = 60
              Width = 452
              Height = 21
              Color = clInfoBk
              DataField = 'MENSAJE_ERROR_ENVIO_ECF'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEIDEnvio: TLFDbedit
              Left = 93
              Top = 16
              Width = 452
              Height = 21
              Color = clInfoBk
              DataField = 'ID_ENVIO'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBECodErrorEnvio: TLFDbedit
              Left = 270
              Top = 38
              Width = 76
              Height = 21
              Color = clInfoBk
              DataField = 'CODIGO_ERROR_ENVIO'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
        end
        object PNLQRECF: TPanel
          Left = 0
          Top = 22
          Width = 209
          Height = 198
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object ImgQRECF: TImage
            Left = 0
            Top = 21
            Width = 209
            Height = 177
            Align = alClient
          end
          object PNLEnlaceQR: TPanel
            Left = 0
            Top = 0
            Width = 209
            Height = 21
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LQRECF: TLFLabel
              Left = 1
              Top = 1
              Width = 16
              Height = 13
              Alignment = taRightJustify
              Caption = 'QR'
            end
            object DBEQRECF: TLFDbedit
              Left = 21
              Top = 0
              Width = 187
              Height = 21
              Color = clInfoBk
              DataField = 'DOCUMENT_STAMP_URL'
              DataSource = DMFacturas.DSxFacturaDGII
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
        end
        object PNLCabEnvioECF: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object LEnvioECFReferencua: TLFLabel
            Left = 344
            Top = 4
            Width = 52
            Height = 13
            Caption = 'Referencia'
          end
          object LEnvioECFFecha: TLFLabel
            Left = 541
            Top = 3
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object DBEEnvioECFTitulo: TLFDbedit
            Left = 70
            Top = 0
            Width = 267
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturas.DSxCliente
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEEnvioECFReferencia: TLFDbedit
            Left = 401
            Top = 0
            Width = 133
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SU_REFERENCIA'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEEnvioECFRIG: TLFDbedit
            Left = 0
            Top = 0
            Width = 69
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMFacturas.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            OnChange = DBEFBancoDireccionChange
          end
          object DBEEnvioECFFecha: TLFDbedit
            Left = 577
            Top = 0
            Width = 71
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'FECHA'
            DataSource = DMFacturas.DSQMCabecera
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
        object PNLReferencia: TPanel
          Left = 769
          Top = 22
          Width = 501
          Height = 198
          Align = alClient
          Alignment = taLeftJustify
          BevelOuter = bvNone
          TabOrder = 3
          object GBReferencia: TGroupBox
            Left = 0
            Top = 0
            Width = 501
            Height = 198
            Align = alClient
            Caption = 'Referencia'
            TabOrder = 0
            object LTipoCF: TLFLabel
              Left = 44
              Top = 52
              Width = 37
              Height = 13
              Caption = 'Tipo CF'
            end
            object LID_S_REF: TLFLabel
              Left = 23
              Top = 74
              Width = 58
              Height = 13
              Caption = 'ID Doc REF'
            end
            object LTipoRef: TLFLabel
              Left = 3
              Top = 96
              Width = 76
              Height = 13
              Caption = 'Tipo Referencia'
            end
            object PnlReferenciaDGII: TLFPanel
              Left = 2
              Top = 15
              Width = 497
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object NavDGIIReferencias: THYMNavigator
                Left = 0
                Top = 0
                Width = 240
                Height = 25
                DataSource = DMFacturas.DSQMDGIIReferencias
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
            object ETipoCFTitulo: TLFEdit
              Left = 141
              Top = 48
              Width = 323
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBEFTipoCF: TLFDBEditFind2000
              Left = 83
              Top = 48
              Width = 57
              Height = 21
              DataField = 'TIPO_CF_REF'
              DataSource = DMFacturas.DSQMDGIIReferencias
              TabOrder = 1
              OnChange = DBEFTipoCFChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'Z_SYS_TIPO_NCF'
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = []
            end
            object DBEID_S: TLFDbedit
              Left = 83
              Top = 70
              Width = 57
              Height = 21
              Color = clInfoBk
              DataField = 'ID_S_REF'
              DataSource = DMFacturas.DSQMDGIIReferencias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object EENCFRef: TLFDbedit
              Left = 141
              Top = 70
              Width = 323
              Height = 21
              Color = clInfoBk
              DataField = 'ENCF_REF'
              DataSource = DMFacturas.DSQMDGIIReferencias
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object CBTipoRef: TLFDBComboBoxValue
              Left = 83
              Top = 92
              Width = 382
              Height = 21
              DataField = 'TIPO_REF'
              DataSource = DMFacturas.DSQMDGIIReferencias
              ItemHeight = 13
              Items.Strings = (
                'Desconocido'
                'Anulaci'#243'n total'
                'Corrige texto del comprobante fiscal modificado'
                'Corrige montos del NCF modificado'
                'Reemplazo NCF emitido en contingencia')
              Values.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4')
              TabOrder = 5
              OnChange = CBTipoRefChange
            end
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 280
    Width = 1284
    Height = 308
    inherited TBDetalle: TLFToolBar
      Width = 1284
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 3
      inherited NavDetalle: THYMNavigator
        DataSource = DMFacturas.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        DelMessage = #191'Desea borrar la l'#237'nea? '
        EditaControl = DBGFDetalle1
        InsertaControl = DBGFDetalle1
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object ToolButton1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtNotas: TToolButton
        Left = 228
        Top = 0
        Hint = 'Edita las notas de la l'#237'nea seleccionada'
        Action = ANotasDetalle
        ParentShowHint = False
        ShowHint = True
      end
      object TButtInfStocks: TToolButton
        Left = 251
        Top = 0
        Action = AInfoStocks
        ParentShowHint = False
        ShowHint = True
      end
      object TButtUnidadesExt: TToolButton
        Left = 274
        Top = 0
        Action = AUnidadesExt
        ParentShowHint = False
        ShowHint = True
      end
      object TButtPrecios: TToolButton
        Left = 297
        Top = 0
        Action = APreciosTarifa
        ParentShowHint = False
        ShowHint = True
      end
      object TButtInfoHistorico: TToolButton
        Left = 320
        Top = 0
        Action = AInfoHistorico
        ParentShowHint = False
        ShowHint = True
      end
      object TButtHerencia: TToolButton
        Left = 343
        Top = 0
        Action = AHerencia
      end
      object TButtProcedencia: TToolButton
        Left = 366
        Top = 0
        Hint = 'Procedencia de la l'#237'nea'
        Action = AProcedencia
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton8: TToolButton
        Left = 389
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSerializacion: TToolButton
        Left = 397
        Top = 0
        Action = ASerializacion
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton10: TToolButton
        Left = 420
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBInfoLotes: TToolButton
        Left = 428
        Top = 0
        Action = AInfoLotes
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton11: TToolButton
        Left = 451
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBArtCli: TToolButton
        Left = 459
        Top = 0
        Action = AArtCli
        ParentShowHint = False
        ShowHint = True
      end
      object TBCliArt: TToolButton
        Left = 482
        Top = 0
        Action = ACliArt
      end
      object TButtCambiaDescripcion: TToolButton
        Left = 505
        Top = 0
        Action = ACambiaTitulo
        ParentShowHint = False
        ShowHint = True
      end
      object TButtMuestraUbicacion: TToolButton
        Left = 528
        Top = 0
        Action = AMuestraUbicacion
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton6: TToolButton
        Left = 551
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRecibos: TToolButton
        Left = 559
        Top = 0
        Action = ARecibos
      end
      object TButtBuscarArticulo: TToolButton
        Left = 582
        Top = 0
        Action = ABuscarArticulo
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object TBDescargaLector: TToolButton
        Left = 605
        Top = 0
        Action = ADescargaLector
      end
      object TButtDuplicarLinea: TToolButton
        Left = 628
        Top = 0
        Action = ADuplicarLinea
      end
      object TBCondicionesClientes: TToolButton
        Left = 651
        Top = 0
        Action = ACondicionesClientes
      end
      object TButtImportarDetalle: TToolButton
        Left = 674
        Top = 0
        Action = AImportarDetalle
      end
      object TButtDetalles: TToolButton
        Left = 697
        Top = 0
        Action = ADetallesDeLinea
      end
      object LBLCertificado: TLFLabel
        Left = 720
        Top = 0
        Width = 60
        Height = 22
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Cert. Ant.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DBECertificadoAnt: TLFDbedit
        Left = 780
        Top = 0
        Width = 100
        Height = 22
        TabStop = False
        Color = clInfoBk
        DataField = 'IMPORTE'
        DataSource = DMFacturas.DSxCertificadoAnt
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
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1284
      Height = 231
    end
    object PCPie: TLFPageControl
      Left = 0
      Top = 253
      Width = 1284
      Height = 55
      ActivePage = TSPieGen
      Align = alBottom
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabPosition = tpBottom
      TabActiveColor = clWhite
      TabInactiveColor = clWhite
      object TSPieGen: TTabSheet
        Caption = '&Gen'#233'rico'
        object PPieGenerico: TLFPanel
          Left = 0
          Top = 0
          Width = 1276
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 2
          Enabled = False
          TabOrder = 0
          object PNLPieUnidades: TLFPanel
            Left = 2
            Top = 2
            Width = 233
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object LSumUnidades: TLFLabel
              Left = 0
              Top = 4
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Uds. (U/L/S)'
              Layout = tlCenter
            end
            object DBESumUnidades: TLFDbedit
              Left = 66
              Top = 0
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBESumUdsLog: TLFDbedit
              Left = 122
              Top = 0
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_LOGISTICAS'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBESumUdsSec: TLFDbedit
              Left = 178
              Top = 0
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_SEC'
              DataSource = DMFacturas.DSxInfoActualizada
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
          object PNLPieInfo: TLFPanel
            Left = 235
            Top = 2
            Width = 295
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object LPieBultos: TLFLabel
              Left = 54
              Top = 4
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bultos'
              Layout = tlCenter
            end
            object LSumaPeso: TLFLabel
              Left = 122
              Top = 4
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso'
              Layout = tlCenter
            end
            object LCantLineas: TLFLabel
              Left = 0
              Top = 4
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lin.'
              Layout = tlCenter
            end
            object LMargen: TLFLabel
              Left = 210
              Top = 4
              Width = 36
              Height = 13
              Caption = 'Margen'
            end
            object DBEBultos: TLFDbedit
              Left = 86
              Top = 0
              Width = 30
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'BULTOS'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBECOUNT_LINEAS: TLFDbedit
              Left = 21
              Top = 0
              Width = 30
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'COUNT_LINEA'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBESumaPeso: TLFDbedit
              Left = 150
              Top = 0
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_PESO'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBEMargen: TLFDbedit
              Left = 250
              Top = 0
              Width = 45
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'MARGEN'
              DataSource = DMFacturas.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              OnChange = DBEMargenChange
            end
          end
          object PNLInfoImportes: TLFPanel
            Left = 530
            Top = 2
            Width = 744
            Height = 25
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LPieTotal: TLFLabel
              Left = 458
              Top = 4
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'TOTAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Layout = tlCenter
            end
            object LPieBaseImponible: TLFLabel
              Left = 0
              Top = 4
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'B. Imp.'
              Layout = tlCenter
            end
            object LPieIVARec: TLFLabel
              Left = 126
              Top = 4
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA y Rec.'
              Layout = tlCenter
            end
            object LPieLiquido: TLFLabel
              Left = 327
              Top = 4
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'quido'
              Layout = tlCenter
            end
            object DBECuotaIVA: TLFDbedit
              Left = 180
              Top = 0
              Width = 70
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_IVA'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBECuotaRec: TLFDbedit
              Left = 251
              Top = 0
              Width = 70
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_RE'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBELiquido: TLFDbedit
              Left = 367
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'LIQUIDO'
              DataSource = DMFacturas.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBES_BaseImponible: TLFDbedit
              Left = 36
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_BASES'
              DataSource = DMFacturas.DSxInfoActualizada
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
            object DBETotalaCobrar: TLFDbedit
              Left = 502
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TOTAL_A_COBRAR'
              DataSource = DMFacturas.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
      end
      object TSPieRetCom: TTabSheet
        Caption = '&Retenciones/Comisiones'
        ImageIndex = 1
        object PPieRetenciones: TLFPanel
          Left = 0
          Top = 0
          Width = 1288
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LPieBaseRetencion: TLFLabel
            Left = 107
            Top = 5
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Retenci'#243'n'
            Layout = tlCenter
          end
          object LPieImporteRetencion: TLFLabel
            Left = 300
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LpieBaseComision: TLFLabel
            Left = 447
            Top = 5
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Comisi'#243'n'
            FocusControl = DBEBaseComision
            Layout = tlCenter
          end
          object LPieImporteComision: TLFLabel
            Left = 634
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            FocusControl = DBEImp_Comision
            Layout = tlCenter
          end
          object DBEBaseRetencionFac: TLFDbedit
            Left = 192
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_BASE_RETENCION'
            DataSource = DMFacturas.DSxInfoActualizada
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
          object DBEI_RetencionFac: TLFDbedit
            Left = 340
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_RETENCION'
            DataSource = DMFacturas.DSxInfoActualizada
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
          object DBEBaseComision: TLFDbedit
            Left = 522
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_COMISION'
            DataSource = DMFacturas.DSxInfoActualizada
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
          object DBEImp_Comision: TLFDbedit
            Left = 674
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_COMISION'
            DataSource = DMFacturas.DSxInfoActualizada
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
      end
      object TSPieCarDtos: TTabSheet
        Caption = '&Cargos y Descuentos'
        ImageIndex = 2
        object PPieComisiones: TLFPanel
          Left = 0
          Top = 0
          Width = 1288
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LPieBaseDescuentoLinea: TLFLabel
            Left = 290
            Top = 5
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Layout = tlCenter
          end
          object LPieImporte: TLFLabel
            Left = 475
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LPieImporteFinanciacion: TLFLabel
            Left = 84
            Top = 5
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Financiaci'#243'n'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object LPieImporteBase: TLFLabel
            Left = 618
            Top = 5
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Bases'
            Layout = tlCenter
          end
          object DBEBaseDtoEnLinea: TLFDbedit
            Left = 374
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_DTO_LINEAS'
            DataSource = DMFacturas.DSxInfoActualizada
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
          object DBEImpDtoEnLinea: TLFDbedit
            Left = 514
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMFacturas.DSxInfoActualizada
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
          object DBEImpFinanciacion: TLFDbedit
            Left = 188
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMFacturas.DSxInfoActualizada
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
          object DBESumaBases: TLFDbedit
            Left = 674
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'S_BASES'
            DataSource = DMFacturas.DSxInfoActualizada
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
      end
    end
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 22
      Width = 1284
      Height = 231
      ActivePage = TSArticulos
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
      OnChange = PCDetalleChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSArticulos: TTabSheet
        Caption = '&Art'#237'culos'
        object DBGFDetalle1: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 1276
          Height = 203
          Align = alClient
          Ctl3D = True
          DataSource = DMFacturas.DSQMDetalle
          DefaultDrawing = False
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalle1CellClick
          OnColEnter = DBGFDetalle1ColEnter
          OnDrawColumnCell = DBGFDetalle1DrawColumnCell
          OnDblClick = DBGFDetalle1DblClick
          OnKeyDown = DBGFDetalle1KeyDown
          OnKeyPress = DBGFDetalle1KeyPress
          OnKeyUp = DBGFDetalle1KeyUp
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 2
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = True
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          BuscarChars = False
          Campos.Strings = (
            'ARTICULO'
            'ARTICULO'
            'ARTICULO'
            'TIPO_IVA'
            'PROYECTO'
            'TIPO_LINEA_KRI'
            'TIPO_UNIDAD_LOGISTICA'
            'CUENTA'
            'DIRECCION_ENTREGA'
            'ALMACEN'
            'ARTICULO'
            'TIPO_IMPUESTO_ADICIONAL')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0'
            'ARTICULO'
            '3'
            'ALFA_1'
            'ALFA_2'
            'FABRICANTE'
            'ARTICULO'
            '0'
            'TIPO_IVA'
            '1'
            'P_IVA'
            'PROYECTO'
            '0'
            'TIPO_LINEA_KRI'
            '0'
            'TIPO_UNIDAD_LOGISTICA'
            '0'
            'CUENTA'
            '0'
            'DIRECCION_ENTREGA'
            '0'
            'ALMACEN'
            '0'
            'ARTICULO'
            '1'
            'TITULO_ARTICULO_CLIENTE'
            'TIPO_IMPUESTO_ADICIONAL'
            '0')
          CamposAMostrarAnchos.Strings = (
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
          CamposADevolver.Strings = (
            'ARTICULO'
            ''
            'ARTICULO'
            ''
            ''
            ''
            'TIPO'
            ''
            'DIRECCION'
            'ALMACEN'
            'ARTICULO'
            '')
          CamposDesplegar.Strings = (
            '0'
            '1'
            '0'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ARTICULO'
            'FECHA_PRE_DET'
            'ORDEN'
            'TITULO'
            'LINEA'
            'PRECIO')
          ColumnasCheckBoxes.Strings = (
            'APLICA_UNIDADES_SECUNDARIAS'
            'MANIPULACION'
            'INVERSION_SUJETO_PASIVO')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'BARRAS'
            'ARTICULO'
            'NSERIE'
            'TIPO'
            'PROYECTO'
            'ID'
            'TIPO'
            'CUENTA'
            'DIRECCION'
            'ALMACEN'
            'CODIGO_CLIENTE'
            'TIPO')
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tablas.Strings = (
            'VER_ARTICULOS_CON_BARRAS'
            'VER_ARTICULOS_EF'
            'ART_ARTICULOS_SERIALIZACION'
            'SYS_TIPO_IVA'
            'EMP_PROYECTOS'
            'SYS_TIPO_LINEA_VENTA_KRI'
            'VER_ARTICULOS_UNID_LOG'
            'CON_CUENTAS'
            'SYS_TERCEROS_DIRECCIONES'
            'ART_ALMACENES'
            'VER_ARTICULOS_COD_CLI'
            'SYS_TIPO_IMPUESTO_ADICIONAL')
          Acciones.Strings = (
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '')
          Titulos.Strings = (
            'TIPO'
            'TITULO'
            'NSERIE'
            'TITULO'
            'TITULO'
            'TITULO'
            'TITULO'
            'TITULO'
            'DIR_COMPLETA'
            'TITULO'
            'TITULO_ARTICULO'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFDetalle1Busqueda
          OnCampoDevuelve = DBGFDetalle1CampoDevuelve
          OnExiste = DBGFDetalle1Existe
          OnRowChange = DBGFDetalle1RowChange
          Planes.Strings = (
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'BARRAS'
            'ARTICULO'
            'NSERIE'
            'TIPO'
            'PROYECTO'
            'ID'
            'TIPO'
            'CUENTA'
            'DIRECCION'
            'ALMACEN'
            'CODIGO_CLIENTE'
            'TIPO')
          Filtros = []
          Entorno = DMFacturas.EntornoDoc
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ORDEN'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 320
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Title.Alignment = taRightJustify
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SIGNO_UNIDADES'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Title.Alignment = taRightJustify
              Width = 85
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_COSTE'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_ADICIONAL'
              Width = 77
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T_COSTE'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M_BRUTO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MARGEN'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO'
              Title.Alignment = taRightJustify
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IVA'
              Width = 36
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_IVA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'B_COMISION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_2'
              Title.Alignment = taRightJustify
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO_3'
              Title.Alignment = taRightJustify
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_UNIDAD_LOGISTICA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_UNIDAD_LOGISTICA'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_LOGISTICAS'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_SEC'
              Title.Alignment = taRightJustify
              Width = 46
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_EXT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 52
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TOTAL_UNIDADES_EXT'
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_LINEA_KRI'
              Width = 25
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'I_DESCUENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PIEZAS_X_BULTO'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'BULTOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMISION'
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'I_COMISION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMISION_LINEAL'
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'I_COMISION_LINEAL'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 65
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_RECARGO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 42
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'B_DTO_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 116
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REC_DET'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROYECTO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION_ENTREGA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_CLIENTE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_CLIENTE'
              Width = 230
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPO_LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 31
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA_RELACION'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MANIPULACION'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INVERSION_SUJETO_PASIVO'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IMPUESTO_ADICIONAL'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'P_IMPUESTO_ADICIONAL'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LOTE'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_TOTAL'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_REAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDAD_FOMENTO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ECOTASA'
              ReadOnly = True
              Width = 50
              Visible = True
            end>
        end
      end
      object TSArticulosCertificados: TTabSheet
        Caption = 'Art'#237'culos &Certificados'
        ImageIndex = 1
        object DBGFDetalleCertificado: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 942
          Height = 131
          Align = alClient
          Ctl3D = True
          DataSource = DMFacturas.DSQMDetalleCertificado
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentCtl3D = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFDetalleCertificadoCellClick
          OnDrawColumnCell = DBGFDetalleCertificadoDrawColumnCell
          OnDblClick = DBGFDetalleCertificadoDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 2
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = True
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          BuscarChars = False
          Campos.Strings = (
            'ARTICULO'
            'ARTICULO'
            'ARTICULO'
            'TIPO_IVA'
            'PROYECTO')
          CamposAMostrar.Strings = (
            'ARTICULO'
            '0'
            'ARTICULO'
            '0'
            'ARTICULO'
            '0'
            'TIPO_IVA'
            '1'
            'P_IVA'
            'PROYECTO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            'ARTICULO'
            ''
            'ARTICULO'
            ''
            '')
          CamposDesplegar.Strings = (
            '0'
            '1'
            '0'
            '1'
            '1')
          CampoAOrdenarColor = clBlack
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'APLICA_UNIDADES_SECUNDARIAS')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'BARRAS'
            'ARTICULO'
            'NSERIE'
            'TIPO'
            'PROYECTO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_ARTICULOS_CON_BARRAS'
            'VER_ARTICULOS_EF'
            'ART_ARTICULOS_SERIALIZACION'
            'SYS_TIPO_IVA'
            'EMP_PROYECTOS')
          Acciones.Strings = (
            ''
            ''
            ''
            ''
            '')
          Titulos.Strings = (
            'TIPO'
            'TITULO'
            'NSERIE'
            'TITULO'
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            ''
            ''
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            ''
            ''
            ''
            '')
          Filtros = []
          Entorno = DMFacturas.EntornoDoc
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 38
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_RELACION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 31
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 335
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_SEC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 53
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_EXT'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 67
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRECIO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO_2'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESCUENTO_3'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'B_IMPONIBLE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Title.Alignment = taRightJustify
              Visible = False
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 588
    Width = 1284
    ButtonWidth = 75
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PEdCabecera
    Complementario = TBDetalle
    Left = 20
    Top = 354
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 20
    Top = 322
  end
  inherited ALMain: TLFActionList
    Left = 292
    Top = 354
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AInformeFactura: TAction
      Category = 'Listados'
      Caption = 'Informe Factura'
      Hint = 'Informe Factura'
      ImageIndex = 14
      OnExecute = AInformeFacturaExecute
    end
    object AHerencia: TAction
      Category = 'Otros'
      Caption = 'Herencia'
      Hint = 'Herencia'
      ImageIndex = 97
      OnExecute = AHerenciaExecute
    end
    object ACambiarNombre: TAction
      Category = 'Procesos'
      Caption = 'Cambiar a Nombre Comercial'
      Hint = 'Cambiar a Nombre Comercial'
      ImageIndex = 17
      OnExecute = ACambiarNombreExecute
    end
    object LFCategoryAction7: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Quitar Filtro'
      Hint = 'Muestra todos los documentos'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AFiltroAbierto: TAction
      Category = 'Filtros'
      Caption = 'Abierto'
      Hint = 'Muestra documentos abiertos'
      ImageIndex = 5
      OnExecute = AFiltroAbiertoExecute
    end
    object AFiltroCerrado: TAction
      Category = 'Filtros'
      Caption = 'Cerrados'
      Hint = 'Muestra documentos cerrados'
      ImageIndex = 5
      OnExecute = AFiltroCerradoExecute
    end
    object AAdjuntosFactura: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de la Factura'
      ImageIndex = 59
      OnExecute = AAdjuntosFacturaExecute
    end
    object AInformeFactura2: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Factura 2'
      Hint = 'Informe Factura 2'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformeFactura2Execute
    end
    object AInformeFactura3: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Factura 3'
      Hint = 'Informe Factura 3'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformeFactura3Execute
    end
    object AInformeFactura4: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Factura 4'
      Hint = 'Informe Factura 4'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformeFactura4Execute
    end
    object AFacturasDiarias: TAction
      Category = 'Listados'
      Caption = 'Facturas Diarias'
      Hint = 'Facturas Diarias'
      ImageIndex = 14
      OnExecute = AFacturasDiariasExecute
    end
    object AVisualizarFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Visualizar Facturas Filtradas'
      Hint = 'Visualizar Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AVisualizarFacturasFiltradasExecute
    end
    object AImprimirFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Facturas Filtradas'
      Hint = 'Imprimir Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AImprimirFacturasFiltradasExecute
    end
    object AVisualizarMail: TAction
      Category = 'Listados'
      Caption = 'Visualizar Factura e-mail'
      Hint = 'Visualizar Factura e-mail'
      ImageIndex = 34
      OnExecute = AVisualizarMailExecute
    end
    object AEnviarFacturaMail: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Factura por e-mail'
      Hint = 'Enviar Factura por e-mail'
      ImageIndex = 34
      OnExecute = AEnviarFacturaMailExecute
    end
    object AEnviarFacturaMailPdf: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Factura por e-mail en Pdf (directo)'
      Hint = 'Enviar Factura por e-mail en Pdf'
      ImageIndex = 34
      ShortCut = 49229
      OnExecute = AEnviarFacturaMailPdfExecute
    end
    object AEnviarFacturaMailPdf2: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar factura por e-mail en Pdf (mensaje)'
      Hint = 'Enviar factura por e-mail en Pdf con cliente de correo'
      ImageIndex = 34
      OnExecute = AEnviarFacturaMailPdf2Execute
    end
    object AEnviarFacturaElectronicaMX: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Factura Electr'#243'nica'
      Hint = 'Enviar factura electr'#243'nica'
      ImageIndex = 34
      OnExecute = AEnviarFacturaElectronicaMXExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Envio por E-Mail'
      ImageIndex = 34
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AResumenFacturas: TAction
      Category = 'Listados'
      Caption = 'Resumen Facturas'
      Hint = 'Resumen Facturas'
      ImageIndex = 14
      OnExecute = AResumenFacturasExecute
    end
    object AResumenFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Resumen Facturas Filtradas'
      Hint = 'Resumen Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AResumenFacturasFiltradasExecute
    end
    object AImprimirResumenFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Resumen Facturas Filtradas'
      Hint = 'Imprimir Resumen Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AImprimirResumenFacturasFiltradasExecute
    end
    object AListadoArticulos: TAction
      Category = 'Listados'
      Caption = 'Listado por Articulos'
      Hint = 'Listado por Articulos'
      ImageIndex = 14
      OnExecute = AListadoArticulosExecute
    end
    object AVisRecibosFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Visualiza los recibos de las facturas filtradas'
      Hint = 'Visualiza los recibos de las facturas filtradas'
      ImageIndex = 14
      OnExecute = AVisRecibosFacturasFiltradasExecute
    end
    object AImpRecibosFacturasFiltradas: TAction
      Tag = 1
      Category = 'Listados'
      Caption = 'Imprime los recibos de las facturas filtradas'
      Hint = 'Visualiza los recibos de las facturas filtradas'
      ImageIndex = 14
      OnExecute = AVisRecibosFacturasFiltradasExecute
    end
    object ARecibosDeLaFactura: TAction
      Category = 'Listados'
      Caption = 'Recibos de la Factura'
      Hint = 'Recibos de la Factura'
      ImageIndex = 14
      OnExecute = ARecibosDeLaFacturaExecute
    end
    object ASep6: TAction
      Category = 'Listados'
      Caption = '-'
      Hint = '-'
    end
    object ARecibosFacturas: TAction
      Category = 'Listados'
      Caption = 'Recibos de Facturas'
      Hint = 'Recibos de Facturas'
      ImageIndex = 14
      OnExecute = ARecibosFacturasExecute
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
    object AListadoUbicaciones: TAction
      Category = 'Listados'
      Caption = 'Listado de Ubicaciones'
      Hint = 'Listado de Ubicaciones'
      ImageIndex = 14
      OnExecute = AListadoUbicacionesExecute
    end
    object ASep3: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AConfFacturas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Facturas'
      Hint = 'Listado de Facturas'
      ImageIndex = 77
      OnExecute = AConfFacturasExecute
    end
    object AConfFacturasFechaCliente: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Facturas entre Fechas y Clientes'
      Hint = 'Listado de Facturas entre Fechas y Clientes'
      ImageIndex = 77
      OnExecute = AConfFacturasFechaClienteExecute
    end
    object AConfFacturasArticulo: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Facturas por Art'#237'culo'
      Hint = 'Listado de Facturas por Art'#237'culo'
      ImageIndex = 77
      OnExecute = AConfFacturasArticuloExecute
    end
    object AConfRecibosFacturas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Recibos de Facturas'
      Hint = 'Listado de Recibos de Facturas'
      ImageIndex = 77
      OnExecute = AConfRecibosFacturasExecute
    end
    object AConfEtiquetas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiquetas'
      Hint = 'Etiquetas'
      ImageIndex = 77
      OnExecute = AConfEtiquetasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object ASep4: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Factura'
      Hint = 'Cerrar Factura (Ctrl+Alt+F)'
      ImageIndex = 68
      ShortCut = 49222
      OnExecute = AAbrirCerrarExecute
    end
    object ASep5: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AFacturaMulti: TAction
      Category = 'Procesos'
      Caption = 'Traspaso de Facturas MultiCanal'
      Hint = 'Traspaso de Facturas MultiCanal'
      ImageIndex = 132
      OnExecute = AFacturaMultiExecute
    end
    object ASep7: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ADuplicar: TAction
      Category = 'Procesos'
      Caption = 'Duplicar Factura'
      Hint = 'Duplicar Factura'
      ImageIndex = 37
      OnExecute = ADuplicarExecute
    end
    object ACondicionesClientes: TAction
      Category = 'Procesos'
      Caption = 'Regenerar Condiciones de Clientes'
      Hint = 'Regenerar Condiciones de Clientes'
      ImageIndex = 25
      OnExecute = ACondicionesClientesExecute
    end
    object ADevolucion: TAction
      Category = 'Procesos'
      Caption = 'Genera devoluci'#243'n'
      Hint = 'Genera Devoluci'#243'n'
      ImageIndex = 39
      OnExecute = ADevolucionExecute
    end
    object AAnulaDocumento: TAction
      Category = 'Procesos'
      Caption = 'Marca el documento como anulado / pendiente'
      Hint = 'Marca el documento como anulado / pendiente'
      ImageIndex = 27
      OnExecute = AAnulaDocumentoExecute
    end
    object ARefrescaDetalle: TAction
      Category = 'Procesos'
      Caption = 'Recalcula el Detalle'
      Hint = 'Recalcula el Detalle'
      ImageIndex = 3
      OnExecute = ARefrescaDetalleExecute
    end
    object ACambiaFinanciacion: TAction
      Category = 'Procesos'
      Caption = 'Cambio de Financiaci'#243'n Manual'
      Hint = 'Cambio de Financiaci'#243'n Manual'
      ImageIndex = 3
      OnExecute = ACambiaFinanciacionExecute
    end
    object ACierraMasivo: TAction
      Category = 'Otros'
      Caption = 'Cierre masivo de Facturas'
      Hint = 'Cierre masivo de Facturas'
      ImageIndex = 15
      OnExecute = ACierraMasivoExecute
    end
    object ATipoIVA: TAction
      Category = 'Otros'
      Caption = 'Cambio Manual del IVA y Recargo'
      Hint = 'Cambio Manual del IVA y Recargo'
      ImageIndex = 110
      OnExecute = ATipoIVAExecute
    end
    object AVentas: TAction
      Category = 'Otros'
      Caption = 'Ventas de Art'#237'culos al Cliente'
      Hint = 'Ventas de Art'#237'culos al Cliente'
      ImageIndex = 109
      OnExecute = AVentasExecute
    end
    object AHistoricoSerializacion: TAction
      Category = 'Otros'
      Caption = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      Hint = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      ImageIndex = 115
      OnExecute = AHistoricoSerializacionExecute
    end
    object ARecibos: TAction
      Category = 'Otros'
      Caption = 'Recibos de documento'
      Hint = 'Recibos de documento'
      ImageIndex = 75
      OnExecute = ARecibosExecute
    end
    object AConfLstUbicaciones: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Ubicaciones'
      ImageIndex = 77
      OnExecute = AConfLstUbicacionesExecute
    end
    object AAnalitica: TAction
      Category = 'Otros'
      Caption = 'Asiento anl'#237'tico'
      Hint = 'Asiento Anal'#237'tico'
      ImageIndex = 21
      OnExecute = AAnaliticaExecute
    end
    object AOrdenaLineas: TAction
      Category = 'Otros'
      Caption = 'Reordena las L'#237'neas'
      Hint = 'Reordenar las lineas del documento'
      ImageIndex = 122
      OnExecute = AOrdenaLineasExecute
    end
    object AAdjuntosCliente: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Cliente'
      ImageIndex = 59
      OnExecute = AAdjuntosClienteExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AAdjuntosAgente: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Agente'
      ImageIndex = 59
      OnExecute = AAdjuntosAgenteExecute
    end
    object AAdjuntosTransportista: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Transportista'
      ImageIndex = 59
      OnExecute = AAdjuntosTransportistaExecute
    end
    object AFacturaElectronicaMX: TAction
      Category = 'Procesos'
      Caption = 'Generar factura electr'#243'nica en XML'
      Hint = 'Generar factura electr'#243'nica en XML'
      OnExecute = AFacturaElectronicaMXExecute
    end
    object AOrdenarLineasPorDireccionEntrega: TAction
      Category = 'Otros'
      Caption = 'Ordenar por Dir. Entrega'
      Hint = 'Ordena las lineas por direccion de entrega'
      ImageIndex = 122
      OnExecute = AOrdenarLineasPorDireccionEntregaExecute
    end
    object AListarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Lista Etiquetas de c'#243'digos de barras'
      Hint = 'Lista Etiquetas de los articulos del documento'
      ImageIndex = 95
      OnExecute = AListarEtiquetasExecute
    end
    object AImportarDocumentoDesdeOtraBD: TAction
      Category = 'Otros'
      Caption = 'Importar Desde otra BD'
      ImageIndex = 49
      OnExecute = AImportarDocumentoDesdeOtraBDExecute
    end
    object AFacturaElectronicaES: TAction
      Category = 'Procesos'
      Caption = 'FacturaE'
      Hint = 'Genera la Factura Electronica Espa'#241'ola'
      ImageIndex = 33
      OnExecute = AFacturaElectronicaESExecute
    end
    object ACambioPCosteLinea: TAction
      Category = 'Procesos'
      Caption = 'Cambio Precio Coste Linea'
      Hint = 'Cambia el precio de coste de la linea'
      ImageIndex = 55
      OnExecute = ACambioPCosteLineaExecute
    end
    object ACambioCosteAdicionalLinea: TAction
      Category = 'Procesos'
      Caption = 'Cambio Coste Adicional Linea'
      Hint = 'Cambia el Coste Adicional de la linea'
      ImageIndex = 55
      OnExecute = ACambioCosteAdicionalLineaExecute
    end
    object ADuplicarLinea: TAction
      Category = 'Otros'
      Caption = 'Duplicar Linea'
      Hint = 'Duplicar Linea'
      ImageIndex = 37
      OnExecute = ADuplicarLineaExecute
    end
    object ASep1: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AGenerarPackingList: TAction
      Category = 'Procesos'
      Caption = 'Generar Packing List'
      Hint = 'Generar Packing List'
      ImageIndex = 18
      OnExecute = AGenerarPackingListExecute
    end
    object AEliminarPackingList: TAction
      Category = 'Procesos'
      Caption = 'Eliminar Packing List'
      Hint = 'Eliminar el Packing List'
      ImageIndex = 22
      OnExecute = AEliminarPackingListExecute
    end
    object AEnviaDTECL: TAction
      Category = 'Procesos'
      Caption = 'Envia DTE Chile'
      Hint = 'Envia DTE Chile'
      ImageIndex = 136
      OnExecute = AEnviaDTECLExecute
    end
    object AAsignaEmpleado: TAction
      Category = 'Otros'
      Caption = 'Asigna Empleado'
      Hint = 'Asigna Empleado Atencion/Responsable'
      ImageIndex = 135
      OnExecute = AAsignaEmpleadoExecute
    end
    object ARegistroFitosanitario: TAction
      Category = 'Otros'
      Caption = 'Registro Fitosanitario'
      Hint = 'Editar Registro Fitosanitario'
      ImageIndex = 137
      OnExecute = ARegistroFitosanitarioExecute
    end
    object APedirFirma: TAction
      Category = 'Otros'
      Caption = 'Pedir Firma'
      Hint = 'Pedir Firma'
      ImageIndex = 124
      OnExecute = APedirFirmaExecute
    end
    object ABorrarFirma: TAction
      Category = 'Otros'
      Caption = 'Borrar Firma'
      Hint = 'Borrar Firma'
      ImageIndex = 124
      OnExecute = ABorrarFirmaExecute
    end
    object ACrearHerenciaManual: TAction
      Category = 'Otros'
      Caption = 'Crear Herencia Manual'
      ImageIndex = 97
      OnExecute = ACrearHerenciaManualExecute
    end
    object AMuestraDocumentosVenta: TAction
      Category = 'Otros'
      Caption = 'Muestra documentos venta del cliente'
      Hint = 'Muestra documentos venta del cliente'
      ImageIndex = 55
      ShortCut = 115
      OnExecute = AMuestraDocumentosVentaExecute
    end
    object AEnvioTBAI: TAction
      Category = 'Procesos'
      Caption = 'Envio TBAI'
      Hint = 'Envio TBAI'
      ImageIndex = 46
      OnExecute = AEnvioTBAIExecute
    end
    object AAnularTBAI: TAction
      Category = 'Procesos'
      Caption = 'Anular Ticket BAI'
      Hint = 'Anular Ticket BAI'
      ImageIndex = 46
      OnExecute = AAnularTBAIExecute
    end
    object ADetallesDeLinea: TAction
      Category = 'Otros'
      Caption = 'Detalles de Linea'
      Hint = 'Detalles de Linea'
      ImageIndex = 18
      OnExecute = ADetallesDeLineaExecute
    end
    object AEnviaDTE: TAction
      Category = 'Procesos'
      Caption = 'Envia DTE'
      ImageIndex = 136
    end
    object AExportarExcel: TAction
      Category = 'Listados'
      Caption = 'Exportar Excel'
      Hint = 'Exportar Documento a Excel'
      ImageIndex = 105
      OnExecute = AExportarExcelExecute
    end
    object ABorradoMasivoLineas: TAction
      Category = 'Otros'
      Caption = 'Seleccion y borrado masivo de lineas'
      Hint = 'Seleccion y borrado masivo de lineas'
      ImageIndex = 32
      OnExecute = ABorradoMasivoLineasExecute
    end
    object AImportaFacturas: TAction
      Category = 'Procesos'
      Caption = 'Importa Facturas'
      Hint = 'Importa Facturas'
      ImageIndex = 33
      OnExecute = AImportaFacturasExecute
    end
    object AImportaFacturas2: TAction
      Category = 'Procesos'
      Caption = 'Importa Facturas 2'
      Hint = 'Importa Facturas 2'
      ImageIndex = 33
      OnExecute = AImportaFacturas2Execute
    end
    object AEnviaFactoingCHL: TAction
      Category = 'Procesos'
      Caption = 'Envia Factoing'
      Hint = 'Envia Factoing'
      ImageIndex = 136
      OnExecute = AEnviaFactoingCHLExecute
    end
    object AIncrementarPrecio: TAction
      Category = 'Procesos'
      Caption = 'Incrementar Precio'
      Hint = 'Incrementar Precio'
      ImageIndex = 56
      OnExecute = AIncrementarPrecioExecute
    end
    object AResumeFactura: TAction
      Category = 'Procesos'
      Caption = 'Resume Factura'
      Hint = 'Agrupa lineas con el mismo articulo'
      ImageIndex = 122
      OnExecute = AResumeFacturaExecute
    end
    object AGeneraNotaDeCredito: TAction
      Category = 'Procesos'
      Caption = 'Genera Nota de Credito'
      Hint = 'Genera Nota de Credito'
      ImageIndex = 37
      OnExecute = AGeneraNotaDeCreditoExecute
    end
    object AGeneraNotaDeDebito: TAction
      Category = 'Procesos'
      Caption = 'Genera Nota De Debito'
      Hint = 'Genera Nota De Debito'
      ImageIndex = 37
      OnExecute = AGeneraNotaDeDebitoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 332
    Top = 322
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    SubComplementario = ALMain
    Left = 53
    Top = 354
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 53
    Top = 322
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PEdNotas
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 86
    Top = 354
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 86
    Top = 322
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
      Visible = False
    end
  end
  object ALFacturas: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 293
    Top = 322
    object ANotasDetalle: TAction
      Caption = 'Notas Detalle'
      Hint = 'Edita las notas de la linea seleccionada (CTRL+N)'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
    end
    object AInfoStocks: TAction
      Caption = 'AInfoStocks'
      Hint = 'Informaci'#243'n de Stocks'
      ImageIndex = 1
      ShortCut = 16467
      OnExecute = AInfoStocksExecute
    end
    object AProcedencia: TAction
      Caption = 'Procedencia'
      Hint = 'Procedencia de la linea'
      ImageIndex = 96
      OnExecute = AProcedenciaExecute
    end
    object AImprime: TAction
      Caption = 'AImprime'
      Hint = 'Imprime Informe'
      ImageIndex = 14
      ShortCut = 49225
      OnExecute = AImprimeExecute
    end
    object AUnidadesExt: TAction
      Caption = 'Unidades Extendidas'
      Hint = 'Unidades Extendidas'
      ImageIndex = 69
      ShortCut = 49221
      OnExecute = AUnidadesExtExecute
    end
    object APreciosTarifa: TAction
      Caption = 'Precios por Tarifa'
      Hint = 'Precios por Tarifa'
      ImageIndex = 33
      ShortCut = 49232
      OnExecute = APreciosTarifaExecute
    end
    object AInfoHistorico: TAction
      Caption = 'Hist'#243'rico de Precios'
      Hint = 'Hist'#243'rico de Precios'
      ImageIndex = 56
      ShortCut = 49224
      OnExecute = AInfoHistoricoExecute
    end
    object ASerializacion: TAction
      Caption = 'ASerializacion'
      Hint = 'Generar n'#250'meros de serializaci'#243'n'
      ImageIndex = 115
      OnExecute = ASerializacionExecute
    end
    object ABuscarNumSerie: TAction
      Caption = 'ABuscarNumSerie'
      Hint = 'Buscar Documentos por n'#250'meros de Serie'
      ImageIndex = 85
      OnExecute = ABuscarNumSerieExecute
    end
    object APVP: TAction
      Caption = 'Calcula Unidades'
      Hint = 'Obtiene Unidades en funcion del PVP'
      ShortCut = 8237
      OnExecute = APVPExecute
    end
    object ANIFFactura: TAction
      Caption = 'Datos del Cliente'
      Hint = 'Datos del Cliente'
      ShortCut = 16452
      OnExecute = ANIFFacturaExecute
    end
    object ARegistroIVA: TAction
      Caption = 'Ver registro de IVA'
      Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
      ShortCut = 49234
      OnExecute = ARegistroIVAExecute
    end
    object AAsientoFactura: TAction
      Caption = 'Ver asiento generado'
      Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
      ShortCut = 49235
      OnExecute = AAsientoFacturaExecute
    end
    object ACentroCoste: TAction
      Caption = 'Introduce Centrode Coste'
      Hint = 'Introduce Centrode Coste'
      ShortCut = 49231
      OnExecute = ACentroCosteExecute
    end
    object ANewCliente: TAction
      Caption = 'Cliente nuevo'
      OnExecute = ANewClienteExecute
    end
    object ANewAgente: TAction
      Caption = 'Agente nuevo'
      OnExecute = ANewAgenteExecute
    end
    object ANewArticulo: TAction
      Caption = 'Art'#237'culo nuevo'
      Hint = 'Crear Articulo'
      OnExecute = ANewArticuloExecute
    end
    object AACliente: TAction
      Caption = 'Ver Datos Cliente'
      Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
      ShortCut = 49219
      OnExecute = AAClienteExecute
    end
    object AAAgente: TAction
      Caption = 'Ver Datos Agente'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
      ShortCut = 49217
      OnExecute = AAAgenteExecute
    end
    object AInfoLotes: TAction
      Caption = 'Informaci'#243'n de Lotes'
      Hint = 'Informaci'#243'n de Lotes'
      ImageIndex = 120
      ShortCut = 16460
      OnExecute = AInfoLotesExecute
    end
    object AArticulo: TAction
      Caption = 'Ver Datos Articulo'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Art'#237'culo'
      ShortCut = 49236
      OnExecute = AArticuloExecute
    end
    object AArticuloCert: TAction
      Caption = 'Ver Datos Articulo'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Art'#237'culo'
      ShortCut = 49236
      OnExecute = AArticuloCertExecute
    end
    object AArtCli: TAction
      Caption = 'Muestra los Clientes que compran este  Art'#237'culo'
      Hint = 'Clientes por Art'#237'culo'
      ImageIndex = 89
      ShortCut = 49219
      OnExecute = AArtCliExecute
    end
    object ACliArt: TAction
      Caption = 'Muestra los Art'#237'culo que compran este  Clientes'
      Hint = 'Muestra los Art'#237'culo que compran este  Clientes'
      ImageIndex = 89
      OnExecute = ACliArtExecute
    end
    object ACambiaTitulo: TAction
      Hint = 'Mostrar t'#237'tulos en el idioma'
      ImageIndex = 91
      OnExecute = ACambiaTituloExecute
    end
    object AMuestraUbicacion: TAction
      Caption = 'Muestra la ubicaci'#243'n en el almac'#233'n'
      Hint = 'Muestra la ubicaci'#243'n en el almac'#233'n'
      ImageIndex = 81
      OnExecute = AMuestraUbicacionExecute
    end
    object ABuscaNIFKRI: TAction
      Caption = 'Busca en clientes varios'
      Hint = 'Busca facturas de clientes varios'
      ImageIndex = 54
      OnExecute = ABuscaNIFKRIExecute
    end
    object ADescargaLector: TAction
      Caption = 'Descarga Lector'
      Hint = 'Descarga los datos leidos con el lector de codigos de barras'
      ImageIndex = 38
      OnExecute = ADescargaLectorExecute
    end
    object ABuscarArticulo: TAction
      Caption = 'ABuscarArticulo'
      Hint = 'Buscar Documentos por articulo'
      ImageIndex = 109
      OnExecute = ABuscarArticuloExecute
    end
    object ARegistroCartera: TAction
      Caption = 'ARegistroCartera'
      Hint = 'Doble click para ver el registro de Cartera'
      OnExecute = ARegistroCarteraExecute
    end
    object AProyecto: TAction
      Caption = 'Proyecto'
      OnExecute = AProyectoExecute
    end
    object AImportarDetalle: TAction
      Caption = 'Importar Detalle'
      Hint = 'Importar Detalle desde Texto'
      ImageIndex = 49
      OnExecute = AImportarDetalleExecute
    end
    object ATercero: TAction
      Caption = 'ATercero'
      OnExecute = ATerceroExecute
    end
    object ALocalizaFolio: TAction
      Caption = 'Localiza Folio'
      Hint = 'Localiza Folio'
      ImageIndex = 83
      OnExecute = ALocalizaFolioExecute
    end
  end
  object RelojNotas: TTimer
    Enabled = False
    OnTimer = RelojNotasTimer
    Left = 332
    Top = 354
  end
  object PMTraspaso: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 262
    Top = 322
    object MITraspasodeFacturasMultiCanal: TMenuItem
      Action = AFacturaMulti
    end
    object MIDuplicarFactura: TMenuItem
      Action = ADuplicar
    end
    object MIGeneradevolucion: TMenuItem
      Action = ADevolucion
    end
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 118
    Top = 322
    object CEOtrosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEOtrosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEOtrosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEOtrosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEOtrosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEOtrosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEOtrosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEOtrosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEOtrosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEOtrosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEOtros: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSOtros
    FichaExclusiva = TSOtros
    PanelEdicion = PNLEdOtros
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEOtrosPMEdit
    Teclas = DMMain.Teclas
    Left = 118
    Top = 354
  end
  object RelojAdjuntos: TTimer
    Enabled = False
    OnTimer = RelojAdjuntosTimer
    Left = 368
    Top = 354
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 400
    Top = 354
  end
  object CEOtrosChilePMEdit: TPopUpTeclas
    Left = 160
    Top = 323
    object CEOtrosChileMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEOtrosChileMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEOtrosChileMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEOtrosChileMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEOtrosChileMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEOtrosChileMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEOtrosChileMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEOtrosChileMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEOtrosChileMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEOtrosChileMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEOtrosChile: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSOtrosChile
    FichaExclusiva = TSOtrosChile
    PanelEdicion = PEdOtrosChile
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEOtrosChilePMEdit
    Teclas = DMMain.Teclas
    Left = 160
    Top = 355
  end
  object CEDirEntrega: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSDirManual
    FichaExclusiva = TSDirManual
    PanelEdicion = PNLDirManualDatos
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEDirEntregaPMEdit
    Teclas = DMMain.Teclas
    Left = 232
    Top = 352
  end
  object CEDirEntregaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 232
    Top = 320
    object CEDirEntregaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEDirEntregaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEDirEntregaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEDirEntregaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEDirEntregaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDirEntregaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEDirEntregaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDirEntregaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDirEntregaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDirEntregaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEProveedores: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSProveedores
    SubComplementario = ALMain
    PopUpMenu = CEProveedoresPMEdit
    Teclas = DMMain.Teclas
    Left = 200
    Top = 352
  end
  object CEProveedoresPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 200
    Top = 320
    object CEProveedoresMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEProveedoresMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEProveedoresMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEProveedoresMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEProveedoresMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEProveedoresMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEProveedoresMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEProveedoresMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEProveedoresMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEProveedoresMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
