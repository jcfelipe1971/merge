inherited FMFacturasAAcr: TFMFacturasAAcr
  Left = 302
  Top = 161
  Width = 992
  Height = 600
  HelpContext = 173
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturas de Acreedores'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  OldCreateOrder = False
  PopupMenu = CEOtrosPMEdit
  Position = poDefault
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 982
    Height = 251
    BorderWidth = 3
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 976
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        972
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMFacturasAAcr.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBEFAcreedor
        InsertaControl = DBENumFactura
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMFacturasAAcr.DSQMCabecera
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      object TButtSep2: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimeListado: TToolButton
        Left = 327
        Top = 0
        Action = AInfFacAcreedores
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscaNIFKRI: TToolButton
        Left = 350
        Top = 0
        Action = ABuscaNIFKRI
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
        CondicionBusqueda = 'tipo='#39'FCR'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_E_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NOMBRE')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMFacturasAAcr.EntornoDoc
      end
      object PNLTitSerie: TLFPanel
        Left = 381
        Top = 0
        Width = 275
        Height = 22
        BevelOuter = bvNone
        Enabled = False
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
        Left = 859
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
        Left = 919
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
      Width = 976
      Height = 219
      MultiLine = True
      TabOrder = 0
      inherited TSFicha: TTabSheet
        object SBVerRegistro: TSpeedButton [0]
          Left = 456
          Top = 48
          Width = 65
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
          GroupIndex = -1
          Flat = True
          OnDblClick = SBVerRegistroDblClick
        end
        object SBVerAsiento: TSpeedButton [1]
          Left = 704
          Top = 48
          Width = 57
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          Down = True
          Caption = 'Ver asiento generado'
          OnDblClick = SBVerAsientoDblClick
        end
        object SBAAcreedor: TSpeedButton [2]
          Left = 144
          Top = 40
          Width = 233
          Height = 25
          Hint = 'Doble click o Ctrl+Alt+D para ver los datos del Acreedor'
          GroupIndex = -1
          OnDblClick = SBAAcreedorDblClick
        end
        object SBVerCartera: TSpeedButton [3]
          Left = 576
          Top = 48
          Width = 65
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
          GroupIndex = -1
          Flat = True
          OnDblClick = SBVerCarteraDblClick
        end
        inherited PEdit: TLFPanel
          Width = 968
          Height = 191
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'NUM_FACTURA'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMFacturasAAcr.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_FACTURA_ACR'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMFacturasAAcr.EntornoDoc
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LBLFactura: TLFLabel
            Left = 32
            Top = 2
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factura'
            FocusControl = DBERIG
          end
          object LBLEstado: TLFLabel
            Left = 143
            Top = 2
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LBLFecha: TLFLabel
            Left = 422
            Top = 2
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLAcreedor: TLFLabel
            Left = 25
            Top = 46
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acreedor'
          end
          object LBLNFactura: TLFLabel
            Left = 17
            Top = 24
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Factura'
            FocusControl = DBENumFactura
          end
          object LBLFormaPago: TLFLabel
            Left = 11
            Top = 90
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LBLNAsiento: TLFLabel
            Left = 658
            Top = 46
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LBLDtoCial: TLFLabel
            Left = 793
            Top = 2
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
          end
          object LblRegistro: TLFLabel
            Left = 394
            Top = 46
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registro IVA'
          end
          object LBLFecha_Con: TLFLabel
            Left = 395
            Top = 24
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cont.'
          end
          object LBLDtoPP: TLFLabel
            Left = 798
            Top = 26
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
          end
          object LBLTipo_asiento: TLFLabel
            Left = 777
            Top = 46
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Asiento'
          end
          object LFechaEntrega: TLFLabel
            Left = 623
            Top = 2
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Entrega'
          end
          object LBReferencia: TLFLabel
            Left = 400
            Top = 68
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
          end
          object LNCF: TLFLabel
            Left = 430
            Top = 112
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'NCF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTipo: TLFLabel
            Left = 433
            Top = 90
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LFechaSII: TLFLabel
            Left = 626
            Top = 24
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha SII'
          end
          object LBLCartera: TLFLabel
            Left = 540
            Top = 46
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cartera'
          end
          object LMonedaFicha: TLFLabel
            Left = 797
            Top = 68
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object DBTValorCambioFijo: TDBText
            Left = 842
            Top = 86
            Width = 64
            Height = 17
            Alignment = taRightJustify
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMFacturasAAcr.DSQMCabecera
          end
          object DBTRectificacion: TDBText
            Left = 457
            Top = 136
            Width = 101
            Height = 13
            AutoSize = True
            DataField = 'DESC_RECTIFICACION'
            DataSource = DMFacturasAAcr.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LDireccion: TLFLabel
            Left = 22
            Top = 68
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LObservaciones: TLFLabel
            Left = 4
            Top = 173
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones'
            FocusControl = DBEObservaciones
          end
          object DBERIG: TLFDbedit
            Left = 73
            Top = 0
            Width = 64
            Height = 21
            DataField = 'RIG'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 0
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 458
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 12
            OnExit = DBDTPFechaExit
          end
          object DBETituloAcreedor: TLFDbedit
            Left = 138
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMFacturasAAcr.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnDblClick = SBAAcreedorDblClick
            OnEnter = DBETituloAcreedorEnter
          end
          object DBEFAcreedor: TLFDBEditFind2000
            Left = 73
            Top = 44
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ACREEDOR'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 4
            OnChange = DBEFAcreedorChange
            Accion = ANewAcreedor
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ACREEDORES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'NOMBRE_R_SOCIAL'
              'CUENTA'
              'NIF'
              'TIT_LOCALIDAD')
            CampoNum = 'ACREEDOR'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'BAJA=0'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = DBEFAcreedorExiste
            OrdenadoPor.Strings = (
              'ACREEDOR')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMFacturasAAcr.EntornoDoc
          end
          object DBENumFactura: TLFDbedit
            Left = 73
            Top = 22
            Width = 305
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUM_FACTURA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 3
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 73
            Top = 88
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FORMA_DE_PAGO'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 8
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
              'forma_pago')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMFacturasAAcr.EntornoDoc
          end
          object ETituloFormaPago: TLFEdit
            Left = 138
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
            TabOrder = 9
          end
          object DBCBDevolucion: TLFDBCheckBox
            Left = 813
            Top = 118
            Width = 97
            Height = 17
            Caption = 'Devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 32
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEVOLUCION'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBERic: TLFDbedit
            Left = 699
            Top = 44
            Width = 64
            Height = 21
            AutoSize = False
            Color = clAqua
            DataField = 'ASIENTO'
            DataSource = DMFacturasAAcr.DSQMCabecera
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
          object DBEDtoCial: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'DTO_CIAL'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 27
          end
          object DBERegistro: TLFDbedit
            Left = 458
            Top = 44
            Width = 64
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'REGISTRO'
            DataSource = DMFacturasAAcr.DSQMCabecera
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
          object DBDTPFecha_Con: TLFDBDateEdit
            Left = 458
            Top = 22
            Width = 87
            Height = 21
            DataField = 'FECHA_CON'
            DataSource = DMFacturasAAcr.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 15
            OnExit = DBDTPFecha_ConExit
          end
          object DBEDtoPP: TLFDbedit
            Left = 842
            Top = 22
            Width = 64
            Height = 21
            DataField = 'DTO_PP'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 28
          end
          object DBCBRec_Invisibles: TLFDBCheckBox
            Left = 813
            Top = 158
            Width = 84
            Height = 17
            Caption = 'Sin Recibos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 34
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SIN_RECIBOS'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBArrendamiento: TLFDBCheckBox
            Left = 73
            Top = 134
            Width = 97
            Height = 17
            Caption = 'Arrendamiento'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ARRENDAMIENTO'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETituloEstado: TLFDbedit
            Left = 181
            Top = 0
            Width = 158
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object DBCBForzarVen: TLFDBCheckBox
            Left = 813
            Top = 98
            Width = 119
            Height = 17
            Caption = 'Forzar Vencimientos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FUERZA_VENCIMIENTOS'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFTipo_asiento: TLFDBEditFind2000
            Left = 842
            Top = 44
            Width = 64
            Height = 21
            DataField = 'TIPO_ASIENTO_KRI'
            DataSource = DMFacturasAAcr.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 29
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBDTPHora_Con: TDBDateTimePicker
            Left = 546
            Top = 22
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 45783.4870468981
            Time = 45783.4870468981
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 16
            DataField = 'FECHA_CON'
            DataSource = DMFacturasAAcr.DSQMCabecera
          end
          object DBCBLeasing: TLFDBCheckBox
            Left = 73
            Top = 112
            Width = 57
            Height = 17
            Caption = 'Leasing'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'LEASING'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPEntrega: TLFDBDateEdit
            Left = 676
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA_ENTREGA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
            OnExit = DBDTPEntregaExit
          end
          object DBEReferencia: TLFDbedit
            Left = 458
            Top = 66
            Width = 305
            Height = 21
            DataField = 'SU_REFERENCIA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 22
          end
          object DBCHKObligaAuto: TLFDBCheckBox
            Left = 813
            Top = 138
            Width = 108
            Height = 16
            Caption = 'Obliga Autofactura'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 33
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OBLIGA_AUTOFACTURA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPHora_Fac: TDBDateTimePicker
            Left = 546
            Top = 0
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 44875.4870468981
            Time = 44875.4870468981
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 13
            DataField = 'FECHA'
            DataSource = DMFacturasAAcr.DSQMCabecera
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 458
            Top = 88
            Width = 48
            Height = 21
            CharCase = ecUpperCase
            DataField = 'Z_TIPO_BIENES'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 23
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'RD_SYS_TIPO_BIENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
            Entorno = DMFacturasAAcr.EntornoDoc
          end
          object DBCBVTipoNCF: TDBLookupComboBox
            Left = 605
            Top = 110
            Width = 157
            Height = 21
            DataField = 'Z_TIPO_NCF'
            DataSource = DMFacturasAAcr.DSQMCabecera
            DropDownWidth = 250
            KeyField = 'TIPO_NCF'
            ListField = 'TITULO'
            ListSource = DMFacturasAAcr.DSxTipoNCF
            TabOrder = 26
            OnClick = DBCBVTipoNCFClick
            OnEnter = DBCBVTipoNCFEnter
          end
          object DBEFPrefijoNCF: TLFDbedit
            Left = 457
            Top = 110
            Width = 78
            Height = 21
            TabStop = False
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'Z_PREFIJO_NCF'
            DataSource = DMFacturasAAcr.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
          end
          object DBEContadorNCF: TLFDbedit
            Left = 536
            Top = 110
            Width = 68
            Height = 21
            TabStop = False
            AutoSize = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'Z_CONTADOR_NCF'
            DataSource = DMFacturasAAcr.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
          end
          object DBCHKListado: TLFDBCheckBox
            Left = 341
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
            DataSource = DMFacturasAAcr.DSxInfoActualizada
            ValueChecked = '16'
            ValueUnchecked = '0'
          end
          object DBDTPFechaSII: TLFDBDateEdit
            Left = 676
            Top = 22
            Width = 87
            Height = 21
            DataField = 'FECHA_SII'
            DataSource = DMFacturasAAcr.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 17
          end
          object DBERegistroCartera: TLFDbedit
            Left = 578
            Top = 44
            Width = 64
            Height = 21
            AutoSize = False
            Color = clAqua
            DataField = 'VENCIMIENTO'
            DataSource = DMFacturasAAcr.DSQMCabecera
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
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 842
            Top = 66
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
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
          object DBEFDireccion: TLFDBEditFind2000
            Left = 73
            Top = 66
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 6
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
            Left = 138
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturasAAcr.DSxDirecciones
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
          object DBCBReciboPagado: TLFDBCheckBox
            Left = 643
            Top = 46
            Width = 17
            Height = 19
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 20
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECIBO_PAGADO'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEObservaciones: TLFDbedit
            Left = 79
            Top = 170
            Width = 684
            Height = 21
            AutoSize = False
            DataField = 'OBSERVACIONES'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 35
          end
        end
      end
      object TSOtros: TTabSheet [1]
        Caption = '&Otros'
        ImageIndex = -1
        object SBAProyecto: TSpeedButton
          Left = 152
          Top = 48
          Width = 233
          Height = 25
          Hint = 'Doble click o Ctrl+Alt+D para ver los datos del Acreedor'
          GroupIndex = -1
          OnDblClick = SBAProyectoDblClick
        end
        object PNLCabOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 968
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
              Left = 346
              Top = 3
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Factura'
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
              DataSource = DMFacturasAAcr.DSQMCabecera
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              DataSource = DMFacturasAAcr.DSxAcreedor
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              DataSource = DMFacturasAAcr.DSQMCabecera
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBEOtrosSuReferenciaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NUM_FACTURA'
              DataSource = DMFacturasAAcr.DSQMCabecera
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
          object NAVOtros: THYMNavigator
            Left = 655
            Top = 0
            Width = 66
            Height = 21
            DataSource = DMFacturasAAcr.DSQMCabecera
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
          Width = 968
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LPorcentajeFinanciacion: TLFLabel
            Left = 804
            Top = 2
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Financ.'
          end
          object LBLProyecto: TLFLabel
            Left = 31
            Top = 3
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = EFProyecto
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
            Top = 68
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Cambio'
            FocusControl = DBEValorCambio
          end
          object LTipoIRPF: TLFLabel
            Left = 13
            Top = 90
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo I.R.P.F.'
          end
          object LBLIRPFFicha: TLFLabel
            Left = 26
            Top = 113
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = '% I.R.P.F.'
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
          object DBEFinanciacion: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'POR_FINANCIACION'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 7
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
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 0
            OnChange = EFProyectoChange
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
            Entorno = DMFacturasAAcr.EntornoDoc
          end
          object ETitProyecto: TLFEdit
            Left = 144
            Top = 0
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
            TabOrder = 9
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
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
            TabOrder = 10
          end
          object DBCHKCambio: TLFDBCheckBox
            Left = 79
            Top = 68
            Width = 73
            Height = 17
            Caption = 'Cambio Fijo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKCambioChange
            DataField = 'CAMBIO_FIJO'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorCambio: TLFDbedit
            Left = 239
            Top = 66
            Width = 65
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 3
          end
          object DBEFTipoIRPF: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 4
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
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitTIPOIRPF: TLFDbedit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturasAAcr.DSxTipoIRPF
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
          object DBCBRECC: TLFDBCheckBox
            Left = 813
            Top = 24
            Width = 148
            Height = 17
            Caption = 'Criterio de Caja'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECC'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object CBForzarModoIva: TLFDBCheckBox
            Left = 387
            Top = 46
            Width = 88
            Height = 17
            Caption = 'Forzar M. IVA'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBForzarModoIvaChange
            DataField = 'FUERZA_MODO_IVA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EFModoIva: TLFDBEditFind2000
            Left = 478
            Top = 44
            Width = 45
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 6
            Visible = False
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
            Left = 524
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 12
            Visible = False
          end
          object DBEPirpf: TLFDbedit
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'P_IRPF'
            DataSource = DMFacturasAAcr.DSQMCabecera
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
          object DBEAplicarIRPF: TLFDbedit
            Left = 144
            Top = 110
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'APLICA_IRPF'
            DataSource = DMFacturasAAcr.DSQMCabecera
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
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 813
            Top = 46
            Width = 120
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMFacturasAAcr.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
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
            DataSource = DMFacturasAAcr.DSQMCabecera
            Enabled = False
            TabOrder = 16
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
            Top = 146
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 17
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
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 18
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
            Entorno = DMFacturasAAcr.EntornoDoc
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
            TabOrder = 19
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 968
          Height = 191
          DataSource = DMFacturasAAcr.DSQMCabecera
          OnCellClick = DBGMainCellClick
          OnKeyDown = DBGMainKeyDown
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'ARRENDAMIENTO'
            'CAMBIO_FIJO'
            'CENTRO_COSTE'
            'DEVOLUCION'
            'FUERZA_MODO_IVA'
            'FUERZA_VENCIMIENTOS'
            'INVERSION_SUJETO_PASIVO'
            'LEASING'
            'MODIFICA_DOC'
            'OBLIGA_AUTOFACTURA'
            'RECC'
            'RECIBO_PAGADO'
            'RECT'
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
            '0')
          CamposAOrdenar.Strings = (
            'ACREEDOR'
            'FECHA'
            'LIQUIDO'
            'MONEDA'
            'NUM_FACTURA'
            'PROYECTO'
            'RIG'
            'SU_REFERENCIA'
            'TITULO'
            'TOTAL_FACTURA')
          CamposCalcAOrdenar.Strings = (
            'TOTAL_CANAL')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_FACTURA'
              Width = 90
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
              FieldName = 'ACREEDOR'
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
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROYECTO'
              Width = 45
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
              FieldName = 'MODIFICA_DOC'
              Width = 40
              Visible = True
            end>
        end
      end
      object TSNotas: TTabSheet
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PNLEdNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 968
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 968
            Height = 169
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMFacturasAAcr.DSQMCabecera
            TabOrder = 0
          end
        end
        object PNLCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 968
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
              Left = 543
              Top = 3
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
              Layout = tlCenter
            end
            object LBLNumFacturaNotas: TLFLabel
              Left = 346
              Top = 3
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Factura'
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
              DataSource = DMFacturasAAcr.DSQMCabecera
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              DataSource = DMFacturasAAcr.DSxAcreedor
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
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
              DataSource = DMFacturasAAcr.DSQMCabecera
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBENotasNumFacturaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NUM_FACTURA'
              DataSource = DMFacturasAAcr.DSQMCabecera
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
            DataSource = DMFacturasAAcr.DSQMCabecera
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
            EditaControl = DBMMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 251
    Width = 982
    Height = 296
    inherited TBDetalle: TLFToolBar
      Width = 982
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 2
      inherited NavDetalle: THYMNavigator
        DataSource = DMFacturasAAcr.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object TButtSep7: TToolButton
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
      object ToolButton1: TToolButton
        Left = 251
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRecibosKri: TToolButton
        Left = 259
        Top = 0
        Action = ARecibos
      end
      object TButtBuscarArticulo: TToolButton
        Left = 282
        Top = 0
        Action = ABuscarArticulo
        Style = tbsCheck
      end
      object ToolButton2: TToolButton
        Left = 305
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCentroCoste: TToolButton
        Left = 313
        Top = 0
        Action = ACentroCoste
      end
      object ToolButton3: TToolButton
        Left = 336
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtDetallesDUA: TToolButton
        Left = 344
        Top = 0
        Action = ADetallesDUA
      end
      object TButtDuplicarLinea: TToolButton
        Left = 367
        Top = 0
        Action = ADuplicarLinea
      end
      object TBSep3: TToolButton
        Left = 390
        Top = 0
        Width = 8
        ImageIndex = 38
        Style = tbsSeparator
      end
      object TBDividirLineaIVA: TToolButton
        Left = 398
        Top = 0
        Action = ADividirLineaIVA
      end
      object TBDividirProyectoLinea: TToolButton
        Left = 421
        Top = 0
        Action = ADividirLineaProyecto
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 982
      Height = 219
      DataSource = DMFacturasAAcr.DSQMDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnColEnter = DBGFDetalleColEnter
      OnDblClick = DBGFDetalleDblClick
      OnKeyDown = DBGFDetalleKeyDown
      OnKeyUp = DBGFDetalleKeyUp
      IniStorage = FSMain
      ColumnaInicial = 1
      AutoCambiarColumna = True
      BuscarNums = True
      Campos.Strings = (
        'ARTICULO'
        'CUENTA_GASTOS'
        'PROYECTO'
        'ALMACEN')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'CUENTA_GASTOS'
        '0'
        'PROYECTO'
        '0'
        'ALMACEN'
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
        'ALMACEN')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1')
      CampoAOrdenarColor = clBlack
      ColumnasCheckBoxes.Strings = (
        'SUPLIDO'
        'INVERSION_SUJETO_PASIVO')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      Numericos.Strings = (
        'ARTICULO'
        'CUENTA'
        'PROYECTO'
        'ALMACEN')
      SalirSiVacio = True
      Tablas.Strings = (
        'VER_ARTICULOS_EF_ACREEDOR'
        'CON_CUENTAS'
        'EMP_PROYECTOS'
        'ART_ALMACENES')
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
      BeforeColExit = DBGFDetalleBeforeColExit
      OnBusqueda = DBGFDetalleBusqueda
      OnRowChange = DBGFDetalleRowChange
      Planes.Strings = (
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        'ARTICULO'
        'CUENTA'
        'PROYECTO'
        'ALMACEN')
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
          Width = 35
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
          Width = 324
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
          Expanded = False
          FieldName = 'P_COSTE'
          Title.Alignment = taRightJustify
          Width = 96
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUPLIDO'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTA_GASTOS'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_CUENTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 303
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Title.Alignment = taRightJustify
          Width = 48
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
          Width = 85
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
          Width = 105
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_IMPONIBLE'
          ReadOnly = True
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
          Width = 49
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'C_IVA'
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
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'C_RECARGO'
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
          Width = 112
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INVERSION_SUJETO_PASIVO'
          Width = 30
          Visible = True
        end>
    end
    object PCPie: TLFPageControl
      Left = 0
      Top = 241
      Width = 982
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
          Width = 974
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 2
          Enabled = False
          TabOrder = 0
          object LBLBImponible: TLFLabel
            Left = 2
            Top = 5
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'B. Imponible'
            Layout = tlCenter
          end
          object LBLIVARec: TLFLabel
            Left = 153
            Top = 5
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'IVA y Rec.'
            Layout = tlCenter
          end
          object LBLLiquido: TLFLabel
            Left = 513
            Top = 5
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'quido'
            Layout = tlCenter
          end
          object LBLIRPF: TLFLabel
            Left = 386
            Top = 5
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.R.P.F.'
            Layout = tlCenter
          end
          object LBLTotal: TLFLabel
            Left = 645
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
          object DBES_Bases: TLFDbedit
            Left = 64
            Top = 2
            Width = 88
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'S_BASES'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBECuotaIVA: TLFDbedit
            Left = 208
            Top = 2
            Width = 88
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'S_CUOTA_IVA'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBECuotaRec: TLFDbedit
            Left = 297
            Top = 2
            Width = 88
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'S_CUOTA_RE'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
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
            Left = 553
            Top = 2
            Width = 88
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'LIQUIDO'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEIrpf: TLFDbedit
            Left = 425
            Top = 2
            Width = 85
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'I_IRPF'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBETotal: TLFDbedit
            Left = 689
            Top = 2
            Width = 90
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'TOTAL_FACTURA'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
        end
      end
      object TSPieCarDtos: TTabSheet
        Caption = '&Cargos y Descuentos'
        ImageIndex = 2
        object PNLPieComisiones: TLFPanel
          Left = 0
          Top = 0
          Width = 782
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLBaseDtoLinea: TLFLabel
            Left = 303
            Top = 5
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Layout = tlCenter
          end
          object LBLImporte: TLFLabel
            Left = 483
            Top = 5
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LBLImpBase: TLFLabel
            Left = 618
            Top = 5
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Bases'
            Layout = tlCenter
          end
          object LImporteFinanciacion: TLFLabel
            Left = 105
            Top = 5
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Financiaci'#243'n'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object DBEBaseDtoEnLinea: TLFDbedit
            Left = 385
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_DTO_LINEAS'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
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
            Left = 522
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
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
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'S_BASES'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
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
            Left = 207
            Top = 2
            Width = 90
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMFacturasAAcr.DSxInfoActualizada
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
    Width = 982
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    DataSource = DMFacturasAAcr.DSQMCabecera
    Complementario = TBDetalle
    Left = 124
    Top = 322
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 124
    Top = 354
    object N1: TMenuItem
      Caption = '-'
    end
    object CEMainMIDatosProveedor: TMenuItem
      Action = ANIFFactura
    end
    object CEMainVerAsientoGenerado: TMenuItem
      Action = AAsientoFactura
    end
    object CEMainVerRegistrodeIVA: TMenuItem
      Action = ARegistroIVA
    end
    object MIVerDatosAcreedor: TMenuItem
      Action = AAAcreedor
    end
  end
  inherited ALMain: TLFActionList
    Left = 88
    Top = 322
    object AInfFacAcreedores: TAction
      Category = 'Listados'
      Caption = 'Informe Factura'
      Hint = 'Informe Factura'
      ImageIndex = 14
      OnExecute = AInfFacAcreedoresExecute
    end
    object ATipoIVA: TAction
      Category = 'Otros'
      Caption = 'Cambio Manual del IVA y Recargo'
      Hint = 'Cambio Manual del IVA y Recargo'
      ImageIndex = 110
      OnExecute = ATipoIVAExecute
    end
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Factura'
      Hint = 'Cerrar Factura (Ctrl+Alt+F)'
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
    object AAdjuntosFactura: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de la Factura'
      Hint = 'Adjuntos de la Factura'
      ImageIndex = 59
      OnExecute = AAdjuntosFacturaExecute
    end
    object AVisualizaFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Visualizar Facturas Filtradas'
      Hint = 'Visualizar Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AVisualizaFacturasFiltradasExecute
    end
    object AEnviarFacturaAcrMailPDF: TAction
      Category = 'Listados'
      Caption = 'Enviar Factura Acreedor por e-mail en Pdf (directo)'
      Hint = 'Enviar Factura Acreedor por e-mail en Pdf'
      ImageIndex = 34
      ShortCut = 49229
      OnExecute = AEnviarFacturaAcrMailPDFExecute
    end
    object AEnviarFacturaAcrMailPDF2: TAction
      Category = 'Listados'
      Caption = 'Enviar Factura Acreedor por e-mail en Pdf (mensaje)'
      Hint = 'Enviar Factura Acreedor por e-mail en Pdf por cliente de correo'
      ImageIndex = 34
      OnExecute = AEnviarFacturaAcrMailPDF2Execute
    end
    object AImprimeFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Facturas Filtradas'
      Hint = 'Imprimir Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AImprimeFacturasFiltradasExecute
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
    object AImpresionResumenFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Impresi'#243'n Resumen Facturas Filtradas'
      Hint = 'Impresi'#243'n Resumen Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AImpresionResumenFacturasFiltradasExecute
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
    object AConfInformeFacturas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Facturas'
      Hint = 'Listado de Facturas'
      ImageIndex = 77
      OnExecute = AConfInformeFacturasExecute
    end
    object AConfListadosFacturasAcreedor: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Resumen de Facturas'
      Hint = 'Listado de Resumen de Facturas'
      ImageIndex = 77
      OnExecute = AConfListadosFacturasAcreedorExecute
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
    object ADuplicar: TAction
      Category = 'Procesos'
      Caption = 'Duplicar Factura'
      Hint = 'Duplicar Factura'
      ImageIndex = 37
      OnExecute = ADuplicarExecute
    end
    object ADevolucion: TAction
      Category = 'Procesos'
      Caption = 'Genera devoluci'#243'n'
      Hint = 'Genera devoluci'#243'n'
      ImageIndex = 39
      OnExecute = ADevolucionExecute
    end
    object ACambiaFinanciacion: TAction
      Category = 'Procesos'
      Caption = 'Cambio de Financiaci'#243'n Manual'
      Hint = 'Cambio de Financiaci'#243'n Manual'
      ImageIndex = 3
      OnExecute = ACambiaFinanciacionExecute
    end
    object ALeasing: TAction
      Category = 'Procesos'
      Caption = 'Datos Leasing'
      Hint = 'Datos Leasing'
      ImageIndex = 89
      OnExecute = ALeasingExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ARecibos: TAction
      Category = 'Otros'
      Caption = 'Muestra los Recibos de la Factura'
      Hint = 'Muestra los Recibos de la Factura'
      ImageIndex = 75
      OnExecute = ARecibosExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AOrdenaLineas: TAction
      Category = 'Otros'
      Caption = 'Reordenar L'#237'neas'
      Hint = 'Reordena las l'#237'neas del documento'
      ImageIndex = 122
      OnExecute = AOrdenaLineasExecute
    end
    object AAnalitica: TAction
      Category = 'Otros'
      Caption = 'Apunte Anal'#237'tico'
      Hint = 'Apunte Anal'#237'tico'
      ImageIndex = 21
      OnExecute = AAnaliticaExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosAcreedor: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Acreedor'
      Hint = 'Adjuntos del Acreedor'
      ImageIndex = 59
      OnExecute = AAdjuntosAcreedorExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      Hint = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
    end
    object ADetallesDUA: TAction
      Category = 'Otros'
      Caption = 'Informacion DUA'
      Hint = 'Informacion DUA'
      ImageIndex = 112
      OnExecute = ADetallesDUAExecute
    end
    object ADuplicarLinea: TAction
      Category = 'Otros'
      Caption = 'Duplicar Linea'
      Hint = 'Duplicar Linea'
      ImageIndex = 37
      OnExecute = ADuplicarLineaExecute
    end
    object AFacturaMultiCanal: TAction
      Category = 'Procesos'
      Caption = 'Factura multi canal'
      ImageIndex = 86
      OnExecute = AFacturaMultiCanalExecute
    end
    object CategoryFiltros: TLFCategoryAction
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
    object AFiltroCerrado: TAction
      Category = 'Filtros'
      Caption = 'Cerrado'
      Hint = 'Muestra documentos cerrados'
      ImageIndex = 5
      OnExecute = AFiltroCerradoExecute
    end
    object AFiltroLeasing: TAction
      Category = 'Filtros'
      Caption = 'Leasing'
      Hint = 'Muestra documentos de Leasing'
      ImageIndex = 5
      OnExecute = AFiltroLeasingExecute
    end
    object AFiltroArrendamiento: TAction
      Category = 'Filtros'
      Caption = 'Arrendamiento'
      Hint = 'Muestra documentos Arrendamiento'
      ImageIndex = 5
      OnExecute = AFiltroArrendamientoExecute
    end
    object ABorradoMasivoLineas: TAction
      Category = 'Otros'
      Caption = 'Seleccion y borrado masivo de lineas'
      Hint = 'Seleccion y borrado masivo de lineas'
      ImageIndex = 32
      OnExecute = ABorradoMasivoLineasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFSerie.Text')
    Left = 14
    Top = 354
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    SubComplementario = ALMain
    Left = 164
    Top = 322
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 164
    Top = 354
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
    Left = 204
    Top = 322
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 204
    Top = 354
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
  object ALFacturasAcr: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 52
    Top = 322
    object ANotasDetalle: TAction
      Caption = 'ANotasDetalle'
      Hint = 'Edita las notas de la linea seleccionada'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
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
    object AImprimeAutomatico: TAction
      Caption = 'Imprime Automatico'
      Hint = 'Imprime sin previsualizar'
      ShortCut = 49225
      OnExecute = AImprimeAutomaticoExecute
    end
    object ANIFFactura: TAction
      Caption = 'Datos del Acreedor'
      Hint = 'Datos del Acreedor'
      ShortCut = 16452
      OnExecute = ANIFFacturaExecute
    end
    object ACentroCoste: TAction
      Caption = 'Introduce Centrode Coste'
      Hint = 'Introduce Centrode Coste'
      ImageIndex = 56
      ShortCut = 49231
      OnExecute = ACentroCosteExecute
    end
    object ANewAcreedor: TAction
      Caption = 'Acreedor nuevo'
      Hint = 'Crear Acreedor'
      OnExecute = ANewAcreedorExecute
    end
    object ANewArticulo: TAction
      Caption = 'Art'#237'culo nuevo'
      Hint = 'Crear Articulo'
      OnExecute = ANewArticuloExecute
    end
    object AAAcreedor: TAction
      Caption = 'Ver Datos Acreedor'
      Hint = 'Doble click o Ctrl+Alt+D para ver los datos del Acreedor'
      ShortCut = 49220
      OnExecute = AAAcreedorExecute
    end
    object AImprime: TAction
      Caption = 'AImprime'
      Hint = 'Imprime Informe'
      ImageIndex = 14
      ShortCut = 49225
      OnExecute = AImprimeExecute
    end
    object AArticulo: TAction
      Caption = 'Ver Datos del Ar'#237'culo'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Art'#237'culo'
      ShortCut = 49217
      OnExecute = AArticuloExecute
    end
    object ABuscarArticulo: TAction
      Caption = 'ABuscarArticulo'
      Hint = 'Buscar Documentos por articulo'
      ImageIndex = 109
      OnExecute = ABuscarArticuloExecute
    end
    object ABuscaNIFKRI: TAction
      Caption = 'Busca en acreedores varios'
      Hint = 'Busca facturas de acreedores varios'
      ImageIndex = 54
      OnExecute = ABuscaNIFKRIExecute
    end
    object ARegistroCartera: TAction
      Caption = 'ARegistroCartera'
      OnExecute = ARegistroCarteraExecute
    end
    object AProyecto: TAction
      Caption = 'Proyecto'
      OnExecute = AProyectoExecute
    end
    object ADividirLineaIVA: TAction
      Caption = 'Dividir Linea IVA'
      Hint = 'Dividir Linea IVA'
      ImageIndex = 136
      OnExecute = ADividirLineaIVAExecute
    end
    object ADividirLineaProyecto: TAction
      Caption = 'Dividir Linea Proyecto'
      Hint = 'Dividir Linea Proyecto'
      ImageIndex = 137
      OnExecute = ADividirLineaProyectoExecute
    end
  end
  object RelojNotas: TTimer
    Enabled = False
    OnTimer = RelojNotasTimer
    Left = 14
    Top = 322
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
    Left = 240
    Top = 324
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 240
    Top = 356
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
    Left = 280
    Top = 328
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 280
    Top = 360
  end
end
