inherited FMFacturasAProveedor: TFMFacturasAProveedor
  Left = 344
  Top = 220
  Width = 1058
  Height = 600
  HelpContext = 170
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Facturas de Proveedores'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = CEOtrosChilePMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1048
    Height = 257
    BorderWidth = 3
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 1042
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        1038
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMFacturasAProveedor.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        DelMessage = #191'Desea borrar la factura?'
        EditaControl = DBEFProveedor
        InsertaControl = DBENumFactura
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMFacturasAProveedor.DSQMCabecera
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
        Action = AInformeFacProv
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
        CondicionBusqueda = 'tipo='#39'FAP'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_E_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NOMBRE')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMFacturasAProveedor.EntornoDoc
      end
      object PNLTitSerie: TLFPanel
        Left = 381
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
        Left = 656
        Top = 0
        Action = AAbrirCerrar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtBuscarNumSerie: TToolButton
        Left = 679
        Top = 0
        Action = ABuscarNumSerie
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
      end
      object TBEnviaECF: TToolButton
        Left = 702
        Top = 0
        Action = AEnviaECF
      end
      object LTelefono: TLFLabel
        Left = 725
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
        Left = 845
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
        Left = 905
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
        Left = 965
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
      Width = 1042
      Height = 225
      MultiLine = True
      TabOrder = 0
      inherited TSFicha: TTabSheet
        object SBVerRegistro: TSpeedButton [0]
          Left = 464
          Top = 48
          Width = 65
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
          GroupIndex = -1
          OnDblClick = SBVerRegistroDblClick
        end
        object SBVerAsiento: TSpeedButton [1]
          Left = 704
          Top = 48
          Width = 65
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          Down = True
          Caption = 'Ver asiento generado'
          OnDblClick = SBVerAsientoDblClick
        end
        object SBAProveedor: TSpeedButton [2]
          Left = 144
          Top = 48
          Width = 241
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+V para ver los datos del Proveedor'
          GroupIndex = -1
          OnDblClick = SBAProveedorDblClick
        end
        object SBVerCartera: TSpeedButton [3]
          Left = 584
          Top = 40
          Width = 65
          Height = 25
          Hint = 'Doble click para ver el registro de Cartera generado'
          GroupIndex = -1
          OnDblClick = SBVerCarteraDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1034
          Height = 197
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'NUM_FACTURA'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_FACTURA_PROV'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMFacturasAProveedor.EntornoDoc
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LBLFactura: TLFLabel
            Left = 37
            Top = 2
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factura'
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
          object LBLFecha: TLFLabel
            Left = 405
            Top = 2
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Fac.'
          end
          object LBLProveedor: TLFLabel
            Left = 24
            Top = 46
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LBLDtoPP: TLFLabel
            Left = 869
            Top = 24
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
          end
          object LBLDtoCial: TLFLabel
            Left = 863
            Top = 2
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
          end
          object LBLAlmacen: TLFLabel
            Left = 32
            Top = 113
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLNFactura: TLFLabel
            Left = 22
            Top = 24
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Factura'
            FocusControl = DBENumFactura
          end
          object LBLFormaPago: TLFLabel
            Left = 16
            Top = 90
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LBLFecha_Con: TLFLabel
            Left = 401
            Top = 24
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cont.'
          end
          object LNumAsiento: TLFLabel
            Left = 665
            Top = 46
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LblRegistro: TLFLabel
            Left = 400
            Top = 46
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registro IVA'
          end
          object LFechaEntrega: TLFLabel
            Left = 629
            Top = 2
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'F. Entrega'
          end
          object LBTipo: TLFLabel
            Left = 427
            Top = 90
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object LBPorPortes: TLFLabel
            Left = 416
            Top = 113
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = '% Portes'
          end
          object LBIPOrtes: TLFLabel
            Left = 528
            Top = 113
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'I. Portes'
          end
          object LBReferencia: TLFLabel
            Left = 407
            Top = 68
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
          end
          object LNCF: TLFLabel
            Left = 436
            Top = 156
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
          object LFechaSII: TLFLabel
            Left = 632
            Top = 24
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha SII'
          end
          object LblCartera: TLFLabel
            Left = 546
            Top = 46
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cartera'
          end
          object LMonedaFicha: TLFLabel
            Left = 869
            Top = 46
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object DBTValorCambioFijo: TDBText
            Left = 982
            Top = 46
            Width = 97
            Height = 13
            AutoSize = True
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
          end
          object LAutorizacion: TLFLabel
            Left = 16
            Top = 135
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizaci'#243'n'
          end
          object LCodigoControl: TLFLabel
            Left = 16
            Top = 156
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Control'
          end
          object LCodigoRespuestaRapida: TLFLabel
            Left = 406
            Top = 157
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo QR'
          end
          object LImporteMinimoPorte: TLFLabel
            Left = 638
            Top = 113
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp.Min.Porte'
          end
          object LTipo: TLFLabel
            Left = 781
            Top = 156
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
          object DBTRectificacion: TDBText
            Left = 919
            Top = 113
            Width = 101
            Height = 13
            AutoSize = True
            DataField = 'DESC_RECTIFICACION'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LFolio: TLFLabel
            Left = 432
            Top = 157
            Width = 22
            Height = 13
            Caption = 'Folio'
          end
          object LDireccion: TLFLabel
            Left = 28
            Top = 68
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direcci'#243'n'
          end
          object LTipoDocumentoTributario: TLFLabel
            Left = 547
            Top = 157
            Width = 54
            Height = 13
            Caption = 'T.Doc.Trib.'
          end
          object LMotivoAbono: TLFLabel
            Left = 391
            Top = 135
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Abono'
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
            Left = 867
            Top = 135
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = DBEFProyectoFicha
          end
          object DBERIG: TLFDbedit
            Left = 79
            Top = 0
            Width = 64
            Height = 21
            DataField = 'RIG'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 0
            OnChange = DBERIGChange
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 464
            Top = 0
            Width = 87
            Height = 21
            Hint = 'Fecha del documeto el proveedor'
            DataField = 'FECHA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 15
            OnExit = DBDTPFechaExit
          end
          object DBEDtoPP: TLFDbedit
            Left = 914
            Top = 22
            Width = 64
            Height = 21
            DataField = 'DTO_PP'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 44
          end
          object DBEDtoCial: TLFDbedit
            Left = 914
            Top = 0
            Width = 64
            Height = 21
            DataField = 'DTO_CIAL'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 43
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 10
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
              'almacen')
            Filtros = [obEmpresa]
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object ETituloAlmacen: TLFEdit
            Left = 144
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
            TabOrder = 11
          end
          object DBETituloProveedor: TLFDbedit
            Left = 144
            Top = 44
            Width = 240
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnDblClick = SBAProveedorDblClick
            OnEnter = DBETituloProveedorEnter
          end
          object DBEFProveedor: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 4
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
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object DBENumFactura: TLFDbedit
            Left = 79
            Top = 22
            Width = 305
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NUM_FACTURA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 3
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FORMA_DE_PAGO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object ETituloFormaPago: TLFEdit
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
            TabOrder = 9
          end
          object DBCBDevolucion: TLFDBCheckBox
            Left = 780
            Top = 113
            Width = 72
            Height = 16
            Caption = 'Devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 48
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEVOLUCION'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKAbono: TLFDBCheckBox
            Left = 780
            Top = 90
            Width = 56
            Height = 16
            Caption = 'Abono'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 47
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SIN_DETALLE'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFecha_Con: TLFDBDateEdit
            Left = 464
            Top = 22
            Width = 87
            Height = 21
            Hint = 'Fecha de contaibilizacion'
            DataField = 'FECHA_CON'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 19
            OnExit = DBDTPFecha_ConExit
          end
          object DBETituloEstado: TLFDbedit
            Left = 187
            Top = 0
            Width = 158
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMFacturasAProveedor.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object DBERic: TLFDbedit
            Left = 705
            Top = 44
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            DataField = 'RIC_FAC'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          object DBERegistro: TLFDbedit
            Left = 464
            Top = 44
            Width = 64
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'REGISTRO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          object DBCBForzarVencimientos: TLFDBCheckBox
            Left = 780
            Top = 68
            Width = 117
            Height = 17
            Caption = '&Forzar Vencimientos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 46
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FUERZA_VENCIMIENTOS'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPHora_Con: TDBDateTimePicker
            Left = 552
            Top = 22
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 45337.4870468981
            Time = 45337.4870468981
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 20
            DataField = 'FECHA_CON'
            DataSource = DMFacturasAProveedor.DSQMCabecera
          end
          object DBDTPEntrega: TLFDBDateEdit
            Left = 682
            Top = 0
            Width = 87
            Height = 21
            Hint = 'Fecha para movimiento de stock si no viene de un albaran'
            DataField = 'FECHA_ENTREGA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 17
            OnExit = DBDTPEntregaExit
          end
          object ETituloPortes: TLFEdit
            Left = 528
            Top = 88
            Width = 241
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
            TabOrder = 28
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 463
            Top = 88
            Width = 64
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 27
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
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object DBEIPortes: TLFDbedit
            Left = 570
            Top = 110
            Width = 64
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
          end
          object DBEPorPortes: TLFDbedit
            Left = 463
            Top = 110
            Width = 64
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 29
          end
          object DBCHKObligaAuto: TLFDBCheckBox
            Left = 916
            Top = 68
            Width = 108
            Height = 16
            Caption = 'Obliga Autofactura'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 49
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'OBLIGA_AUTOFACTURA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBRec_Invisibles: TLFDBCheckBox
            Left = 916
            Top = 90
            Width = 77
            Height = 16
            Caption = 'Sin Recibos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 50
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SIN_RECIBOS'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEReferencia: TLFDbedit
            Left = 464
            Top = 66
            Width = 305
            Height = 21
            DataField = 'SU_REFERENCIA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 26
          end
          object DBDTPHora_Fac: TDBDateTimePicker
            Left = 552
            Top = 0
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 45337.487037037
            Time = 45337.487037037
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 16
            DataField = 'FECHA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
          end
          object DBCBVTipoNCF: TDBLookupComboBox
            Left = 611
            Top = 154
            Width = 158
            Height = 21
            DataField = 'Z_TIPO_NCF'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            DropDownRows = 15
            DropDownWidth = 250
            KeyField = 'TIPO_NCF'
            ListField = 'TITULO'
            ListSource = DMFacturasAProveedor.DSxTipoNCF
            TabOrder = 39
            OnClick = DBCBVTipoNCFClick
            OnEnter = DBCBVTipoNCFEnter
          end
          object DBEFPrefijoNCF: TLFDbedit
            Left = 463
            Top = 154
            Width = 78
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Z_PREFIJO_NCF'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clDefault
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 37
            OnChange = DBEFPrefijoNCFChange
          end
          object DBEContadorNCF: TLFDbedit
            Left = 542
            Top = 154
            Width = 68
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'Z_CONTADOR_NCF'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clDefault
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 38
            OnChange = DBEContadorNCFChange
          end
          object DBCHKListado: TLFDBCheckBox
            Left = 347
            Top = 2
            Width = 37
            Height = 17
            Hint = 'Documento impreso'
            Caption = 'List.'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 2
            TabStop = True
            OnClick = DBCHKListadoClick
            Alignment = taLeftJustify
            DataField = 'MODIFICA_DOC'
            DataSource = DMFacturasAProveedor.DSxInfoActualizada
            ReadOnly = True
            ValueChecked = '32'
            ValueUnchecked = '0'
          end
          object DBDTPFechaSII: TLFDBDateEdit
            Left = 682
            Top = 22
            Width = 87
            Height = 21
            DataField = 'FECHA_SII'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 21
          end
          object DBERegistroCartera: TLFDbedit
            Left = 584
            Top = 44
            Width = 64
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clAqua
            DataField = 'VENCIMIENTO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 914
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 45
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
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object DBEAutorizacion: TLFDbedit
            Left = 79
            Top = 132
            Width = 305
            Height = 21
            DataField = 'SFV_AUTORIZACION'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 12
          end
          object DBECodigoControl: TLFDbedit
            Left = 79
            Top = 154
            Width = 305
            Height = 21
            DataField = 'SFV_CODIGO_CONTROL'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 13
          end
          object DBECodigoRespuestaRapida: TLFDbedit
            Left = 463
            Top = 154
            Width = 305
            Height = 21
            DataField = 'SFV_CODIGO_CONTROL'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 42
          end
          object BCodigoRespuestaRapida: TButton
            Left = 769
            Top = 154
            Width = 20
            Height = 21
            Hint = 'Interpreta Codigo de Respuesta Rapida'
            Caption = '!'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 40
            OnClick = BCodigoRespuestaRapidaClick
          end
          object DBEImporteMinimoPorte: TLFDbedit
            Left = 705
            Top = 110
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'IMPORTE_MINIMO_PORTE'
            DataSource = DMFacturasAProveedor.DSxProveedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 31
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 807
            Top = 154
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'Z_TIPO_BIENES'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 41
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
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object DBEFolio: TLFDbedit
            Left = 463
            Top = 154
            Width = 64
            Height = 21
            DataField = 'FOLIO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 34
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 79
            Top = 66
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
            Left = 144
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturasAProveedor.DSxDirecciones
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
          object DBEFTipoDocumentoTributario: TLFDBEditFind2000
            Left = 602
            Top = 154
            Width = 41
            Height = 21
            DataField = 'TIPO_DOC_TRIBUTARIO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 35
            OnChange = DBEFTipoDocumentoTributarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETipoDocumentoTributario: TLFEdit
            Left = 644
            Top = 154
            Width = 125
            Height = 21
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 36
            Text = 'ETipoDocumentoTributario'
          end
          object DBCBReciboPagado: TLFDBCheckBox
            Left = 648
            Top = 46
            Width = 17
            Height = 19
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 24
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECIBO_PAGADO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ReadOnly = True
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPHora_Entrega: TDBDateTimePicker
            Left = 770
            Top = 0
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 45337.9196224421
            Time = 45337.9196224421
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 18
            DataField = 'FECHA_ENTREGA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
          end
          object DBEFMotivoAbono: TLFDBEditFind2000
            Left = 463
            Top = 132
            Width = 64
            Height = 21
            DataField = 'COD_MOTIVO_ABONO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 32
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
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object EMotivoAbono: TLFEdit
            Left = 528
            Top = 132
            Width = 241
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
            TabOrder = 33
          end
          object DBEObservaciones: TLFDbedit
            Left = 79
            Top = 176
            Width = 690
            Height = 21
            AutoSize = False
            DataField = 'OBSERVACIONES'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 14
          end
          object DBEFProyectoFicha: TLFDBEditFind2000
            Left = 914
            Top = 132
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 51
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
            Entorno = DMFacturasAProveedor.EntornoDoc
          end
          object EProyectoFicha: TLFEdit
            Left = 979
            Top = 132
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
            TabOrder = 52
          end
        end
      end
      object TSOtros: TTabSheet [1]
        Caption = '&Otros'
        ImageIndex = -1
        object SBAProyecto: TSpeedButton
          Left = 152
          Top = 56
          Width = 241
          Height = 17
          Hint = 'Doble click o Ctrl+Alt+V para ver los datos del Proveedor'
          GroupIndex = -1
          OnDblClick = SBAProyectoDblClick
        end
        object PNLCabOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 1034
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
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
              DataSource = DMFacturasAProveedor.DSxProveedor
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
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
              DataField = 'NUM_FACTURA'
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          Width = 1034
          Height = 175
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LPorFinanciacion: TLFLabel
            Left = 804
            Top = 2
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Financ.'
          end
          object LBLProyecto: TLFLabel
            Left = 32
            Top = 2
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
            Layout = tlCenter
          end
          object LTipoIRPF: TLFLabel
            Left = 14
            Top = 91
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo I.R.P.F.'
          end
          object LBLIRPFFicha: TLFLabel
            Left = 27
            Top = 113
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = '% I.R.P.F.'
          end
          object LIdioma: TLFLabel
            Left = 42
            Top = 24
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Idioma'
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
          object LTipoRetencion: TLFLabel
            Left = 400
            Top = 91
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Retencion'
          end
          object LPorcRetITBIS: TLFLabel
            Left = 435
            Top = 113
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = '% ITBIS'
          end
          object LPorRecISR: TLFLabel
            Left = 572
            Top = 113
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = '% ISR'
          end
          object DBEFinanciacion: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            AutoSize = False
            DataField = 'POR_FINANCIACION'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 21
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
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
            Entorno = DMFacturasAProveedor.EntornoDoc
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
            TabOrder = 1
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
            Entorno = DMFacturasAProveedor.EntornoDoc
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
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorCambio: TLFDbedit
            Left = 239
            Top = 66
            Width = 65
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 7
          end
          object DBEPirpf: TLFDbedit
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'P_IRPF'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          object DBEAplicarIRPF: TLFDbedit
            Left = 144
            Top = 110
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'APLICA_IRPF'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          object DBETitTIPOIRPF: TLFDbedit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturasAProveedor.DSxTipoIRPF
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
          object DBEFTipoIRPF: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 8
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
          object DBCBRECC: TLFDBCheckBox
            Left = 813
            Top = 24
            Width = 148
            Height = 17
            Caption = 'Criterio de Caja'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 22
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECC'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBForzarModoIvaChange
            DataField = 'FUERZA_MODO_IVA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EFModoIva: TLFDBEditFind2000
            Left = 478
            Top = 44
            Width = 45
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 15
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
            Enabled = False
            ReadOnly = True
            TabOrder = 16
            Visible = False
          end
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 813
            Top = 46
            Width = 120
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 23
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
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
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
            Entorno = DMFacturasAProveedor.EntornoDoc
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
            DataSource = DMFacturasAProveedor.DSQMCabecera
            Enabled = False
            TabOrder = 12
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
            TabOrder = 13
          end
          object DBEIdTipoRetencion: TLFDBEditFind2000
            Left = 478
            Top = 88
            Width = 45
            Height = 21
            DataField = 'DOM_ID_TIPO_RETENCION'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 17
            OnChange = DBEIdTipoRetencionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'DOM_TIPO_RETENCION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'ID'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object ETipoRetencionTitulo: TLFEdit
            Left = 524
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 18
          end
          object DBEPorcRetITBIS: TLFDbedit
            Left = 478
            Top = 110
            Width = 64
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DOM_RET_POR_ITBIS'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          object DBEPorRecISR: TLFDbedit
            Left = 606
            Top = 110
            Width = 64
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DOM_RET_POR_ISR'
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1034
          Height = 197
          DataSource = DMFacturasAProveedor.DSQMCabecera
          OnCellClick = DBGMainCellClick
          OnKeyDown = DBGMainKeyDown
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'CAMBIO_FIJO'
            'CENTRO_COSTE'
            'DEVOLUCION'
            'FUERZA_MODO_IVA'
            'FUERZA_VENCIMIENTOS'
            'INVERSION_SUJETO_PASIVO'
            'MODIFICA_DOC'
            'OBLIGA_AUTOFACTURA'
            'RECC'
            'RECIBO_PAGADO'
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
            '0')
          CamposAOrdenar.Strings = (
            'FECHA'
            'LIQUIDO'
            'MONEDA'
            'NUM_FACTURA'
            'PROVEEDOR'
            'PROYECTO'
            'RIG'
            'SU_REFERENCIA'
            'TITULO')
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
              Width = 29
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
      end
      object TSNotas: TTabSheet
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object PNLEdNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 1034
          Height = 175
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 1034
            Height = 175
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 0
          end
        end
        object PNLCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 1034
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
            object LBLNumFacturaNotas: TLFLabel
              Left = 344
              Top = 0
              Width = 52
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
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
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
              DataSource = DMFacturasAProveedor.DSxProveedor
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
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
            object DBENotasNumFacturaCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NUM_FACTURA'
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
      object TSDirEntrega: TTabSheet
        Caption = 'Dir. Entrega'
        ImageIndex = 4
        object PNLDirEntrega: TLFPanel
          Left = 0
          Top = 0
          Width = 1034
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
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
              DataSource = DMFacturasAProveedor.DSxProveedor
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
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
              DataSource = DMFacturasAProveedor.DSQMCabecera
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
            DataSource = DMFacturasAProveedor.DSQMCabecera
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
          Width = 1034
          Height = 175
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMDirEntrega: TLFDBMemo
            Left = 0
            Top = 0
            Width = 1034
            Height = 175
            Align = alClient
            DataField = 'DIR_ENTREGA_MANUAL'
            DataSource = DMFacturasAProveedor.DSQMCabecera
            TabOrder = 0
          end
        end
      end
      object TSOtrosChile: TTabSheet
        Caption = 'Otros Chile'
        ImageIndex = 5
        OnShow = TSOtrosChileShow
        object PEdOtrosChile: TLFPanel
          Left = 0
          Top = 0
          Width = 1034
          Height = 197
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GBReferenciasDte: TGroupBox
            Left = 0
            Top = 0
            Width = 529
            Height = 197
            Align = alLeft
            Caption = 'Referencia(s)'
            TabOrder = 0
            object LTpoDocRef: TLFLabel
              Left = 116
              Top = 58
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Doc Ref'
            end
            object LIdDocRef: TLFLabel
              Left = 120
              Top = 80
              Width = 60
              Height = 13
              Alignment = taRightJustify
              Caption = 'ID Doc. Ref.'
            end
            object LRUTOtr: TLFLabel
              Left = 134
              Top = 102
              Width = 46
              Height = 13
              Alignment = taRightJustify
              Caption = 'RUT Otro'
            end
            object LCodRef: TLFLabel
              Left = 92
              Top = 124
              Width = 88
              Height = 13
              Alignment = taRightJustify
              Caption = 'C'#243'digo Referencia'
            end
            object LRazonRef: TLFLabel
              Left = 94
              Top = 146
              Width = 86
              Height = 13
              Alignment = taRightJustify
              Caption = 'Raz'#243'n Referencia'
            end
            object LFolioRef: TLFLabel
              Left = 249
              Top = 80
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Folio Ref.'
            end
            object LFchRef: TLFLabel
              Left = 313
              Top = 102
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Ref.'
            end
            object PNLReferenciasDteCab: TPanel
              Left = 2
              Top = 15
              Width = 525
              Height = 26
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object NavReferenciasDte: THYMNavigator
                Left = 8
                Top = 0
                Width = 240
                Height = 25
                DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
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
            object DBGReferenciasDte: TDBGridFind2000
              Left = 2
              Top = 41
              Width = 73
              Height = 154
              Align = alLeft
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
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
                  Width = 33
                  Visible = True
                end>
            end
            object DBETpoDocRef: TLFDBEditFind2000
              Left = 185
              Top = 54
              Width = 60
              Height = 21
              DataField = 'TPODOCREF'
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
              TabOrder = 2
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CODIGO'
              CampoStr = 'TITULO'
              CampoADevolver = 'CODIGO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = []
            end
            object DBEIdDocRef: TLFDbedit
              Left = 185
              Top = 76
              Width = 60
              Height = 21
              Color = clInfoBk
              DataField = 'ID_E_REF'
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBERUTOtr: TLFDbedit
              Left = 185
              Top = 98
              Width = 121
              Height = 21
              DataField = 'RUTOTR'
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
              TabOrder = 5
            end
            object DBERazonRef: TLFDbedit
              Left = 185
              Top = 142
              Width = 306
              Height = 21
              DataField = 'RAZONREF'
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
              TabOrder = 8
            end
            object DBEFolioRef: TLFDbedit
              Left = 299
              Top = 76
              Width = 192
              Height = 21
              DataField = 'FOLIOREF'
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
              TabOrder = 4
            end
            object DBDFchRef: TLFDBDateEdit
              Left = 370
              Top = 98
              Width = 121
              Height = 21
              DataField = 'FCHREF'
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 6
            end
            object CBCodRef: TLFDBComboBoxValue
              Left = 185
              Top = 120
              Width = 145
              Height = 21
              DataField = 'CODREF'
              DataSource = DMFacturasAProveedor.DSQMSIIDteReferencia
              ItemHeight = 13
              Items.Strings = (
                'Anula Documento de Referencia'
                'Corrige Texto Documento de Referencia'
                'Corrige montos')
              Values.Strings = (
                '1'
                '2'
                '3')
              TabOrder = 7
            end
            object ETipoDocTribTitulo: TLFEdit
              Left = 246
              Top = 54
              Width = 245
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGray
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 9
              Text = 'ETipoDocTribTitulo'
            end
          end
        end
      end
      object TSEnvioECF: TTabSheet
        Hint = 'Envio ECF'
        Caption = 'Envio ECF'
        ImageIndex = 6
        OnShow = TSEnvioECFShow
        object GBDatosEnvioECF: TGroupBox
          Left = 0
          Top = 0
          Width = 1034
          Height = 82
          Align = alTop
          Caption = 'Datos Envio ECF'
          TabOrder = 0
          object LIDEnvio: TLabel
            Left = 48
            Top = 15
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID Envio'
          end
          object LStatus: TLabel
            Left = 60
            Top = 37
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Status'
          end
          object LMensajeErrorEnvio: TLabel
            Left = 3
            Top = 59
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mensaje Error Env'
          end
          object LSecurityCode: TLabel
            Left = 343
            Top = 37
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Security Code'
          end
          object LCodigoErrorEnvio: TLFLabel
            Left = 560
            Top = 59
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo Error'
          end
          object DBEIDEnvio: TLFDbedit
            Left = 93
            Top = 11
            Width = 452
            Height = 21
            Color = clInfoBk
            DataField = 'ID_ENVIO'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEStatus: TLFDbedit
            Left = 93
            Top = 33
            Width = 244
            Height = 21
            Color = clInfoBk
            DataField = 'STATUS'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEMensajeErrorEnvio: TLFDbedit
            Left = 93
            Top = 55
            Width = 452
            Height = 21
            Color = clInfoBk
            DataField = 'MENSAJE_ERROR_ENVIO_ECF'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBESecurityCode: TLFDbedit
            Left = 412
            Top = 33
            Width = 133
            Height = 21
            Color = clInfoBk
            DataField = 'SECURITY_CODE'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBECodErrorEnvio: TLFDbedit
            Left = 624
            Top = 55
            Width = 65
            Height = 21
            Color = clInfoBk
            DataField = 'CODIGO_ERROR_ENVIO'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
        end
        object GBDatosConsultaECF: TGroupBox
          Left = 0
          Top = 82
          Width = 1034
          Height = 115
          Align = alClient
          Caption = 'Datos Consulta ECF'
          TabOrder = 1
          object LENCF: TLabel
            Left = 62
            Top = 21
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'ENCF'
          end
          object LStatusConsulta: TLabel
            Left = 15
            Top = 43
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Status Consulta'
          end
          object LTrackID: TLabel
            Left = 51
            Top = 65
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'TrackID'
          end
          object LMensajeErrorConsulta: TLabel
            Left = 3
            Top = 87
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mensaje Error Con'
          end
          object LLegalStatus: TLabel
            Left = 371
            Top = 42
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Legal Status'
          end
          object BtnConsultaEstadoECF: TSpeedButton
            Left = 424
            Top = 59
            Width = 121
            Height = 22
            Caption = 'Consulta Estado ECF'
            OnClick = BtnConsultaEstadoECFClick
          end
          object DBEENCF: TLFDbedit
            Left = 93
            Top = 16
            Width = 452
            Height = 21
            Color = clInfoBk
            DataField = 'ENCF'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
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
            Width = 120
            Height = 21
            Color = clInfoBk
            DataField = 'STATUS_CONSULTA'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBETrackID: TLFDbedit
            Left = 93
            Top = 60
            Width = 324
            Height = 21
            Color = clInfoBk
            DataField = 'TRACK_ID'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEMensajeErrorConsulta: TLFDbedit
            Left = 93
            Top = 82
            Width = 452
            Height = 21
            Color = clInfoBk
            DataField = 'MENSAJE_ERROR_CONSULTA_ECF'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object CBSeqConsummed: TLFDBCheckBox
            Left = 216
            Top = 41
            Width = 121
            Height = 17
            Caption = 'Seq. Consummed'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SEQUENCE_CONSUMED'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBELegalStatus: TLFDbedit
            Left = 434
            Top = 38
            Width = 111
            Height = 21
            Color = clInfoBk
            DataField = 'LEGAL_STATUS_CONSULTA'
            DataSource = DMFacturasAProveedor.DSxFacturaCompraDGII
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
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
  inherited PDetalle: TLFPanel
    Top = 257
    Width = 1048
    Height = 290
    inherited TBDetalle: TLFToolBar
      Width = 1048
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 2
      inherited NavDetalle: THYMNavigator
        DataSource = DMFacturasAProveedor.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        DelMessage = #191'Desea borrar la l'#237'nea?'
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object TButtSep8: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtNotas: TToolButton
        Left = 228
        Top = 0
        Hint = 'Edita las notas de la l'#237'nea seleccionada (CTRL+N)'
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
      object TButtUnidadesExt: TToolButton
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
      object ToolButton1: TToolButton
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
      object ToolButton2: TToolButton
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
      object ToolButton3: TToolButton
        Left = 451
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBArtProv: TToolButton
        Left = 459
        Top = 0
        Hint = 'Proveedores que venden este art'#237'culo'
        Action = AArticuloProv
        ParentShowHint = False
        ShowHint = True
      end
      object TButtUbicaciones: TToolButton
        Left = 482
        Top = 0
        Action = AUbicaciones
      end
      object ToolButton4: TToolButton
        Left = 505
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRecibosKri: TToolButton
        Left = 513
        Top = 0
        Action = ARecibos
      end
      object TButtBuscarArticulo: TToolButton
        Left = 536
        Top = 0
        Action = ABuscarArticulo
        Style = tbsCheck
      end
      object TButtCondicionesCompra: TToolButton
        Left = 559
        Top = 0
        Action = ACondicionesCompra
      end
      object TButtDuplicarLinea: TToolButton
        Left = 582
        Top = 0
        Action = ADuplicarLinea
      end
      object TButtImportarDetalle: TToolButton
        Left = 605
        Top = 0
        Action = AImportarDetalle
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1048
      Height = 213
      DataSource = DMFacturasAProveedor.DSQMDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnColExit = DBGFDetalleColExit
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
        'ARTICULO'
        'TIPO_IVA'
        'PROYECTO'
        'CUENTA'
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
        'ARTICULO'
        '0'
        'TIPO_IVA'
        '1'
        'P_IVA'
        'PROYECTO'
        '0'
        'CUENTA'
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
        '0'
        '0')
      CamposADevolver.Strings = (
        'ARTICULO'
        'ARTICULO'
        ''
        'ARTICULO'
        ''
        ''
        ''
        'ALMACEN'
        ''
        '')
      CamposDesplegar.Strings = (
        '0'
        '0'
        '1'
        '0'
        '1'
        '1'
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
        'SUPLIDO'
        'APLICA_UNIDADES_SECUNDARIAS'
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
        'CODIGO_PROVEEDOR'
        'ARTICULO'
        'NSERIE'
        'TIPO'
        'PROYECTO'
        'CUENTA'
        'ALMACEN'
        'TIPO'
        'TIPO')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_CON_BARRAS'
        'ART_ARTICULOS_CODPROV'
        'VER_ARTICULOS_EF'
        'ART_ARTICULOS_SERIALIZACION'
        'SYS_TIPO_IVA'
        'EMP_PROYECTOS'
        'CON_CUENTAS'
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
        ''
        '')
      Titulos.Strings = (
        'TIPO'
        'PROVEEDOR'
        'TITULO'
        'NSERIE'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO')
      BeforeColExit = DBGFDetalleBeforeColExit
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
        '')
      OrdenadosPor.Strings = (
        'BARRAS'
        'CODIGO_PROVEEDOR'
        'ARTICULO'
        'NSERIE'
        'TIPO'
        'PROYECTO'
        'CUENTA'
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
          Width = 35
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
          Width = 65
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
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Title.Alignment = taRightJustify
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTE_ADICIONAL'
          Width = 81
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
          FieldName = 'SUPLIDO'
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Title.Alignment = taRightJustify
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_2'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_3'
          Width = 52
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
          Width = 46
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
          Width = 46
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
          FieldName = 'FECHA_REC_DET'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CUENTA'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_CUENTA'
          ReadOnly = True
          Width = 264
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
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
          FieldName = 'IMPORTE_ICE'
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
          FieldName = 'I_IMPUESTO_ADICIONAL'
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
      Top = 235
      Width = 1048
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
          Width = 1040
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          BorderWidth = 2
          Enabled = False
          TabOrder = 0
          object PNLPieInfo: TLFPanel
            Left = 233
            Top = 2
            Width = 165
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object LCantLineas: TLFLabel
              Left = 0
              Top = 4
              Width = 17
              Height = 13
              Alignment = taRightJustify
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
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
          object PNLPieInfoUnidades: TLFPanel
            Left = 2
            Top = 2
            Width = 231
            Height = 25
            Align = alLeft
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
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
              Left = 64
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
              Left = 120
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_LOGISTICAS'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
              Left = 176
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_SEC'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
          object PNLInfoImportes: TLFPanel
            Left = 398
            Top = 2
            Width = 640
            Height = 25
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LICE: TLFLabel
              Left = 496
              Top = 4
              Width = 17
              Height = 13
              Caption = 'ICE'
            end
            object LTotal: TLFLabel
              Left = 734
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
            object LLiquido: TLFLabel
              Left = 602
              Top = 4
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'quido'
              Layout = tlCenter
            end
            object LBLIVARec: TLFLabel
              Left = 159
              Top = 4
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA/Rec/Adic'
              Layout = tlCenter
            end
            object LBLBImponible: TLFLabel
              Left = 0
              Top = 4
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'B. Imponible'
              Layout = tlCenter
            end
            object DBETotal: TLFDbedit
              Left = 778
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TOTAL_FACTURA'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBES_Bases: TLFDbedit
              Left = 62
              Top = 0
              Width = 88
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_BASES'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
              Left = 642
              Top = 0
              Width = 88
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'LIQUIDO'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEICE: TLFDbedit
              Left = 514
              Top = 0
              Width = 80
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'IMPORTE_ICE_TOTAL'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBECuotaRec: TLFDbedit
              Left = 317
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_RE'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
              Left = 230
              Top = 0
              Width = 86
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_IVA'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 5
            end
            object DBECuotaImpuestoAdic: TLFDbedit
              Left = 404
              Top = 0
              Width = 86
              Height = 21
              Color = clInfoBk
              DataField = 'S_CUOTA_IMPUESTO_ADICIONAL'
              DataSource = DMFacturasAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 6
            end
          end
        end
      end
      object TSPieCarDtos: TTabSheet
        Caption = '&Cargos y Descuentos'
        ImageIndex = 2
        object PNLPieComisiones: TLFPanel
          Left = 0
          Top = 0
          Width = 1040
          Height = 29
          Align = alClient
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LBLBaseDtoLinea: TLFLabel
            Left = 326
            Top = 6
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Layout = tlCenter
          end
          object LBLImporte: TLFLabel
            Left = 485
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LBLImpBase: TLFLabel
            Left = 618
            Top = 6
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Bases'
            Layout = tlCenter
          end
          object LImpFinanciacion: TLFLabel
            Left = 5
            Top = 6
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Financiaci'#243'n'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object LBLIRPF: TLFLabel
            Left = 203
            Top = 6
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.R.P.F.'
            Layout = tlCenter
          end
          object DBEBaseDtoEnLinea: TLFDbedit
            Left = 408
            Top = 2
            Width = 73
            Height = 21
            Color = clInfoBk
            DataField = 'B_DTO_LINEAS'
            DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
            Left = 524
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
            DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
            Left = 107
            Top = 2
            Width = 90
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
          object DBEIrpf: TLFDbedit
            Left = 243
            Top = 2
            Width = 76
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'I_IRPF'
            DataSource = DMFacturasAProveedor.DSxInfoActualizada
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
  end
  inherited TBActions: TLFToolBar
    Top = 547
    Width = 1048
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    DataSource = DMFacturasAProveedor.DSQMCabecera
    Complementario = TBDetalle
    Left = 131
    Top = 316
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 131
    Top = 348
    object N1: TMenuItem
      Caption = '-'
    end
    object CEMainMIDatosProveedor: TMenuItem
      Action = ANIFFactura
    end
    object CEMainMIVerAsientoGenerado: TMenuItem
      Action = AAsientoFactura
    end
    object CEMainMIVerRegistrodeIVA: TMenuItem
      Action = ARegistroIVA
    end
    object MIVerDatosProveedor: TMenuItem
      Action = AAProveedor
    end
  end
  inherited ALMain: TLFActionList
    Left = 49
    Top = 316
    object AInformeFacProv: TAction
      Category = 'Listados'
      Caption = 'Informe Factura'
      Hint = 'Informe Factura'
      ImageIndex = 14
      OnExecute = AInformeFacProvExecute
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
      ImageIndex = 59
      OnExecute = AAdjuntosFacturaExecute
    end
    object AFacturasDiarias: TAction
      Category = 'Listados'
      Caption = 'Facturas Diarias'
      Hint = 'Facturas Diarias'
      ImageIndex = 14
      OnExecute = AFacturasDiariasExecute
    end
    object AVisualizaFacturasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Visualizar Facturas Filtradas'
      Hint = 'Visualizar Facturas Filtradas'
      ImageIndex = 14
      OnExecute = AVisualizaFacturasFiltradasExecute
    end
    object AEnvioFacturaMailPDF: TAction
      Category = 'Listados'
      Caption = 'Enviar Factura por e-mail en Pdf (directo)'
      Hint = 'Enviar Factura por e-mail en Pdf'
      ImageIndex = 34
      ShortCut = 49229
      OnExecute = AEnvioFacturaMailPDFExecute
    end
    object AEnviarFacturaMailPDF2: TAction
      Category = 'Listados'
      Caption = 'Enviar Factura por e-mail en Pdf (mensaje)'
      Hint = 'Enviar Factura por e-mail en Pdf por correo electr'#243'nico'
      ImageIndex = 34
      OnExecute = AEnviarFacturaMailPDF2Execute
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
    object AListadoporArticulos: TAction
      Category = 'Listados'
      Caption = 'Listado por Articulos'
      Hint = 'Listado por Articulos'
      ImageIndex = 14
      OnExecute = AListadoporArticulosExecute
    end
    object AListadoCodigosBarras: TAction
      Category = 'Listados'
      Caption = 'Listado de etiquetas de C'#243'digos de Barras'
      Hint = 'Listado de etiquetas de C'#243'digos de Barras'
      ImageIndex = 95
      OnExecute = AListadoCodigosBarrasExecute
    end
    object ASep3: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object ALstUbicaciones: TAction
      Category = 'Listados'
      Caption = 'Listado de Ubicaciones'
      Hint = 'Listado de Ubicaciones'
      ImageIndex = 14
      OnExecute = ALstUbicacionesExecute
    end
    object ASep5: TAction
      Category = 'Listados'
      Caption = '-'
      Hint = '-'
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfInfFactura: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Facturas'
      Hint = 'Listado de Facturas'
      ImageIndex = 77
      OnExecute = AConfInfFacturaExecute
    end
    object AConfFacturasProv: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Resumen de Facturas'
      Hint = 'Listado de Resumen de Facturas'
      ImageIndex = 77
      OnExecute = AConfFacturasProvExecute
    end
    object AConfFacturasProvporProv: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Resumen de Facturas por Proveedor'
      Hint = 'Listado de Resumen de Facturas'
      ImageIndex = 77
      OnExecute = AConfFacturasProvporProvExecute
    end
    object AConfListadoCodigosBarras: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de C'#243'digos de Barras'
      Hint = 'Listado de C'#243'digos de Barras'
      ImageIndex = 77
      OnExecute = AConfListadoCodigosBarrasExecute
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
    object AFacturaMulti: TAction
      Category = 'Procesos'
      Caption = 'Traspaso MultiCanal'
      Hint = 'Traspaso MultiCanal'
      ImageIndex = 86
      OnExecute = AFacturaMultiExecute
    end
    object ASep6: TAction
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
    object ARegeneraCond: TAction
      Category = 'Procesos'
      Caption = 'Regenera las Condiciones del Proveedor'
      Hint = 'Regenera las Condiciones del Proveedor'
      ImageIndex = 25
      OnExecute = ARegeneraCondExecute
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
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AHerencia: TAction
      Category = 'Otros'
      Caption = 'Herencia'
      Hint = 'Herencia'
      ImageIndex = 97
      OnExecute = AHerenciaExecute
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
      Caption = 'Recibos de la Factura'
      Hint = 'Recibos de la Factura'
      ImageIndex = 75
      OnExecute = ARecibosExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AConfigLstUbicaciones: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Ubicaciones'
      Hint = 'Listado de Ubicaciones'
      ImageIndex = 77
      OnExecute = AConfigLstUbicacionesExecute
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
      Caption = 'Apunte anal'#237'tico'
      Hint = 'Apunte anal'#237'tico'
      ImageIndex = 21
      OnExecute = AAnaliticaExecute
    end
    object LFCategoryAction5: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosProveedor: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Proveedor'
      ImageIndex = 59
      OnExecute = AAdjuntosProveedorExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Tercero'
      ImageIndex = 59
      OnExecute = AAdjuntosTerceroExecute
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
    object AAsignacionCodigoBarra: TAction
      Category = 'Otros'
      Caption = 'Asignacion de Codigos de Barra'
      Hint = 'Asignacion de Codigos de Barra'
      ImageIndex = 38
      OnExecute = AAsignacionCodigoBarraExecute
    end
    object AAnula: TAction
      Category = 'Procesos'
      Caption = 'Generar Anulaci'#243'n'
      Hint = 'Generar Anulaci'#243'n'
      ImageIndex = 27
      OnExecute = AAnulaExecute
    end
    object ACrearHerenciaManual: TAction
      Category = 'Otros'
      Caption = 'Crear Herencia Manual'
      ImageIndex = 97
      OnExecute = ACrearHerenciaManualExecute
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
    object AAsignaFolio: TAction
      Category = 'Procesos'
      Caption = 'Asigna folio'
      Hint = 'Asigna folio desde xml de factura'
      ImageIndex = 98
      OnExecute = AAsignaFolioExecute
    end
    object AImportaFacturaXml: TAction
      Category = 'Procesos'
      Caption = 'Importa Fac desde Xml'
      ImageIndex = 98
      OnExecute = AImportaFacturaXmlExecute
    end
    object ABorradoMasivoLineas: TAction
      Category = 'Otros'
      Caption = 'Seleccion y borrado masivo de lineas'
      Hint = 'Seleccion y borrado masivo de lineas'
      ImageIndex = 32
      OnExecute = ABorradoMasivoLineasExecute
    end
    object AEnviaECF: TAction
      Category = 'Procesos'
      Caption = 'Envia ECF al DGII'
      Hint = 'Envia ECF al DGII'
      ImageIndex = 46
      OnExecute = AEnviaECFExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 8
    Top = 348
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    SubComplementario = ALMain
    Left = 172
    Top = 316
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 172
    Top = 348
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
    Left = 214
    Top = 316
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 214
    Top = 348
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
  object ALFacturasProv: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 90
    Top = 316
    object ANotasDetalle: TAction
      Caption = 'Notas Detalle'
      Hint = 'Edita las notas de la l'#237'nea seleccionada'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotasDetalleExecute
    end
    object AUnidades_Ext: TAction
      Caption = 'Unidades Extendidas'
      Hint = 'Unidades Extendidas'
      ImageIndex = 69
      ShortCut = 49221
      OnExecute = AUnidades_ExtExecute
    end
    object APreciosTarifa: TAction
      Caption = 'APreciosTarifa'
      Hint = 'Precios Tarifa'
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
    object ASerializacion: TAction
      Caption = 'ASerializacion'
      Hint = 'Generar n'#250'meros de serializaci'#243'n'
      ImageIndex = 115
      OnExecute = ASerializacionExecute
    end
    object ABuscarNumSerie: TAction
      Caption = 'ABuscarNumSerie'
      Hint = 'Buscar Documentos por n'#250'meros de serie'
      ImageIndex = 85
      OnExecute = ABuscarNumSerieExecute
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
    object ANIFFactura: TAction
      Caption = 'Datos del Proveedor'
      Hint = 'Datos del Proveedor'
      ShortCut = 16452
      OnExecute = ANIFFacturaExecute
    end
    object AImpresionAuto: TAction
      Caption = 'AImpresionAuto'
      ShortCut = 49225
      OnExecute = AImpresionAutoExecute
    end
    object AInfoHistorico: TAction
      Caption = 'Hist'#243'rico de Precios'
      Hint = 'Hist'#243'rico de Precios'
      ImageIndex = 56
      ShortCut = 49224
      OnExecute = AInfoHistoricoExecute
    end
    object AProcedencia: TAction
      Caption = 'AProcedencia'
      Hint = 'Procedencia de la linea'
      ImageIndex = 96
      OnExecute = AProcedenciaExecute
    end
    object ANewProveedor: TAction
      Caption = 'Proveedor nuevo'
      OnExecute = ANewProveedorExecute
    end
    object ANewArticulo: TAction
      Caption = 'Art'#237'culo nuevo'
      Hint = 'Crear Articulo'
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
    object ACentroCoste: TAction
      Caption = 'Introduce Centrode Coste'
      Hint = 'Introduce Centrode Coste'
      ShortCut = 49231
      OnExecute = ACentroCosteExecute
    end
    object AInfoLotes: TAction
      Caption = 'Informaci'#243'n de Lotes'
      Hint = 'Informaci'#243'n de Lotes'
      ImageIndex = 120
      ShortCut = 16460
      OnExecute = AInfoLotesExecute
    end
    object AArticulo: TAction
      Caption = 'Ver Datos del Art'#237'culo'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Art'#237'culo'
      ShortCut = 49217
      OnExecute = AArticuloExecute
    end
    object AArticuloProv: TAction
      Caption = 'Ver Proveedores para el Art'#237'culo'
      ImageIndex = 89
      ShortCut = 16464
      OnExecute = AArticuloProvExecute
    end
    object AUbicaciones: TAction
      Caption = 'Ubicaciones del art'#237'culo'
      Hint = 'Ubicaciones del art'#237'culo'
      ImageIndex = 81
      OnExecute = AUbicacionesExecute
    end
    object ABuscarArticulo: TAction
      Caption = 'ABuscarArticulo'
      Hint = 'Buscar Documentos por articulo'
      ImageIndex = 109
      OnExecute = ABuscarArticuloExecute
    end
    object ACondicionesCompra: TAction
      Caption = 'Condiciones de Compra'
      Hint = 'Condiciones de Compra'
      ImageIndex = 143
      OnExecute = ACondicionesCompraExecute
    end
    object ABuscaNIFKRI: TAction
      Caption = 'Busca en proveedores varios'
      Hint = 'Busca facturas de proveedores varios'
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
    Top = 316
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
    Left = 256
    Top = 316
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 256
    Top = 348
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
  object RelojAdjuntos: TTimer
    OnTimer = RelojAdjuntosTimer
    Left = 296
    Top = 318
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 296
    Top = 352
  end
  object CEOtrosChilePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 376
    Top = 360
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
    Left = 376
    Top = 320
  end
end
