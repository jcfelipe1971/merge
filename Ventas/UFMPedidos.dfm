inherited FMPedidos: TFMPedidos
  Left = 280
  Top = 170
  Width = 1288
  Height = 626
  HelpContext = 195
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Pedidos de Clientes'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  OldCreateOrder = False
  PopupMenu = CEProveedoresPMEdit
  Position = poDefault
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1278
    Height = 280
    BorderWidth = 3
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 1272
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        1268
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMPedidos.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        DelMessage = #191'Desea borrar el pedido? '
        EditaControl = EFCliente
        InsertaControl = EFCliente
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMPedidos.DSQMCabecera
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TButtSeparador2: TToolButton
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
      object EFBuscaNIFKRI: TLFEditFind2000
        Left = 350
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
        CondicionBusqueda = 'tipo='#39'PEC'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_S_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NOMBRE, EJERCICIO DESC, RIG')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMPedidos.EntornoDoc
      end
      object TButtBuscaNIFKRI: TToolButton
        Left = 358
        Top = 0
        Action = ABuscaNIFKRI
        ParentShowHint = False
        ShowHint = True
      end
      object TButtSeparador6: TToolButton
        Left = 381
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TbuttCambiarNombre: TToolButton
        Left = 389
        Top = 0
        Action = ACambiarNombre
        ParentShowHint = False
        ShowHint = True
      end
      object PNLTitSerie: TLFPanel
        Left = 412
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBLSerie: TLFLabel
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
        Left = 687
        Top = 0
        Action = AAnulaDocumento
        ParentShowHint = False
        ShowHint = True
      end
      object TButtVerFicherosAsociados: TToolButton
        Left = 710
        Top = 0
        Action = zAFicherosAsociados
      end
      object TButtTraspaso: TToolButton
        Left = 733
        Top = 0
        Hint = 'Traspaso de documentos'
        Caption = 'Traspaso'
        DropdownMenu = PMTraspaso
        ImageIndex = 86
        Style = tbsDropDown
      end
      object LTelefono: TLFLabel
        Left = 769
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
        Left = 889
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
          AutoSize = True
          DataField = 'RIESGO_DISPONIBLE'
          DataSource = DMPedidos.DSxInfoActualizada
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
      object LBNotas: TLFLabel
        Left = 1001
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
        OnClick = LBNotasClick
      end
      object LAdjuntos: TLFLabel
        Left = 1061
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
        Left = 1121
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
      Width = 1272
      Height = 248
      ActivePage = TSProveedores
      MultiLine = True
      TabIndex = 6
      TabOrder = 0
      inherited TSFicha: TTabSheet
        object SBACliente: TSpeedButton [0]
          Left = 118
          Top = 30
          Width = 160
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        object SBAAgente: TSpeedButton [1]
          Left = 115
          Top = 93
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAAgenteDblClick
        end
        object SBATercero: TSpeedButton [2]
          Left = 459
          Top = 198
          Width = 305
          Height = 22
          GroupIndex = -1
          OnDblClick = ATerceroExecute
        end
        inherited PEdit: TLFPanel
          Width = 1264
          Height = 220
          TabOrder = 1
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              
                'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
                '_IDX2),'
              
                '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
                '_PED_ID),'
              
                '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
                ')))')
            CamposADesplegar.Strings = (
              'SU_REFERENCIA'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMPedidos.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_PEDIDO'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
        end
        object PNLEdCabecera: TLFPanel
          Left = 0
          Top = 0
          Width = 1264
          Height = 220
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          OnResize = PNLEdCabeceraResize
          DesignSize = (
            1264
            220)
          object LBLPedido: TLFLabel
            Left = 42
            Top = 2
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
            FocusControl = DBERIG
          end
          object LBLEstado: TLFLabel
            Left = 151
            Top = 3
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LBLFechaFicha: TLFLabel
            Left = 424
            Top = 2
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLReferencia: TLFLabel
            Left = 402
            Top = 46
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
            FocusControl = DBESuReferencia
          end
          object LBLCliente: TLFLabel
            Left = 43
            Top = 24
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LBLDir: TLFLabel
            Left = 30
            Top = 46
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LBLAgente: TLFLabel
            Left = 41
            Top = 90
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LBLDtoPP: TLFLabel
            Left = 797
            Top = 24
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
          end
          object LBLDtoCial: TLFLabel
            Left = 794
            Top = 2
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
          end
          object LBLEntrega: TLFLabel
            Left = 559
            Top = 3
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha prev.'
          end
          object LBLAlmacen: TLFLabel
            Left = 34
            Top = 156
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLFormaPago: TLFLabel
            Left = 18
            Top = 112
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LTarifa: TLFLabel
            Left = 48
            Top = 134
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LAgrupacionKri: TLFLabel
            Left = 782
            Top = 200
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrup. Ped.'
            FocusControl = DBESuReferencia
          end
          object LBLFechaRec: TLFLabel
            Left = 391
            Top = 24
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha recep.'
          end
          object LOperarioKri: TLFLabel
            Left = 414
            Top = 178
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
            FocusControl = DBESuReferencia
          end
          object LContacto: TLFLabel
            Left = 32
            Top = 68
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LMargenKri: TLFLabel
            Left = 939
            Top = 203
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'rgen'
            FocusControl = DBESuReferencia
          end
          object LPedidoCli: TLFLabel
            Left = 398
            Top = 68
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Pedido'
            FocusControl = DBEPedidoCli
          end
          object LFechaCreacion: TLFLabel
            Left = 607
            Top = 26
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Creac.'
          end
          object LPortes: TLFLabel
            Left = 429
            Top = 112
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Porte'
          end
          object LRango: TLFLabel
            Left = 422
            Top = 134
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rango'
          end
          object LIndice: TLFLabel
            Left = 425
            Top = 157
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = #205'ndice'
          end
          object LTransportista: TLFLabel
            Left = 393
            Top = 90
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object LMonedaFicha: TLFLabel
            Left = 798
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
            DataSource = DMPedidos.DSQMCabecera
          end
          object LNombreComercial: TLFLabel
            Left = 15
            Top = 179
            Width = 60
            Height = 13
            Caption = 'N. Comercial'
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
          object DBERIG: TLFDbedit
            Left = 79
            Top = 0
            Width = 64
            Height = 21
            DataField = 'RIG'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 0
            OnChange = DBERIGChange
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 458
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMPedidos.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 20
            OnExit = DBDTPFechaExit
          end
          object DBESuReferencia: TLFDbedit
            Left = 458
            Top = 44
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'SU_REFERENCIA'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 27
          end
          object EFCliente: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'CLIENTE'
            DataSource = DMPedidos.DSQMCabecera
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
            SalirSiVacio = False
            OnExiste = EFClienteExiste
            OrdenadoPor.Strings = (
              'cliente')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETituloCliente: TLFDbedit
            Left = 144
            Top = 22
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 5
            OnDblClick = SBAClienteDblClick
          end
          object EFDireccion: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 6
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETituloDireccion: TLFDbedit
            Left = 144
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxDirecciones
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object EFAgente: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'AGENTE'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 10
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
              'agente')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETituloAgente: TLFDbedit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxAgentes
            ReadOnly = True
            TabOrder = 11
            OnDblClick = SBAAgenteDblClick
          end
          object DBEDtoPP: TLFDbedit
            Left = 842
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'DTO_PP'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 42
          end
          object DBEDtoCial: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'DTO_CIAL'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 41
          end
          object EFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 154
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 16
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETituloAlmacen: TLFDbedit
            Left = 144
            Top = 154
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxAlmacenes
            Enabled = False
            ReadOnly = True
            TabOrder = 17
          end
          object DBDTPFechaEntrega: TLFDBDateEdit
            Left = 620
            Top = 1
            Width = 87
            Height = 21
            DataField = 'FECHA_ENTREGA_PREV'
            DataSource = DMPedidos.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 21
            OnExit = DBDTPFechaEntregaExit
          end
          object DBCHKServido: TLFDBCheckBox
            Left = 813
            Top = 127
            Width = 100
            Height = 17
            Caption = 'Servido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 46
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SERVIDO'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EFFormaPago: TLFDBEditFind2000
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'FORMA_PAGO'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 12
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETituloFormaPago: TLFDbedit
            Left = 144
            Top = 110
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxFormasPago
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBETituloEstado: TLFDbedit
            Left = 187
            Top = 0
            Width = 158
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMPedidos.DSxInfoActualizada
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object DBEFTarifa: TLFDBEditFind2000
            Left = 79
            Top = 132
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TARIFA'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 14
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETitTarifa: TLFDbedit
            Left = 144
            Top = 132
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxTarifas
            Enabled = False
            ReadOnly = True
            TabOrder = 15
          end
          object DBEAgrupacionKri: TLFDbedit
            Left = 842
            Top = 198
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'AGRUPACION_KRI'
            DataSource = DMPedidos.DSQMCabecera
            Enabled = False
            TabOrder = 50
          end
          object DBDTPFecha_Rec: TLFDBDateEdit
            Left = 458
            Top = 22
            Width = 87
            Height = 21
            DataField = 'FECHA_REC_CAB'
            DataSource = DMPedidos.DSQMCabecera
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            NumGlyphs = 2
            TabOrder = 24
          end
          object DBEFOperarioKri: TLFDBEditFind2000
            Left = 458
            Top = 176
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'USUARIO'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 39
            OnChange = DBEFOperarioKriChange
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
          object EOperarioKri: TLFEdit
            Left = 523
            Top = 176
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 40
          end
          object DBEPedidoCli: TLFDbedit
            Left = 458
            Top = 66
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'PEDIDO_CLIENTE'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 28
          end
          object DBEFContacto: TLFDBEditFind2000
            Left = 79
            Top = 66
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'CONTACTO'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 8
            OnChange = DBEFContactoChange
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEContacto: TLFDbedit
            Left = 144
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIT_CONTACTO'
            DataSource = DMPedidos.DSQMCabecera
            Enabled = False
            TabOrder = 9
          end
          object DBEDiasEntCli: TLFDbedit
            Left = 763
            Top = 1
            Width = 29
            Height = 21
            Hint = 'Dias Entrega'
            TabStop = False
            Color = clInfoBk
            DataField = 'DIAS_ENTREGA'
            DataSource = DMPedidos.DSxCliente
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ParentShowHint = False
            ReadOnly = True
            ShowHint = True
            TabOrder = 23
          end
          object DBMargenKri: TLFDbedit
            Left = 980
            Top = 200
            Width = 64
            Height = 21
            DataField = 'MARGEN_KRI'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 51
          end
          object DBDEFechaCreacionKri: TLFDBDateEdit
            Left = 676
            Top = 22
            Width = 87
            Height = 21
            DataField = 'FECHA_CREACION_KRI'
            DataSource = DMPedidos.DSQMCabecera
            CheckOnExit = True
            Color = clInfoBk
            Enabled = False
            NumGlyphs = 2
            TabOrder = 26
            OnExit = DBDTPFechaExit
          end
          object DBEClienteKri: TLFDbedit
            Left = 126
            Top = 22
            Width = 17
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 4
            OnChange = DBEClienteKriChange
            OnExit = DBEClienteKriExit
            OnKeyUp = DBEClienteKriKeyUp
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 458
            Top = 110
            Width = 23
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 31
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
            Entorno = DMPedidos.EntornoDoc
          end
          object ETituloPortes: TLFEdit
            Left = 482
            Top = 110
            Width = 168
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 32
          end
          object DBEPorPortes: TLFDbedit
            Left = 651
            Top = 110
            Width = 56
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 33
          end
          object DBEIPortes: TLFDbedit
            Left = 708
            Top = 110
            Width = 55
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 34
          end
          object DBEFRango: TLFDBEditFind2000
            Left = 458
            Top = 132
            Width = 64
            Height = 21
            DataField = 'RANGO'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 35
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBEFIndice: TLFDBEditFind2000
            Left = 458
            Top = 154
            Width = 64
            Height = 21
            DataField = 'INDICE'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 37
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBERango: TLFDbedit
            Left = 523
            Top = 132
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxRangos
            Enabled = False
            ReadOnly = True
            TabOrder = 36
          end
          object DBEIndice: TLFDbedit
            Left = 523
            Top = 154
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxIndices
            Enabled = False
            ReadOnly = True
            TabOrder = 38
          end
          object EFTransportista: TLFDBEditFind2000
            Left = 458
            Top = 88
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TRANSPORTISTA'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 29
            OnChange = EFTransportistaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
            Filtros = [obEmpresa]
            Entorno = DMPedidos.EntornoDoc
          end
          object ETituloTransportista: TLFEdit
            Left = 523
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 30
          end
          object DBCHKListado: TLFDBCheckBox
            Left = 346
            Top = 2
            Width = 38
            Height = 17
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
            DataSource = DMPedidos.DSxInfoActualizada
            ValueChecked = '4'
            ValueUnchecked = '0'
          end
          object DBDTPFechaPrevista: TDBDateTimePicker
            Left = 706
            Top = 0
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
            TabOrder = 22
            DataField = 'FECHA_ENTREGA_PREV'
            DataSource = DMPedidos.DSQMCabecera
          end
          object DBDTPFechaRecepcion: TDBDateTimePicker
            Left = 544
            Top = 22
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 46188.3871174653
            Format = 'HH:mm'
            Time = 46188.3871174653
            Color = clInfoBk
            DateFormat = dfShort
            DateMode = dmComboBox
            Enabled = False
            Kind = dtkTime
            ParseInput = False
            TabOrder = 25
            DataField = 'FECHA_REC_CAB'
            DataSource = DMPedidos.DSQMCabecera
          end
          object DBCHKListoParaPreparar: TLFDBCheckBox
            Left = 813
            Top = 109
            Width = 100
            Height = 17
            Caption = 'Listo preparaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 45
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'LISTO_PARA_PREPARAR'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBValorado: TLFDBCheckBox
            Left = 813
            Top = 91
            Width = 100
            Height = 17
            Caption = 'Valorar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 44
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PEDIDO_VALORADO'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBDocumentoMuestras: TLFDBCheckBox
            Left = 813
            Top = 145
            Width = 100
            Height = 17
            Caption = 'Muestras'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 47
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DOCUMENTO_MUESTRAS'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PNLClinica: TLFPanel
            Left = 914
            Top = 0
            Width = 350
            Height = 220
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 52
            Visible = False
            object LProyectoClinica: TLFLabel
              Left = 32
              Top = 2
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clinica'
              FocusControl = DBEFProyectoClinica
            end
            object LPoliza: TLFLabel
              Left = 35
              Top = 90
              Width = 28
              Height = 13
              Caption = 'Poliza'
            end
            object LAutorizacion: TLFLabel
              Left = 5
              Top = 68
              Width = 58
              Height = 13
              Caption = 'Autorizaci'#243'n'
            end
            object LPaciente: TLFLabel
              Left = 21
              Top = 46
              Width = 42
              Height = 13
              Caption = 'Paciente'
            end
            object LAsegurado: TLFLabel
              Left = 12
              Top = 24
              Width = 51
              Height = 13
              Caption = 'Asegurado'
            end
            object LFechaRecIh: TLFLabel
              Left = 2
              Top = 112
              Width = 61
              Height = 13
              Caption = 'Fec. Rec. IH'
            end
            object DBEFProyectoClinica: TLFDBEditFind2000
              Left = 67
              Top = 0
              Width = 64
              Height = 21
              AutoSelect = False
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'PROYECTO'
              DataSource = DMPedidos.DSQMCabecera
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'EMP_PROYECTOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'PROYECTO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              OnBusqueda = EFProyectoBusqueda
              OrdenadoPor.Strings = (
                'proyecto')
              Filtros = [obEmpresa]
              Entorno = DMPedidos.EntornoDoc
            end
            object DBETituloProyectoClinica: TLFDbedit
              Left = 132
              Top = 0
              Width = 213
              Height = 21
              TabStop = False
              AutoSelect = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPedidos.DSxProyectos
              Enabled = False
              ReadOnly = True
              TabOrder = 7
            end
            object DBEAutorizacion: TLFDbedit
              Left = 67
              Top = 66
              Width = 278
              Height = 21
              DataField = 'AUTORIZACION'
              DataSource = DMPedidos.DSQMCabecera
              TabOrder = 3
            end
            object DBEPoliza: TLFDbedit
              Left = 67
              Top = 88
              Width = 278
              Height = 21
              DataField = 'POLIZA'
              DataSource = DMPedidos.DSQMCabecera
              TabOrder = 4
            end
            object DBEAsegurado: TLFDbedit
              Left = 67
              Top = 22
              Width = 278
              Height = 21
              DataField = 'ASEGURADO'
              DataSource = DMPedidos.DSQMCabecera
              TabOrder = 1
            end
            object DBEPaciente: TLFDbedit
              Left = 67
              Top = 44
              Width = 278
              Height = 21
              DataField = 'PACIENTE'
              DataSource = DMPedidos.DSQMCabecera
              TabOrder = 2
            end
            object DBDEFecRecIH: TLFDBDateEdit
              Left = 67
              Top = 110
              Width = 87
              Height = 21
              DataField = 'FEC_REC_IH'
              DataSource = DMPedidos.DSQMCabecera
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 5
            end
            object DBDTPFecRecIH: TDBDateTimePicker
              Left = 155
              Top = 110
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
              TabOrder = 6
              DataField = 'FEC_REC_IH'
              DataSource = DMPedidos.DSQMCabecera
            end
          end
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 842
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMPedidos.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 43
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
          object DBENombreComercial: TLFDbedit
            Left = 79
            Top = 176
            Width = 305
            Height = 21
            Color = clAqua
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMPedidos.DSQMCabecera
            Enabled = False
            ReadOnly = True
            TabOrder = 18
            OnDblClick = ATerceroExecute
          end
          object DBEObservaciones: TLFDbedit
            Left = 79
            Top = 198
            Width = 684
            Height = 21
            AutoSize = False
            DataField = 'Z_OBSERVACION'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 19
          end
          object DBCBEmpaquetadoEmpresa: TLFDBCheckBox
            Left = 813
            Top = 162
            Width = 140
            Height = 17
            Caption = 'Empaquetado Empresa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 48
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EMPAQUETADO_EMPRESA'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBTratado: TLFDBCheckBox
            Left = 813
            Top = 180
            Width = 140
            Height = 17
            Caption = 'Tratado'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 49
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TRATADO'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PNLAvisos: TLFPanel
            Left = 933
            Top = 0
            Width = 273
            Height = 217
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 53
            object LAvisos: TLFLabel
              Left = 0
              Top = 0
              Width = 273
              Height = 13
              Align = alTop
              Caption = 'Avisos'
            end
            object LNotasCliente: TLFLabel
              Left = 0
              Top = 113
              Width = 273
              Height = 13
              Align = alTop
              Caption = 'Notas Cliente'
            end
            object DBMAviso: TLFDBMemo
              Left = 0
              Top = 13
              Width = 273
              Height = 100
              Align = alTop
              Color = clInfoBk
              DataField = 'MENSAJE'
              DataSource = DMPedidos.DSxAvisos
              ReadOnly = True
              TabOrder = 0
            end
            object DBMNotaCliente: TLFDBMemo
              Left = 0
              Top = 126
              Width = 273
              Height = 91
              Align = alClient
              Color = clInfoBk
              DataField = 'NOTAS'
              DataSource = DMPedidos.DSxAvisos
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
      end
      object TSOtros: TTabSheet [1]
        Caption = '&Otros'
        ImageIndex = 4
        OnShow = TSOtrosShow
        object SBAProyecto: TSpeedButton
          Left = 123
          Top = 101
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAProyectoDblClick
        end
        object PNLCabOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 1264
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
            object LLBLFechaOtros: TLFLabel
              Left = 544
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLReferenciaOtros: TLFLabel
              Left = 346
              Top = 4
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
              DataSource = DMPedidos.DSQMCabecera
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEOtrosSuReferenciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMPedidos.DSQMCabecera
              Enabled = False
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
              DataSource = DMPedidos.DSxCliente
              Enabled = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEOtrosRIGCab: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMPedidos.DSQMCabecera
              Enabled = False
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
            DataSource = DMPedidos.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEOtrosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = False
            ControlEdit = CEOtros
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLEdOtros: TPanel
          Left = 0
          Top = 22
          Width = 1264
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LMoneda: TLFLabel
            Left = 34
            Top = 46
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLCampanya: TLFLabel
            Left = 407
            Top = 2
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campa'#241'a'
          end
          object LBLProyecto: TLFLabel
            Left = 31
            Top = 2
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = EFProyecto
          end
          object LBIdioma: TLFLabel
            Left = 42
            Top = 25
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
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
            Left = 402
            Top = 25
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Linea'
          end
          object LCodBarras: TLFLabel
            Left = 781
            Top = 46
            Width = 55
            Height = 13
            Caption = 'C'#243'd. Barras'
          end
          object ICodBarras: TImage
            Left = 842
            Top = 66
            Width = 115
            Height = 21
          end
          object LFechaPedidoKri: TLFLabel
            Left = 388
            Top = 70
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Pedido'
          end
          object LPorFinanciacion: TLFLabel
            Left = 801
            Top = 2
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Financ.'
            FocusControl = DBESuReferencia
          end
          object LFirma: TLFLabel
            Left = 429
            Top = 112
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Firma'
          end
          object LBancoDireccion: TLFLabel
            Left = 44
            Top = 92
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LUsuarioCreacion: TLFLabel
            Left = 5
            Top = 180
            Width = 70
            Height = 13
            Hint = 'Usuario Creacion'
            Alignment = taRightJustify
            Caption = 'Usuario Creac.'
            FocusControl = DBESuReferencia
            ParentShowHint = False
            ShowHint = True
          end
          object LRuta: TLFLabel
            Left = 429
            Top = 92
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta'
          end
          object LRutaOrden: TLFLabel
            Left = 564
            Top = 92
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LModoIVA: TLFLabel
            Left = 405
            Top = 48
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMPedidos.DSQMCabecera
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
          object DBETitMoneda: TLFDbedit
            Left = 144
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxMonedas
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object EFCampanya: TLFDBEditFind2000
            Left = 458
            Top = 0
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CAMPANYA'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 12
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETituloCampanya: TLFDbedit
            Left = 523
            Top = 0
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxCampanyas
            Enabled = False
            ReadOnly = True
            TabOrder = 13
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
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = EFProyectoBusqueda
            OrdenadoPor.Strings = (
              'proyecto')
            Filtros = [obEmpresa]
            Entorno = DMPedidos.EntornoDoc
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
            DataSource = DMPedidos.DSxProyectos
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEFIdioma: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'IDIOMA'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 2
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
            Entorno = DMPedidos.EntornoDoc
          end
          object DBETituloIdioma: TLFDbedit
            Left = 144
            Top = 22
            Width = 240
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPedidos.DSxIdiomas
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBCHKCambio: TLFDBCheckBox
            Left = 79
            Top = 68
            Width = 82
            Height = 17
            Caption = 'Cambio Fijo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKCambioChange
            DataField = 'CAMBIO_FIJO'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorCambio: TLFDbedit
            Left = 237
            Top = 66
            Width = 64
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 7
          end
          object DBEFTipoLineaKri: TLFDBEditFind2000
            Left = 458
            Top = 22
            Width = 66
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TIPO_LINEA_KRI'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 14
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
            Entorno = DMPedidos.EntornoDoc
          end
          object ETipoLineaKri: TLFEdit
            Left = 523
            Top = 22
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
          end
          object DBECodBarras: TLFDbedit
            Left = 842
            Top = 44
            Width = 115
            Height = 21
            DataField = 'Z_COD_BARRAS_PED'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 23
            OnChange = DBECodBarrasChange
          end
          object DBEFechaPedidoKri: TLFDBDateEdit
            Left = 458
            Top = 66
            Width = 87
            Height = 21
            DataField = 'FECHA_CLIENTE'
            DataSource = DMPedidos.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 18
            OnExit = DBDTPFechaExit
          end
          object DBEFinanciacion: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 21
          end
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 813
            Top = 24
            Width = 120
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMPedidos.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PNLFirma: TLFPanel
            Left = 458
            Top = 110
            Width = 205
            Height = 65
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 24
            DesignSize = (
              205
              65)
            object ImgFirma: TImage
              Left = 0
              Top = 0
              Width = 205
              Height = 65
              Align = alClient
              Center = True
              Proportional = True
              Stretch = True
            end
            object DBTFirmaNombre: TDBText
              Left = 0
              Top = 39
              Width = 205
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              Color = clBtnFace
              DataField = 'NOMBRE'
              DataSource = DMPedidos.DSQMFirmas
              ParentColor = False
              Transparent = True
            end
            object DBTNIFFirma: TDBText
              Left = 0
              Top = 52
              Width = 205
              Height = 13
              Anchors = [akLeft, akRight, akBottom]
              DataField = 'NIF'
              DataSource = DMPedidos.DSQMFirmas
              Transparent = True
            end
          end
          object DBEFBancoDireccion: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            DataField = 'BANCO'
            DataSource = DMPedidos.DSQMCabecera
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
          object DBEFUsuarioCreacion: TLFDBEditFind2000
            Left = 79
            Top = 176
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'USUARIO_CREACION'
            DataSource = DMPedidos.DSQMCabecera
            Enabled = False
            TabOrder = 10
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
          object EUsuarioCreacion: TLFEdit
            Left = 144
            Top = 176
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 11
          end
          object DBERuta: TLFDbedit
            Left = 458
            Top = 88
            Width = 66
            Height = 21
            DataField = 'RUTA'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 19
          end
          object DBERutaOrden: TLFDbedit
            Left = 597
            Top = 88
            Width = 66
            Height = 21
            DataField = 'RUTA_ORDEN'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 20
          end
          object EFModoIva: TLFDBEditFind2000
            Left = 458
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMPedidos.DSQMCabecera
            TabOrder = 16
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
          object EModoIva: TLFEdit
            Left = 523
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 17
          end
        end
      end
      object TSNotas: TTabSheet [2]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PNLEdNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 1264
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object splitter: TSplitter
            Left = 1056
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
            Width = 1264
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
            object ToolButton6: TToolButton
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
            Width = 1056
            Height = 169
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBRENotasInternasKri: TDBRichEdit
              Left = 0
              Top = 80
              Width = 1056
              Height = 89
              Align = alBottom
              Color = clMoneyGreen
              DataField = 'NOTAS_INTERNAS_KRI'
              DataSource = DMPedidos.DSQMCabecera
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
              Width = 1056
              Height = 80
              Align = alClient
              DataField = 'NOTAS'
              DataSource = DMPedidos.DSQMCabecera
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
            Left = 1064
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
              object ToolButton7: TToolButton
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
        object PNLCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 1264
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object PNLTitNotas: TLFPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LBLFechaNotas: TLFLabel
              Left = 544
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLReferenciaNotas: TLFLabel
              Left = 346
              Top = 4
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
              DataSource = DMPedidos.DSQMCabecera
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
            object DBENotasSuReferenciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMPedidos.DSQMCabecera
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
            object DBENotasClienteTituloCab: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMPedidos.DSxCliente
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
            object DBENotasRIGCab: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMPedidos.DSQMCabecera
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
            DataSource = DMPedidos.DSQMCabecera
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
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavMainClickAfterAdjust
          end
        end
      end
      object TSEDI: TTabSheet [3]
        Caption = '&EDI'
        ImageIndex = 3
        OnHide = TSEDIHide
        OnShow = TSEDIShow
        object PNLEDI: TLFPanel
          Left = 0
          Top = 0
          Width = 1264
          Height = 220
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LEDICliente: TLFLabel
            Left = 44
            Top = 30
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LEDIAQuienSeFactura: TLFLabel
            Left = 36
            Top = 51
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'A.Q.S.F.'
          end
          object LEDIDescuento: TLFLabel
            Left = 56
            Top = 72
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto.'
          end
          object LEDIQuienPaga: TLFLabel
            Left = 40
            Top = 96
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Q.Paga'
          end
          object LEDIQuienPide: TLFLabel
            Left = 44
            Top = 117
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Q.Pide'
          end
          object LEDIReceptor: TLFLabel
            Left = 32
            Top = 139
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Receptor'
          end
          object LEDIFechaEntrega: TLFLabel
            Left = 24
            Top = 162
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Ent.'
          end
          object DBEEDICliente: TLFDbedit
            Left = 80
            Top = 26
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'CLIENTE'
            DataSource = DMPedidos.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBEEDIClienteChange
          end
          object DBEEDIAQuienSeFactura: TLFDbedit
            Left = 80
            Top = 48
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'AQSF'
            DataSource = DMPedidos.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            OnChange = DBEEDIAQuienSeFacturaChange
          end
          object DBEEDIDescuento: TLFDbedit
            Left = 80
            Top = 70
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'DEPTO'
            DataSource = DMPedidos.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEEDIQuienPaga: TLFDbedit
            Left = 80
            Top = 92
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'QPAGA'
            DataSource = DMPedidos.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 3
            OnChange = DBEEDIQuienPagaChange
          end
          object DBEEDIQuienPide: TLFDbedit
            Left = 80
            Top = 114
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'QPIDE'
            DataSource = DMPedidos.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 4
            OnChange = DBEEDIQuienPideChange
          end
          object DBEEDIReceptor: TLFDbedit
            Left = 80
            Top = 136
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'RECEPTOR'
            DataSource = DMPedidos.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 5
            OnChange = DBEEDIReceptorChange
          end
          object DBEEDIFechaEntrega: TLFDbedit
            Left = 80
            Top = 158
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'FECHAERE'
            DataSource = DMPedidos.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 6
          end
          object ETitEDICliente: TLFEdit
            Left = 202
            Top = 26
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object ETitEDIAQuienSeFactura: TLFEdit
            Left = 202
            Top = 48
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object ETitEDIQuienPaga: TLFEdit
            Left = 202
            Top = 92
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object ETitEDIQuienPide: TLFEdit
            Left = 202
            Top = 114
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object ETitEDIReceptor: TLFEdit
            Left = 202
            Top = 136
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1264
          Height = 220
          DataSource = DMPedidos.DSQMCabecera
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          OnCellClick = DBGMainCellClick
          OnKeyDown = DBGMainKeyDown
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'DOCUMENTO_MUESTRAS'
            'EMPAQUETADO_EMPRESA'
            'INVERSION_SUJETO_PASIVO'
            'LISTO_PARA_PREPARAR'
            'MODIFICA_DOC'
            'PEDIDO_VALORADO'
            'TRATADO')
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
            'AGENTE'
            'ALMACEN'
            'B_DTO_LINEAS'
            'CAMPANYA'
            'CLIENTE'
            'CODIGO_POSTAL'
            'CONTACTO'
            'DIR_COMPLETA'
            'DTO_CIAL'
            'DTO_PP'
            'EMPLEADO_ATENCION'
            'EMPLEADO_RESPONSABLE'
            'ESTADO'
            'FECHA'
            'FECHA_CLIENTE'
            'FECHA_CREACION_KRI'
            'FECHA_ENTREGA_PREV'
            'FECHA_REC_CAB'
            'FORMA_PAGO'
            'I_COMISION'
            'I_DTO_CIAL'
            'I_DTO_LINEAS'
            'I_DTO_PP'
            'I_FINANCIACION'
            'I_PORTES'
            'ID_FICHA_TECNICA'
            'IDIOMA'
            'LIQUIDO'
            'LISTO_PARA_PREPARAR'
            'LOCALIDAD'
            'MARGEN_KRI'
            'MONEDA'
            'NOMBRE_COMERCIAL'
            'PORTES'
            'PROYECTO'
            'RIG'
            'RUTA'
            'S_BASES'
            'S_CUOTA_IVA'
            'S_CUOTA_RE'
            'SERVIDO'
            'SU_REFERENCIA'
            'TARIFA'
            'TIPO_PORTES'
            'TIT_CONTACTO'
            'TITULO'
            'TRANSPORTISTA'
            'TRATADO'
            'USUARIO'
            'Z_OBSERVACION'
            'PEDIDO_CLIENTE')
          CamposCalcAOrdenar.Strings = (
            'TOTAL_CANAL')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Title.Alignment = taRightJustify
              Width = 53
              Visible = True
            end
            item
              Alignment = taRightJustify
              Expanded = False
              FieldName = 'FECHA'
              Title.Alignment = taRightJustify
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
              Width = 233
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_CANAL'
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
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PED_PROV_ASOCIADO'
              Width = 65
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
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ANTICIPADO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODIFICA_DOC'
              Width = 40
              Visible = True
            end>
        end
      end
      object TSDirManual: TTabSheet
        Caption = 'Dir. Manual'
        ImageIndex = 4
        OnResize = TSDirManualResize
        object PNLDirManual: TLFPanel
          Left = 0
          Top = 0
          Width = 1264
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
              DataSource = DMPedidos.DSQMCabecera
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
              DataSource = DMPedidos.DSQMCabecera
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
              DataSource = DMPedidos.DSQMCabecera
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
              DataSource = DMPedidos.DSQMCabecera
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
            DataSource = DMPedidos.DSQMCabecera
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
          Width = 1264
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object PNLDirEntrega: TLFPanel
            Left = 600
            Top = 0
            Width = 664
            Height = 198
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object PNLEdDirEntrega: TLFPanel
              Left = 0
              Top = 0
              Width = 664
              Height = 97
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LFLabel3: TLFLabel
                Left = 0
                Top = 0
                Width = 664
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
                DataSource = DMPedidos.DSQMCabecera
                TabOrder = 0
              end
              object DBEMatriculaEntrega: TLFDbedit
                Left = 64
                Top = 39
                Width = 297
                Height = 21
                DataField = 'MATRICULA_ENTREGA'
                DataSource = DMPedidos.DSQMCabecera
                TabOrder = 1
              end
              object DBDEFechaEntregaManual: TLFDBDateEdit
                Left = 64
                Top = 61
                Width = 121
                Height = 21
                DataField = 'FECHA_ENTREGA_MANUAL'
                DataSource = DMPedidos.DSQMCabecera
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
                DataSource = DMPedidos.DSQMCabecera
              end
            end
            object DBMDirEntrega: TLFDBMemo
              Left = 0
              Top = 97
              Width = 664
              Height = 101
              Align = alClient
              DataField = 'DIR_ENTREGA_MANUAL'
              DataSource = DMPedidos.DSQMCabecera
              TabOrder = 1
            end
          end
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
              Height = 97
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
                DataSource = DMPedidos.DSQMCabecera
                TabOrder = 0
              end
              object DBEMatriculaRecogida: TLFDbedit
                Left = 64
                Top = 39
                Width = 297
                Height = 21
                DataField = 'MATRICULA_RECOGIDA'
                DataSource = DMPedidos.DSQMCabecera
                TabOrder = 1
              end
              object DBDEFechaRecogidaManual: TLFDBDateEdit
                Left = 64
                Top = 61
                Width = 121
                Height = 21
                DataField = 'FECHA_RECOGIDA_MANUAL'
                DataSource = DMPedidos.DSQMCabecera
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
                DataSource = DMPedidos.DSQMCabecera
              end
            end
            object DBMDirRecogida: TLFDBMemo
              Left = 0
              Top = 97
              Width = 600
              Height = 101
              Align = alClient
              DataField = 'DIR_RECOGIDA_MANUAL'
              DataSource = DMPedidos.DSQMCabecera
              TabOrder = 1
            end
          end
        end
      end
      object TSProveedores: TTabSheet
        Caption = 'Proveedores'
        ImageIndex = 6
        OnShow = TSProveedoresShow
        object PNLProveedores: TLFPanel
          Left = 0
          Top = 0
          Width = 1264
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
              DataSource = DMPedidos.DSQMCabecera
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
              DataSource = DMPedidos.DSQMCabecera
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
              DataSource = DMPedidos.DSQMCabecera
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
              DataSource = DMPedidos.DSQMCabecera
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
            DataSource = DMPedidos.DSxProveedores
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
          Width = 1264
          Height = 198
          Align = alClient
          DataSource = DMPedidos.DSxProveedores
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
          Transaction = DMPedidos.TLocal
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
          Entorno = DMPedidos.EntornoDoc
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
              Width = 60
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
    end
  end
  inherited PDetalle: TLFPanel
    Top = 280
    Width = 1278
    Height = 293
    inherited TBDetalle: TLFToolBar
      Width = 1278
      Height = 23
      ButtonHeight = 23
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Wrapable = False
      inherited NavDetalle: THYMNavigator
        Height = 23
        DataSource = DMPedidos.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        DelMessage = #191'Desea borrar la l'#237'nea? '
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object ToolButton3: TToolButton
        Left = 220
        Top = 0
        Width = 10
        Style = tbsSeparator
      end
      object TButtNotas: TToolButton
        Left = 230
        Top = 0
        Hint = 'Edita las notas de la l'#237'nea seleccionada'
        Action = ANotasDetalle
        ParentShowHint = False
        ShowHint = True
      end
      object TButtInfStocks: TToolButton
        Left = 253
        Top = 0
        Action = AInfoStocks
        ParentShowHint = False
        ShowHint = True
      end
      object TButtUnidades_Ext: TToolButton
        Left = 276
        Top = 0
        Action = AUnidadesExt
        ParentShowHint = False
        ShowHint = True
      end
      object TButtPrecios: TToolButton
        Left = 299
        Top = 0
        Action = APreciosTarifa
        ParentShowHint = False
        ShowHint = True
      end
      object TButtInfoHistorico: TToolButton
        Left = 322
        Top = 0
        Action = AInfoHistorico
        ParentShowHint = False
        ShowHint = True
      end
      object TButtRecibos: TToolButton
        Left = 345
        Top = 0
        Action = ARecibos
        ParentShowHint = False
        ShowHint = True
      end
      object TButtHerencia: TToolButton
        Left = 368
        Top = 0
        Action = AHerencia
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton1: TToolButton
        Left = 391
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBArtCli: TToolButton
        Left = 399
        Top = 0
        Action = AArtCli
        ParentShowHint = False
        ShowHint = True
      end
      object TBCliArt: TToolButton
        Left = 422
        Top = 0
        Action = ACliArt
      end
      object ToolButton2: TToolButton
        Left = 445
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCambiaDescripcion: TToolButton
        Left = 453
        Top = 0
        Action = ACambiaTitulo
        ParentShowHint = False
        ShowHint = True
      end
      object TButtDetalleArticulo: TToolButton
        Left = 476
        Top = 0
        Action = ADetalleArticulo
        ParentShowHint = False
        ShowHint = True
      end
      object TBDescargaLector: TToolButton
        Left = 499
        Top = 0
        Action = ADescargaLector
        ParentShowHint = False
        ShowHint = True
      end
      object TBDivisiones: TToolButton
        Left = 522
        Top = 0
        Action = ADivisiones
        ImageIndex = 18
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscarArticulo: TToolButton
        Left = 545
        Top = 0
        Action = ABuscarArticulos
        Style = tbsCheck
      end
      object TButtBuscarOrden: TToolButton
        Left = 568
        Top = 0
        Action = ABuscarOrdenDeProduccion
        Style = tbsCheck
      end
      object TButtBuscarLoteSimple: TToolButton
        Left = 591
        Top = 0
        Action = ABuscarLoteSimple
        Style = tbsCheck
      end
      object ToolButton4: TToolButton
        Left = 614
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBBajarLinea: TToolButton
        Left = 622
        Top = 0
        Action = ABajarLinea
        ParentShowHint = False
        ShowHint = True
      end
      object TBSubirLinea: TToolButton
        Left = 645
        Top = 0
        Action = ASubirLinea
        ParentShowHint = False
        ShowHint = True
      end
      object TSep1: TToolButton
        Left = 668
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCondicionesVenta: TToolButton
        Left = 676
        Top = 0
        Action = ACondicionesDeVenta
      end
      object TButtDetalles: TToolButton
        Left = 699
        Top = 0
        Action = ADetallesDeLinea
      end
      object TButtDuplicarLinea: TToolButton
        Left = 722
        Top = 0
        Action = ADuplicarLinea
      end
      object TBCondicionesClientes: TToolButton
        Left = 745
        Top = 0
        Action = ACondicionesClientes
      end
      object TBCreaAnticipo: TToolButton
        Left = 768
        Top = 0
        Action = ACreaAnticipo
      end
      object TButtImportarDetalle: TToolButton
        Left = 791
        Top = 0
        Action = AImportarDetalle
      end
      object TBSep1: TToolButton
        Left = 814
        Top = 0
        Width = 8
        ImageIndex = 50
        Style = tbsSeparator
      end
      object TButtImportarExcel: TToolButton
        Left = 822
        Top = 0
        Action = AImportarExcel
      end
      object PNLProgreso: TLFPanel
        Left = 845
        Top = 0
        Width = 179
        Height = 23
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          179
          23)
        object PBProgreso: TProgressBar
          Left = 0
          Top = 0
          Width = 122
          Height = 23
          Align = alLeft
          Anchors = [akLeft, akTop, akRight, akBottom]
          Min = 0
          Max = 100
          TabOrder = 0
        end
        object BCancelar: TButton
          Left = 125
          Top = 0
          Width = 53
          Height = 22
          Anchors = [akTop, akRight]
          Caption = 'Cancelar'
          TabOrder = 1
          OnClick = BCancelarClick
        end
      end
      object TBSep2: TToolButton
        Left = 1024
        Top = 0
        Width = 8
        ImageIndex = 87
        Style = tbsSeparator
      end
      object TBSeleccionaDetalleTyC: TToolButton
        Left = 1032
        Top = 0
        Action = ASeleccionaDetalleTyC
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Top = 45
      Width = 1278
      Height = 193
      DataSource = DMPedidos.DSQMDetalle
      TabOrder = 0
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      OnKeyDown = DBGFDetalleKeyDown
      OnKeyPress = DBGFDetalleKeyPress
      OnKeyUp = DBGFDetalleKeyUp
      IniStorage = FSMain
      ColumnaInicial = 2
      UsaDicG2K = False
      AutoCambiarColumna = True
      Transaction = DMPedidos.TLocal
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO'
        'TIPO_IVA'
        'DIRECCION_ENTREGA'
        'ARTICULO'
        'PROYECTO'
        'TIPO_LINEA_KRI'
        'TIPO_UNIDAD_LOGISTICA'
        'ARTICULO'
        'ALMACEN'
        'TIPO_IMPUESTO_ADICIONAL'
        'ID_DESPIECE'
        'DIRECCION_ALM_LOGISTICO'
        'ID_ESC'
        'ID_ESC_2')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'ARTICULO'
        '3'
        'ALFA_1'
        'ALFA_2'
        'FABRICANTE'
        'TIPO_IVA'
        '1'
        'P_IVA'
        'DIRECCION_ENTREGA'
        '0'
        'ARTICULO'
        '0'
        'PROYECTO'
        '0'
        'TIPO_LINEA_KRI'
        '0'
        'TIPO_UNIDAD_LOGISTICA'
        '0'
        'ARTICULO'
        '1'
        'TITULO_ARTICULO_CLIENTE'
        'ALMACEN'
        '0'
        'TIPO_IMPUESTO_ADICIONAL'
        '0'
        'ID_DESPIECE'
        '3'
        'ARTICULO'
        'SU_REFERENCIA'
        'EJERCICIO'
        'DIRECCION_ALM_LOGISTICO'
        '0'
        'ID_ESC'
        '4'
        'DESCRIPCION'
        'COMPUESTO'
        'ESCANDALLO'
        'VERSION_ESCANDALLO'
        'ID_ESC_2'
        '4'
        'DESCRIPCION'
        'COMPUESTO'
        'ESCANDALLO'
        'VERSION_ESCANDALLO')
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
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        'ARTICULO'
        ''
        ''
        'DIRECCION'
        'ARTICULO'
        ''
        ''
        'TIPO'
        'ARTICULO'
        'ALMACEN'
        ''
        ''
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '0'
        '1'
        '1'
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
        '1'
        '1')
      CamposAOrdernar.Strings = (
        'FECHA_ENTREGA_PREV'
        'FECHA_REC_DET'
        'ARTICULO'
        'ORDEN'
        'TITULO'
        'PRECIO'
        'SERVIDO'
        'LINEA')
      ColumnasCheckBoxes.Strings = (
        'APLICA_UNIDADES_SECUNDARIAS'
        'SERVIDO'
        'MANIPULACION'
        'INVERSION_SUJETO_PASIVO'
        'PEDIR')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0'
        '0'
        '0')
      Numericos.Strings = (
        'BARRAS'
        'ARTICULO'
        'TIPO'
        'DIRECCION'
        'NSERIE'
        'PROYECTO'
        'ID'
        'TIPO'
        'CODIGO_CLIENTE'
        'ALMACEN'
        'TIPO'
        'ID_DESPIECE_CAB'
        'DIRECCION'
        'ID_ESC'
        'ID_ESC')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_CON_BARRAS'
        'VER_ARTICULOS_EF'
        'SYS_TIPO_IVA'
        'SYS_TERCEROS_DIRECCIONES'
        'ART_ARTICULOS_SERIALIZACION'
        'EMP_PROYECTOS'
        'SYS_TIPO_LINEA_VENTA_KRI'
        'VER_ARTICULOS_UNID_LOG'
        'VER_ARTICULOS_COD_CLI'
        'ART_ALMACENES'
        'SYS_TIPO_IMPUESTO_ADICIONAL'
        'PRO_DESPIECE_CAB'
        'SYS_TERCEROS_DIRECCIONES'
        'VER_PRO_ESCANDALLO_EF'
        'VER_PRO_ESCANDALLO_EF')
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
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TIPO'
        'TITULO'
        'TITULO'
        'DIR_COMPLETA'
        'NSERIE'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO_ARTICULO'
        'TITULO'
        'TITULO'
        'TITULO'
        'DIR_COMPLETA'
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
        ''
        ''
        ''
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        'BARRAS'
        'ARTICULO'
        'TIPO'
        'DIRECCION'
        'NSERIE'
        'PROYECTO'
        'ID'
        'DEFECTO,TIPO'
        'CODIGO_CLIENTE'
        'ALMACEN'
        'TIPO'
        'ID_DESPIECE_CAB'
        'DIRECCION'
        'VERSION_ESCANDALLO'
        'VERSION_ESCANDALLO')
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
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 282
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Alignment = taRightJustify
          Width = 57
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
          Width = 75
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
          FieldName = 'P_COSTE'
          ReadOnly = True
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
          Width = 50
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
          Width = 38
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
          Width = 47
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
          Width = 94
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
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TIPO_UNIDAD_LOGISTICA'
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_UNIDAD_LOGISTICA'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_LOGISTICAS'
          Width = 44
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
          Width = 44
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_UNIDADES_EXT'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_PENDIENTES'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 46
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERVIDO'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_LINEA_KRI'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARGEN_KRI'
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
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PIEZAS_X_BULTO'
          Width = 53
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
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMISION_LINEAL'
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
          Width = 47
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
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION_ALM_LOGISTICO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIRECCION_ENTREGA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_ENTREGA_PREV'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_CONF_DET'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_REC_DET'
          Width = 72
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
          FieldName = 'CODIGO_CLIENTE'
          ReadOnly = True
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_CLIENTE'
          ReadOnly = True
          Width = 230
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_ORDEN'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_ESC'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ESC_2'
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
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_MEDIDA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MANIPULACION'
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
          FieldName = 'ID_DESPIECE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'AGENTE'
          Width = 40
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
          FieldName = 'PEDIR'
          Width = 39
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
    object PCPie: TLFPageControl
      Left = 0
      Top = 238
      Width = 1278
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
        object PNLPieGenerico: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 2
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object PNLPieUnidades: TLFPanel
            Left = 2
            Top = 2
            Width = 235
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            ParentShowHint = False
            ShowHint = True
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
              Hint = 'Sum Unidades'
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMPedidos.DSxInfoActualizada
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
              Left = 123
              Top = 0
              Width = 55
              Height = 21
              Hint = 'Sum Unidades Logisiticas'
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_LOGISTICAS'
              DataSource = DMPedidos.DSxInfoActualizada
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
              Left = 180
              Top = 0
              Width = 55
              Height = 21
              Hint = 'Sum Unidades Secundarias'
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_SEC'
              DataSource = DMPedidos.DSxInfoActualizada
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
            Left = 237
            Top = 2
            Width = 298
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object LBLBultos: TLFLabel
              Left = 57
              Top = 4
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bultos'
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
            object LSumaPeso: TLFLabel
              Left = 124
              Top = 4
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso'
              Layout = tlCenter
            end
            object LMargen: TLFLabel
              Left = 213
              Top = 4
              Width = 36
              Height = 13
              Caption = 'Margen'
            end
            object DBEBultos: TLFDbedit
              Left = 89
              Top = 1
              Width = 30
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'BULTOS'
              DataSource = DMPedidos.DSxInfoActualizada
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
              Left = 22
              Top = 1
              Width = 30
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'COUNT_LINEA'
              DataSource = DMPedidos.DSxInfoActualizada
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
              Left = 153
              Top = 1
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_PESO'
              DataSource = DMPedidos.DSxInfoActualizada
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
              Left = 253
              Top = 2
              Width = 45
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'MARGEN'
              DataSource = DMPedidos.DSxInfoActualizada
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
            Left = 535
            Top = 2
            Width = 733
            Height = 25
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LBLTotalAnticipado: TLFLabel
              Left = 460
              Top = 4
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'T. Antic.'
              Layout = tlCenter
            end
            object LBLLiquido: TLFLabel
              Left = 330
              Top = 4
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'quido'
              Layout = tlCenter
            end
            object LBLBaseImp: TLFLabel
              Left = 0
              Top = 4
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'B. Imp.'
              Layout = tlCenter
            end
            object LBLCuotas: TLFLabel
              Left = 129
              Top = 4
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA y Rec.'
              Layout = tlCenter
            end
            object DBECuotaIVA: TLFDbedit
              Left = 183
              Top = 0
              Width = 70
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_IVA'
              DataSource = DMPedidos.DSxInfoActualizada
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
              Left = 254
              Top = 0
              Width = 70
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_RE'
              DataSource = DMPedidos.DSxInfoActualizada
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
              Left = 370
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'LIQUIDO'
              DataSource = DMPedidos.DSxInfoActualizada
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
            object DBES_Bases: TLFDbedit
              Left = 39
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_BASES'
              DataSource = DMPedidos.DSxInfoActualizada
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
            object DBETotal_Anticipado: TLFDbedit
              Left = 504
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TOTAL_ANTICIPADO'
              DataSource = DMPedidos.DSxInfoActualizada
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
          end
        end
      end
      object TSPieRetCom: TTabSheet
        Caption = '&Retenciones/Comisiones'
        ImageIndex = 1
        object PNLPieRetenciones: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLBaseComision: TLFLabel
            Left = 449
            Top = 5
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Comisi'#243'n'
            FocusControl = DBEBaseComision
            Layout = tlCenter
          end
          object LBLImporte: TLFLabel
            Left = 636
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            FocusControl = DBEImp_Comision
            Layout = tlCenter
          end
          object DBEBaseComision: TLFDbedit
            Left = 522
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_COMISION'
            DataSource = DMPedidos.DSxInfoActualizada
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
          object DBEImp_Comision: TLFDbedit
            Left = 674
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_COMISION'
            DataSource = DMPedidos.DSxInfoActualizada
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
      object TSPieCarDtos: TTabSheet
        Caption = '&Cargos y Descuentos'
        ImageIndex = 2
        object PNLPNLieComisiones: TLFPanel
          Left = 0
          Top = 0
          Width = 1270
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLBaseDtoLinea: TLFLabel
            Left = 269
            Top = 5
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Layout = tlCenter
          end
          object LBLImporteFicha: TLFLabel
            Left = 470
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LBLImporteCargos: TLFLabel
            Left = 118
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object LBLImpBase: TLFLabel
            Left = 619
            Top = 5
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Bases'
            Layout = tlCenter
          end
          object DBEBaseDtoEnLinea: TLFDbedit
            Left = 350
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_DTO_LINEAS'
            DataSource = DMPedidos.DSxInfoActualizada
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
            Left = 508
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMPedidos.DSxInfoActualizada
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
            Left = 156
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMPedidos.DSxInfoActualizada
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
            DataSource = DMPedidos.DSxInfoActualizada
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
    object TBProduccion: TLFToolBar
      Left = 0
      Top = 23
      Width = 1278
      Height = 22
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 3
      Separators = True
      object TButtOrdenProd: TToolButton
        Left = 0
        Top = 0
        Hint = 'Generar Orden de Producci'#243'n'
        Caption = 'Generar Orden de Producci'#243'n'
        ImageIndex = 92
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtOrdenProdClick
      end
      object TBEscandall: TToolButton
        Left = 23
        Top = 0
        Hint = 'Crear/Abrir/Reasignar Escandallo'
        Caption = 'Crear/Seleccionar Escandallo'
        DropdownMenu = PMSeleccEsc
        ImageIndex = 96
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = AProCrearEscandalloExecute
      end
      object TBDatosEsp: TToolButton
        Left = 59
        Top = 0
        Action = AProADatosEsc
        ParentShowHint = False
        ShowHint = True
      end
      object TBOrden: TToolButton
        Left = 82
        Top = 0
        Hint = 'Crear/Abrir Orden Fabricaci'#243'n'
        Caption = 'Crear Orden de Producci'#243'n'
        DropdownMenu = PMCreacionOrdenes
        ImageIndex = 92
        ParentShowHint = False
        ShowHint = True
        Style = tbsDropDown
        OnClick = AProCrearOFExecute
      end
      object TBDespiece: TToolButton
        Left = 118
        Top = 0
        Action = ADespiece
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton5: TToolButton
        Left = 141
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLEstadoOrden: TLFPanel
        Left = 149
        Top = 0
        Width = 250
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object ChkBEstadoOrden: TLFCheckBox
          Left = 6
          Top = 3
          Width = 240
          Height = 18
          Caption = 'Orden %d Creada (deslanzada)'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 573
    Width = 1278
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PNLEdCabecera
    Complementario = TBDetalle
    Left = 72
    Top = 336
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 104
    Top = 336
  end
  inherited ALMain: TLFActionList
    Left = 296
    Top = 336
    object ZAInformeEspecial: TAction
      Category = 'Listados'
      Caption = 'Informe Especial Temporal'
      Hint = 'Informe Especial Temporal'
      ImageIndex = 14
      OnExecute = ZAInformeEspecialExecute
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
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Quitar Filtro'
      Hint = 'Quitar Filtro'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AFiltroAbierto: TAction
      Category = 'Filtros'
      Caption = 'Abiertos'
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
    object AFiltroAbiertoListoPreparacion: TAction
      Category = 'Filtros'
      Caption = 'Abierto y Listo Preparacion'
      Hint = 'Muesta documentos abiertos y listos para preparacion'
      ImageIndex = 5
      OnExecute = AFiltroAbiertoListoPreparacionExecute
    end
    object AAdjuntosPedido: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Pedido'
      ImageIndex = 59
      OnExecute = AAdjuntosPedidoExecute
    end
    object ZAInformeEspecialFinal: TAction
      Category = 'Listados'
      Caption = 'Informe Especial Final'
      Hint = 'Informe Especial Final'
      ImageIndex = 14
      OnExecute = ZAInformeEspecialFinalExecute
    end
    object ZAInformeDetallado: TAction
      Category = 'Listados'
      Caption = 'Informe Detallado'
      Hint = 'Informe Detallado'
      ImageIndex = 14
      OnExecute = ZAInformeDetalladoExecute
    end
    object AInformePedido: TAction
      Category = 'Listados'
      Caption = 'Informe Pedido'
      Hint = 'Informe Pedido'
      ImageIndex = 14
      OnExecute = AInformePedidoExecute
    end
    object AInformePedido2: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Pedido 2'
      Hint = 'Informe Pedido 2'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformePedido2Execute
    end
    object AInformePedido3: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Pedido 3'
      Hint = 'Informe Pedido 3'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformePedido3Execute
    end
    object AInformePedido4: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Pedido 4'
      Hint = 'Informe Pedido 4'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformePedido4Execute
    end
    object APickingList: TAction
      Category = 'Listados'
      Caption = 'Picking List'
      Hint = 'Listado de preparacion (Picking List)'
      ImageIndex = 14
      OnExecute = APickingListExecute
    end
    object AVisualizarPedidosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Visualizar Pedidos Filtrados'
      Hint = 'Visualizar Pedidos Filtrados'
      ImageIndex = 14
      OnExecute = AVisualizarPedidosFiltradosExecute
    end
    object AEnviarPedidoMailPDF: TAction
      Category = 'Listados'
      Caption = 'Enviar Pedido por e-mail en Pdf (directo)'
      Hint = 'Enviar Pedido por e-mail en Pdf'
      ImageIndex = 34
      ShortCut = 49229
      OnExecute = AEnviarPedidoMailPDFExecute
    end
    object AEnviarPedidoMailPDF2: TAction
      Category = 'Listados'
      Caption = 'Enviar Pedido por e-mail en Pdf (mensaje)'
      Hint = 'Enviar Pedido por e-mail en Pdf por correo electr'#243'nico'
      ImageIndex = 34
      OnExecute = AEnviarPedidoMailPDF2Execute
    end
    object AImprimirPedidosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Imprimir Pedidos Filtrados'
      Hint = 'Imprimir Pedidos Filtrados'
      ImageIndex = 14
      OnExecute = AImprimirPedidosFiltradosExecute
    end
    object ALstCodigoBarras: TAction
      Category = 'Listados'
      Caption = 'Listado de C'#243'digo de Barras'
      Hint = 'Listado de etiquets de C'#243'digo de Barras'
      ImageIndex = 95
      OnExecute = ALstCodigoBarrasExecute
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
    object ZALstEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Listado de Etiquetas'
      Hint = 'Listado de Etiquetas'
      ImageIndex = 95
      OnExecute = ZALstEtiquetasExecute
    end
    object ALstRentabilidad: TAction
      Category = 'Listados'
      Caption = 'Listado de Rentabilidad'
      ImageIndex = 14
      OnExecute = ALstRentabilidadExecute
    end
    object ZLstEspEtiqueta: TAction
      Category = 'Listados'
      Caption = 'Listado Especial + Etiquetas'
      ImageIndex = 95
      OnExecute = ZLstEspEtiquetaExecute
    end
    object ASep2: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AInformePedidoEspecial: TAction
      Category = 'Listados'
      Caption = 'Listado Ordenes por Pedido'
      ImageIndex = 14
      OnExecute = AInformePedidoEspecialExecute
    end
    object ASep8: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ZAConfPedidoEspecial: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Informe de Pedido Especial'
      Hint = 'Informe de Pedido Especial'
      ImageIndex = 77
      OnExecute = ZAConfPedidoEspecialExecute
    end
    object ZAConfPedidoDetallado: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Informe de Pedido Detallado'
      Hint = 'Informe de Pedido Detallado'
      ImageIndex = 77
      OnExecute = ZAConfPedidoDetalladoExecute
    end
    object ZASep2: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = '-'
    end
    object AConfPedidos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Pedidos'
      Hint = 'Listados de Pedidos'
      ImageIndex = 77
      OnExecute = AConfPedidosExecute
    end
    object AConfPedidosFechasClientes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Pedidos entre Fechas y Clientes'
      Hint = 'Listados de Pedidos entre Fechas y Clientes'
      ImageIndex = 77
      OnExecute = AConfPedidosFechasClientesExecute
    end
    object AConfOrdenesPedidos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Ordenes de Pedidos'
      ImageIndex = 77
      OnExecute = AConfOrdenesPedidosExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object ASep3: TAction
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
    object AAFactura: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Factura'
      Hint = 'Traspasa el Pedido actual a Factura'
      ImageIndex = 61
      OnExecute = AAFacturaExecute
    end
    object APecMulti: TAction
      Category = 'Procesos'
      Caption = 'Traspaso de Pedidos MultiCanal'
      Hint = 'Traspaso de Pedidos MultiCanal'
      ImageIndex = 132
      OnExecute = APecMultiExecute
    end
    object ATicket: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Ticket'
      Hint = 'Traspasa el pedido actual a Ticket'
      ImageIndex = 123
      OnExecute = ATicketExecute
    end
    object ASep4: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Pedido'
      Hint = 'Cerrar Pedido (Ctrl+Alt+F)'
      ImageIndex = 68
      ShortCut = 49222
      OnExecute = AAbrirCerrarExecute
    end
    object AAnulaDocumento: TAction
      Category = 'Procesos'
      Caption = 'Marca el documento como anulado / pendiente'
      Hint = 'Marca el documento como anulado / pendiente'
      ImageIndex = 27
      OnExecute = AAnulaDocumentoExecute
    end
    object ADevolucion: TAction
      Category = 'Procesos'
      Caption = 'Genera Devoluci'#243'n'
      Hint = 'Genera Devoluci'#243'n'
      ImageIndex = 39
      OnExecute = ADevolucionExecute
    end
    object ASep5: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ADuplicar: TAction
      Category = 'Procesos'
      Caption = 'Duplicar Pedido'
      Hint = 'Duplicar Pedido'
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
    object ARefrescaDetalle: TAction
      Category = 'Procesos'
      Caption = 'Recalcular el Detalle'
      Hint = 'Recalcular el Detalle'
      ImageIndex = 3
      OnExecute = ARefrescaDetalleExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object APasoaPedProv: TAction
      Category = 'Otros'
      Caption = 'Paso a Propuesta/Pedido de Proveedor'
      Hint = 'Pasar l'#237'neas a Propuesta/Pedidos de Proveedor'
      ImageIndex = 42
      OnExecute = APasoaPedProvExecute
    end
    object APasoaPedProvAutomatico: TAction
      Category = 'Otros'
      Caption = 'Paso a Propuesta de Proveedor (Automatico)'
      Hint = 'Paso a Propuesta de Proveedor (Automatico)'
      ImageIndex = 92
      Visible = False
      OnExecute = APasoaPedProvAutomaticoExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AImportaPedidosEDI: TAction
      Category = 'Procesos'
      Caption = 'Importa Pedidos EDI'
      ImageIndex = 98
      OnExecute = AImportaPedidosEDIExecute
    end
    object zAFicherosAsociados: TAction
      Category = 'Procesos'
      Caption = 'Ficheros Asociados'
      Hint = 'Ficheros Asociados'
      ImageIndex = 87
      OnExecute = zAFicherosAsociadosExecute
    end
    object LFCategoryAction6: TLFCategoryAction
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
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
    object ACambiaCampanyaFiltrados: TAction
      Category = 'Procesos'
      Caption = 'Cambia campa'#241'a de pedidos filtrados'
      ImageIndex = 21
      OnExecute = ACambiaCampanyaFiltradosExecute
    end
    object AMarcaPedido: TAction
      Category = 'Otros'
      Caption = 'Marcar la referencia del pedido con una X'
      Hint = 'Marcar la referencia del pedido con una X'
      ImageIndex = 118
      OnExecute = AMarcaPedidoExecute
    end
    object ADuplicarPedidoEDI: TAction
      Category = 'Otros'
      Caption = 'Duplicar Pedido EDI'
      Hint = 'Duplicar Pedido EDI'
      ImageIndex = 37
      OnExecute = ADuplicarPedidoEDIExecute
    end
    object AOrdenaLineas: TAction
      Category = 'Otros'
      Caption = 'Reordenar las L'#237'neas'
      Hint = 'Reordena las l'#237'neas del documento'
      ImageIndex = 122
      OnExecute = AOrdenaLineasExecute
    end
    object ASep6: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AGenerarPackingList: TAction
      Category = 'Procesos'
      Caption = 'Generar Packing List'
      Hint = 'Genera Packing List'
      ImageIndex = 18
      OnExecute = AGenerarPackingListExecute
    end
    object ZALstEtiPed: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida Lst Etiquetas'
      Hint = 'Configuraci'#243'n R'#225'pida Lst Etiquetas'
      ImageIndex = 77
      OnExecute = ZALstEtiPedExecute
    end
    object AEliminarPackingList: TAction
      Category = 'Procesos'
      Caption = 'Eliminar Packing List'
      Hint = 'Eliminar el Packing List'
      ImageIndex = 22
      OnExecute = AEliminarPackingListExecute
    end
    object AOrdenarLineasPorDireccionEntrega: TAction
      Category = 'Otros'
      Caption = 'Ordenar L'#237'neas por Dir. Entrega'
      Hint = 'Ordena las lineas por direccion de entrega'
      ImageIndex = 122
      OnExecute = AOrdenarLineasPorDireccionEntregaExecute
    end
    object AOrdenaPedidosLineas: TAction
      Category = 'Otros'
      Caption = 'Ordena Lineas por Articulo'
      Hint = 'Ordena las lineas por articulo'
      ImageIndex = 122
      OnExecute = AOrdenaPedidosLineasExecute
    end
    object AExportarPedidosFiltrados: TAction
      Category = 'Otros'
      Caption = 'Exportar Pedidos Filtrados'
      Hint = 'Exportar Pedidos Filtrados'
      ImageIndex = 36
      OnExecute = AExportarPedidosFiltradosExecute
    end
    object AListarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Listar Etiquetas'
      Hint = 'Lista Etiquetas de los articulos del documento'
      ImageIndex = 95
      OnExecute = AListarEtiquetasExecute
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
    object ADetallesDeLinea: TAction
      Category = 'Otros'
      Caption = 'Detalles de Linea'
      Hint = 'Detalles de Linea'
      ImageIndex = 18
      OnExecute = ADetallesDeLineaExecute
    end
    object ACrearRuta: TAction
      Category = 'Otros'
      Caption = 'Crear Ruta'
      Hint = 'Crea ruta asociada al pedido'
      ImageIndex = 112
      OnExecute = ACrearRutaExecute
    end
    object ACrearAlquiler: TAction
      Category = 'Otros'
      Caption = 'Crear/Ver Alquiler'
      Hint = 'Crear Cuotas de Alquiler'
      ImageIndex = 40
      OnExecute = ACrearAlquilerExecute
    end
    object AHojaDeTrabajo: TAction
      Category = 'Otros'
      Caption = 'Hojas de Trabajo'
      ImageIndex = 105
      OnExecute = AHojaDeTrabajoExecute
    end
    object ACreaAnticipo: TAction
      Category = 'Otros'
      Caption = 'Anticipo'
      Hint = 'Crea Recibo Anticipo'
      ImageIndex = 141
      ShortCut = 117
      OnExecute = ACreaAnticipoExecute
    end
    object AAsignaEmpleado: TAction
      Category = 'Otros'
      Caption = 'Asigna Empleado'
      Hint = 'Asigna Empleado Atencion/Responsable'
      ImageIndex = 135
      OnExecute = AAsignaEmpleadoExecute
    end
    object ARecibos: TAction
      Category = 'Otros'
      Caption = 'Recibos de documento'
      Hint = 'Recibos de documento'
      ImageIndex = 75
      OnExecute = ARecibosExecute
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
    object AModificarFechaEntregaPrev: TAction
      Category = 'Otros'
      Caption = 'ModificarFecha de Entrega Prev.'
      Hint = 'ModificarFecha de Entrega Prev.'
      ImageIndex = 134
      OnExecute = AModificarFechaEntregaPrevExecute
    end
    object AMuestraDocumentosVenta: TAction
      Category = 'Otros'
      Caption = 'Muestra documentos venta'
      Hint = 'Muestra documentos venta del cliente'
      ImageIndex = 55
      ShortCut = 115
      OnExecute = AMuestraDocumentosVentaExecute
    end
    object AFiltroCerrado: TAction
      Category = 'Filtros'
      Caption = 'Cerrados'
      Hint = 'Muestra documentos cerrados'
      ImageIndex = 5
      OnExecute = AFiltroCerradoExecute
    end
    object AImportaDetalleDesdeExcel: TAction
      Category = 'Procesos'
      Caption = 'Importa detalle desde Excel'
      Hint = 'Importa detalle desde Excel'
      ImageIndex = 98
      OnExecute = AImportaDetalleDesdeExcelExecute
    end
    object AImportaDesdeExcelConArticuloPunto: TAction
      Category = 'Procesos'
      Caption = 'Importa detalle desde Excel con articulo punto'
      Hint = 'Importa detalle desde Excel con articulo punto'
      ImageIndex = 98
      OnExecute = AImportaDesdeExcelConArticuloPuntoExecute
    end
    object ABorradoMasivoLineas: TAction
      Category = 'Otros'
      Caption = 'Seleccion y borrado masivo de lineas'
      Hint = 'Seleccion y borrado masivo de lineas'
      ImageIndex = 32
      OnExecute = ABorradoMasivoLineasExecute
    end
    object AConfPickingList: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Picking List'
      Hint = 'Listado de Preparacion (Picking List)'
      ImageIndex = 77
      OnExecute = AConfPickingListExecute
    end
    object AQuitarMarcaTratado: TAction
      Category = 'Otros'
      Caption = 'Quitar Marca Tratado'
      Hint = 'Quitar Marca Tratado a todos los documentos'
      ImageIndex = 147
      OnExecute = AQuitarMarcaTratadoExecute
    end
    object AIncrementarPrecio: TAction
      Category = 'Procesos'
      Caption = 'Incrementar Precio'
      Hint = 'Incrementar Precio'
      ImageIndex = 56
      OnExecute = AIncrementarPrecioExecute
    end
    object AExportacionPedidosPendientes: TAction
      Category = 'Otros'
      Caption = 'Exportacion Pedidos Pendientes'
      Hint = 'Exportacion Pedidos Pendientes a fichero Excel'
      ImageIndex = 21
      OnExecute = AExportacionPedidosPendientesExecute
    end
    object ADiferenciaPedidoAnterior: TAction
      Category = 'Otros'
      Caption = 'Diferencia con Pedido Anterior'
      Hint = 'Diferencia con Pedido Anterior'
      ImageIndex = 37
      OnExecute = ADiferenciaPedidoAnteriorExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 32
    Top = 336
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    SubComplementario = ALMain
    Left = 72
    Top = 368
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 104
    Top = 368
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLEdNotas
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 136
    Top = 336
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 168
    Top = 336
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
  object ALPedidos: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 296
    Top = 368
    object ANotasDetalle: TAction
      Caption = 'Notas Detalle'
      Hint = 'Edita las notas de la linea seleccionada (CTRL+N)'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
    end
    object AInfoStocks: TAction
      Caption = 'Info. Stocks'
      Hint = 'Informaci'#243'n de Stocks '
      ImageIndex = 1
      ShortCut = 16467
      OnExecute = AInfoStocksExecute
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
    object AImprime: TAction
      Caption = 'Imprime Informe'
      Hint = 'Imprime Informe'
      ImageIndex = 14
      ShortCut = 49225
      OnExecute = AImprimeExecute
    end
    object AArticulo: TAction
      Caption = 'Ver Datos Art'#237'culo'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Art'#237'culo'
      ShortCut = 49236
      OnExecute = AArticuloExecute
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
    object AAgrupaPedidosFiltradosKri: TAction
      Caption = 'Agrupa Pedidos Filtrados'
      Hint = 'Agrupa los pedidos filtrados'
      ImageIndex = 4
      OnExecute = AAgrupaPedidosFiltradosKriExecute
    end
    object ACambiaTitulo: TAction
      Caption = 'ACambiaTitulo'
      Hint = 'Mostrar t'#237'tulos en el idioma'
      ImageIndex = 91
      OnExecute = ACambiaTituloExecute
    end
    object ANIFPedido: TAction
      Caption = 'Datos del Cliente'
      Hint = 'Datos del Cliente'
      ShortCut = 16452
      OnExecute = ANIFPedidoExecute
    end
    object ADescargaLector: TAction
      Caption = 'Descarga Lector'
      Hint = 'Descarga los datos leidos con el lector de codigos de barras'
      ImageIndex = 38
      OnExecute = ADescargaLectorExecute
    end
    object ADivisiones: TAction
      Caption = 'Divisiones'
      Hint = 'Modifica las Divisiones de la Linea'
      ImageIndex = 132
      ShortCut = 16449
      OnExecute = ADivisionesExecute
    end
    object ABuscarArticulos: TAction
      Caption = 'Buscar Documentos por articulo'
      Hint = 'Buscar Documentos por articulo'
      ImageIndex = 109
      OnExecute = ABuscarArticulosExecute
    end
    object ASubirLinea: TAction
      Caption = 'Subir Linea'
      Hint = 'Sube la linea'
      ImageIndex = 53
      ShortCut = 49217
      OnExecute = ASubirLineaExecute
    end
    object ABajarLinea: TAction
      Caption = 'Bajar Linea'
      Hint = 'Baja la linea'
      ImageIndex = 52
      ShortCut = 49242
      OnExecute = ABajarLineaExecute
    end
    object ABuscaNIFKRI: TAction
      Caption = 'Busca en Clientes Varios'
      Hint = 'Busca en Clientes Varios'
      ImageIndex = 54
      OnExecute = ABuscaNIFKRIExecute
    end
    object ATipoUnidadLogistica: TAction
      Caption = 'ATipoUnidadLogistica'
    end
    object ACondicionesDeVenta: TAction
      Caption = 'Ver Condiciones Venta'
      Hint = 'Ver Condiciones Venta'
      ImageIndex = 143
      OnExecute = ACondicionesDeVentaExecute
    end
    object ABuscarOrdenDeProduccion: TAction
      Caption = 'Buscar Documento por Orden De Produccion'
      Hint = 'Buscar Documentos por orden de produccion'
      ImageIndex = 116
      OnExecute = ABuscarOrdenDeProduccionExecute
    end
    object AProCrearEscandallo: TAction
      Caption = 'Crear/Seleccionar Escandallo'
      Hint = 'Crear/Abrir Escandallo'
      ImageIndex = 57
      OnExecute = AProCrearEscandalloExecute
    end
    object AProCrearOF: TAction
      Caption = 'Crear Orden de Producci'#243'n'
      Hint = 'Crear/Abrir Orden Fabricaci'#243'n'
      ImageIndex = 92
      OnExecute = AProCrearOFExecute
    end
    object AAEscandall: TAction
      Caption = 'Ir a Escandallo'
      Hint = 'Ir a Escandallo'
      OnExecute = AAEscandallExecute
    end
    object AProReasigEsc: TAction
      Caption = '&Reasignar Escandallo'
      Hint = 'Reasignar Escandallo'
      ImageIndex = 26
      OnExecute = AProReasigEscExecute
    end
    object AProADatosEsc: TAction
      Caption = 'ADatosEscandallo'
      Hint = 'Datos Adicionales Escandallo'
      ImageIndex = 118
      OnExecute = AProADatosEscExecute
    end
    object ADespiece: TAction
      Caption = 'Despiece'
      Hint = 'Despiece'
      ImageIndex = 111
      OnExecute = ADespieceExecute
    end
    object ADetalleArticulo: TAction
      Caption = 'Detalle del Articulo'
      Hint = 'Detalle del Articulo'
      ImageIndex = 10
      OnExecute = ADetalleArticuloExecute
    end
    object ABuscarLoteSimple: TAction
      Caption = 'Busca Lote Simple'
      Hint = 'Busca Lote Simple'
      ImageIndex = 85
      OnExecute = ABuscarLoteSimpleExecute
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
    object AProCrearTodasOF: TAction
      Caption = 'Crea Ordenes de Producci'#243'n para todas las l'#237'neas c/despiece'
      Hint = 
        'Crea Ordenes de Producci'#243'n para todas las l'#237'neas. Solo lineas co' +
        'n despiece.'
      ImageIndex = 92
      OnExecute = AProCrearTodasOFExecute
    end
    object AAEscandall2: TAction
      Caption = 'Ir a Escandallo 2'
      Hint = 'Ir a Escandallo 2'
      OnExecute = AAEscandall2Execute
    end
    object AImportarExcel: TAction
      Caption = 'AImportarExcel'
      Hint = 'Importar Pedidos de  Excel '
      ImageIndex = 86
      OnExecute = AImportarExcelExecute
    end
    object ASeleccionaDetalleTyC: TAction
      Caption = 'Selecciona Detalle TyC'
      Hint = 'Selecciona Detalle TyC'
      ImageIndex = 10
      OnExecute = ASeleccionaDetalleTyCExecute
    end
  end
  object RelojNotas: TTimer
    Enabled = False
    OnTimer = RelojNotasTimer
    Left = 394
    Top = 336
  end
  object CodBarras: TCodeBar
    Alto = 100
    OrigenY = 0
    OrigenX = 0
    Modulo = 1
    Ratio = 2
    ChequearDigito = False
    TipoChequeo = csmModulo10
    Porcentaje = 20
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 360
    Top = 336
  end
  object PMSeleccEsc: TPopupMenu
    AutoHotkeys = maManual
    Images = DMMain.ILMain_Ac
    Left = 328
    Top = 368
    object MICrearEscandallo: TMenuItem
      Action = AProCrearEscandallo
      Caption = 'Crear/Abrir Escandallo'
    end
    object MIReasignarEscandallo: TMenuItem
      Action = AProReasigEsc
    end
  end
  object PMTraspaso: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 328
    Top = 336
    object MITraspasoaAlbaran: TMenuItem
      Action = AAAlbaran
    end
    object MITraspasoaFactura: TMenuItem
      Action = AAFactura
    end
    object MIDuplicarPedido: TMenuItem
      Action = ADuplicar
    end
    object MITraspasoATicket: TMenuItem
      Action = ATicket
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
    Left = 136
    Top = 368
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 168
    Top = 368
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
  object CEDirEntrega: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSDirManual
    FichaExclusiva = TSDirManual
    PanelEdicion = PNLDirManualDatos
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEDirEntregaPMEdit
    Teclas = DMMain.Teclas
    Left = 200
    Top = 336
  end
  object CEDirEntregaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 200
    Top = 368
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
    Left = 272
    Top = 320
  end
  object CEProveedoresPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 272
    Top = 352
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
  object RelojAdjuntos: TTimer
    OnTimer = RelojAdjuntosTimer
    Left = 392
    Top = 368
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 392
    Top = 400
  end
  object PMCreacionOrdenes: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 328
    Top = 400
    object MICrearOrdendeProduccion: TMenuItem
      Action = AProCrearOF
    end
    object MICreaOrdenesdeProduccinparatodaslaslineas: TMenuItem
      Action = AProCrearTodasOF
    end
  end
end
