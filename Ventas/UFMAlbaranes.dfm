inherited FMAlbaranes: TFMAlbaranes
  Left = 280
  Top = 170
  Width = 1188
  Height = 600
  HelpContext = 198
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Albaranes a Clientes'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  OldCreateOrder = False
  PopupMenu = CEProveedoresPMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1178
    Height = 280
    BorderWidth = 3
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 1172
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        1168
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMAlbaranes.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        DelMessage = #191'Desea borrar el albar'#225'n? '
        EditaControl = EFCliente
        InsertaControl = EFCliente
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMAlbaranes.DSQMCabecera
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TSepBuscaFolio: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBLocalizaFolio: TToolButton
        Left = 327
        Top = 0
        Action = ALocalizaFolio
      end
      object TBSep1: TToolButton
        Left = 350
        Top = 0
        Width = 8
        ImageIndex = 138
        Style = tbsSeparator
      end
      object TButtImprimeListado: TToolButton
        Left = 358
        Top = 0
        Action = AInformeAlbaran
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscaNIFKRI: TToolButton
        Left = 381
        Top = 0
        Action = ABuscaNIFKRI
        ParentShowHint = False
        ShowHint = True
      end
      object EFBuscaNIFKRI: TLFEditFind2000
        Left = 404
        Top = 0
        Width = 8
        Height = 22
        TabOrder = 4
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
        CondicionBusqueda = 'tipo='#39'ALB'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_S_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NOMBRE, EJERCICIO DESC, RIG')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMAlbaranes.EntornoDoc
      end
      object TButtSep6: TToolButton
        Left = 412
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TbuttCambiarNombre: TToolButton
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
          AutoSize = False
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
          Plan.Strings = (
            
              'PLAN JOIN (VER_CANALES_SERIES GS INDEX (PK_GEN_SERIES),VER_CANAL' +
              'ES_SERIES SE INDEX (PK_EMP_SERIES,RDB$FOREIGN_FEBE6D3C6))')
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object TButtBuscarNumSerie: TToolButton
        Left = 718
        Top = 0
        Action = ABuscarNumSerie
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object TBuscaReferencia: TToolButton
        Left = 741
        Top = 0
        Action = ABuscaReferencia
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
      end
      object LTelefono: TLFLabel
        Left = 823
        Top = 0
        Width = 120
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Tel'#233'fono'
        Constraints.MinWidth = 120
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        OnClick = LTelefonoClick
      end
      object PNLRiesgo: TLFPanel
        Left = 943
        Top = 0
        Width = 112
        Height = 22
        BevelOuter = bvNone
        TabOrder = 5
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
        object LRiesgoAct: TDBText
          Left = 36
          Top = 0
          Width = 76
          Height = 22
          Align = alClient
          DataField = 'RIESGO_DISPONIBLE'
          DataSource = DMAlbaranes.DSxInfoActualizada
          ParentShowHint = False
          ShowHint = True
        end
      end
      object LBNotas: TLFLabel
        Left = 1055
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
        Left = 1115
        Top = 0
        Width = 60
        Height = 22
        Alignment = taCenter
        Anchors = []
        AutoSize = False
        Caption = 'Adjunto'
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
        Left = 1175
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
      object EFReferencia: TLFEditFind2000
        Left = 1235
        Top = 0
        Width = 2
        Height = 22
        TabStop = False
        AutoSize = False
        TabOrder = 3
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoADevolver = 'ID_S_CAB'
        CampoNum = 'REFERENCIA'
        CampoStr = 'DETALLE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_GARANTIAS_REPARACION'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'REFERENCIA')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    inherited PCMain: TLFPageControl
      Left = 3
      Top = 29
      Width = 1172
      Height = 248
      ActivePage = TSProveedores
      MultiLine = True
      TabIndex = 8
      TabOrder = 0
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBACliente: TSpeedButton [0]
          Left = 113
          Top = 28
          Width = 160
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          Caption = 'Ver Datos Cliente'
          OnDblClick = SBAClienteDblClick
        end
        object SBAAgente: TSpeedButton [1]
          Left = 112
          Top = 91
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          Caption = 'Ver Datos Agente'
          OnDblClick = SBAAgenteDblClick
        end
        object SBATercero: TSpeedButton [2]
          Left = 80
          Top = 175
          Width = 305
          Height = 22
          GroupIndex = -1
          OnDblClick = ATerceroExecute
        end
        inherited PEdit: TLFPanel
          Width = 1164
          Height = 220
          TabOrder = 1
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'SU_REFERENCIA'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMAlbaranes.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_ALBARAN '
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMAlbaranes.EntornoDoc
            OrdenadoPor.Strings = (
              'RIG')
          end
        end
        object PNLEdCabecera: TLFPanel
          Left = 0
          Top = 0
          Width = 1164
          Height = 220
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          DesignSize = (
            1164
            220)
          object LBLAlbaran: TLFLabel
            Left = 39
            Top = 2
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Albar'#225'n'
            FocusControl = DBERIG
          end
          object LBLEstado: TLFLabel
            Left = 150
            Top = 2
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
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
          object LBLTransportista: TLFLabel
            Left = 393
            Top = 90
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object LBLDtoPP: TLFLabel
            Left = 773
            Top = 24
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
          end
          object LBLDtoCial: TLFLabel
            Left = 770
            Top = 2
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
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
            Left = 643
            Top = 24
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrup. Alb.'
            FocusControl = DBESuReferencia
          end
          object LBPortes: TLFLabel
            Left = 424
            Top = 112
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object LBRango: TLFLabel
            Left = 422
            Top = 134
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rango'
          end
          object LBIndice: TLFLabel
            Left = 425
            Top = 156
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = #205'ndice'
          end
          object LContacto: TLFLabel
            Left = 32
            Top = 68
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
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
          object LBLFechaServido: TLFLabel
            Left = 406
            Top = 24
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Servido'
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
          object LMonedaFicha: TLFLabel
            Left = 774
            Top = 46
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object DBTValorCambioFijo: TDBText
            Left = 768
            Top = 64
            Width = 113
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 0
            OnChange = DBERIGChange
          end
          object EFCliente: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'CLIENTE'
            DataSource = DMAlbaranes.DSQMCabecera
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
            Plan.Strings = (
              
                'PLAN (VER_CLIENTES_EF CON_CUENTAS_GES_CLI INDEX (PK_CON_CUENTAS_' +
                'GES_CLI))')
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMAlbaranes.EntornoDoc
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
            DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
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
            Entorno = DMAlbaranes.EntornoDoc
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
            DataSource = DMAlbaranes.DSxDirecciones
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
            DataSource = DMAlbaranes.DSQMCabecera
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
            Entorno = DMAlbaranes.EntornoDoc
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
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 26
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
            Entorno = DMAlbaranes.EntornoDoc
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
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 27
          end
          object DBEDtoPP: TLFDbedit
            Left = 817
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'DTO_PP'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 37
          end
          object DBEDtoCial: TLFDbedit
            Left = 817
            Top = 0
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'DTO_CIAL'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 36
          end
          object EFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 154
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 15
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
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMAlbaranes.EntornoDoc
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
          object EFFormaPago: TLFDBEditFind2000
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'FORMA_PAGO'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 11
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object DBETituloFormaPago: TLFDbedit
            Left = 144
            Top = 110
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlbaranes.DSxFormasPago
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
          object DBETituloEstado: TLFDbedit
            Left = 187
            Top = 0
            Width = 158
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMAlbaranes.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
            DataSource = DMAlbaranes.DSQMCabecera
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object ETituloTarifa: TLFEdit
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
          object DBCKGarantiaKRI: TLFDBCheckBox
            Left = 775
            Top = 139
            Width = 80
            Height = 17
            Caption = 'Garantia'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 42
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'GARANTIA'
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAgrupacionKri: TLFDbedit
            Left = 699
            Top = 22
            Width = 64
            Height = 21
            DataField = 'AGRUPACION_KRI'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 23
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 458
            Top = 110
            Width = 23
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 28
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object ETituloPortes: TLFEdit
            Left = 482
            Top = 110
            Width = 168
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 29
          end
          object DBEPorPortes: TLFDbedit
            Left = 651
            Top = 110
            Width = 56
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 30
          end
          object DBEIPortes: TLFDbedit
            Left = 708
            Top = 110
            Width = 55
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 31
          end
          object DBEFRango: TLFDBEditFind2000
            Left = 458
            Top = 132
            Width = 64
            Height = 21
            DataField = 'RANGO'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 32
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
            Left = 523
            Top = 132
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlbaranes.DSxRangos
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
          object DBEFIndice: TLFDBEditFind2000
            Left = 458
            Top = 154
            Width = 64
            Height = 21
            DataField = 'INDICE'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 34
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
          object DBEIndice: TLFDbedit
            Left = 523
            Top = 154
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlbaranes.DSxIndices
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
          object DBDTPFecha: TLFDBDateEdit
            Left = 458
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMAlbaranes.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 19
            OnExit = DBDTPFechaExit
          end
          object DBEFContacto: TLFDBEditFind2000
            Left = 79
            Top = 66
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'CONTACTO'
            DataSource = DMAlbaranes.DSQMCabecera
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object DBEContacto: TLFDbedit
            Left = 144
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIT_CONTACTO'
            DataSource = DMAlbaranes.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object LFDBChkDevolucion: TLFDBCheckBox
            Left = 775
            Top = 120
            Width = 80
            Height = 16
            Caption = 'Devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 41
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEVOLUCION_DEPOSITO'
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBESuReferencia: TLFDbedit
            Left = 458
            Top = 44
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'SU_REFERENCIA'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 24
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
            DataSource = DMAlbaranes.DSxInfoActualizada
            ValueChecked = '2'
            ValueUnchecked = '0'
          end
          object DBCBValorar: TLFDBCheckBox
            Left = 775
            Top = 82
            Width = 80
            Height = 16
            Caption = 'Valorar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 39
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ALBARAN_VALORADO'
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFechaServido: TLFDBDateEdit
            Left = 458
            Top = 22
            Width = 87
            Height = 21
            DataField = 'FECHA_SERVIDO'
            DataSource = DMAlbaranes.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 21
          end
          object DBDTPHoraServido: TDBDateTimePicker
            Left = 546
            Top = 22
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 46188.3871174653
            Format = 'HH:mm'
            Time = 46188.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 22
            DataField = 'FECHA_SERVIDO'
            DataSource = DMAlbaranes.DSQMCabecera
          end
          object DBDTPHoraDocumento: TDBDateTimePicker
            Left = 546
            Top = 0
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 46188.3871174653
            Format = 'HH:mm'
            Time = 46188.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 20
            DataField = 'FECHA'
            DataSource = DMAlbaranes.DSQMCabecera
          end
          object DBEPedidoCli: TLFDbedit
            Left = 458
            Top = 66
            Width = 305
            Height = 21
            AutoSize = False
            DataField = 'PEDIDO_CLIENTE'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 25
          end
          object DBCBDocumentoMuestras: TLFDBCheckBox
            Left = 775
            Top = 159
            Width = 80
            Height = 16
            Caption = 'Muestras'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 43
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DOCUMENTO_MUESTRAS'
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBFacturable: TLFDBCheckBox
            Left = 775
            Top = 101
            Width = 80
            Height = 16
            Caption = 'Facturable'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 40
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FACTURABLE'
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 817
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMAlbaranes.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 38
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
            TabStop = False
            Color = clAqua
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMAlbaranes.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
            OnDblClick = ATerceroExecute
          end
          object DBEObservaciones: TLFDbedit
            Left = 79
            Top = 198
            Width = 684
            Height = 21
            AutoSize = False
            DataField = 'Z_OBSERVACION'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 18
          end
          object DBCBEmpaquetadoEmp: TLFDBCheckBox
            Left = 775
            Top = 178
            Width = 122
            Height = 17
            Caption = 'Empaquetado Emp.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 44
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EMPAQUETADO_EMPRESA'
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PNLAvisos: TLFPanel
            Left = 888
            Top = 0
            Width = 273
            Height = 217
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 46
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
              DataSource = DMAlbaranes.DSxAvisos
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
              DataSource = DMAlbaranes.DSxAvisos
              ReadOnly = True
              TabOrder = 1
            end
          end
          object PNLChile: TLFPanel
            Left = 882
            Top = 0
            Width = 280
            Height = 197
            Anchors = [akLeft, akTop, akRight]
            BevelOuter = bvNone
            Constraints.MaxWidth = 380
            Constraints.MinWidth = 280
            TabOrder = 45
            DesignSize = (
              280
              197)
            object LSIIFormaPago: TLFLabel
              Left = 7
              Top = 4
              Width = 53
              Height = 13
              Caption = 'SII F. Pago'
            end
            object LSIITipoVenta: TLFLabel
              Left = 7
              Top = 26
              Width = 54
              Height = 13
              Caption = 'SII T Venta'
            end
            object LSIICodigoGiroEmpresa: TLFLabel
              Left = 2
              Top = 69
              Width = 59
              Height = 13
              Caption = 'SII Giro Emp'
            end
            object LSIITDespacho: TLFLabel
              Left = -1
              Top = 91
              Width = 62
              Height = 13
              Caption = 'T. Despacho'
            end
            object LSIITDocTrib: TLFLabel
              Left = 4
              Top = 113
              Width = 57
              Height = 13
              Caption = 'T.Doc. Trib.'
            end
            object LSIIFolio: TLFLabel
              Left = 22
              Top = 179
              Width = 38
              Height = 13
              Caption = 'SII Folio'
            end
            object LSIICodigoGiroCliente: TLFLabel
              Left = 12
              Top = 48
              Width = 49
              Height = 13
              Caption = 'SII Giro Cli'
            end
            object LSIITipoImpresion: TLFLabel
              Left = 4
              Top = 135
              Width = 58
              Height = 13
              Caption = 'T. Impresion'
            end
            object LSIIIndTraslado: TLFLabel
              Left = 5
              Top = 157
              Width = 59
              Height = 13
              Caption = 'Ind Traslado'
            end
            object LSIITituloTipoVenta: TLFEdit
              Left = 112
              Top = 22
              Width = 168
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object CBSIIFormaPago: TLFDBComboBoxValue
              Left = 66
              Top = 0
              Width = 72
              Height = 21
              DataField = 'SII_FMA_PAGO'
              DataSource = DMAlbaranes.DSQMCabecera
              ItemHeight = 13
              Items.Strings = (
                '1: Contado'
                '2: Cr'#233'dito'
                '3: Sin costo (entrega gratuita)')
              Values.Strings = (
                '1'
                '2'
                '3')
              TabOrder = 0
            end
            object lSIITituloFormaPago: TLFEdit
              Left = 138
              Top = 0
              Width = 142
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
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
            object LSIITituloCodigoGiroEmpresa: TLFEdit
              Left = 112
              Top = 66
              Width = 168
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 7
            end
            object SIITituloDespachoDBESIITDespacho: TLFEdit
              Left = 112
              Top = 88
              Width = 168
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
            end
            object LSIITituloTDocTrib: TLFEdit
              Left = 112
              Top = 110
              Width = 168
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 11
            end
            object DBESIITipoVenta: TLFDBEditFind2000
              Left = 66
              Top = 22
              Width = 45
              Height = 21
              DataField = 'TIPO_VENTA'
              DataSource = DMAlbaranes.DSQMCabecera
              TabOrder = 2
              OnChange = DBESIITipoVentaChange
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
              Filtros = []
            end
            object DBESIICodigoGiroCliente: TLFDBEditFind2000
              Left = 66
              Top = 44
              Width = 45
              Height = 21
              DataField = 'CODIGO_GIRO_CLIENTE'
              DataSource = DMAlbaranes.DSQMCabecera
              TabOrder = 4
              OnChange = DBESIICodigoGiroClienteChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_EMP_CLIENTES_GIROS_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO_GIRO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
              Entorno = DMAlbaranes.EntornoDoc
            end
            object DBESIICodigoGiroEmpresa: TLFDBEditFind2000
              Left = 66
              Top = 66
              Width = 45
              Height = 21
              DataField = 'CODIGO_GIRO_EMPRESA'
              DataSource = DMAlbaranes.DSQMCabecera
              TabOrder = 6
              OnChange = DBESIICodigoGiroEmpresaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_SYS_EMPRESAS_GIROS_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO_GIRO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
              Entorno = DMAlbaranes.EntornoDoc
            end
            object DBESIITDespacho: TLFDBEditFind2000
              Left = 66
              Top = 88
              Width = 45
              Height = 21
              DataField = 'ID_TIPO_DESPACHO'
              DataSource = DMAlbaranes.DSQMCabecera
              TabOrder = 8
              OnChange = DBESIITDespachoChange
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
              Filtros = []
            end
            object DBESIITDocTrib: TLFDBEditFind2000
              Left = 66
              Top = 110
              Width = 45
              Height = 21
              DataField = 'TIPO_DOC_TRIBUTARIO'
              DataSource = DMAlbaranes.DSQMCabecera
              TabOrder = 10
              OnChange = DBESIITDocTribChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'VISIBLE_ALB=1'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = []
            end
            object DBESIIFolio: TLFDbedit
              Left = 66
              Top = 176
              Width = 80
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FOLIO'
              DataSource = DMAlbaranes.DSQMCabecera
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 14
            end
            object CBSIIIndTraslado: TLFDBComboBoxValue
              Left = 66
              Top = 154
              Width = 216
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'INDTRASLADO'
              DataSource = DMAlbaranes.DSQMCabecera
              ItemHeight = 13
              Items.Strings = (
                'Operaci'#243'n constituye venta'
                'Ventas por efectuar'
                'Consignaciones'
                'Entrega gratuita'
                'Traslados internos'
                'Otros traslados no venta'
                'Gu'#237'a de devoluci'#243'n'
                'Traslado para exportaci'#243'n. (no venta)'
                'Venta para exportaci'#243'n')
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
              TabOrder = 13
            end
            object CBSIITipoImpresion: TLFDBComboBoxValue
              Left = 66
              Top = 132
              Width = 216
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'TPOIMPRESION'
              DataSource = DMAlbaranes.DSQMCabecera
              ItemHeight = 13
              Items.Strings = (
                'Normal '
                'Ticket')
              Values.Strings = (
                'N'
                'T'
                '')
              TabOrder = 12
            end
            object DBESIITituloCodigoGiroCliente: TLFDbedit
              Left = 112
              Top = 44
              Width = 168
              Height = 21
              DataField = 'TITULO_GIRO_CLIENTE'
              DataSource = DMAlbaranes.DSQMCabecera
              TabOrder = 5
            end
          end
        end
      end
      object TSOtros: TTabSheet [1]
        Caption = '&Otros'
        ImageIndex = 5
        OnShow = TSOtrosShow
        object SBAProyecto: TSpeedButton
          Left = 120
          Top = 99
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          Caption = 'Ver Datos Agente'
          OnDblClick = SBAProyectoDblClick
        end
        object PNLCabOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 1164
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
              Left = 541
              Top = 0
              Width = 30
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLRefOtros: TLFLabel
              Left = 344
              Top = 0
              Width = 52
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
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
              DataSource = DMAlbaranes.DSQMCabecera
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
            object DBEOtrosSuReferenciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMAlbaranes.DSQMCabecera
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
            object DBEOtrosClienteTituloCab: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAlbaranes.DSxCliente
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
            object DBEOtrosRIGCab: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMAlbaranes.DSQMCabecera
              Enabled = False
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
            DataSource = DMAlbaranes.DSQMCabecera
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
            Exclusivo = False
            ControlEdit = CEOtros
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLEdOtros: TLFPanel
          Left = 0
          Top = 22
          Width = 1164
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
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
          object LValorCambio: TLFLabel
            Left = 171
            Top = 70
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Cambio'
            FocusControl = DBEValorCambio
          end
          object LBLCampanya: TLFLabel
            Left = 407
            Top = 2
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campa'#241'a'
          end
          object LTipoLineaKri: TLFLabel
            Left = 402
            Top = 24
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Linea'
          end
          object LTipoIRPF: TLFLabel
            Left = 13
            Top = 112
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo I.R.P.F.'
          end
          object LBLRetencion: TLFLabel
            Left = 26
            Top = 134
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = '% I.R.P.F.'
          end
          object LBLBultosKri: TLFLabel
            Left = 645
            Top = 112
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bultos EDI'
          end
          object LPorcFinanciacion: TLFLabel
            Left = 802
            Top = 24
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Financ.'
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
            Left = 41
            Top = 91
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LFechaReparto: TLFLabel
            Left = 392
            Top = 91
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
          object LMotivoAbono: TLFLabel
            Left = 771
            Top = 2
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Abono'
          end
          object LModoIVA: TLFLabel
            Left = 405
            Top = 46
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object LBultosCab: TLFLabel
            Left = 666
            Top = 91
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bultos'
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
            DataSource = DMAlbaranes.DSQMCabecera
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
            Entorno = DMAlbaranes.EntornoDoc
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
            DataSource = DMAlbaranes.DSxProyectos
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
          object DBEFIdioma: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'IDIOMA'
            DataSource = DMAlbaranes.DSQMCabecera
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object ETituloIdioma: TLFEdit
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
            DataSource = DMAlbaranes.DSQMCabecera
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
          object ETituloMoneda: TLFEdit
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
          object DBCHKCambio: TLFDBCheckBox
            Left = 79
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
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorCambio: TLFDbedit
            Left = 237
            Top = 66
            Width = 64
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 7
          end
          object EFCampanya: TLFDBEditFind2000
            Left = 458
            Top = 0
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'CAMPANYA'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 16
            OnChange = EFCampanyaChange
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object ETituloCampanya: TLFEdit
            Left = 523
            Top = 0
            Width = 239
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
            TabOrder = 17
          end
          object DBEFTipoLineaKri: TLFDBEditFind2000
            Left = 458
            Top = 22
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TIPO_LINEA_KRI'
            DataSource = DMAlbaranes.DSQMCabecera
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object ETipoLineaKri: TLFEdit
            Left = 523
            Top = 22
            Width = 239
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
          object DBEFTipoIRPF: TLFDBEditFind2000
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSxTipoIRPF
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
          object DBEApliIRPF: TLFDbedit
            Left = 144
            Top = 132
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'APLICA_IRPF'
            DataSource = DMAlbaranes.DSQMCabecera
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
          object DBChkDeposito: TLFDBCheckBox
            Left = 394
            Top = 68
            Width = 62
            Height = 17
            Caption = 'Dep'#243'sito'
            ClicksDisabled = False
            ColorCheck = 57088
            Enabled = False
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEPOSITO'
            DataSource = DMAlbaranes.DSQMCabecera
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAlmacenDeposito: TLFDbedit
            Left = 459
            Top = 66
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'ALMACEN_DEPOSITO'
            DataSource = DMAlbaranes.DSQMCabecera
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
            OnChange = DBEAlmacenDepositoChange
          end
          object ETituloAlmacenDeposito: TLFEdit
            Left = 523
            Top = 66
            Width = 239
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
            TabOrder = 24
          end
          object DBEBultosKri: TLFDbedit
            Left = 698
            Top = 110
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'BULTOS_KRI'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 28
          end
          object DBEFinanciacion: TLFDbedit
            Left = 842
            Top = 22
            Width = 64
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 31
          end
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 949
            Top = 22
            Width = 120
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 32
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMAlbaranes.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PNLFirma: TLFPanel
            Left = 458
            Top = 110
            Width = 185
            Height = 59
            BevelOuter = bvNone
            Color = clWhite
            TabOrder = 33
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
              DataSource = DMAlbaranes.DSQMFirmas
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
              DataSource = DMAlbaranes.DSQMFirmas
              Transparent = True
            end
          end
          object DBEFBancoDireccion: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            DataField = 'BANCO'
            DataSource = DMAlbaranes.DSQMCabecera
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
          object DEFechaReparto: TLFDBDateEdit
            Left = 459
            Top = 88
            Width = 87
            Height = 21
            DataField = 'FECHA_ENTREGA_REPARTO'
            DataSource = DMAlbaranes.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 25
            OnExit = DBDTPFechaExit
          end
          object DBDTPHoraReparto: TDBDateTimePicker
            Left = 547
            Top = 88
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 46188
            Time = 46188
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 26
            DataField = 'FECHA_ENTREGA_REPARTO'
            DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSQMCabecera
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
            Entorno = DMAlbaranes.EntornoDoc
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
          object DBEFMotivoAbono: TLFDBEditFind2000
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'COD_MOTIVO_ABONO'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 29
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
            Entorno = DMAlbaranes.EntornoDoc
          end
          object EMotivoAbono: TLFEdit
            Left = 907
            Top = 0
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
            TabOrder = 30
          end
          object EFModoIva: TLFDBEditFind2000
            Left = 458
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMAlbaranes.DSQMCabecera
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
          object EModoIva: TLFEdit
            Left = 523
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 21
          end
          object DBEBultosCab: TLFDbedit
            Left = 698
            Top = 88
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'BULTOS'
            DataSource = DMAlbaranes.DSQMCabecera
            ReadOnly = True
            TabOrder = 27
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
          Width = 1164
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object splitter: TSplitter
            Left = 956
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
            Width = 1164
            Height = 29
            EdgeBorders = []
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
            Width = 956
            Height = 169
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBRENotasInternasKri: TDBRichEdit
              Left = 0
              Top = 53
              Width = 956
              Height = 116
              Align = alBottom
              Color = clMoneyGreen
              DataField = 'NOTAS_INTERNAS_KRI'
              DataSource = DMAlbaranes.DSQMCabecera
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
              Width = 956
              Height = 53
              Align = alClient
              DataField = 'NOTAS'
              DataSource = DMAlbaranes.DSQMCabecera
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
            Left = 964
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
              object ToolButton5: TToolButton
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
          Width = 1164
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
              Left = 541
              Top = 0
              Width = 30
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLRefNotas: TLFLabel
              Left = 344
              Top = 0
              Width = 52
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSxCliente
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
              DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSQMCabecera
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
      object TSCartaPorte: TTabSheet [3]
        Caption = 'Carta &Porte'
        ImageIndex = 3
        OnShow = TSCartaPorteShow
        object TBCartaPorte: TLFToolBar
          Left = 0
          Top = 0
          Width = 1164
          Height = 24
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLTitCartaPortes: TLFPanel
            Left = 0
            Top = 2
            Width = 648
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object LFechaCartaPortes: TLFLabel
              Left = 541
              Top = 0
              Width = 30
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LSuReferenciaCartaPortes: TLFLabel
              Left = 344
              Top = 0
              Width = 52
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Referencia'
              Layout = tlCenter
            end
            object DBEFechaCartaPortes: TLFDbedit
              Left = 577
              Top = 0
              Width = 71
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'FECHA'
              DataSource = DMAlbaranes.DSQMCabecera
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
            object DBESuReferenciaCartaPortes: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SU_REFERENCIA'
              DataSource = DMAlbaranes.DSQMCabecera
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
            object DBETituloCartaPortes: TLFDbedit
              Left = 70
              Top = 0
              Width = 267
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAlbaranes.DSxCliente
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
            object DBERIGCartaPortes: TLFDbedit
              Left = 0
              Top = 0
              Width = 69
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'RIG'
              DataSource = DMAlbaranes.DSQMCabecera
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
          object TBSep4: TToolButton
            Left = 648
            Top = 2
            Width = 8
            ImageIndex = 91
            Style = tbsSeparator
          end
          object NavCartaPortes: THYMNavigator
            Left = 656
            Top = 2
            Width = 110
            Height = 22
            DataSource = DMAlbaranes.DSCartaPortes
            VisibleButtons = [nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMCartaPortesPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavCartaPortesBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFCargadora
            InsertaControl = DBEFCargadora
            Exclusivo = True
            ControlEdit = CECartaPortes
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavCartaPortesClickAfterAdjust
          end
          object TButtSep1: TToolButton
            Left = 766
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtInformeCartaPortes: TToolButton
            Left = 774
            Top = 2
            Action = AInformeCartaPortes1
            DropdownMenu = pmCartaPorte
            Style = tbsDropDown
          end
          object TBSep2: TToolButton
            Left = 810
            Top = 2
            Width = 8
            ImageIndex = 15
            Style = tbsSeparator
          end
          object TBAsignarEnvio: TToolButton
            Left = 818
            Top = 2
            Action = AAsignarEnvio
          end
          object TBSep3: TToolButton
            Left = 841
            Top = 2
            Width = 8
            ImageIndex = 113
            Style = tbsSeparator
          end
          object TBPeticionRecogidaGLS: TToolButton
            Left = 849
            Top = 2
            Action = APeticionRecogidaGLS
          end
          object TBSep5: TToolButton
            Left = 872
            Top = 2
            Width = 8
            ImageIndex = 91
            Style = tbsSeparator
          end
          object TBGeneraPeticionDHL: TToolButton
            Left = 880
            Top = 2
            Action = APeticionRecogidaDHL
          end
          object TBSep6: TToolButton
            Left = 903
            Top = 2
            Width = 8
            ImageIndex = 91
            Style = tbsSeparator
          end
          object TBDHLRates: TToolButton
            Left = 911
            Top = 2
            Action = ADHLRates
          end
        end
        object PNLCartaPorte: TLFPanel
          Left = 0
          Top = 24
          Width = 1164
          Height = 196
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object PNLIzqCarta: TLFPanel
            Left = 0
            Top = 0
            Width = 1164
            Height = 223
            Align = alTop
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object LBLCargadora: TLFLabel
              Left = 32
              Top = 6
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cargadora'
            end
            object LBLExpedidora: TLFLabel
              Left = 28
              Top = 50
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Expedidora'
            end
            object LBLDirExpedidora: TLFLabel
              Left = 9
              Top = 72
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Expedidora'
            end
            object LBLDirIntermediaria: TLFLabel
              Left = 2
              Top = 116
              Width = 79
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Intermediaria'
            end
            object LBLIntermediaria: TLFLabel
              Left = 21
              Top = 94
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'Intermediaria'
            end
            object LBDirCargadora: TLFLabel
              Left = 13
              Top = 28
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Cargadora'
            end
            object LBLDirTransportista: TLFLabel
              Left = 1
              Top = 160
              Width = 80
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Transportista'
            end
            object LBLTransportista2: TLFLabel
              Left = 20
              Top = 138
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Transportista'
            end
            object LBLDirDestinatario: TLFLabel
              Left = 6
              Top = 204
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Destinatario'
            end
            object LBLDestinatario: TLFLabel
              Left = 25
              Top = 182
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Destinatario'
            end
            object LBLPeso: TLFLabel
              Left = 409
              Top = 72
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso'
            end
            object LCartaPortesDestino: TLFLabel
              Left = 397
              Top = 50
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Destino'
            end
            object LBLBultos2: TLFLabel
              Left = 640
              Top = 72
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bultos'
            end
            object LBLFecha: TLFLabel
              Left = 403
              Top = 115
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object LBLNotas: TLFLabel
              Left = 401
              Top = 158
              Width = 28
              Height = 13
              Caption = 'Notas'
            end
            object LCartaPortesAlmacen: TLFLabel
              Left = 392
              Top = 6
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Almac'#233'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
            end
            object LBLPalets: TLFLabel
              Left = 522
              Top = 72
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Palets'
            end
            object LFUdLogistica: TLFLabel
              Left = 600
              Top = 116
              Width = 69
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ud. Log'#237'sticas'
            end
            object LFPesoBruto: TLFLabel
              Left = 382
              Top = 93
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso bruto'
            end
            object LBLVolumen: TLFLabel
              Left = 627
              Top = 93
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Volumen'
            end
            object LCodigoExpedicion: TLFLabel
              Left = 375
              Top = 136
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cod. Exped.'
            end
            object DBEFCargadora: TLFDBEditFind2000
              Left = 86
              Top = 2
              Width = 80
              Height = 21
              AutoSize = False
              DataField = 'CARGADORA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 0
              OnChange = DBEFCargadoraChange
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
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitCargadora: TLFEdit
              Left = 167
              Top = 2
              Width = 208
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
              TabOrder = 1
            end
            object ETitExpedidora: TLFEdit
              Left = 167
              Top = 46
              Width = 208
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
            object ETitDirExpedidora: TLFEdit
              Left = 167
              Top = 68
              Width = 208
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
              TabOrder = 7
            end
            object DBEFDirIntermediaria: TLFDBEditFind2000
              Left = 86
              Top = 112
              Width = 80
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'DIR_INTERMEDIARIA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 10
              OnChange = DBEFDirIntermediariaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'DIRECCION'
              CampoStr = 'DIR_COMPLETA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFDirIntermediariaBusqueda
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = []
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitDirIntermediaria: TLFEdit
              Left = 167
              Top = 112
              Width = 208
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
            object DBEFIntermediaria: TLFDBEditFind2000
              Left = 86
              Top = 90
              Width = 80
              Height = 21
              AutoSize = False
              DataField = 'INTERMEDIARIA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 8
              OnChange = DBEFIntermediariaChange
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
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitIntermediaria: TLFEdit
              Left = 167
              Top = 90
              Width = 208
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
            object DBEFDirCargadora: TLFDBEditFind2000
              Left = 86
              Top = 24
              Width = 80
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'DIR_CARGADORA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 2
              OnChange = DBEFDirCargadoraChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'DIRECCION'
              CampoStr = 'DIR_COMPLETA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFDirCargadoraBusqueda
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = []
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitDirCargadora: TLFEdit
              Left = 167
              Top = 24
              Width = 208
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
            object DBEFDirTransportista: TLFDBEditFind2000
              Left = 86
              Top = 156
              Width = 80
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'DIR_TRANSPORTISTA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 14
              OnChange = DBEFDirTransportistaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'DIRECCION'
              CampoStr = 'DIR_COMPLETA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFDirTransportistaBusqueda
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = []
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitDirTransportista: TLFEdit
              Left = 167
              Top = 156
              Width = 208
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
              TabOrder = 15
            end
            object DBEFTransportistaCartaPorte: TLFDBEditFind2000
              Left = 86
              Top = 134
              Width = 80
              Height = 21
              AutoSize = False
              DataField = 'TRANSPORTISTA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 12
              OnChange = DBEFTransportistaCartaPorteChange
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
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitTransportista: TLFEdit
              Left = 167
              Top = 134
              Width = 208
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
              TabOrder = 13
            end
            object DBEFDirDestinatario: TLFDBEditFind2000
              Left = 86
              Top = 200
              Width = 80
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'DIR_DESTINATARIO'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 18
              OnChange = DBEFDirDestinatarioChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'DIRECCION'
              CampoStr = 'DIR_COMPLETA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFDirDestinatarioBusqueda
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = []
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitDirDestinatario: TLFEdit
              Left = 167
              Top = 200
              Width = 208
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
              TabOrder = 19
            end
            object DBEFDestinatario: TLFDBEditFind2000
              Left = 86
              Top = 178
              Width = 80
              Height = 21
              AutoSize = False
              DataField = 'DESTINATARIO'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 16
              OnChange = DBEFDestinatarioChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'TERCERO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'TERCERO')
              Filtros = [obEmpresa]
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitDestinatario: TLFEdit
              Left = 167
              Top = 178
              Width = 208
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
              TabOrder = 17
            end
            object DBEPeso: TLFDbedit
              Left = 437
              Top = 68
              Width = 80
              Height = 21
              DataField = 'PESO'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 25
            end
            object DBETiDirAlmacen: TLFDbedit
              Left = 437
              Top = 24
              Width = 316
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMAlbaranes.DSxOrigen
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
            object DBEFDestino: TLFDBEditFind2000
              Left = 437
              Top = 46
              Width = 80
              Height = 21
              AutoSize = False
              DataField = 'DESTINO'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 23
              OnChange = DBEFDestinoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_DIRECCIONES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'DIRECCION'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFDirDestinatarioBusqueda
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = [obTercero]
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitDestino: TLFEdit
              Left = 518
              Top = 46
              Width = 235
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
              TabOrder = 24
            end
            object DBEBultos2: TLFDbedit
              Left = 673
              Top = 68
              Width = 80
              Height = 21
              DataField = 'BULTOS'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 27
            end
            object DBDEFechaPorte: TLFDBDateEdit
              Left = 437
              Top = 112
              Width = 104
              Height = 21
              DataField = 'FECHA_TRANSPORTE'
              DataSource = DMAlbaranes.DSCartaPortes
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 30
            end
            object DBMNotasCarta: TLFDBMemo
              Left = 437
              Top = 156
              Width = 316
              Height = 66
              DataField = 'NOTAS'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 34
              OnExit = DBMNotasCartaExit
            end
            object DBEFDirExpedidora: TLFDBEditFind2000
              Left = 86
              Top = 68
              Width = 80
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              DataField = 'DIR_EXPEDIDORA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 6
              OnChange = DBEFDirExpedidoraChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'DIRECCION'
              CampoStr = 'DIR_COMPLETA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFDirExpedidoraBusqueda
              OrdenadoPor.Strings = (
                'DIRECCION')
              Filtros = []
              Entorno = DMAlbaranes.EntornoDoc
            end
            object DBEFExpedidora: TLFDBEditFind2000
              Left = 86
              Top = 46
              Width = 80
              Height = 21
              AutoSize = False
              DataField = 'EXPEDIDORA'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 4
              OnChange = DBEFExpedidoraChange
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
              Entorno = DMAlbaranes.EntornoDoc
            end
            object DBEFAlmacen: TLFDBEditFind2000
              Left = 437
              Top = 2
              Width = 60
              Height = 21
              AutoSize = False
              CharCase = ecUpperCase
              Color = clInfoBk
              DataField = 'ALMACEN'
              DataSource = DMAlbaranes.DSQMCabecera
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 20
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
              Filtros = [obEmpresa]
              Entorno = DMAlbaranes.EntornoDoc
            end
            object ETitAlmacen: TLFEdit
              Left = 498
              Top = 2
              Width = 255
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
              TabOrder = 21
            end
            object DBEPalets: TLFDbedit
              Left = 555
              Top = 68
              Width = 80
              Height = 21
              DataField = 'PALETS'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 26
            end
            object LFDBPesBrut: TLFDbedit
              Left = 437
              Top = 90
              Width = 80
              Height = 21
              DataField = 'PESO_BRUTO'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 28
            end
            object LFDBULogistica: TLFDbedit
              Left = 673
              Top = 112
              Width = 80
              Height = 21
              DataField = 'UNIDADES_LOGISTICAS'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 32
            end
            object DBEVolumen: TLFDbedit
              Left = 673
              Top = 90
              Width = 80
              Height = 21
              DataField = 'VOLUMEN'
              DataSource = DMAlbaranes.DSCartaPortes
              TabOrder = 29
            end
            object DBDTPFechaPorte: TDBDateTimePicker
              Left = 540
              Top = 112
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
              TabOrder = 31
              DataField = 'FECHA_TRANSPORTE'
              DataSource = DMAlbaranes.DSCartaPortes
            end
            object DBECodigoExpedicion: TLFDbedit
              Left = 437
              Top = 134
              Width = 316
              Height = 21
              AutoSize = False
              DataField = 'CODIGO_EXPEDICION'
              DataSource = DMAlbaranes.DSCartaPortes
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 33
            end
          end
          object PNLMatNat: TLFPanel
            Left = 0
            Top = 223
            Width = 1164
            Height = 93
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object PNLMatricula: TLFPanel
              Left = 0
              Top = 0
              Width = 376
              Height = 93
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object DBGMatricula: TDBGridFind2000
                Left = 0
                Top = 26
                Width = 376
                Height = 67
                Align = alClient
                DataSource = DMAlbaranes.DSQMMatriculas
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnColEnter = DBGMatriculaColEnter
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
                  'MATRICULA')
                CamposAMostrar.Strings = (
                  'MATRICULA'
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
                CamposAOrdernar.Strings = (
                  'MATRICULAS'
                  'TITULO'
                  'TRANSPORTISTA'
                  'TITULO_TRANS')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'MATRICULA')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'EMP_MATRICULAS')
                Acciones.Strings = (
                  '')
                Titulos.Strings = (
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGMatriculaBusqueda
                Planes.Strings = (
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  'DEFECTO desc,MATRICULA')
                Filtros = [obEmpresa]
                Entorno = DMAlbaranes.EntornoDoc
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'MATRICULA'
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
                    Width = 209
                    Visible = True
                  end>
              end
              object TBMat: TLFToolBar
                Left = 0
                Top = 0
                Width = 376
                Height = 26
                ButtonWidth = 168
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object NavMat: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 198
                  Height = 22
                  DataSource = DMAlbaranes.DSQMMatriculas
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEMatriculaPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGMatricula
                  InsertaControl = DBGMatricula
                  Exclusivo = True
                  ControlEdit = CEMatricula
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
            end
            object PNLNaturaleza: TLFPanel
              Left = 376
              Top = 0
              Width = 788
              Height = 93
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBGNaturaleza: TDBGridFind2000
                Left = 0
                Top = 26
                Width = 788
                Height = 67
                Align = alClient
                DataSource = DMAlbaranes.DSQMNaturaleza
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnColEnter = DBGNaturalezaColEnter
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
                  'NATURALEZA')
                CamposAMostrar.Strings = (
                  'NATURALEZA'
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
                  'NATURALEZA'
                  'TITULO')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'NATURALEZA')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_NATURALEZA_CARGA')
                Acciones.Strings = (
                  '')
                Titulos.Strings = (
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGNaturalezaBusqueda
                Planes.Strings = (
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  'DEFECTO desc,NATURALEZA')
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'NATURALEZA'
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
                    Width = 276
                    Visible = True
                  end>
              end
              object TBNat: TLFToolBar
                Left = 0
                Top = 0
                Width = 788
                Height = 26
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object NavNat: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 198
                  Height = 22
                  DataSource = DMAlbaranes.DSQMNaturaleza
                  VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CENaturalezaPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGNaturaleza
                  InsertaControl = DBGNaturaleza
                  Exclusivo = True
                  ControlEdit = CENaturaleza
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
            end
          end
        end
      end
      object TSEDI: TTabSheet [4]
        Caption = '&EDI'
        ImageIndex = 3
        OnShow = TSEDIShow
        object PNLEDI: TLFPanel
          Left = 0
          Top = 0
          Width = 1164
          Height = 220
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LCompradorEDI: TLFLabel
            Left = 25
            Top = 27
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comprador'
          end
          object LDestinoEDI: TLFLabel
            Left = 40
            Top = 48
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Destino'
          end
          object LDtoEDI: TLFLabel
            Left = 56
            Top = 68
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto.'
          end
          object LOrigenEDI: TLFLabel
            Left = 45
            Top = 92
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Origen'
          end
          object LReceptorEDI: TLFLabel
            Left = 32
            Top = 113
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Receptor'
          end
          object LRecogidaEDI: TLFLabel
            Left = 30
            Top = 136
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recogida'
          end
          object LExpedidorEDI: TLFLabel
            Left = 29
            Top = 159
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Expedidor'
          end
          object DBECompradorEDI: TLFDbedit
            Left = 80
            Top = 23
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'COMPRADOR'
            DataSource = DMAlbaranes.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = DBECompradorEDIChange
          end
          object DBEDestinoEDI: TLFDbedit
            Left = 80
            Top = 45
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'DESTINO'
            DataSource = DMAlbaranes.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 1
            OnChange = DBEDestinoEDIChange
          end
          object DBEDtoEDI: TLFDbedit
            Left = 80
            Top = 67
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'DPTO'
            DataSource = DMAlbaranes.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEOrigenEDI: TLFDbedit
            Left = 80
            Top = 89
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'ORIGEN'
            DataSource = DMAlbaranes.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 3
            OnChange = DBEOrigenEDIChange
          end
          object DBEReceptorEDI: TLFDbedit
            Left = 80
            Top = 111
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'RECEPTOR'
            DataSource = DMAlbaranes.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 4
            OnChange = DBEReceptorEDIChange
          end
          object DEBRecogidaEDI: TLFDbedit
            Left = 80
            Top = 133
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'RECOGIDA'
            DataSource = DMAlbaranes.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 5
            OnChange = DEBRecogidaEDIChange
          end
          object DBEExpedidorEDI: TLFDbedit
            Left = 80
            Top = 155
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'EXPEDIDOR'
            DataSource = DMAlbaranes.DSQMCabeceraEDI
            Enabled = False
            ReadOnly = True
            TabOrder = 6
            OnChange = DBEExpedidorEDIChange
          end
          object ECompradorEDI: TLFEdit
            Left = 202
            Top = 23
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object EDestinoEDI: TLFEdit
            Left = 202
            Top = 45
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object EOrigenEDI: TLFEdit
            Left = 202
            Top = 89
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object EReceptorEDI: TLFEdit
            Left = 202
            Top = 111
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object ERecogidaEDI: TLFEdit
            Left = 202
            Top = 133
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object EExpedidorEDI: TLFEdit
            Left = 202
            Top = 155
            Width = 455
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 12
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1164
          Height = 220
          DataSource = DMAlbaranes.DSQMCabecera
          OnCellClick = DBGMainCellClick
          OnKeyDown = DBGMainKeyDown
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'ALBARAN_VALORADO'
            'CAMBIO_FIJO'
            'DEVOLUCION_DEPOSITO'
            'DOCUMENTO_MUESTRAS'
            'EMPAQUETADO_EMPRESA'
            'FACTURABLE'
            'GARANTIA'
            'INVERSION_SUJETO_PASIVO'
            'MODIFICA_DOC')
          CamposChecked.Strings = (
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
            '0')
          CamposAOrdenar.Strings = (
            'AGENTE'
            'ALBARAN_VALORADO'
            'ALMACEN'
            'B_COMISION'
            'B_DTO_LINEAS'
            'BANCO'
            'BRUTO'
            'BULTOS'
            'BULTOS_KRI'
            'C_TOTAL'
            'CAMBIO_FIJO'
            'CAMPANYA'
            'CLIENTE'
            'COD_MOTIVO_ABONO'
            'CODIGO_GIRO_CLIENTE'
            'CODIGO_GIRO_EMPRESA'
            'CODIGO_POSTAL'
            'CONTACTO'
            'DEPOSITO'
            'DEVOLUCION_DEPOSITO'
            'DIR_COMPLETA'
            'DTO_CIAL'
            'DTO_PP'
            'EJERCICIO'
            'EMPAQUETADO_EMPRESA'
            'EMPLEADO_ATENCION'
            'EMPLEADO_RESPONSABLE'
            'ESTADO'
            'FACTURABLE'
            'FECHA'
            'FECHA_ENTREGA_MANUAL'
            'FECHA_ENTREGA_REPARTO'
            'FECHA_RECOGIDA_MANUAL'
            'FECHA_SERVIDO'
            'FOLIO'
            'FORMA_PAGO'
            'GARANTIA'
            'I_BASE_RETENCION'
            'I_COMISION'
            'I_DTO_CIAL'
            'I_DTO_LINEAS'
            'I_DTO_PP'
            'I_FINANCIACION'
            'I_PORTES'
            'I_PORTES_CANAL'
            'I_RETENCION'
            'ID_FICHA_TECNICA'
            'ID_S'
            'ID_TIPO_DESPACHO'
            'ID_TIPO_GIRO_CLIENTE'
            'ID_TIPO_GIRO_EMPRESA'
            'IDIOMA'
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
            'NOMBRE_COMERCIAL'
            'NUM_MOV_DEPOSITO'
            'ORIGEN_DOCUMENTO'
            'P_RETENCION'
            'POR_FINANCIACION'
            'POR_PORTES'
            'PROYECTO'
            'RIG'
            'S_BASES'
            'S_CUOTA_IVA'
            'S_CUOTA_RE'
            'SII_FMA_PAGO'
            'SU_REFERENCIA'
            'TARIFA'
            'TERCERO'
            'TIPO'
            'TIPO_DOC_TRIBUTARIO'
            'TIPO_IRPF'
            'TIPO_LINEA_KRI'
            'TIPO_PORTES'
            'TIPO_VENTA'
            'TIT_CONTACTO'
            'TITULO'
            'TITULO_GIRO_CLIENTE'
            'TOTAL_A_COBRAR'
            'TOTAL_ANTICIPADO'
            'TRANSPORTISTA'
            'UNIDADES'
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
              Width = 240
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_ANTICIPADO'
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
          Width = 1164
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSQMCabecera
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
          Width = 1164
          Height = 198
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object PNLDirEntrega: TLFPanel
            Left = 600
            Top = 0
            Width = 564
            Height = 198
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object PNLEdDirEntrega: TLFPanel
              Left = 0
              Top = 0
              Width = 564
              Height = 89
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object LFLabel3: TLFLabel
                Left = 0
                Top = 0
                Width = 564
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
                DataSource = DMAlbaranes.DSQMCabecera
                TabOrder = 0
              end
              object DBEMatriculaEntrega: TLFDbedit
                Left = 64
                Top = 39
                Width = 297
                Height = 21
                DataField = 'MATRICULA_ENTREGA'
                DataSource = DMAlbaranes.DSQMCabecera
                TabOrder = 1
              end
              object DBDEFechaEntregaManual: TLFDBDateEdit
                Left = 64
                Top = 61
                Width = 121
                Height = 21
                DataField = 'FECHA_ENTREGA_MANUAL'
                DataSource = DMAlbaranes.DSQMCabecera
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
                DataSource = DMAlbaranes.DSQMCabecera
              end
            end
            object DBMDirEntrega: TLFDBMemo
              Left = 0
              Top = 89
              Width = 564
              Height = 109
              Align = alClient
              DataField = 'DIR_ENTREGA_MANUAL'
              DataSource = DMAlbaranes.DSQMCabecera
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
                DataSource = DMAlbaranes.DSQMCabecera
                TabOrder = 0
              end
              object DBEMatriculaRecogida: TLFDbedit
                Left = 64
                Top = 39
                Width = 297
                Height = 21
                DataField = 'MATRICULA_RECOGIDA'
                DataSource = DMAlbaranes.DSQMCabecera
                TabOrder = 1
              end
              object DBDEFechaRecogidaManual: TLFDBDateEdit
                Left = 64
                Top = 61
                Width = 121
                Height = 21
                DataField = 'FECHA_RECOGIDA_MANUAL'
                DataSource = DMAlbaranes.DSQMCabecera
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
                DataSource = DMAlbaranes.DSQMCabecera
              end
            end
            object DBMDirRecogida: TLFDBMemo
              Left = 0
              Top = 89
              Width = 600
              Height = 109
              Align = alClient
              DataField = 'DIR_RECOGIDA_MANUAL'
              DataSource = DMAlbaranes.DSQMCabecera
              TabOrder = 1
            end
          end
        end
      end
      object TSOtrosChile: TTabSheet
        Caption = 'Otros Chile'
        ImageIndex = 7
        object PEdOtrosChile: TLFPanel
          Left = 0
          Top = 23
          Width = 1164
          Height = 197
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LOtrosTipoDocIdentificacion: TLFLabel
            Left = 26
            Top = 9
            Width = 55
            Height = 13
            Caption = 'Documento'
          end
          object LOtrosFmaPagoSII: TLFLabel
            Left = 39
            Top = 31
            Width = 37
            Height = 13
            Caption = 'F. Pago'
          end
          object LOtrosTipoVenta: TLFLabel
            Left = 25
            Top = 53
            Width = 52
            Height = 13
            Caption = 'Tipo Venta'
          end
          object LOtrosCodigoGiroCliente: TLFLabel
            Left = 17
            Top = 75
            Width = 61
            Height = 13
            Caption = 'Cod. Giro Cli.'
          end
          object LOtrosCodigoGiroEmpresa: TLFLabel
            Left = 7
            Top = 97
            Width = 71
            Height = 13
            Caption = 'Cod. Giro Emp.'
          end
          object LOtrosTipoDespacho: TLFLabel
            Left = 13
            Top = 119
            Width = 62
            Height = 13
            Caption = 'T. Despacho'
          end
          object LOtrosTipoDocumentoTributario: TLFLabel
            Left = 26
            Top = 140
            Width = 47
            Height = 13
            Caption = 'Doc. Trib.'
          end
          object LOtrosSiiTrackID: TLFLabel
            Left = 152
            Top = 31
            Width = 10
            Height = 13
            Caption = 'T.'
          end
          object LOtrosFolio: TLFLabel
            Left = 270
            Top = 141
            Width = 22
            Height = 13
            Caption = 'Folio'
          end
          object DBEOtrosTipoDocIdentificacion: TLFDbedit
            Left = 86
            Top = 5
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TIPO_DOC_IDENT'
            DataSource = DMAlbaranes.DSxCliente
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEOtrosNIF: TLFDbedit
            Left = 151
            Top = 5
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMAlbaranes.DSxCliente
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
          object DBEFOtrosTipoVenta: TLFDBEditFind2000
            Left = 86
            Top = 48
            Width = 64
            Height = 21
            DataField = 'TIPO_VENTA'
            DataSource = DMAlbaranes.DSQMCabecera
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
          end
          object DBEFOtrosCodigoGiroCliente: TLFDBEditFind2000
            Left = 86
            Top = 70
            Width = 64
            Height = 21
            DataField = 'CODIGO_GIRO_CLIENTE'
            DataSource = DMAlbaranes.DSQMCabecera
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
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DEFECTO DESC, CODIGO_GIRO')
            Filtros = []
          end
          object DBEFOtrosCodigoGiroEmpresa: TLFDBEditFind2000
            Left = 86
            Top = 92
            Width = 64
            Height = 21
            DataField = 'CODIGO_GIRO_EMPRESA'
            DataSource = DMAlbaranes.DSQMCabecera
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
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'DEFECTO DESC, CODIGO_GIRO')
            Filtros = []
          end
          object DBEOtrosTipoDespacho: TLFDBEditFind2000
            Left = 86
            Top = 114
            Width = 64
            Height = 21
            DataField = 'ID_TIPO_DESPACHO'
            DataSource = DMAlbaranes.DSQMCabecera
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
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBEFOtrosTipoDocumentoTributario: TLFDBEditFind2000
            Left = 86
            Top = 136
            Width = 64
            Height = 21
            DataField = 'TIPO_DOC_TRIBUTARIO'
            DataSource = DMAlbaranes.DSQMCabecera
            TabOrder = 12
            OnChange = DBEFOtrosTipoDocumentoTributarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'VISIBLE_ALB=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBCBOtrosFmaPagoSII: TLFDBComboBoxValue
            Left = 86
            Top = 27
            Width = 64
            Height = 21
            DataField = 'SII_FMA_PAGO'
            DataSource = DMAlbaranes.DSQMCabecera
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
          object DBEOtrosSiiTrackID: TLFDbedit
            Left = 166
            Top = 27
            Width = 225
            Height = 21
            Color = clInfoBk
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
          object DBEOtrosFolio: TLFDbedit
            Left = 299
            Top = 137
            Width = 92
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object EOtrosTipoVenta: TLFEdit
            Left = 151
            Top = 49
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object EOtrosCodigoGiroCliente: TLFEdit
            Left = 151
            Top = 71
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object EOtrosCodigoGiroEmpresa: TLFEdit
            Left = 151
            Top = 93
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object EOtrosTipoDespachoTitulo: TLFEdit
            Left = 151
            Top = 115
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object EOtrosTipoDocumentoTributario: TLFEdit
            Left = 151
            Top = 137
            Width = 111
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object GBReferencia: TGroupBox
            Left = 395
            Top = 0
            Width = 497
            Height = 160
            Caption = 'Referencia'
            TabOrder = 15
            object LTpoDocRef: TLFLabel
              Left = 108
              Top = 49
              Width = 67
              Height = 13
              Caption = 'Tipo Doc Ref.'
            end
            object LIdDocRef: TLFLabel
              Left = 115
              Top = 71
              Width = 60
              Height = 13
              Caption = 'ID Doc. Ref.'
            end
            object LRUTOtr: TLFLabel
              Left = 129
              Top = 93
              Width = 46
              Height = 13
              Caption = 'RUT Otro'
            end
            object LCodRef: TLFLabel
              Left = 87
              Top = 115
              Width = 88
              Height = 13
              Caption = 'C'#243'digo Referencia'
            end
            object LRazonRef: TLFLabel
              Left = 88
              Top = 137
              Width = 86
              Height = 13
              Caption = 'Raz'#243'n Referencia'
            end
            object LFolioRef: TLFLabel
              Left = 249
              Top = 71
              Width = 42
              Height = 13
              Caption = 'Folio Ref'
            end
            object LFchRef: TLFLabel
              Left = 313
              Top = 93
              Width = 53
              Height = 13
              Caption = 'Fecha Ref.'
            end
            object DBETpoDocRef: TLFDBEditFind2000
              Left = 181
              Top = 45
              Width = 40
              Height = 21
              DataField = 'TPODOCREF'
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
              TabOrder = 0
              OnChange = DBETpoDocRefChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'VISIBLE_ALB = 1'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'CODIGO')
              Filtros = []
            end
            object ETipoDocTribTitulo: TLFEdit
              Left = 222
              Top = 45
              Width = 270
              Height = 21
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
            end
            object DBEIdDocRef: TLFDbedit
              Left = 181
              Top = 67
              Width = 60
              Height = 21
              DataField = 'ID_S_REF'
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
              TabOrder = 2
            end
            object DBERUTOtr: TLFDbedit
              Left = 181
              Top = 89
              Width = 121
              Height = 21
              DataField = 'RUTOTR'
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
              TabOrder = 4
            end
            object DBERazonRef: TLFDbedit
              Left = 181
              Top = 133
              Width = 312
              Height = 21
              DataField = 'RAZONREF'
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
              TabOrder = 7
            end
            object DBEFolioRef: TLFDbedit
              Left = 305
              Top = 67
              Width = 187
              Height = 21
              DataField = 'FOLIOREF'
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
              TabOrder = 3
            end
            object CBCodRef: TLFDBComboBoxValue
              Left = 181
              Top = 111
              Width = 312
              Height = 21
              DataField = 'CODREF'
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
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
            end
            object DBDFchRef: TLFDBDateEdit
              Left = 372
              Top = 89
              Width = 121
              Height = 21
              DataField = 'FCHREF'
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 5
            end
            object DBGFReferenciasDte: TDBGridFind2000
              Left = 8
              Top = 43
              Width = 77
              Height = 114
              DataSource = DMAlbaranes.DSQMSIIDteReferencia
              TabOrder = 8
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
                  FieldName = 'NROLINREF'
                  Width = 35
                  Visible = True
                end>
            end
            object PNLReferenciasDteCab: TLFPanel
              Left = 2
              Top = 15
              Width = 493
              Height = 25
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 9
              object NavReferenciasDte: THYMNavigator
                Left = 0
                Top = 0
                Width = 240
                Height = 25
                DataSource = DMAlbaranes.DSQMSIIDteReferencia
                Align = alLeft
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
          object GBDTEEnvio: TGroupBox
            Left = 893
            Top = 0
            Width = 271
            Height = 57
            Caption = 'DTE Envio'
            TabOrder = 16
            object LTrackID: TLFLabel
              Left = 4
              Top = 25
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Track ID'
            end
            object DBETrackID: TLFDbedit
              Left = 51
              Top = 22
              Width = 214
              Height = 21
              Color = clInfoBk
              DataField = 'SII_TRACKID'
              DataSource = DMAlbaranes.DSxSiiDte
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
        object PNLDteCab: TLFPanel
          Left = 0
          Top = 0
          Width = 1164
          Height = 23
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object NavOtrosChile: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 23
            DataSource = DMAlbaranes.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel]
            Align = alLeft
            ParentShowHint = False
            PopupMenu = CEOtrosChilePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEOtrosChile
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSProveedores: TTabSheet
        Caption = 'Proveedores'
        ImageIndex = 8
        OnShow = TSProveedoresShow
        object PNLProveedores: TLFPanel
          Left = 0
          Top = 0
          Width = 1164
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSQMCabecera
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
              DataSource = DMAlbaranes.DSQMCabecera
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
            DataSource = DMAlbaranes.DSxProveedores
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
          Width = 1164
          Height = 198
          Align = alClient
          DataSource = DMAlbaranes.DSxProveedores
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
          Transaction = DMAlbaranes.TLocal
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
          Entorno = DMAlbaranes.EntornoDoc
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
    Width = 1178
    Height = 267
    inherited TBDetalle: TLFToolBar
      Width = 1178
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 2
      inherited NavDetalle: THYMNavigator
        DataSource = DMAlbaranes.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        DelMessage = #191'Desea borrar la l'#237'nea? '
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object TButtSep7: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtEditaLineas: TToolButton
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
      object TButtRecibos: TToolButton
        Left = 343
        Top = 0
        Action = ARecibos
        ParentShowHint = False
        ShowHint = True
      end
      object TButtHerencia: TToolButton
        Left = 366
        Top = 0
        Action = AHerencia
        ParentShowHint = False
        ShowHint = True
      end
      object TButtProcedenciaLinea: TToolButton
        Left = 389
        Top = 0
        Action = AProcedencia
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton1: TToolButton
        Left = 412
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSerializacion: TToolButton
        Left = 420
        Top = 0
        Action = ASerializacion
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 443
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBInfoLotes: TToolButton
        Left = 451
        Top = 0
        Action = AInfoLotes
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 474
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtArtCli: TToolButton
        Left = 482
        Top = 0
        Action = AArtCli
        ParentShowHint = False
        ShowHint = True
      end
      object TBCliArt: TToolButton
        Left = 505
        Top = 0
        Action = ACliArt
      end
      object TBNroSerieKri: TToolButton
        Left = 528
        Top = 0
        Action = ANroSerieKri
        ParentShowHint = False
        ShowHint = True
      end
      object TButtCambiaDescripcion: TToolButton
        Left = 551
        Top = 0
        Action = ACambiaTitulo
        ParentShowHint = False
        ShowHint = True
      end
      object TButtMuestraUbiacion: TToolButton
        Left = 574
        Top = 0
        Action = AMuestraUbiacion
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 597
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBDescargaLector: TToolButton
        Left = 605
        Top = 0
        Action = ADescargaLector
        ParentShowHint = False
        ShowHint = True
      end
      object TBAsignaGarantiasLector: TToolButton
        Left = 628
        Top = 0
        Action = AAsignaGarantiasLector
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscarArticulo: TToolButton
        Left = 651
        Top = 0
        Action = ABuscarArticulo
        AllowAllUp = True
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object TButtBuscarLoteSimple: TToolButton
        Left = 674
        Top = 0
        Action = ABuscarLoteSimple
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object TButtCondicionesVenta: TToolButton
        Left = 697
        Top = 0
        Action = ACondicionesDeVenta
        ParentShowHint = False
        ShowHint = True
      end
      object TButtDuplicarLinea: TToolButton
        Left = 720
        Top = 0
        Action = ADuplicarLinea
        ParentShowHint = False
        ShowHint = True
      end
      object TBCondicionesClientes: TToolButton
        Left = 743
        Top = 0
        Action = ACondicionesClientes
        ParentShowHint = False
        ShowHint = True
      end
      object TBCreaAnticipo: TToolButton
        Left = 766
        Top = 0
        Action = ACreaAnticipo
        ParentShowHint = False
        ShowHint = True
      end
      object TButtImportarDetalle: TToolButton
        Left = 789
        Top = 0
        Action = AImportarDetalle
      end
      object TButtDetalles: TToolButton
        Left = 812
        Top = 0
        Action = ADetallesDeLinea
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1178
      Height = 190
      DataSource = DMAlbaranes.DSQMDetalle
      DefaultDrawing = False
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
      AutoCambiarColumna = True
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO'
        'ARTICULO'
        'TIPO_IVA'
        'TIPO_CAJA_EDI'
        'PROYECTO'
        'TIPO_LINEA_KRI'
        'TIPO_UNIDAD_LOGISTICA'
        'ID_UBICACION'
        'DIRECCION_ENTREGA'
        'ALMACEN'
        'ARTICULO')
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
        'TIPO_CAJA_EDI'
        '0'
        'PROYECTO'
        '0'
        'TIPO_LINEA_KRI'
        '0'
        'TIPO_UNIDAD_LOGISTICA'
        '0'
        'ID_UBICACION'
        '0'
        'DIRECCION_ENTREGA'
        '0'
        'ALMACEN'
        '0'
        'ARTICULO'
        '1'
        'TITULO_ARTICULO_CLIENTE')
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
        ''
        'TIPO'
        ''
        'DIRECCION'
        'ALMACEN'
        'ARTICULO')
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
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'TITULO'
        'ORDEN'
        'FECHA_PRE_DET'
        'LINEA'
        'PRECIO')
      CamposNoAccesibles.Strings = (
        'LINEA_SERVIDA'
        'UNIDADES_FACTURADAS')
      ColumnasCheckBoxes.Strings = (
        'LINEA_SERVIDA'
        'APLICA_UNIDADES_SECUNDARIAS'
        'MANIPULACION'
        'INVERSION_SUJETO_PASIVO')
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
      Numericos.Strings = (
        'BARRAS'
        'ARTICULO'
        'NSERIE'
        'TIPO'
        'CAJA'
        'PROYECTO'
        'ID'
        'TIPO'
        'ID_UBICACION'
        'DIRECCION'
        'ALMACEN'
        'CODIGO_CLIENTE')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_CON_BARRAS'
        'VER_ARTICULOS_EF'
        'ART_ARTICULOS_SERIALIZACION'
        'SYS_TIPO_IVA'
        'SYS_EMBALAJES'
        'EMP_PROYECTOS'
        'SYS_TIPO_LINEA_VENTA_KRI'
        'VER_ARTICULOS_UNID_LOG'
        'ART_ALMACENES_UBICACIONES'
        'SYS_TERCEROS_DIRECCIONES'
        'ART_ALMACENES'
        'VER_ARTICULOS_COD_CLI')
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
        'TITULO'
        'DIR_COMPLETA'
        'TITULO'
        'TITULO_ARTICULO')
      OnBusqueda = DBGFDetalleBusqueda
      OnCampoDevuelve = DBGFDetalleCampoDevuelve
      OnExiste = DBGFDetalleExiste
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
        '')
      OrdenadosPor.Strings = (
        'BARRAS'
        'ARTICULO'
        'NSERIE'
        'TIPO'
        'CAJA'
        'PROYECTO'
        'ID'
        'TIPO'
        'COMPOSICION'
        'DIRECCION'
        'ALMACEN'
        'CODIGO_CLIENTE')
      Entorno = DMAlbaranes.EntornoDoc
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
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 335
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Alignment = taRightJustify
          Width = 56
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
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'BRUTO'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE'
          ReadOnly = True
          Title.Alignment = taRightJustify
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
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'M_BRUTO'
          ReadOnly = True
          Title.Alignment = taRightJustify
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
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TIPO_UNIDAD_LOGISTICA'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Alignment = taRightJustify
          Expanded = False
          FieldName = 'TITULO_UNIDAD_LOGISTICA'
          Title.Alignment = taRightJustify
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_LOGISTICAS'
          Title.Alignment = taRightJustify
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
          Title.Alignment = taRightJustify
          Width = 47
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
          Width = 34
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
          Expanded = False
          FieldName = 'TIPO_LINEA_KRI'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NO_FABRICACION_KRI'
          Width = 65
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
          FieldName = 'LINEA_SERVIDA'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGrayText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES_FACTURADAS'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGrayText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAJA_EDI'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_CAJA_EDI'
          Width = 65
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
          FieldName = 'ID_LOTE'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_UBICACION'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COMPOSICION'
          ReadOnly = True
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CALLE'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTANTERIA'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REPISA'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_RELACION'
          Width = 29
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
          Width = 29
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POSICION'
          ReadOnly = True
          Width = 35
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
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_IMPUESTO_ADICIONAL'
          ReadOnly = True
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
      Top = 212
      Width = 1178
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
          Width = 1170
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
              ParentShowHint = False
              ShowHint = True
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
              DataSource = DMAlbaranes.DSxInfoActualizada
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
              Hint = 'Sum Unidades Logisiticas'
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
              Hint = 'Sum Unidades Secundarias'
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
            Width = 292
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object LBultosPie: TLFLabel
              Left = 54
              Top = 5
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bultos'
              Layout = tlCenter
            end
            object LMargen: TLFLabel
              Left = 207
              Top = 5
              Width = 36
              Height = 13
              Caption = 'Margen'
            end
            object LSumaPeso: TLFLabel
              Left = 119
              Top = 5
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso'
              Layout = tlCenter
            end
            object LCantLineas: TLFLabel
              Left = 0
              Top = 5
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lin.'
              Layout = tlCenter
            end
            object DBEBultosPie: TLFDbedit
              Left = 86
              Top = 1
              Width = 30
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'BULTOS'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
            object DBEMargen: TLFDbedit
              Left = 247
              Top = 1
              Width = 45
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'MARGEN'
              DataSource = DMAlbaranes.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = DBEMargenChange
            end
            object DBECOUNT_LINEAS: TLFDbedit
              Left = 21
              Top = 1
              Width = 30
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'COUNT_LINEA'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
            object DBESumaPeso: TLFDbedit
              Left = 147
              Top = 1
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_PESO'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
          object PNLInfoImportes: TLFPanel
            Left = 527
            Top = 2
            Width = 641
            Height = 25
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LFLTotalAnticipado: TLFLabel
              Left = 594
              Top = 5
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'T. Antic.'
              Layout = tlCenter
            end
            object LBLTotal: TLFLabel
              Left = 459
              Top = 5
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
            object LBLLiquido: TLFLabel
              Left = 328
              Top = 5
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'quido'
              Layout = tlCenter
            end
            object LBLIVARec: TLFLabel
              Left = 127
              Top = 5
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA y Rec.'
              Layout = tlCenter
            end
            object LBLBImp: TLFLabel
              Left = 1
              Top = 5
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'B. Imp'
              Layout = tlCenter
            end
            object DBETotal_Anticipado: TLFDbedit
              Left = 638
              Top = 1
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TOTAL_ANTICIPADO'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
            object DBETotal: TLFDbedit
              Left = 503
              Top = 1
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TOTAL_A_COBRAR'
              DataSource = DMAlbaranes.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBES_Bases: TLFDbedit
              Left = 37
              Top = 1
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_BASES'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
            object DBELiquido: TLFDbedit
              Left = 368
              Top = 1
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'LIQUIDO'
              DataSource = DMAlbaranes.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBECuotaRec: TLFDbedit
              Left = 252
              Top = 1
              Width = 70
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_RE'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
            object DBECuotaIVA: TLFDbedit
              Left = 181
              Top = 1
              Width = 70
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_IVA'
              DataSource = DMAlbaranes.DSxInfoActualizada
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
          end
        end
      end
      object TSPieRetCom: TTabSheet
        Caption = '&Retenciones/Comisiones'
        ImageIndex = 1
        object PNLPieRetenciones: TLFPanel
          Left = 0
          Top = 0
          Width = 1170
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLBaseRet: TLFLabel
            Left = 99
            Top = 5
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Retenci'#243'n'
            Layout = tlCenter
          end
          object LBLImporte: TLFLabel
            Left = 297
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LBLBaseComRet: TLFLabel
            Left = 447
            Top = 5
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Comisi'#243'n'
            FocusControl = DBEBaseComision
            Layout = tlCenter
          end
          object LBLImporteRet: TLFLabel
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
            Left = 184
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_BASE_RETENCION'
            DataSource = DMAlbaranes.DSxInfoActualizada
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
            Left = 337
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_RETENCION'
            DataSource = DMAlbaranes.DSxInfoActualizada
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
            DataSource = DMAlbaranes.DSxInfoActualizada
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
            DataSource = DMAlbaranes.DSxInfoActualizada
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
        object PNLPieComisiones: TLFPanel
          Left = 0
          Top = 0
          Width = 1170
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLBaseDtoCargos: TLFLabel
            Left = 266
            Top = 5
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Layout = tlCenter
          end
          object LBLImporteCargos: TLFLabel
            Left = 467
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LBLImpFinan: TLFLabel
            Left = 44
            Top = 5
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Financiaci'#243'n'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object LBLImpBaseCargos: TLFLabel
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
            DataSource = DMAlbaranes.DSxInfoActualizada
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
            Left = 506
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMAlbaranes.DSxInfoActualizada
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
            Left = 148
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMAlbaranes.DSxInfoActualizada
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
            DataSource = DMAlbaranes.DSxInfoActualizada
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
    Top = 547
    Width = 1178
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PNLEdCabecera
    Complementario = TBDetalle
    Left = 136
    Top = 292
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 136
    Top = 322
  end
  inherited ALMain: TLFActionList
    Left = 40
    Top = 360
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
      Category = 'Filtros'
      Caption = 'Filtros'
      ImageIndex = 5
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AInformeAlbaran: TAction
      Category = 'Listados'
      Caption = 'Informe Albar'#225'n'
      Hint = 'Informe Albar'#225'n'
      ImageIndex = 14
      OnExecute = AInformeAlbaranExecute
    end
    object AInformeAlbaran2: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Albar'#225'n 2'
      Hint = 'Informe Albar'#225'n 2'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformeAlbaran2Execute
    end
    object AHerencia: TAction
      Category = 'Otros'
      Caption = 'Herencia'
      Hint = 'Herencia'
      ImageIndex = 97
      OnExecute = AHerenciaExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AInformeAlbaran3: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Albar'#225'n 3'
      Hint = 'Informe Albar'#225'n 3'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformeAlbaran3Execute
    end
    object AInformeAlbaran4: TLFNoSaveAction
      Category = 'Listados'
      Caption = 'Informe Albar'#225'n 4'
      Hint = 'Informe Albar'#225'n 4'
      ImageIndex = 14
      Visible = False
      OnExecute = AInformeAlbaran4Execute
    end
    object APickingList: TAction
      Category = 'Listados'
      Caption = 'Picking List'
      Hint = 'Listado de Preparacion (Picking List)'
      ImageIndex = 77
      OnExecute = APickingListExecute
    end
    object AVisualizarAlbaranesFiltrados: TAction
      Category = 'Listados'
      Caption = 'Visualizar Albaranes Filtrados'
      Hint = 'Visualizar Albaranes Filtrados'
      ImageIndex = 14
      OnExecute = AVisualizarAlbaranesFiltradosExecute
    end
    object AEnviarAlbaranMailPDF: TAction
      Category = 'Listados'
      Caption = 'Enviar Albar'#225'n por e-mail en Pdf (directo)'
      Hint = 'Enviar Albar'#225'n por e-mail en Pdf'
      ImageIndex = 34
      ShortCut = 49229
      OnExecute = AEnviarAlbaranMailPDFExecute
    end
    object AEnviarAlbaranMailPDF2: TAction
      Category = 'Listados'
      Caption = 'Enviar Albar'#225'n por e-mail en Pdf (mensaje)'
      Hint = 'Enviar Albar'#225'n por e-mail en Pdf con el cliente de correo'
      ImageIndex = 34
      OnExecute = AEnviarAlbaranMailPDF2Execute
    end
    object AImprimirAlbaranesFiltrados: TAction
      Category = 'Listados'
      Caption = 'Imprimir Albaranes Filtrados'
      Hint = 'Imprimir Albaranes Filtrados'
      ImageIndex = 14
      OnExecute = AImprimirAlbaranesFiltradosExecute
    end
    object AInformeCartaPortes1: TAction
      Category = 'Listados'
      Caption = 'Informe Carta de Portes 1'
      Hint = 'Informe Carta de Portes 1'
      ImageIndex = 14
      OnExecute = AInformeCartaPortes1Execute
    end
    object AInformeCartaPortes2: TAction
      Category = 'Listados'
      Caption = 'Informe Carta de Portes 2'
      Hint = 'Informe Carta de Portes 2'
      ImageIndex = 14
      OnExecute = AInformeCartaPortes2Execute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object ACambiaFecha: TAction
      Category = 'Procesos'
      Caption = 'Cambia Fecha'
      Hint = 'Modifica la fecha de todos los albaranes filtrados y abiertos'
      ImageIndex = 9
      OnExecute = ACambiaFechaExecute
    end
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Quitar Filtro'
      Hint = 'Muestra todos los docuemtos'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AFiltroAbierto: TAction
      Category = 'Filtros'
      Caption = 'Abiertos'
      Hint = 'Muestra los docuemtos abiertos'
      ImageIndex = 5
      OnExecute = AFiltroAbiertoExecute
    end
    object AFiltroAnulado: TAction
      Category = 'Filtros'
      Caption = 'Anulados'
      Hint = 'Muestra los docuemtos anulados'
      ImageIndex = 5
      OnExecute = AFiltroAnuladoExecute
    end
    object AFiltroAbiertoFacturable: TAction
      Category = 'Filtros'
      Caption = 'Abiertos Facturables'
      Hint = 'Muestra documentos Abiertos y Facturables'
      ImageIndex = 5
      OnExecute = AFiltroAbiertoFacturableExecute
    end
    object AFiltroAbiertoMuestras: TAction
      Category = 'Filtros'
      Caption = 'Abiertos Muestras'
      Hint = 'Muestra documentos Abiertos marcados como Muestras'
      ImageIndex = 5
      OnExecute = AFiltroAbiertoMuestrasExecute
    end
    object AAdjuntosAlbaran: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Albaran'
      ImageIndex = 59
      OnExecute = AAdjuntosAlbaranExecute
    end
    object AResumenAlbaranes: TAction
      Category = 'Listados'
      Caption = 'Resumen Albaranes'
      Hint = 'Resumen Albaranes'
      ImageIndex = 14
      OnExecute = AResumenAlbaranesExecute
    end
    object AResumenAlbaranesFiltrados: TAction
      Category = 'Listados'
      Caption = 'Resumen Albaranes Filtrados'
      Hint = 'Resumen Albaranes Filtrados'
      ImageIndex = 14
      OnExecute = AResumenAlbaranesFiltradosExecute
    end
    object AImprimirResumenAlbaranesFiltrados: TAction
      Category = 'Listados'
      Caption = 'Imprimir Resumen Albaranes Filtrados'
      Hint = 'Imprimir Resumen Albaranes Filtrados'
      ImageIndex = 14
      OnExecute = AImprimirResumenAlbaranesFiltradosExecute
    end
    object AListadoArticulos: TAction
      Category = 'Listados'
      Caption = 'Listado por Articulos'
      Hint = 'Listado por Articulos'
      ImageIndex = 14
      OnExecute = AListadoArticulosExecute
    end
    object ASep2: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Etiquetas'
      Hint = 'Etiquetas de envio'
      ImageIndex = 95
      OnExecute = AEtiquetasExecute
    end
    object ASep6: TAction
      Category = 'Listados'
      Caption = '-'
      Hint = '-'
    end
    object ALstUbicaciones: TAction
      Category = 'Listados'
      Caption = 'Listado de Ubicaciones'
      Hint = 'Listado de Ubicaciones'
      ImageIndex = 14
      OnExecute = ALstUbicacionesExecute
    end
    object ASep3: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object ACambiarNombre: TAction
      Category = 'Procesos'
      Caption = 'Cambiar a Nombre Comercial'
      Hint = 'Cambiar a Nombre Comercial'
      ImageIndex = 17
      OnExecute = ACambiarNombreExecute
    end
    object ASep4: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object AFactura: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Factura'
      Hint = 'Traspasa el Albar'#225'n actual a Factura'
      ImageIndex = 61
      OnExecute = AFacturaExecute
    end
    object AAlbaranMulti: TAction
      Category = 'Procesos'
      Caption = 'Traspaso de Albaranes MultiCanal'
      Hint = 'Traspaso de Albaranes MultiCanal'
      ImageIndex = 132
      OnExecute = AAlbaranMultiExecute
    end
    object ASep5: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ADuplicar: TAction
      Category = 'Procesos'
      Caption = 'Duplicar Albar'#225'n'
      Hint = 'Duplicar Albar'#225'n'
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
      Caption = 'Recalcula el Detalle'
      Hint = 'Recalcula el Detalle'
      ImageIndex = 3
      OnExecute = ARefrescaDetalleExecute
    end
    object AAnulaDocumento: TAction
      Category = 'Procesos'
      Caption = 'Marca el documento como anulado / pendiente'
      Hint = 'Marca el documento como anulado / pendiente'
      ImageIndex = 27
      OnExecute = AAnulaDocumentoExecute
    end
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar documento'
      Hint = 'Cierra el documento actual'
      ImageIndex = 68
      OnExecute = AAbrirCerrarExecute
    end
    object AMantenimientoDeposito: TAction
      Category = 'Procesos'
      Caption = 'Dep'#243'sito'
      Hint = 'Crea, Elimina o Visualiza Dep'#243'sito'
      ImageIndex = 21
      OnExecute = AMantenimientoDepositoExecute
    end
    object AHistoricoSerializacion: TAction
      Category = 'Otros'
      Caption = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      Hint = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      ImageIndex = 115
      OnExecute = AHistoricoSerializacionExecute
    end
    object ADevolucion: TAction
      Category = 'Procesos'
      Caption = 'Genera Devoluci'#243'n'
      Hint = 'Genera Devoluci'#243'n'
      ImageIndex = 39
      OnExecute = ADevolucionExecute
    end
    object AConfListadosAlbaranes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Albaranes'
      Hint = 'Listados de Albaranes'
      ImageIndex = 77
      OnExecute = AConfListadosAlbaranesExecute
    end
    object AConfListadoAlbPorte1: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Albaranes con Carta de Porte 1'
      Hint = 'Listado Albaranes con Carta de Porte 1'
      ImageIndex = 77
      OnExecute = AConfListadoAlbPorte1Execute
    end
    object AConfListadoAlbPorte2: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Albaranes con Carta de Porte 2'
      Hint = 'Listado Albaranes con Carta de Porte 2'
      ImageIndex = 77
      OnExecute = AConfListadoAlbPorte2Execute
    end
    object AConfAlbFechasClientes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Albaranes entre Fechas y Clientes'
      Hint = 'Listados de Albaranes entre Fechas y Clientes'
      ImageIndex = 77
      OnExecute = AConfAlbFechasClientesExecute
    end
    object AConfEtiquetas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiquetas'
      Hint = 'Etiquetas'
      ImageIndex = 77
      OnExecute = AConfEtiquetasExecute
    end
    object AConfLstUbicaciones: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Ubicaciones'
      Hint = 'Listado de Ubicaciones'
      ImageIndex = 77
      OnExecute = AConfLstUbicacionesExecute
    end
    object AAgrupaAlbaranesFiltradosKri: TAction
      Category = 'Procesos'
      Caption = 'Agrupa Albaranes Filtrados'
      Hint = 'Agrupa los albaranes filtrados'
      ImageIndex = 60
      OnExecute = AAgrupaAlbaranesFiltradosKriExecute
    end
    object ASep1: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ABuscaReferencia: TAction
      Category = 'Otros'
      Caption = 'Busca Referencia'
      Hint = 'Busca Referencia'
      ImageIndex = 83
      OnExecute = ABuscaReferenciaExecute
    end
    object AOrdenaLineas: TAction
      Category = 'Otros'
      Caption = 'Reordenar las L'#237'neas'
      Hint = 'Reordena las l'#237'neas del documento'
      ImageIndex = 122
      OnExecute = AOrdenaLineasExecute
    end
    object AGenerarPackingList: TAction
      Category = 'Procesos'
      Caption = 'Generar Packing List'
      Hint = 'Genera Packing List'
      ImageIndex = 18
      OnExecute = AGenerarPackingListExecute
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
    object AOrdenarLineasPorDireccionEntrega: TAction
      Category = 'Otros'
      Caption = 'Ordenar por Dir. Entrega'
      Hint = 'Ordena las lineas por direccion de entrega'
      ImageIndex = 122
      OnExecute = AOrdenarLineasPorDireccionEntregaExecute
    end
    object AOrdenarLineasPorDireccionEntrega_Filtradas: TAction
      Category = 'Otros'
      Caption = 'Ordenar por Dir. Entrega de los registros filtrados'
      Hint = 
        'Ordena las lineas por direccion de entrega de los registros filt' +
        'rados'
      ImageIndex = 122
      OnExecute = AOrdenarLineasPorDireccionEntrega_FiltradasExecute
    end
    object ADistribuyeLineasPorDirecionEntrega: TAction
      Category = 'Otros'
      Caption = 'Asignar Cajas por Dir. Entrega'
      Hint = 'Asigna caja segun direccion de entrega'
      ImageIndex = 115
      OnExecute = ADistribuyeLineasPorDirecionEntregaExecute
    end
    object AListarEtiquetas: TAction
      Category = 'Listados'
      Caption = 'Lista Etiquetas'
      Hint = 'Lista Etiquetas de los articulos del documento'
      ImageIndex = 95
      OnExecute = AListarEtiquetasExecute
    end
    object ADuplicarLinea: TAction
      Category = 'Otros'
      Caption = 'Duplicar Linea'
      Hint = 'Duplicar Linea'
      ImageIndex = 37
      OnExecute = ADuplicarLineaExecute
    end
    object AExportarVGG: TAction
      Category = 'Otros'
      Caption = 'Exportar a VGG'
      Hint = 'Exporta el albaran a un fichero de texto para VGG'
      ImageIndex = 36
      OnExecute = AExportarVGGExecute
    end
    object ADetalleDeCabecera: TAction
      Category = 'Otros'
      Caption = 'Detalle de Documento'
      Hint = 'Detalle de Documento'
      ImageIndex = 29
      OnExecute = ADetalleDeCabeceraExecute
    end
    object AEliminarPackingList: TAction
      Category = 'Procesos'
      Caption = 'Eliminar Packing List'
      Hint = 'Eliminar el Packing List'
      ImageIndex = 22
      OnExecute = AEliminarPackingListExecute
    end
    object ACambioPCosteLinea: TAction
      Category = 'Procesos'
      Caption = 'Cambio Precio Coste de Linea'
      Hint = 'Cambia el precio de coste de la linea'
      ImageIndex = 55
      OnExecute = ACambioPCosteLineaExecute
    end
    object AEtiquetaAlbaran: TAction
      Category = 'Listados'
      Caption = 'Etiqueta Albar'#225'n'
      Hint = 'Etiqueta Albar'#225'n'
      ImageIndex = 95
      OnExecute = AEtiquetaAlbaranExecute
    end
    object AConfLstEtiquetaAlbaran: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Etiqueta Albar'#225'n'
      Hint = 'Etiqueta Albar'#225'n'
      ImageIndex = 77
      OnExecute = AConfLstEtiquetaAlbaranExecute
    end
    object ACrearRuta: TAction
      Category = 'Otros'
      Caption = 'Crear Ruta'
      Hint = 'Crea una ruta de reparto'
      ImageIndex = 112
      OnExecute = ACrearRutaExecute
    end
    object ACreaAnticipo: TAction
      Category = 'Otros'
      Caption = 'Anticipo'
      Hint = 'Crea Recibo Anticipo'
      ImageIndex = 141
      ShortCut = 117
      OnExecute = ACreaAnticipoExecute
    end
    object ARecibos: TAction
      Category = 'Otros'
      Caption = 'Recibos de documento'
      Hint = 'Recibos de documento'
      ImageIndex = 75
      OnExecute = ARecibosExecute
    end
    object AAsignaEmpleado: TAction
      Category = 'Otros'
      Caption = 'Asigna Empleado'
      Hint = 'Asigna Empleado Atencion/Responsable'
      ImageIndex = 135
      OnExecute = AAsignaEmpleadoExecute
    end
    object ATraspasoMovimientoStock: TAction
      Category = 'Otros'
      Caption = 'Traspaso a Movimiento Stock'
      Hint = 'Traspaso a Movimiento Stock de Entrada'
      ImageIndex = 125
      OnExecute = ATraspasoMovimientoStockExecute
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
    object ACambioCosteAdicionalLinea: TAction
      Category = 'Procesos'
      Caption = 'Cambio Coste Adicional Linea'
      Hint = 'Cambia el Coste Adicional de la linea'
      ImageIndex = 55
      OnExecute = ACambioCosteAdicionalLineaExecute
    end
    object ATraspasarLinea: TAction
      Category = 'Otros'
      Caption = 'Traspasar Linea'
      Hint = 'Traspasa la linea seleccionada a una factura abierta.'
      ImageIndex = 61
      OnExecute = ATraspasarLineaExecute
    end
    object AMuestraDocumentosVenta: TAction
      Category = 'Otros'
      Caption = 'Muestra documentos venta del cliente'
      Hint = 'Muestra documentos venta del cliente'
      ImageIndex = 55
      ShortCut = 115
      OnExecute = AMuestraDocumentosVentaExecute
    end
    object ACrearHerenciaManual: TAction
      Category = 'Otros'
      Caption = 'Crear Herencia Manual'
      ImageIndex = 97
      OnExecute = ACrearHerenciaManualExecute
    end
    object AEnviaDTECL: TAction
      Category = 'Procesos'
      Caption = 'Envia Guia de Despacho'
      Hint = 'Envia Guia de Despacho'
      ImageIndex = 136
      OnExecute = AEnviaDTECLExecute
    end
    object ADetallesDeLinea: TAction
      Category = 'Otros'
      Caption = 'Detalles de Linea'
      Hint = 'Detalles de Linea'
      ImageIndex = 18
      OnExecute = ADetallesDeLineaExecute
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
      Hint = 'Listado de preparacion (Picking List)'
      ImageIndex = 77
      OnExecute = AConfPickingListExecute
    end
    object AExportarExcel: TAction
      Category = 'Listados'
      Caption = 'Exportar Excel'
      Hint = 'Exportar Documento a Excel'
      ImageIndex = 105
      OnExecute = AExportarExcelExecute
    end
    object AFiltraClientesALFA: TAction
      Category = 'Otros'
      Caption = 'Filtra Clientes con Certificado'
      Hint = 
        'Filtra Clientes con Certificado.'#13#10'Albaranes de clientes cuyo cam' +
        'po ALFA_1 contenga una "X".'
      ImageIndex = 35
      OnExecute = AFiltraClientesALFAExecute
    end
    object AIncrementarPrecio: TAction
      Category = 'Procesos'
      Caption = 'Incrementar Precio'
      Hint = 'Incrementar Precio'
      ImageIndex = 56
      OnExecute = AIncrementarPrecioExecute
    end
    object AFiltroCerrado: TAction
      Category = 'Filtros'
      Caption = 'Cerrados'
      Hint = 'Muestra documentos cerrados'
      ImageIndex = 5
      OnExecute = AFiltroCerradoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 232
    Top = 358
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    Complementario = nil
    SubComplementario = ALMain
    Left = 168
    Top = 292
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 168
    Top = 322
  end
  object CENotas: TControlEdit
    EnlazadoA = CECartaPortes
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLEdNotas
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 200
    Top = 292
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 200
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
  object ALAlbaranes: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 8
    Top = 360
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
    object AProcedencia: TAction
      Caption = 'Procedencia'
      Hint = 'Procedencia de la l'#237'nea'
      ImageIndex = 96
      OnExecute = AProcedenciaExecute
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
    object APVP: TAction
      Caption = 'Calcula Unidades'
      Hint = 'Obtiene Unidades en funcion del PVP'
      ShortCut = 8237
      OnExecute = APVPExecute
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
      Caption = 'AImprime'
      Hint = 'Imprime Informe'
      ImageIndex = 14
      ShortCut = 49225
      OnExecute = AImprimeExecute
    end
    object AInfoLotes: TAction
      Caption = 'Informaci'#243'n de Lotes'
      Hint = 'Informaci'#243'n de Lotes'
      ImageIndex = 120
      ShortCut = 16460
      OnExecute = AInfoLotesExecute
    end
    object AArticulo: TAction
      Caption = 'Ver Datos Art'#237'culo'
      Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Art'#237'culo'
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
    object ABuscarNumSerie: TAction
      Caption = 'ABuscarNumSerie'
      Hint = 'Buscar Documentos por n'#250'meros de Serie'
      ImageIndex = 85
      OnExecute = ABuscarNumSerieExecute
    end
    object ANroSerieKri: TAction
      Caption = 'Nro. de Serie'
      Hint = 'Edita los nros de serie de una linea de albaran'
      ImageIndex = 56
      OnExecute = ANroSerieKriExecute
    end
    object ACambiaTitulo: TAction
      Caption = 'Cambia Descripci'#243'n'
      Hint = 'Mostrar t'#237'tulos en el idioma'
      ImageIndex = 91
      OnExecute = ACambiaTituloExecute
    end
    object AMuestraUbiacion: TAction
      Caption = 'Muestra las ubiaciones de los articulos'
      Hint = 'Muestra las ubiaciones de los articulos'
      ImageIndex = 81
      OnExecute = AMuestraUbiacionExecute
    end
    object AExportaAlbaranEDI: TAction
      Caption = 'Exporta Albaran a EDI'
      Hint = 'Exporta este albar'#225'n a los ficheros EDI'
      OnExecute = AExportaAlbaranEDIExecute
    end
    object ANIFAlbaran: TAction
      Caption = 'Datos del Cliente'
      Hint = 'Datos de Cliente'
      ShortCut = 16452
      OnExecute = ANIFAlbaranExecute
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
    object AAsignaGarantiasLector: TAction
      Caption = 'Asigna Garantias Lector'
      Hint = 
        '- Lee los datos del Lector de c'#243'digo de barras,'#13#10'- Verifica que ' +
        'los art'#237'culos sean los correctos'#13#10'- Asigna Albar'#225'n a las Garant'#237 +
        'as.'
      ImageIndex = 18
      OnExecute = AAsignaGarantiasLectorExecute
    end
    object ABuscarArticulo: TAction
      Caption = 'Buscar Articulo'
      Hint = 'Buscar Documentos por articulo'
      ImageIndex = 109
      OnExecute = ABuscarArticuloExecute
    end
    object ACondicionesDeVenta: TAction
      Caption = 'Ver Condiciones Venta'
      Hint = 'Ver Condiciones Venta'
      ImageIndex = 143
      OnExecute = ACondicionesDeVentaExecute
    end
    object ABuscarLoteSimple: TAction
      Caption = 'Buscar Lote Simple'
      Hint = 'Buscar Documentos por Lote Simple'
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
    object AVerificacionDrasa: TAction
      Caption = 'Verificacion DRASA'
      ShortCut = 24697
      OnExecute = AVerificacionDrasaExecute
    end
    object ALocalizaFolio: TAction
      Caption = 'Localiza Folio'
      Hint = 'Localiza Folio'
      ImageIndex = 83
      OnExecute = ALocalizaFolioExecute
    end
    object ATraspasaMovimientoStock: TAction
      Caption = 'Traspasa a Movimiento de Stock'
      Hint = 'Traspasa a Movimiento de Stock'
      ImageIndex = 125
      OnExecute = ATraspasaMovimientoStockExecute
    end
    object ATraspasaFiltradosMovimientoStock: TAction
      Caption = 'Traspasa a Movimiento de Stock los documentos filtrados'
      Hint = 'Traspasa a Movimiento de Stock los documentos filtrados'
      ImageIndex = 125
      OnExecute = ATraspasaFiltradosMovimientoStockExecute
    end
    object AAsignarEnvio: TAction
      Caption = 'Asignar a Envio'
      Hint = 'Asignar a Envio del dia'
      ImageIndex = 112
      OnExecute = AAsignarEnvioExecute
    end
    object APeticionRecogidaGLS: TAction
      Caption = 'Peticion Recogida GLS'
      Hint = 'Peticion Recogida GLS'
      ImageIndex = 90
      OnExecute = APeticionRecogidaGLSExecute
    end
    object APeticionRecogidaDHL: TAction
      Caption = 'Peticion Recogida DHL'
      Hint = 'Peticion Recogida DHL'
      ImageIndex = 90
      OnExecute = APeticionRecogidaDHLExecute
    end
    object ADHLRates: TAction
      Caption = 'DHL Rates'
      Hint = 'DHLRates'
      ImageIndex = 33
      OnExecute = ADHLRatesExecute
    end
  end
  object RelojNotas: TTimer
    Enabled = False
    OnTimer = RelojNotasTimer
    Left = 368
    Top = 302
  end
  object CECartaPortes: TControlEdit
    EnlazadoA = CEMatricula
    FichaEdicion = TSCartaPorte
    PanelEdicion = PNLIzqCarta
    SubComplementario = ALMain
    PopUpMenu = CEMCartaPortesPMEdit
    Teclas = DMMain.Teclas
    Left = 104
    Top = 292
  end
  object CEMCartaPortesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 104
    Top = 322
    object CECartaPortesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CECartaPortesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CECartaPortesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CECartaPortesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CECartaPortesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CECartaPortesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECartaPortesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECartaPortesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECartaPortesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECartaPortesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEMatricula: TControlEdit
    EnlazadoA = CENaturaleza
    SubComplementario = ALMain
    PopUpMenu = CEMatriculaPMEdit
    Teclas = DMMain.Teclas
    Left = 72
    Top = 292
  end
  object CENaturaleza: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = CENaturalezaPMEdit
    Teclas = DMMain.Teclas
    Left = 40
    Top = 292
  end
  object CEMatriculaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 72
    Top = 322
    object CEMatriculaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMatriculaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMatriculaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMatriculaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMatriculaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMatriculaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMatriculaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEMatriculaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMatriculaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMatriculaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENaturalezaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 40
    Top = 322
    object CENaturalezaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CENaturalezaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CENaturalezaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CENaturalezaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CENaturalezaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CENaturalezaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CENaturalezaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CENaturalezaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENaturalezaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENaturalezaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object PMTraspaso: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 8
    Top = 322
    object MITraspasoaFactura: TMenuItem
      Action = AFactura
    end
    object MIDuplicarAlbaran: TMenuItem
      Action = ADuplicar
    end
    object MIGeneraDevolucion: TMenuItem
      Action = ADevolucion
    end
  end
  object CEOtros: TControlEdit
    EnlazadoA = CEOtros
    FichaEdicion = TSOtros
    FichaExclusiva = TSOtros
    PanelEdicion = PNLEdOtros
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEOtrosPMEdit
    Teclas = DMMain.Teclas
    Left = 232
    Top = 292
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 232
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
  object CEDirEntrega: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSDirManual
    FichaExclusiva = TSDirManual
    PanelEdicion = PNLDirManualDatos
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEDirEntregaPMEdit
    Teclas = DMMain.Teclas
    Left = 264
    Top = 292
  end
  object CEDirEntregaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 264
    Top = 324
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
  object RelojAdjuntos: TTimer
    OnTimer = RelojAdjuntosTimer
    Left = 368
    Top = 336
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 368
    Top = 368
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
    Left = 296
    Top = 293
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
  object CEProveedores: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSProveedores
    SubComplementario = ALMain
    PopUpMenu = CEProveedoresPMEdit
    Teclas = DMMain.Teclas
    Left = 296
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
  object pmCartaPorte: TPopupMenu
    Images = DMMain.ILMain_Ac
    Left = 136
    Top = 64
    object MIInformeCartadePortes1: TMenuItem
      Tag = 1
      Action = AInformeCartaPortes1
    end
    object MIInformeCartadePortes2: TMenuItem
      Tag = 2
      Action = AInformeCartaPortes2
    end
  end
end
