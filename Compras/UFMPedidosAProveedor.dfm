inherited FMPedidosAProveedor: TFMPedidosAProveedor
  Left = 234
  Top = 248
  Width = 993
  Height = 540
  HelpContext = 164
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Pedidos a Proveedores'
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  OldCreateOrder = False
  PopupMenu = CEOtrosPMEdit
  Position = poDefault
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 983
    Height = 257
    BorderWidth = 3
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 977
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        973
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMPedidosAProveedor.DSCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        DelMessage = #191'Desea borrar el pedido?'
        EditaControl = DBEFProveedor
        InsertaControl = DBEFProveedor
        OnClickBefore = NavMainClickBefore
        OnChangeState = NavMainChangeState
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMPedidosAProveedor.DSCabecera
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TSep2: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimeListado: TToolButton
        Left = 327
        Top = 0
        Action = AInformePedido
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscarNIFKRI: TToolButton
        Left = 350
        Top = 0
        Action = ABuscaNIFKRI
        Caption = 'Busca pedidos de proveedor varios'
      end
      object EFBuscaNIFKRI: TLFEditFind2000
        Left = 373
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
        CampoADevolver = 'ID_E'
        CampoNum = 'NOMBRE'
        CampoStr = 'RIG'
        CondicionBusqueda = 'tipo='#39'PEP'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_E_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'nombre')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMFacturas.EntornoDoc
      end
      object PNLTitSerie: TLFPanel
        Left = 381
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object LSerie: TLFLabel
          Left = 12
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
        Left = 656
        Top = 0
        Action = AAbrirCerrar
        ParentShowHint = False
        ShowHint = True
      end
      object LTelefono: TLFLabel
        Left = 679
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
      object LBNotas: TLFLabel
        Left = 799
        Top = 0
        Width = 60
        Height = 22
        Alignment = taCenter
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
        OnClick = LBNotasClick
      end
      object LAdjuntos: TLFLabel
        Left = 859
        Top = 0
        Width = 60
        Height = 22
        Alignment = taCenter
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
        Left = 919
        Top = 0
        Width = 60
        Height = 22
        Alignment = taCenter
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
      Width = 977
      Height = 225
      MultiLine = True
      TabOrder = 0
      inherited TSFicha: TTabSheet
        ImageIndex = -1
        object SBAProveedor: TSpeedButton [0]
          Left = 120
          Top = 24
          Width = 160
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+V para ver los datos del Proveedor'
          GroupIndex = -1
          OnDblClick = SBAProveedorDblClick
        end
        object SBAOrden: TSpeedButton [1]
          Left = 512
          Top = 8
          Width = 25
          Height = 25
          Action = AOrden
        end
        inherited PEdit: TLFPanel
          Width = 969
          Height = 197
          inherited G2KTableLoc: TG2KTBLoc
            Top = 60
            CamposADesplegar.Strings = (
              'SU_REFERENCIA'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMPedidosAProveedor.DSCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_PEDIDO_PROV'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMPedidosAProveedor.EntornoDoc
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LPedido: TLFLabel
            Left = 42
            Top = 2
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
            FocusControl = DBERIG
          end
          object LEstado: TLFLabel
            Left = 150
            Top = 2
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LFecha: TLFLabel
            Left = 424
            Top = 2
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LProveedor: TLFLabel
            Left = 26
            Top = 24
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LDtoPP: TLFLabel
            Left = 798
            Top = 24
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
          end
          object LDtoCial: TLFLabel
            Left = 795
            Top = 2
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
          end
          object LAlmacen: TLFLabel
            Left = 34
            Top = 90
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLFormaPago: TLFLabel
            Left = 18
            Top = 68
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LFechaEntregaKri: TLFLabel
            Left = 457
            Top = 25
            Width = 3
            Height = 13
            Alignment = taRightJustify
          end
          object LBLReferencia: TLFLabel
            Left = 402
            Top = 68
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
            FocusControl = DBESuReferencia
          end
          object LFechaPrevista: TLFLabel
            Left = 396
            Top = 24
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Prev.'
          end
          object LFechaRecepcion: TLFLabel
            Left = 386
            Top = 46
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Recep.'
          end
          object LFechaConfirmadaKri: TLFLabel
            Left = 583
            Top = 24
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Confirmada'
          end
          object LPlazoInicialKri: TLFLabel
            Left = 613
            Top = 2
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plazo Inicial'
          end
          object LPlazoConfirmadoKri: TLFLabel
            Left = 587
            Top = 46
            Width = 82
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plazo Confirmado'
          end
          object LTransportistaKri: TLFLabel
            Left = 393
            Top = 90
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object LIdOrden: TLFLabel
            Left = 34
            Top = 113
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Orden'
          end
          object LFase: TLFLabel
            Left = 153
            Top = 113
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LCreaPedidoPendientes: TLFLabel
            Left = 814
            Top = 175
            Width = 81
            Height = 13
            BiDiMode = bdRightToLeft
            Caption = 'Nuevo Pedido'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            Layout = tlCenter
            Visible = False
          end
          object LMonedaFicha: TLFLabel
            Left = 797
            Top = 46
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object DBTValorCambioFijo: TDBText
            Left = 842
            Top = 64
            Width = 64
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMPedidosAProveedor.DSCabecera
          end
          object LTipoPorte: TLFLabel
            Left = 406
            Top = 112
            Width = 48
            Height = 13
            Caption = 'Tipo porte'
          end
          object LPorPortes: TLFLabel
            Left = 412
            Top = 134
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = '% Portes'
          end
          object LIPortes: TLFLabel
            Left = 524
            Top = 135
            Width = 39
            Height = 13
            Caption = 'I. Portes'
          end
          object LImporteMinimoPorte: TLFLabel
            Left = 631
            Top = 135
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp.Min.Porte'
          end
          object LDireccion: TLFLabel
            Left = 28
            Top = 46
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LObservaciones: TLFLabel
            Left = 4
            Top = 179
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones'
            FocusControl = DBEObservaciones
          end
          object LProyectoFicha: TLFLabel
            Left = 412
            Top = 157
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object DBERIG: TLFDbedit
            Left = 79
            Top = 0
            Width = 64
            Height = 21
            DataField = 'RIG'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 0
            OnChange = DBERIGChange
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 458
            Top = 0
            Width = 90
            Height = 21
            DataField = 'FECHA'
            DataSource = DMPedidosAProveedor.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
            OnExit = DBDTPFechaExit
          end
          object DBEDtoPP: TLFDbedit
            Left = 842
            Top = 22
            Width = 64
            Height = 21
            DataField = 'DTO_PP'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 33
          end
          object DBEDtoCial: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'DTO_CIAL'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 32
          end
          object EFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 9
            OnChange = EFAlmacenChange
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
              'almacen')
            Filtros = [obEmpresa]
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object ETituloAlmacen: TLFEdit
            Left = 144
            Top = 88
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
            TabOrder = 10
          end
          object DBETituloProveedor: TLFDbedit
            Left = 144
            Top = 22
            Width = 240
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMPedidosAProveedor.DSCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            OnDblClick = SBAProveedorDblClick
            OnEnter = DBETituloProveedorEnter
          end
          object DBEFProveedor: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 3
            OnChange = DBEFProveedorChange
            Accion = ANewProveedor
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE_COMERCIAL'
              'TELEFONOS'
              'NIF'
              'LOCALIDAD')
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = DBEFProveedorExiste
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 79
            Top = 66
            Width = 64
            Height = 21
            DataField = 'FORMA_DE_PAGO'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 7
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
              'forma_pago')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object DBEFormaPago: TLFDbedit
            Left = 144
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidosAProveedor.DSxFormasPago
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
          object DBETituloEstado: TLFDbedit
            Left = 187
            Top = 0
            Width = 158
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMPedidosAProveedor.DSxInfoActualizada
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object DBESuReferencia: TLFDbedit
            Left = 458
            Top = 66
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'SU_REFERENCIA'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 20
          end
          object DBDTPFecha_Pre: TLFDBDateEdit
            Left = 458
            Top = 22
            Width = 90
            Height = 21
            DataField = 'FECHA_PRE_CAB'
            DataSource = DMPedidosAProveedor.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            TabOrder = 15
          end
          object DBDTPFecha_Rec: TLFDBDateEdit
            Left = 458
            Top = 44
            Width = 90
            Height = 21
            DataField = 'FECHA_REC_CAB'
            DataSource = DMPedidosAProveedor.DSCabecera
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 16
          end
          object DBDEFechaConfirmadaKri: TLFDBDateEdit
            Left = 673
            Top = 22
            Width = 90
            Height = 21
            DataField = 'FECHA_CONFIRMADA_KRI'
            DataSource = DMPedidosAProveedor.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 18
          end
          object DBDEPlazoInicialKri: TLFDBDateEdit
            Left = 673
            Top = 0
            Width = 90
            Height = 21
            DataField = 'PLAZO_INICIAL_KRI'
            DataSource = DMPedidosAProveedor.DSCabecera
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 17
          end
          object DBDEPlazoConfirmadoKri: TLFDBDateEdit
            Left = 673
            Top = 44
            Width = 90
            Height = 21
            DataField = 'PLAZO_CONFIRM_KRI'
            DataSource = DMPedidosAProveedor.DSCabecera
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 19
          end
          object DBEFTransportistaKri: TLFDBEditFind2000
            Left = 458
            Top = 88
            Width = 64
            Height = 21
            DataField = 'TRANSPORTISTA'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 21
            OnChange = DBEFTransportistaKriChange
            Accion = ANewProveedor
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TRANSPORTE_RAPIDO_KRI')
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'transportista')
            Filtros = [obEmpresa]
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object ETransportistaKri: TLFEdit
            Left = 523
            Top = 88
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
            TabOrder = 22
          end
          object BTransportistaNormalKri: TButton
            Left = 718
            Top = 88
            Width = 22
            Height = 20
            Caption = 'N'
            TabOrder = 23
            Visible = False
            OnClick = BTransportistaNormalKriClick
          end
          object BTransportistaRapidoKri: TButton
            Left = 740
            Top = 88
            Width = 22
            Height = 20
            Caption = 'R'
            TabOrder = 24
            Visible = False
            OnClick = BTransportistaRapidoKriClick
          end
          object DBCBNoTraspasarLineasKri: TLFDBCheckBox
            Left = 813
            Top = 103
            Width = 200
            Height = 17
            Hint = 
              'Este check impide que se agreguen l'#237'neas'#13#10'traspasadas desde pedi' +
              'dos de clientes.'
            Caption = 'Pedido Enviado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 36
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'NO_AGREGAR_LINEAS_KRI'
            DataSource = DMPedidosAProveedor.DSCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBNoSuperarMaxImportePEPKri: TLFDBCheckBox
            Left = 813
            Top = 120
            Width = 200
            Height = 17
            Hint = 
              'Este check impide que se agreguen l'#237'neas'#13#10'que superen el importe' +
              ' m'#225'ximo para pedidos a proveedor.'
            Caption = 'Per. sup. importe m'#225'x.'
            ClicksDisabled = False
            ColorCheck = 57088
            ShowHint = True
            TabOrder = 37
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PERMITIR_SUPERAR_IMPORTE_KRI'
            DataSource = DMPedidosAProveedor.DSCabecera
            ParentShowHint = False
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFIdOrden: TLFDBEditFind2000
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            Color = clAqua
            DataField = 'ID_ORDEN'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 11
            OnExit = DBEFIdOrdenExit
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            CondicionBusqueda = 'situacion=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFFase: TLFDBEditFind2000
            Left = 180
            Top = 110
            Width = 43
            Height = 21
            DataField = 'LINEA_FASE'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 12
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ORD_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'LINEA_FASE'
            CampoStr = 'FASE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFFaseBusqueda
            OrdenadoPor.Strings = (
              'LINEA_FASE')
            Filtros = []
          end
          object DBETituloFase: TLFDbedit
            Left = 224
            Top = 110
            Width = 160
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESC_FASE'
            DataSource = DMPedidosAProveedor.DSCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBCHKListado: TLFDBCheckBox
            Left = 347
            Top = 2
            Width = 37
            Height = 17
            Caption = 'List.'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 2
            TabStop = True
            OnClick = DBCHKListadoClick
            Alignment = taLeftJustify
            DataField = 'MODIFICA_DOC'
            DataSource = DMPedidosAProveedor.DSxInfoActualizada
            ValueChecked = '128'
            ValueUnchecked = '0'
          end
          object DBCBValorado: TLFDBCheckBox
            Left = 813
            Top = 86
            Width = 200
            Height = 17
            Hint = 
              'Este check impide que se agreguen l'#237'neas'#13#10'traspasadas desde pedi' +
              'dos de clientes.'
            Caption = 'Valorar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 35
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKCambioChange
            DataField = 'PEDIDO_VALORADO'
            DataSource = DMPedidosAProveedor.DSCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 842
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMPedidosAProveedor.DSCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 34
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
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 458
            Top = 110
            Width = 64
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 25
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
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object ETituloPortes: TLFEdit
            Left = 523
            Top = 110
            Width = 240
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
            TabOrder = 26
          end
          object DBEImporteMinimoPorte: TLFDbedit
            Left = 699
            Top = 132
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'IMPORTE_MINIMO_PORTE'
            DataSource = DMPedidosAProveedor.DSxProveedor
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 29
          end
          object DBEPorPortes: TLFDbedit
            Left = 458
            Top = 132
            Width = 64
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMPedidosAProveedor.DSCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
          end
          object DBEIPORTES: TLFDbedit
            Left = 565
            Top = 132
            Width = 64
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMPedidosAProveedor.DSCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES                '
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'COD_POSTAL'
              'LOCALIDAD')
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFDireccionBusqueda
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
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
            DataSource = DMPedidosAProveedor.DSxDirecciones
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
          object DBCBAceptaEntregaParcial: TLFDBCheckBox
            Left = 813
            Top = 137
            Width = 200
            Height = 17
            Caption = 'Acepta Entrega Parcial'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 38
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACEPTA_ENTREGA_PARCIAL'
            DataSource = DMPedidosAProveedor.DSCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPedidoRecibido: TLFDBCheckBox
            Left = 813
            Top = 154
            Width = 200
            Height = 17
            Caption = 'Pedido Recibido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 39
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PEDIDO_RECIBIDO'
            DataSource = DMPedidosAProveedor.DSCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEObservaciones: TLFDbedit
            Left = 79
            Top = 176
            Width = 684
            Height = 21
            AutoSize = False
            DataField = 'OBSERVACIONES'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 40
          end
          object DBEFProyectoFicha: TLFDBEditFind2000
            Left = 458
            Top = 154
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 30
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
            OnBusqueda = EFProyectoBusqueda
            OrdenadoPor.Strings = (
              'proyecto')
            Filtros = [obEmpresa]
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object DBEProyectoFicha: TLFDbedit
            Left = 523
            Top = 154
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMPedidosAProveedor.DSxProyectos
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
        end
      end
      object TSOtros: TTabSheet [1]
        Caption = '&Otros'
        ImageIndex = -1
        object SBAProyecto: TSpeedButton
          Left = 128
          Top = 32
          Width = 160
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+V para ver los datos del Proveedor'
          GroupIndex = -1
          OnDblClick = SBAProyectoDblClick
        end
        object PNLCabOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 969
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLTitOtros: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LBLFechaOtros: TLFLabel
              Left = 543
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLRefOtros: TLFLabel
              Left = 345
              Top = 3
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Referencia'
              Layout = tlCenter
            end
            object DBEOtrosFechaCab: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMPedidosAProveedor.DSCabecera
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
            object DBEOtrosClienteTituloCab: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMPedidosAProveedor.DSxProveedor
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
            object DBEOtrosRIGCab: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMPedidosAProveedor.DSCabecera
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
            object DBEOtrosSuReferenciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMPedidosAProveedor.DSCabecera
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
          object NavOtros: THYMNavigator
            Left = 655
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMPedidosAProveedor.DSCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEOtrosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = EFProyecto
            Exclusivo = False
            ControlEdit = CEOtros
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLEdOtros: TLFPanel
          Left = 0
          Top = 22
          Width = 969
          Height = 175
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LBLProyecto: TLFLabel
            Left = 33
            Top = 2
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
          end
          object LValorCambio: TLFLabel
            Left = 179
            Top = 68
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Cambio'
          end
          object LMoneda: TLFLabel
            Left = 36
            Top = 46
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LPorFinanciacion: TLFLabel
            Left = 801
            Top = 2
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Financ.'
          end
          object LUsuarioCreacion: TLFLabel
            Left = 8
            Top = 149
            Width = 67
            Height = 13
            Hint = 'Usuario Creacion'
            Alignment = taRightJustify
            Caption = 'Usu. Creacion'
            ParentShowHint = False
            ShowHint = True
          end
          object LIdioma: TLFLabel
            Left = 42
            Top = 24
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
          end
          object DBETitProyecto: TLFDbedit
            Left = 144
            Top = 0
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMPedidosAProveedor.DSxProyectos
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
          object EFProyecto: TLFDBEditFind2000
            Left = 79
            Top = 0
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 0
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
            OnBusqueda = EFProyectoBusqueda
            OrdenadoPor.Strings = (
              'proyecto')
            Filtros = [obEmpresa]
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object DBEValorCambio: TLFDbedit
            Left = 247
            Top = 66
            Width = 64
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 7
          end
          object DBCHKCambio: TLFDBCheckBox
            Left = 87
            Top = 68
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
            DataSource = DMPedidosAProveedor.DSCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMPedidosAProveedor.DSCabecera
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
            Filtros = []
            Entorno = DMFacturas.EntornoDoc
          end
          object ETitMoneda: TLFEdit
            Left = 144
            Top = 44
            Width = 240
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
          object DBEFinanciacion: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 10
          end
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 813
            Top = 24
            Width = 120
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMPedidosAProveedor.DSCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EUsuarioCreacion: TLFEdit
            Left = 144
            Top = 146
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEFUsuarioCreacion: TLFDBEditFind2000
            Left = 79
            Top = 146
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'USUARIO_CREACION'
            DataSource = DMPedidosAProveedor.DSCabecera
            Enabled = False
            TabOrder = 8
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'IDIOMA'
            DataSource = DMPedidosAProveedor.DSCabecera
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
            Entorno = DMPedidosAProveedor.EntornoDoc
          end
          object EIdioma: TLFEdit
            Left = 144
            Top = 22
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        ImageIndex = -1
        inherited DBGMain: THYTDBGrid
          Width = 969
          Height = 191
          DataSource = DMPedidosAProveedor.DSCabecera
          OnCellClick = DBGMainCellClick
          OnKeyDown = DBGMainKeyDown
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'ACEPTA_ENTREGA_PARCIAL'
            'CAMBIO_FIJO'
            'INVERSION_SUJETO_PASIVO'
            'MODIFICA_DOC'
            'NO_AGREGAR_LINEAS_KRI'
            'PEDIDO_VALORADO'
            'PERMITIR_SUPERAR_IMPORTE_KRI')
          CamposChecked.Strings = (
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
            '0')
          CamposAOrdenar.Strings = (
            'ALMACEN'
            'ESTADO'
            'FECHA'
            'FECHA_CONFIRMADA_KRI'
            'FECHA_ENTREGA'
            'FECHA_PRE_CAB'
            'FECHA_REC_CAB'
            'FORMA_DE_PAGO'
            'LIQUIDO'
            'MONEDA'
            'NOMBRE_COMERCIAL'
            'PLAZO_CONFIRM_KRI'
            'PLAZO_INICIAL_KRI'
            'PROVEEDOR'
            'PROYECTO'
            'RIG'
            'SU_REFERENCIA'
            'TITULO'
            'TRANSPORTISTA')
          CamposCalcAOrdenar.Strings = (
            'TOTAL_CANAL')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Title.Alignment = taRightJustify
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 265
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEDA'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_CANAL'
              Title.Alignment = taRightJustify
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NO_AGREGAR_LINEAS_KRI'
              Width = 42
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_MINIMO_PORTE'
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
          Left = 203
        end
      end
      object TSNotas: TTabSheet
        Caption = '&Notas'
        ImageIndex = -1
        OnShow = TSNotasShow
        object PEdNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 969
          Height = 175
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 969
            Height = 175
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 0
          end
        end
        object PCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 969
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PTitNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LFechaNotas: TLFLabel
              Left = 543
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLReferenciaNotas: TLFLabel
              Left = 345
              Top = 3
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Referencia'
              Layout = tlCenter
            end
            object DBENotasFechaCab: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMPedidosAProveedor.DSCabecera
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
            object DBENotasProveedorTituloCab: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMPedidosAProveedor.DSxProveedor
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
            object DBENotasRIGCab: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMPedidosAProveedor.DSCabecera
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
            object DBENotasSuReferenciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMPedidosAProveedor.DSCabecera
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
          object NavNotas: THYMNavigator
            Left = 655
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMPedidosAProveedor.DSCabecera
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
            EditaControl = DBMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSDirEntrega: TTabSheet
        Caption = 'Dir. Entrega'
        ImageIndex = 4
        object PNLDirEntrega: TLFPanel
          Left = 0
          Top = 0
          Width = 969
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLDirEntrega2: TLFPanel
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
              DataSource = DMPedidosAProveedor.DSCabecera
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
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMPedidosAProveedor.DSxProveedor
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
              DataSource = DMPedidosAProveedor.DSCabecera
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
              DataSource = DMPedidosAProveedor.DSCabecera
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
            Height = 21
            DataSource = DMPedidosAProveedor.DSCabecera
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
            EditaControl = DBMDirEntrega
            Exclusivo = False
            ControlEdit = CEDirEntrega
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLEdDirEntrega: TLFPanel
          Left = 0
          Top = 22
          Width = 969
          Height = 175
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMDirEntrega: TLFDBMemo
            Left = 0
            Top = 0
            Width = 969
            Height = 175
            Align = alClient
            DataField = 'DIR_ENTREGA_MANUAL'
            DataSource = DMPedidosAProveedor.DSCabecera
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 257
    Width = 983
    Height = 230
    inherited TBDetalle: TLFToolBar
      Width = 983
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 2
      inherited NavDetalle: THYMNavigator
        DataSource = DMPedidosAProveedor.DSDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        DelMessage = #191'Desea borrar la l'#237'nea? '
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object TSep8: TToolButton
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
      object TButtInfoStocks: TToolButton
        Left = 251
        Top = 0
        Action = AInfoStocks
        ParentShowHint = False
        ShowHint = True
      end
      object TButtUnidades_Ext: TToolButton
        Left = 274
        Top = 0
        Action = AUnidades_Ext
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
      object TButtArtTarifa: TToolButton
        Left = 343
        Top = 0
        Action = ATarifasProveedor
        ImageIndex = 17
        ParentShowHint = False
        ShowHint = True
      end
      object TBDesServir: TToolButton
        Left = 366
        Top = 0
        Action = ADesServir
        ParentShowHint = False
        ShowHint = True
      end
      object TButtHerencia: TToolButton
        Left = 389
        Top = 0
        Action = AHerencia
      end
      object ToolButton2: TToolButton
        Left = 412
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBArtProv: TToolButton
        Left = 420
        Top = 0
        Hint = 'Proveedores que venden este Art'#237'culo'
        Action = AArticuloProv
        ParentShowHint = False
        ShowHint = True
      end
      object TBVerPedidosAProveedorKri: TToolButton
        Left = 443
        Top = 0
        Action = AVerPedidosAProveedor
      end
      object TBVerPedidosDeArticuloKri: TToolButton
        Left = 466
        Top = 0
        Action = AVerPedidosDeArticulo
      end
      object TBVerArticulosPorTarifaKri: TToolButton
        Left = 489
        Top = 0
        Action = AVerArticulosPorTarifa
      end
      object TBVerHistoricoDeCostesKri: TToolButton
        Left = 512
        Top = 0
        Action = AVerHistoricoDeCostesKri
      end
      object TBVerCodigoProveedor: TToolButton
        Left = 535
        Top = 0
        Action = AVerCodigoProveedorKri
      end
      object ToolButton1: TToolButton
        Left = 558
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtBuscarArticulo: TToolButton
        Left = 566
        Top = 0
        Action = ABuscarArticulo
        Style = tbsCheck
      end
      object TButtCondicionesCompra: TToolButton
        Left = 589
        Top = 0
        Hint = 'Ver Condiciones Compra'
        Action = ACondicionesCompra
      end
      object TButtDuplicarLinea: TToolButton
        Left = 612
        Top = 0
        Action = ADuplicarLinea
      end
      object TButtImportarDetalle: TToolButton
        Left = 635
        Top = 0
        Action = AImportarDetalle
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 983
      Height = 153
      DataSource = DMPedidosAProveedor.DSDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      OnKeyDown = DBGFDetalleKeyDown
      OnKeyPress = DBGFDetalleKeyPress
      OnKeyUp = DBGFDetalleKeyUp
      IniStorage = FSMain
      ColumnaInicial = 1
      AutoCambiarColumna = True
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO'
        'ARTICULO'
        'TIPO_IVA'
        'ARTICULO'
        'PROYECTO'
        'ALMACEN'
        'TIPO_UNIDAD_LOGISTICA'
        'TIPO_IMPUESTO_ADICIONAL')
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
        'ARTICULO'
        '0'
        'PROYECTO'
        '0'
        'ALMACEN'
        '0'
        'TIPO_UNIDAD_LOGISTICA'
        '0'
        'TIPO_IMPUESTO_ADICIONAL'
        '1'
        'PORCENTAJE')
      CamposAMostrarAnchos.Strings = (
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
        'ARTICULO'
        'ARTICULO'
        ''
        'ARTICULO'
        ''
        'ALMACEN'
        ''
        '')
      CamposDesplegar.Strings = (
        '0'
        '1'
        '0'
        '1'
        '0'
        '1'
        '1'
        '1'
        '1')
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'FECHA_PRE_DET'
        'ORDEN'
        'TITULO'
        'LINEA'
        'PRECIO')
      ColumnasCheckBoxes.Strings = (
        'APLICA_UNIDADES_SECUNDARIAS'
        'LINEA_SERVIDA'
        'INVERSION_SUJETO_PASIVO')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0')
      Numericos.Strings = (
        'BARRAS'
        'ARTICULO'
        'CODIGO_PROVEEDOR'
        'TIPO'
        'NSERIE'
        'PROYECTO'
        'ALMACEN'
        'TIPO'
        'TIPO')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_CON_BARRAS'
        'VER_ARTICULOS_EF'
        'ART_ARTICULOS_CODPROV'
        'SYS_TIPO_IVA'
        'ART_ARTICULOS_SERIALIZACION'
        'EMP_PROYECTOS'
        'ART_ALMACENES'
        'VER_ARTICULOS_UNID_LOG'
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
        '')
      Titulos.Strings = (
        'TIPO'
        'TITULO'
        'PROVEEDOR'
        'TITULO'
        'NSERIE'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      OnCampoDevuelve = DBGFDetalleCampoDevuelve
      OnRowChange = DBGFDetalleRowChange
      Planes.Strings = (
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        ''
        ''
        ''
        'ALMACEN'
        'DEFECTO,TIPO'
        'TIPO')
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
          Width = 33
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
          Width = 324
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Alignment = taRightJustify
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_UNIDAD_LOGISTICA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_UNIDAD_LOGISTICA'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_LOGISTICAS'
          Width = 63
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
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_POR_SERVIR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_SERVIDA'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Title.Alignment = taRightJustify
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TIPO_IVA'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Title.Alignment = taRightJustify
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
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BRUTO'
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
          FieldName = 'T_COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
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
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'M_BRUTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
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
          Width = 46
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'C_IVA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
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
          Width = 46
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'C_RECARGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
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
          Width = 117
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FECHA_PRE_DET'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CONF_KRI'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REC_DET'
          Title.Caption = 'Fec. Recepci'#243'n'
          Width = 74
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
          Width = 60
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
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLIENTE_ORIGEN_KRI'
          Width = 300
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
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_IMPUESTO_ADICIONAL'
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
          FieldName = 'PRO_NUM_PLANO'
          Width = 200
          Visible = True
        end>
    end
    object PCPie: TLFPageControl
      Left = 0
      Top = 175
      Width = 983
      Height = 55
      ActivePage = TSPieGen
      Align = alBottom
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabPosition = tpBottom
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSPieGen: TTabSheet
        Caption = '&Gen'#233'rico'
        object PPieGenerico: TLFPanel
          Left = 0
          Top = 0
          Width = 975
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
            Width = 234
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object LBLUnidades: TLFLabel
              Left = 0
              Top = 4
              Width = 62
              Height = 13
              Alignment = taRightJustify
              Caption = 'Uds. (U/L/S)'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object DBESumUnidades: TLFDbedit
              Left = 67
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
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
              Left = 123
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_LOGISTICAS'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
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
              Left = 179
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_SEC'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
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
            Left = 236
            Top = 2
            Width = 165
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object LCantLineas: TLFLabel
              Left = 0
              Top = 4
              Width = 17
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Lin.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object LSumaPeso: TLFLabel
              Left = 81
              Top = 4
              Width = 24
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Peso'
              Layout = tlCenter
            end
            object DBECantLineas: TLFDbedit
              Left = 19
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'COUNT_LINEA'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBESumaPeso: TLFDbedit
              Left = 110
              Top = 0
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_PESO'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
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
          object PNLInfoImportes: TLFPanel
            Left = 401
            Top = 2
            Width = 572
            Height = 25
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LLiquido: TLFLabel
              Left = 522
              Top = 4
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'quido'
              Layout = tlCenter
            end
            object LCuotaIVAyRec: TLFLabel
              Left = 172
              Top = 4
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA/Rec/Adic'
              Layout = tlCenter
            end
            object LBaseImponible: TLFLabel
              Left = 1
              Top = 4
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base Imponible'
              Layout = tlCenter
            end
            object DBES_Bases: TLFDbedit
              Left = 77
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_BASES'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBELiquido: TLFDbedit
              Left = 563
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'LIQUIDO'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBECuotaRec: TLFDbedit
              Left = 335
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_RE'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBECuotaIVA: TLFDbedit
              Left = 244
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_IVA'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBECuotaImpuestoAdic: TLFDbedit
              Left = 426
              Top = 0
              Width = 91
              Height = 21
              Color = clInfoBk
              DataField = 'S_CUOTA_IMPUESTO_ADICIONAL'
              DataSource = DMPedidosAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
          end
        end
      end
      object TSPieCarDtos: TTabSheet
        Caption = '&Cargos y Descuentos'
        ImageIndex = 2
        object PPieComisiones: TLFPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBaseDtoLineas: TLFLabel
            Left = 268
            Top = 6
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Layout = tlCenter
          end
          object LImportePie: TLFLabel
            Left = 469
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LImporteBase: TLFLabel
            Left = 618
            Top = 6
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Bases'
            Layout = tlCenter
          end
          object LImporteFinanciacion: TLFLabel
            Left = 46
            Top = 6
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Financiaci'#243'n'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object DBEBaseDtoEnLinea: TLFDbedit
            Left = 350
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_DTO_LINEAS'
            DataSource = DMPedidosAProveedor.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEImpDtoEnLinea: TLFDbedit
            Left = 508
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMPedidosAProveedor.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBESumaBases: TLFDbedit
            Left = 674
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'S_BASES'
            DataSource = DMPedidosAProveedor.DSxInfoActualizada
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
            Left = 148
            Top = 2
            Width = 90
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMPedidosAProveedor.DSxInfoActualizada
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
  end
  inherited TBActions: TLFToolBar
    Top = 487
    Width = 983
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 132
    Top = 325
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 132
    Top = 357
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosProveedor: TMenuItem
      Action = AAProveedor
    end
  end
  inherited ALMain: TLFActionList
    Left = 82
    Top = 325
    object AInformePedido: TAction
      Category = 'Listados'
      Caption = 'Informe Pedido'
      Hint = 'Informe Pedido'
      ImageIndex = 14
      OnExecute = AInformePedidoExecute
    end
    object AInformePedido2: TAction
      Tag = 1
      Category = 'Listados'
      Caption = 'Informe de Pedido 2'
      Hint = 'Informe de Pedido 2'
      ImageIndex = 14
      OnExecute = AInformePedidoExecute
    end
    object AInformePedido3: TAction
      Tag = 2
      Category = 'Listados'
      Caption = 'Informe de Pedido 3'
      Hint = 'Informe de Pedido 2'
      ImageIndex = 14
      OnExecute = AInformePedidoExecute
    end
    object AInformePedido4: TAction
      Tag = 3
      Category = 'Listados'
      Caption = 'Informe de Pedido 4'
      Hint = 'Informe de Pedido 4'
      ImageIndex = 14
      OnExecute = AInformePedidoExecute
    end
    object AHerencia: TAction
      Category = 'Otros'
      Caption = 'Herencia'
      Hint = 'Herencia'
      ImageIndex = 97
      OnExecute = AHerenciaExecute
    end
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Pedido'
      Hint = 'Cerrar Pedido (Ctrl+Alt+F)'
      ImageIndex = 68
      ShortCut = 49222
      OnExecute = AAbrirCerrarExecute
    end
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Todos'
      Hint = 'Muestra todos los documentos'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AAdjuntosPedido: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Pedido'
      Hint = 'Adjuntos del Pedido'
      ImageIndex = 59
      OnExecute = AAdjuntosPedidoExecute
    end
    object ASep1: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AAAlbaran: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Albar'#225'n'
      Hint = 'Traspasa el Pedido actual a Albar'#225'n'
      ImageIndex = 60
      OnExecute = AAAlbaranExecute
    end
    object APedidosMulti: TAction
      Category = 'Procesos'
      Caption = 'Traspaso MultiCanal'
      Hint = 'Traspaso MultiCanal'
      ImageIndex = 86
      OnExecute = APedidosMultiExecute
    end
    object AAFactura: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Factura'
      Hint = 'Traspasa el Pedido actual a Factura'
      ImageIndex = 61
      OnExecute = AAFacturaExecute
    end
    object AAFacturaSoloIVA: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Factura (solo las bases del IVA)'
      Hint = 'Traspaso a Factura (solo las bases del IVA)'
      ImageIndex = 61
      OnExecute = AAFacturaSoloIVAExecute
    end
    object ASep3: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AListaPedido: TLFNoSaveAction
      Category = 'Procesos'
      Caption = 'Listar Pedido'
      Hint = 'Cambia estado a *Listado*'
      ImageIndex = 146
      OnExecute = AListaPedidoExecute
    end
    object AVisualizarPedidosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Visualizar Pedidos Filtrados'
      Hint = 'Visualizar Pedidos Filtrados'
      ImageIndex = 14
      OnExecute = AVisualizarPedidosFiltradosExecute
    end
    object AImprimirPedidosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Imprimir Pedidos Filtrados'
      Hint = 'Imprimir Pedidos Filtrados'
      ImageIndex = 14
      OnExecute = AImprimirPedidosFiltradosExecute
    end
    object AVisualizaPedMail: TAction
      Category = 'Listados'
      Caption = 'Visualizar Pedido e-mail'
      Hint = 'Visualizar Pedido e-mail'
      ImageIndex = 34
      OnExecute = AVisualizaPedMailExecute
    end
    object AEnviarPedidoEMail: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Pedido por e-mail'
      Hint = 'Enviar Pedido por e-mail'
      ImageIndex = 34
      OnExecute = AEnviarPedidoEMailExecute
    end
    object ACrearNuevoPedidoPendientes: TAction
      Category = 'Procesos'
      Caption = 'Crear Nuevo Pedido de Unidades Pendientes'
      Hint = 'Crear Nuevo Pedido de Unidades Pendientes'
      ImageIndex = 62
      OnExecute = ACrearNuevoPedidoPendientesExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AResumenPedidos: TAction
      Category = 'Listados'
      Caption = 'Resumen Pedidos'
      Hint = 'Resumen Pedidos'
      ImageIndex = 14
      OnExecute = AResumenPedidosExecute
    end
    object AResumenPedidosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Resumen Pedidos Filtrados'
      Hint = 'Resumen Pedidos Filtrados'
      ImageIndex = 14
      OnExecute = AResumenPedidosFiltradosExecute
    end
    object AImprimirResumenPedidosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Imprimir Resumen Pedidos Filtrados'
      Hint = 'Imprimir Resumen Pedidos Filtrados'
      ImageIndex = 14
      OnExecute = AImprimirResumenPedidosFiltradosExecute
    end
    object ASep2: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object ALstCodigoBarras: TAction
      Category = 'Listados'
      Caption = 'Listado de etiquetas de C'#243'digo de Barras'
      Hint = 'Listado de etiquetas de C'#243'digo de Barras'
      ImageIndex = 14
      OnExecute = ALstCodigoBarrasExecute
    end
    object AConfListadoPedidos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Pedidos'
      Hint = 'Listado de Pedidos'
      ImageIndex = 77
      OnExecute = AConfListadoPedidosExecute
    end
    object AConfListadoResumen: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Resumen de Pedidos'
      Hint = 'Listado de Resumen de Pedidos'
      ImageIndex = 77
      OnExecute = AConfListadoResumenExecute
    end
    object ADuplicar: TAction
      Category = 'Procesos'
      Caption = 'Duplicar Pedido'
      Hint = 'Duplicar Pedido'
      ImageIndex = 37
      OnExecute = ADuplicarExecute
    end
    object ARegenerar: TAction
      Category = 'Procesos'
      Caption = 'Regenerar las Condiciones de Proveedor'
      Hint = 'Regenerar las Condiciones del Proveedor'
      ImageIndex = 25
      OnExecute = ARegenerarExecute
    end
    object AAnulaDocumento: TAction
      Category = 'Procesos'
      Caption = 'Marca el documento como anulado / pendiente'
      Hint = 'Marca el documento como anulado / pendiente'
      ImageIndex = 27
      OnExecute = AAnulaDocumentoExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AEnviarPedidoMailPdf: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Pedido por e-mail en Pdf (directo)'
      Hint = 'Enviar Pedido por e-mail en Pdf'
      ImageIndex = 34
      ShortCut = 49229
      OnExecute = AEnviarPedidoMailPdfExecute
    end
    object AEnviarPedidoMailPDF2: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Pedido por e-mail en Pdf (mensaje)'
      Hint = 'Enviar Pedido por e-mail en Pdf con correo electr'#243'nico'
      ImageIndex = 34
      OnExecute = AEnviarPedidoMailPDF2Execute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Envio por E-Mail'
      ImageIndex = 34
    end
    object AOrdenaLineas: TAction
      Category = 'Otros'
      Caption = 'Reordenar L'#237'neas'
      Hint = 'Reordena las l'#237'neas del documento'
      ImageIndex = 122
      OnExecute = AOrdenaLineasExecute
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosProveedor: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Proveedor'
      Hint = 'Adjuntos del Proveedor'
      ImageIndex = 59
      OnExecute = AAdjuntosProveedorExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      Hint = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object AAdjuntosTransportista: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Transportista'
      Hint = 'Adjuntos del Transportista'
      ImageIndex = 59
      OnExecute = AAdjuntosTransportistaExecute
    end
    object AConfListadoCodigoBarras: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de C'#243'digo de Barras'
      Hint = 'Listado de C'#243'digo de Barras'
      ImageIndex = 77
      OnExecute = AConfListadoCodigoBarrasExecute
    end
    object AListarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Lista Etiquetas'
      Hint = 'Lista Etiquetas de los articulos del documento'
      ImageIndex = 95
      OnExecute = AListarEtiquetasExecute
    end
    object AConfListadoMaterialesProduccion: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Materiales de producci'#243'n'
      Hint = 'Listado de materiales a producir'
      ImageIndex = 77
      OnExecute = AConfListadoMaterialesProduccionExecute
    end
    object ADuplicarLinea: TAction
      Category = 'Otros'
      Caption = 'Duplicar Linea'
      Hint = 'Duplicar Linea'
      ImageIndex = 37
      OnExecute = ADuplicarLineaExecute
    end
    object AImportaVentasDeposito: TAction
      Category = 'Procesos'
      Caption = 'Genera detalle ventas en dep'#243'sito'
      Hint = 'Genera detalle ventas en dep'#243'sito'
      ImageIndex = 25
      OnExecute = AImportaVentasDepositoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AAsignacionCodigoBarra: TAction
      Category = 'Otros'
      Caption = 'Asignacion de Codigos de Barra'
      Hint = 'Asignacion de Codigos de Barra'
      ImageIndex = 38
      OnExecute = AAsignacionCodigoBarraExecute
    end
    object ACrearHerenciaManual: TAction
      Category = 'Otros'
      Caption = 'Crear Herencia Manual'
      ImageIndex = 97
      OnExecute = ACrearHerenciaManualExecute
    end
    object AListarEtiquetasProcedencia: TAction
      Category = 'Listados'
      Caption = 'Etiquetas de Procedencia'
      Hint = 'Listar Etiquetas de Procedencia'
      ImageIndex = 95
      OnExecute = AListarEtiquetasProcedenciaExecute
    end
    object AConfEtiquetaProcedencia: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiquetade Procedencia'
      Hint = 'Etiquetade Procedencia'
      ImageIndex = 77
      OnExecute = AConfEtiquetaProcedenciaExecute
    end
    object ACategoryFiltros: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object AFiltroAbierto: TAction
      Category = 'Filtros'
      Caption = 'Abierto'
      Hint = 'Muestra documentos activos'
      ImageIndex = 5
      OnExecute = AFiltroAbiertoExecute
    end
    object AFiltroAnulado: TAction
      Category = 'Filtros'
      Caption = 'Anulados'
      Hint = 'Muestra documentos anulados'
      ImageIndex = 5
      OnExecute = AFiltroAnuladoExecute
    end
    object AFiltroCerrado: TAction
      Category = 'Filtros'
      Caption = 'Cerrado'
      Hint = 'Muestra documentos cerrados'
      ImageIndex = 5
      OnExecute = AFiltroCerradoExecute
    end
    object ABorradoMasivoLineas: TAction
      Category = 'Otros'
      Caption = 'Seleccion y borrado masivo de lineas'
      Hint = 'Seleccion y borrado masivo de lineas'
      ImageIndex = 32
      OnExecute = ABorradoMasivoLineasExecute
    end
    object AExportacionEuropastry: TAction
      Category = 'Otros'
      Caption = 'Exportacion Europastry'
      Hint = 'Exportacion Europastry'
      ImageIndex = 36
      OnExecute = AExportacionEuropastryExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 8
    Top = 357
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    SubComplementario = ALMain
    Left = 170
    Top = 324
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 170
    Top = 357
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
    Left = 208
    Top = 324
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 208
    Top = 357
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
  object CEDirEntrega: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSDirEntrega
    FichaExclusiva = TSDirEntrega
    PanelEdicion = PNLEdDirEntrega
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEDirEntregaPMEdit
    Teclas = DMMain.Teclas
    Left = 272
    Top = 328
  end
  object CEDirEntregaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 272
    Top = 360
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
  object ALPedidos: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 49
    Top = 325
    object AUnidades_Ext: TAction
      Caption = 'Unidades Extendidas'
      Hint = 'Unidades Extendidas'
      ImageIndex = 69
      ShortCut = 49221
      OnExecute = AUnidades_ExtExecute
    end
    object APreciosTarifa: TAction
      Caption = 'Precios por Tarifa'
      Hint = 'Precios por Tarifa'
      ImageIndex = 33
      ShortCut = 49232
      OnExecute = APreciosTarifaExecute
    end
    object AInfoStocks: TAction
      Caption = 'AInfoStocks'
      Hint = 'Informaci'#243'n de Stocks '
      ImageIndex = 1
      ShortCut = 16467
      OnExecute = AInfoStocksExecute
    end
    object ANotasDetalle: TAction
      Caption = 'ANotasDetalle'
      Hint = 'Edita las notas de la linea seleccionada'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
    end
    object AInfoHistorico: TAction
      Caption = 'Hist'#243'rico de Precios'
      Hint = 'Hist'#243'rico de Precios'
      ImageIndex = 56
      ShortCut = 49224
      OnExecute = AInfoHistoricoExecute
    end
    object ANewProveedor: TAction
      Caption = 'Proveedor nuevo'
      OnExecute = ANewProveedorExecute
    end
    object ANewArticulo: TAction
      Caption = 'Art'#237'culo nuevo'
      Hint = 'Nuevo Articulo'
      OnExecute = ANewArticuloExecute
    end
    object AAProveedor: TAction
      Caption = 'Ver Datos Proveedor'
      Hint = 'Doble click o Ctrl+Alt+V para ver los datos del Proveedor'
      ShortCut = 49238
      OnExecute = AAProveedorExecute
    end
    object AImprime: TAction
      Caption = 'AImprime'
      Hint = 'Imprime Informe'
      ImageIndex = 14
      ShortCut = 49225
      OnExecute = AImprimeExecute
    end
    object AArticulo: TAction
      Caption = 'Ver Datos Articulo'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Art'#237'culo'
      ShortCut = 49217
      OnExecute = AArticuloExecute
    end
    object AArticuloProv: TAction
      Caption = 'Ver Proveedores para el Art'#237'culo'
      Hint = 'Ver Proveedores para el Art'#237'culo'
      ImageIndex = 89
      ShortCut = 16464
      OnExecute = AArticuloProvExecute
    end
    object AVerPedidosAProveedor: TAction
      Caption = 'Pedidos a Proveedor'
      Hint = 'Muestras los pedidos hechos a este proveedor'
      ImageIndex = 30
      OnExecute = AVerPedidosAProveedorExecute
    end
    object AVerPedidosDeArticulo: TAction
      Caption = 'Pedidos de Articulo'
      Hint = 'Pedidos en donde se encuentra el art'#237'culo'
      ImageIndex = 109
      OnExecute = AVerPedidosDeArticuloExecute
    end
    object AVerArticulosPorTarifa: TAction
      Caption = 'Articulos por Tarifa'
      Hint = 'Tarifas de Proveedor en las que se encuentra el articulo'
      ImageIndex = 11
      OnExecute = AVerArticulosPorTarifaExecute
    end
    object AVerHistoricoDeCostesKri: TAction
      Caption = 'Historico de Costes'
      Hint = 'Historico de Precios de Compra'
      ImageIndex = 3
      OnExecute = AVerHistoricoDeCostesKriExecute
    end
    object AVerCodigoProveedorKri: TAction
      Caption = 'Codigo de Proveedor'
      Hint = 'Ver Codigo de Proveedor de Articulos'
      ImageIndex = 64
      OnExecute = AVerCodigoProveedorKriExecute
    end
    object ANIFPedidos: TAction
      Caption = 'Datos del Proveedor'
      Hint = 'Datos del Proveedor'
      ShortCut = 16452
      OnExecute = ANIFPedidosExecute
    end
    object ADesServir: TAction
      Caption = 'ADesServir'
      Hint = 'Marcar la l'#237'nea como no servida'
      ImageIndex = 35
      OnExecute = ADesServirExecute
    end
    object ABuscarArticulo: TAction
      Caption = 'ABuscarArticulo'
      Hint = 'Buscar Documentos por articulo'
      ImageIndex = 109
      OnExecute = ABuscarArticuloExecute
    end
    object ABuscaNIFKRI: TAction
      Caption = 'Busca Proveedores -1'
      Hint = 'Busca pedidos de proveedores varios'
      ImageIndex = 54
      OnExecute = ABuscaNIFKRIExecute
    end
    object ACondicionesCompra: TAction
      Caption = 'Condiciones de Compra'
      Hint = 'Condiciones de Compra'
      ImageIndex = 143
      OnExecute = ACondicionesCompraExecute
    end
    object AOrden: TAction
      Caption = 'Abrir Orden de Produccion'
      Hint = 'Abrir la orden de produccion'
      ImageIndex = 116
      OnExecute = AOrdenExecute
    end
    object ATarifasProveedor: TAction
      Caption = 'Tarifas del Proveedor'
      Hint = 'Tarifas del Proveedor'
      OnExecute = ATarifasProveedorExecute
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
  end
  object RelojNotas: TTimer
    Enabled = False
    OnTimer = RelojNotasTimer
    Left = 8
    Top = 324
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
    Left = 248
    Top = 328
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 248
    Top = 360
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
    object CEOtrosMiNext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEOtrosMiLast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEOtrosMiInsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEOtrosMiDelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEOtrosMiEdit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEOtrosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEOtrosMiCancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEOtrosMiRefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object RelojAdjuntos: TTimer
    OnTimer = RelojAdjuntosTimer
    Left = 288
    Top = 328
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 288
    Top = 360
  end
end
