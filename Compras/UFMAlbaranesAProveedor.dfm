inherited FMAlbaranesAProveedor: TFMAlbaranesAProveedor
  Left = 256
  Top = 170
  Width = 1011
  Height = 600
  HelpContext = 167
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Albaranes de Proveedores'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  OldCreateOrder = False
  PopupMenu = CEDirEntregaPMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1001
    Height = 251
    BorderWidth = 3
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 995
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        991
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMAlbaranesAProveedor.DSQMCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        DelMessage = #191'Desea borrar el albar'#225'n?'
        EditaControl = DBEFProveedor
        InsertaControl = DBEFProveedor
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
        Action = AInformeAlbaran
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
        CondicionBusqueda = 'tipo='#39'ALP'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_E_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NOMBRE')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMAlbaranesAProveedor.EntornoDoc
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
      object TButtBuscarNumSerie: TToolButton
        Left = 656
        Top = 0
        Action = ABuscarNumSerie
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
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
      Width = 995
      Height = 219
      MultiLine = True
      TabOrder = 0
      inherited TSFicha: TTabSheet
        object SBAProveedor: TSpeedButton [0]
          Left = 124
          Top = 30
          Width = 160
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+V para ver los datos del Proveedor'
          GroupIndex = -1
          OnDblClick = SBAProveedorDblClick
        end
        object SBAIdOrden: TSpeedButton [1]
          Left = 742
          Top = 10
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAIdOrdenDblClick
        end
        inherited PEdit: TLFPanel
          Width = 987
          Height = 191
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              
                'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN_PROV CAB INDEX (PK_GES_CA' +
                'BECERAS_E),'
              
                '                 VER_CABECERAS_ALBARAN_PROV ALB INDEX (GES_CABEC' +
                'ERAS_E_ALB_ID),'
              
                '                 VER_CABECERAS_ALBARAN_PROV TER INDEX (PK_SYS_TE' +
                'RCEROS)))'
              ' ')
            CamposADesplegar.Strings = (
              'NUM_ALBARAN'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_ALBARAN_PROV'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMAlbaranesAProveedor.EntornoDoc
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LBLAlbaran: TLFLabel
            Left = 37
            Top = 2
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Albar'#225'n'
            FocusControl = DBERIG
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLEstado: TLFLabel
            Left = 150
            Top = 2
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLFechaFicha: TLFLabel
            Left = 422
            Top = 2
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLProveedor: TLFLabel
            Left = 24
            Top = 24
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLDtoPP: TLFLabel
            Left = 799
            Top = 24
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLDtoCial: TLFLabel
            Left = 796
            Top = 2
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLAlmacen: TLFLabel
            Left = 32
            Top = 90
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
          object LBLNAlbaran: TLFLabel
            Left = 388
            Top = 24
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm. Albar'#225'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLFormaPago: TLFLabel
            Left = 16
            Top = 68
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LBTPortes: TLFLabel
            Left = 422
            Top = 69
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Portes'
          end
          object LBPorPortes: TLFLabel
            Left = 412
            Top = 91
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = '% Portes'
          end
          object LBIPOrtes: TLFLabel
            Left = 524
            Top = 92
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'I. Portes'
          end
          object LBReferencia: TLFLabel
            Left = 400
            Top = 46
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
          end
          object LOrden: TLFLabel
            Left = 44
            Top = 112
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
          end
          object LImporteMinimoPorte: TLFLabel
            Left = 631
            Top = 91
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
          object LMotivoAbono: TLFLabel
            Left = 386
            Top = 113
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Motivo Abono'
          end
          object LFechaAlbaran: TLFLabel
            Left = 613
            Top = 2
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Prov.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
          object LProyectoFicha: TLFLabel
            Left = 410
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBERIGChange
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 458
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 12
            OnExit = DBDTPFechaExit
          end
          object DBEDtoPP: TLFDbedit
            Left = 842
            Top = 22
            Width = 64
            Height = 21
            DataField = 'DTO_PP'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
          end
          object DBEDtoCial: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'DTO_CIAL'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
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
            Entorno = DMAlbaranesAProveedor.EntornoDoc
          end
          object DBETituloAlmacen: TLFDbedit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlbaranesAProveedor.DSxAlmacenes
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
            Entorno = DMAlbaranesAProveedor.EntornoDoc
          end
          object DBENumAlbaran: TLFDbedit
            Left = 458
            Top = 22
            Width = 305
            Height = 21
            DataField = 'NUM_ALBARAN'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object DBEFFormasPago: TLFDBEditFind2000
            Left = 79
            Top = 66
            Width = 64
            Height = 21
            DataField = 'FORMA_DE_PAGO'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            Entorno = DMAlbaranesAProveedor.EntornoDoc
          end
          object DBEFormasPago: TLFDbedit
            Left = 144
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlbaranesAProveedor.DSxFormasPago
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
            DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object ETituloPortes: TLFEdit
            Left = 523
            Top = 66
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
            TabOrder = 18
          end
          object DBEFPortes: TLFDBEditFind2000
            Left = 458
            Top = 66
            Width = 64
            Height = 21
            DataField = 'TIPO_PORTES'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 17
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
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMAlbaranesAProveedor.EntornoDoc
          end
          object DBEPorPortes: TLFDbedit
            Left = 458
            Top = 88
            Width = 64
            Height = 21
            DataField = 'POR_PORTES'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 19
          end
          object DBEIPortes: TLFDbedit
            Left = 567
            Top = 88
            Width = 64
            Height = 21
            DataField = 'I_PORTES'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 20
          end
          object DBEReferencia: TLFDbedit
            Left = 458
            Top = 44
            Width = 305
            Height = 21
            DataField = 'SU_REFERENCIA'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 16
          end
          object LFDBOrden: TLFDbedit
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            DataField = 'ID_Orden'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 11
            OnChange = LFDBOrdenChange
          end
          object DBCHKListado: TLFDBCheckBox
            Left = 339
            Top = 2
            Width = 45
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
            DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
            ReadOnly = True
            ValueChecked = '64'
            ValueUnchecked = '0'
          end
          object DBCBValorado: TLFDBCheckBox
            Left = 813
            Top = 92
            Width = 200
            Height = 17
            Hint = 
              'Este check impide que se agreguen l'#237'neas'#13#10'traspasadas desde pedi' +
              'dos de clientes.'
            Caption = 'Valorar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 29
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKCambioChange
            DataField = 'ALBARAN_VALORADO'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBChkDevolucion: TLFDBCheckBox
            Left = 813
            Top = 114
            Width = 121
            Height = 17
            Caption = 'Devoluci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEVOLUCION'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 842
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 28
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
          object DBEImporteMinimoPorte: TLFDbedit
            Left = 699
            Top = 88
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'IMPORTE_MINIMO_PORTE'
            DataSource = DMAlbaranesAProveedor.DSxProveedor
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            DataSource = DMAlbaranesAProveedor.DSxDirecciones
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
          object DBDTPHoraDocumento: TDBDateTimePicker
            Left = 546
            Top = 0
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 44831.3871174653
            Format = 'HH:mm'
            Time = 44831.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 13
            DataField = 'FECHA'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
          end
          object DBCBEntregaDirecta: TLFDBCheckBox
            Left = 813
            Top = 136
            Width = 121
            Height = 17
            Caption = 'Entrega Directa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ENTREGA_DIRECTA'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMotivoAbono: TLFDBEditFind2000
            Left = 458
            Top = 110
            Width = 64
            Height = 21
            DataField = 'COD_MOTIVO_ABONO'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 22
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
            Entorno = DMAlbaranesAProveedor.EntornoDoc
          end
          object EMotivoAbono: TLFEdit
            Left = 523
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
            TabOrder = 23
          end
          object DBDEFechaAlbaran: TLFDBDateEdit
            Left = 676
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA_ALBARAN'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 14
            OnExit = DBDTPFechaExit
          end
          object DBEObservaciones: TLFDbedit
            Left = 79
            Top = 170
            Width = 684
            Height = 21
            AutoSize = False
            DataField = 'OBSERVACIONES'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 32
          end
          object DBEFProyectoFicha: TLFDBEditFind2000
            Left = 458
            Top = 132
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 24
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
            Entorno = DMAlbaranesAProveedor.EntornoDoc
          end
          object EProyectoFicha: TLFEdit
            Left = 523
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
            TabOrder = 25
          end
        end
      end
      object TSOtros: TTabSheet [1]
        Caption = '&Otros'
        ImageIndex = -1
        object SBAProyecto: TSpeedButton
          Left = 132
          Top = 38
          Width = 160
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+V para ver los datos del Proveedor'
          GroupIndex = -1
          OnDblClick = SBAProyectoDblClick
        end
        object PNLCabOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 987
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
              Left = 351
              Top = 0
              Width = 49
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'N'#250'm. Alb.'
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
              DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
              DataSource = DMAlbaranesAProveedor.DSxProveedor
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
              DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
              DataField = 'NUM_ALBARAN'
              DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
          Width = 987
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LFinanciacion: TLFLabel
            Left = 801
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
          object LBMoneda: TLFLabel
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
            Top = 92
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo I.R.P.F.'
          end
          object LBLIRPFFicha: TLFLabel
            Left = 26
            Top = 114
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
            DataField = 'POR_FINANCIACION'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 14
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            Entorno = DMAlbaranesAProveedor.EntornoDoc
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorCambio: TLFDbedit
            Left = 239
            Top = 66
            Width = 65
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 7
          end
          object DBEFTipoIRPF: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            DataField = 'TIPO_IRPF'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
          object DBETitTIPOIRPF: TLFDbedit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAlbaranesAProveedor.DSxTipoIRPF
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
          object DBEAplicarIRPF: TLFDbedit
            Left = 144
            Top = 110
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'APLICA_IRPF'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
          object DBEPirpf: TLFDbedit
            Left = 79
            Top = 110
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'P_IRPF'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 813
            Top = 24
            Width = 120
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
          object DBEFIdioma: TLFDBEditFind2000
            Left = 79
            Top = 22
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'IDIOMA'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            Entorno = DMAlbaranesAProveedor.EntornoDoc
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
        inherited DBGMain: THYTDBGrid
          Width = 987
          Height = 191
          DataSource = DMAlbaranesAProveedor.DSQMCabecera
          OnCellClick = DBGMainCellClick
          OnKeyDown = DBGMainKeyDown
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'ALBARAN_VALORADO'
            'CAMBIO_FIJO'
            'DEVOLUCION'
            'ENTREGA_DIRECTA'
            'INVERSION_SUJETO_PASIVO'
            'MODIFICA_DOC')
          CamposChecked.Strings = (
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
            '0')
          CamposAOrdenar.Strings = (
            'FECHA'
            'LIQUIDO'
            'MONEDA'
            'NUM_ALBARAN'
            'PROVEEDOR'
            'PROYECTO'
            'RIG'
            'TITULO'
            'TOTAL_ALBARAN')
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
              FieldName = 'NUM_ALBARAN'
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
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ESTADO'
              Width = 130
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
          Width = 987
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 987
            Height = 169
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
        object PNLCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 987
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
            object LBLNumAlbaranNotas: TLFLabel
              Left = 351
              Top = 0
              Width = 49
              Height = 21
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'N'#250'm. Alb.'
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
              DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
              DataSource = DMAlbaranesAProveedor.DSxProveedor
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
              DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            object DBENotasNumAlbaranCab: TLFDbedit
              Left = 401
              Top = 0
              Width = 133
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'NUM_ALBARAN'
              DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
          Width = 987
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
              DataSource = DMAlbaranesAProveedor.DSxProveedor
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
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
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
          Width = 987
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMDirEntrega: TLFDBMemo
            Left = 0
            Top = 0
            Width = 987
            Height = 169
            Align = alClient
            DataField = 'DIR_ENTREGA_MANUAL'
            DataSource = DMAlbaranesAProveedor.DSQMCabecera
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 251
    Width = 1001
    Height = 296
    inherited TBDetalle: TLFToolBar
      Width = 1001
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 2
      inherited NavDetalle: THYMNavigator
        DataSource = DMAlbaranesAProveedor.DSQMDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        DelMessage = #191'Desea borrar la l'#237'nea?'
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object ToolButton2: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtNotas: TToolButton
        Left = 228
        Top = 0
        Hint = 'Edita las notas de la l'#237'nea seleccionada'
        Action = ANotaDetalle
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
      object TButtHerencia: TToolButton
        Left = 343
        Top = 0
        Action = AHerencia
        ParentShowHint = False
        ShowHint = True
      end
      object TButtProcedenciaLinea: TToolButton
        Left = 366
        Top = 0
        Action = AProcedencia
      end
      object TButtSep7: TToolButton
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
      object ToolButton1: TToolButton
        Left = 420
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBInfolotes: TToolButton
        Left = 428
        Top = 0
        Action = AInfoLotes
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton4: TToolButton
        Left = 451
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBArtProv: TToolButton
        Left = 459
        Top = 0
        Action = AArticuloProv
        ParentShowHint = False
        ShowHint = True
      end
      object TButtUbicaciones: TToolButton
        Left = 482
        Top = 0
        Action = AUbicaciones
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton6: TToolButton
        Left = 505
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtBuscarArticulo: TToolButton
        Left = 513
        Top = 0
        Action = ABuscarArticulos
        Style = tbsCheck
      end
      object TButtCondicionesCompra: TToolButton
        Left = 536
        Top = 0
        Hint = 'Ver Condiciones Compra'
        Action = ACondicionesCompra
      end
      object TButtDuplicarLinea: TToolButton
        Left = 559
        Top = 0
        Action = ADuplicarLinea
      end
      object ToolButton7: TToolButton
        Left = 582
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImpProduccion: TToolButton
        Left = 590
        Top = 0
        Action = AImpProduccion
        ParentShowHint = False
        ShowHint = True
      end
      object TButtImportarDetalle: TToolButton
        Left = 613
        Top = 0
        Action = AImportarDetalle
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 1001
      Height = 219
      DataSource = DMAlbaranesAProveedor.DSQMDetalle
      DefaultDrawing = False
      ParentFont = False
      TabOrder = 0
      TitleFont.Color = clGrayText
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
      BuscarNums = True
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'ARTICULO'
        'ARTICULO'
        'TIPO_IVA'
        'ARTICULO'
        'PROYECTO'
        'ID_UBICACION'
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
        'ID_UBICACION'
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
        ''
        'ARTICULO'
        ''
        ''
        'ALMACEN'
        ''
        '')
      CamposDesplegar.Strings = (
        '0'
        '0'
        '1'
        '1'
        '0'
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
        'TIPO'
        'NSERIE'
        'PROYECTO'
        'ID_UBICACION'
        'ALMACEN'
        'TIPO'
        'TIPO')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_CON_BARRAS'
        'ART_ARTICULOS_CODPROV'
        'VER_ARTICULOS_EF'
        'SYS_TIPO_IVA'
        'ART_ARTICULOS_SERIALIZACION'
        'EMP_PROYECTOS'
        'ART_ALMACENES_UBICACIONES'
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
        'TITULO'
        'NSERIE'
        'TITULO'
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
        ''
        '')
      OrdenadosPor.Strings = (
        'BARRAS'
        'CODIGO_PROVEEDOR'
        'ARTICULO'
        'TIPO'
        'NSERIE'
        'PROYECTO'
        'COMPOSICION'
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 299
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_UNIDAD_LOGISTICA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_UNIDAD_LOGISTICA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_LOGISTICAS'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_UNIDADES_EXT'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTE_ADICIONAL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO'
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TIPO_IVA'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUPLIDO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 33
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_2'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO_3'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'T_COSTE'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'B_IMPONIBLE'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = False
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'M_BRUTO'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 126
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FECHA_REC_DET'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BULTOS'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_SEC'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'APLICA_UNIDADES_SECUNDARIAS'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_LOTE'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_UBICACION'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COMPOSICION'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CALLE'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ESTANTERIA'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REPISA'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POSICION'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INVERSION_SUJETO_PASIVO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_IMPUESTO_ADICIONAL'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_IMPUESTO_ADICIONAL'
          ReadOnly = True
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
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
      Top = 241
      Width = 1001
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
          Width = 993
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
            ParentShowHint = False
            ShowHint = True
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
              Hint = 'Sum Unidades'
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_LOGISTICAS'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
              Hint = 'Sum Unidades Secundarias'
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_SEC'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
            object DBESumaPeso: TLFDbedit
              Left = 110
              Top = 0
              Width = 55
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_PESO'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
            object DBECantLineas: TLFDbedit
              Left = 19
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'COUNT_LINEA'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
            Width = 590
            Height = 25
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LBLTotal: TLFLabel
              Left = 613
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
            object LBLLiquido: TLFLabel
              Left = 481
              Top = 4
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'quido'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object LBLCuotas: TLFLabel
              Left = 155
              Top = 4
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA y Rec.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object LBLBaseImp: TLFLabel
              Left = 0
              Top = 4
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'B. Imponible'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
            end
            object DBETotal: TLFDbedit
              Left = 656
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'TOTAL_ALBARAN'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
              Left = 61
              Top = 0
              Width = 88
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_BASES'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
              Left = 520
              Top = 0
              Width = 88
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'LIQUIDO'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBECuotaRec: TLFDbedit
              Left = 296
              Top = 0
              Width = 88
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_RE'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBECuotaIVA: TLFDbedit
              Left = 207
              Top = 0
              Width = 88
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_IVA'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBECuotaImpuestoAdic: TLFDbedit
              Left = 385
              Top = 0
              Width = 91
              Height = 21
              Color = clInfoBk
              DataField = 'S_CUOTA_IMPUESTO_ADICIONAL'
              DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
          object LBLBaseDtoCargos: TLFLabel
            Left = 317
            Top = 6
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LBLImporteCargos: TLFLabel
            Left = 499
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LBLImpBase: TLFLabel
            Left = 635
            Top = 6
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Bases'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
          end
          object LImpFinanciacion: TLFLabel
            Left = 9
            Top = 6
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Financiaci'#243'n'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object LBLIRPF: TLFLabel
            Left = 207
            Top = 6
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.R.P.F.'
            Layout = tlCenter
          end
          object DBEBaseDtoEnLinea: TLFDbedit
            Left = 399
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_DTO_LINEAS'
            DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
            Left = 538
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
            Left = 692
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'S_BASES'
            DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
            Left = 111
            Top = 2
            Width = 90
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
            Left = 247
            Top = 2
            Width = 64
            Height = 21
            AutoSize = False
            Color = clInfoBk
            DataField = 'I_IRPF'
            DataSource = DMAlbaranesAProveedor.DSxInfoActualizada
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
    Width = 1001
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 115
    Top = 316
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 115
    Top = 354
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosProveedor: TMenuItem
      Action = AAProveedor
    end
  end
  inherited ALMain: TLFActionList
    Left = 46
    Top = 316
    object AInformeAlbaran: TAction
      Category = 'Listados'
      Caption = 'Informe Albar'#225'n'
      Hint = 'Informe Albar'#225'n'
      ImageIndex = 14
      OnExecute = AInformeAlbaranExecute
    end
    object ATipoIVA: TAction
      Category = 'Otros'
      Caption = 'Cambio Manual del IVA y Recargo'
      Hint = 'Cambio Manual del IVA y Recargo'
      ImageIndex = 110
      OnExecute = ATipoIVAExecute
    end
    object AHerencia: TAction
      Category = 'Otros'
      Caption = 'Herencia'
      Hint = 'Herencia'
      ImageIndex = 97
      OnExecute = AHerenciaExecute
    end
    object AFactura: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Factura'
      Hint = 'Traspasa el Albar'#225'n actual a Factura'
      ImageIndex = 61
      OnExecute = AFacturaExecute
    end
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Todos'
      Hint = 'Muestra todos los documentos'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AAdjuntosAlbaran: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Albaran'
      ImageIndex = 59
      OnExecute = AAdjuntosAlbaranExecute
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
      Hint = 'Enviar Albar'#225'n por e-mail en Pdf por cliente de correo'
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
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
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
    object AImpresionResumenAlbaranesFiltrados: TAction
      Category = 'Listados'
      Caption = 'Impresi'#243'n Resumen Albaranes Filtrados'
      Hint = 'Impresi'#243'n Resumen Albaranes Filtrados'
      ImageIndex = 14
      OnExecute = AImpresionResumenAlbaranesFiltradosExecute
    end
    object ASep2: TAction
      Category = 'Listados'
      Caption = '-'
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
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfInfAlbaranes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Albaranes'
      Hint = 'Listado de Albaranes'
      ImageIndex = 77
      OnExecute = AConfInfAlbaranesExecute
    end
    object AConfListadoResumenAlbaranes: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Resumen de Albaranes'
      Hint = 'Listado de Resumen de Albaranes'
      ImageIndex = 77
      OnExecute = AConfListadoResumenAlbaranesExecute
    end
    object AConfListadoCBarras: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de C'#243'digos de Barras'
      Hint = 'Listado de C'#243'digos de Barras'
      ImageIndex = 77
      OnExecute = AConfListadoCBarrasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AAlbaranMulti: TAction
      Category = 'Procesos'
      Caption = 'Traspaso MultiCanal'
      Hint = 'Traspaso MultiCanal'
      ImageIndex = 86
      OnExecute = AAlbaranMultiExecute
    end
    object ASep4: TAction
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
    object ARegenerarCond: TAction
      Category = 'Procesos'
      Caption = 'Regenera las Condiciones del Proveedor'
      Hint = 'Regenera las Condiciones del Proveedor'
      ImageIndex = 26
      OnExecute = ARegenerarCondExecute
    end
    object AAnulaDocumento: TAction
      Category = 'Procesos'
      Caption = 'Marca el documento como anulado / pendiente'
      Hint = 'Marca el documento como anulado / pendiente'
      ImageIndex = 27
      OnExecute = AAnulaDocumentoExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AHistoricoSerializacion: TAction
      Category = 'Otros'
      Caption = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      Hint = 'Hist'#243'rico de Movimientos para N'#250'meros de Serie'
      ImageIndex = 115
      OnExecute = AHistoricoSerializacionExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AConfListadoUbicaciones: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Ubicaciones'
      Hint = 'Configuraci'#243'n Listado Ubicaciones'
      ImageIndex = 77
      OnExecute = AConfListadoUbicacionesExecute
    end
    object AOrdenaLineas: TAction
      Category = 'Otros'
      Caption = 'Reordenar L'#237'neas'
      Hint = 'Reordena las l'#237'neas del documento'
      ImageIndex = 122
      OnExecute = AOrdenaLineasExecute
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
    object AAsientoDeInventarioPermanente: TAction
      Category = 'Otros'
      Caption = 'Ver Asiento de Inventario Permanente'
      Hint = 'Muestra Asiento de Inventario Permanente'
      ImageIndex = 30
      OnExecute = AAsientoDeInventarioPermanenteExecute
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
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar documento'
      Hint = 'Cierra el documento actual'
      ImageIndex = 68
      OnExecute = AAbrirCerrarExecute
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
    object AListadoArticulos: TAction
      Category = 'Listados'
      Caption = 'Listado por Articulos'
      Hint = 'Listado por Articulos'
      ImageIndex = 14
      OnExecute = AListadoArticulosExecute
    end
    object ARelacionaConReparacion: TAction
      Category = 'Otros'
      Caption = 'Relaciona con Reparacion'
      Hint = 'Relaciona con Reparacion'
      ImageIndex = 97
      OnExecute = ARelacionaConReparacionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 12
    Top = 354
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    SubComplementario = ALMain
    Left = 148
    Top = 316
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 148
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
    Left = 182
    Top = 316
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 182
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
  object ALAlbaranProv: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 80
    Top = 316
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
    object ASerializacion: TAction
      Caption = 'ASerializacion'
      Hint = 'Generar n'#250'meros de serializaci'#243'n'
      ImageIndex = 115
      OnExecute = ASerializacionExecute
    end
    object ANotaDetalle: TAction
      Caption = 'ANotaDetalle'
      Hint = 'Edita las notas de la linea seleccionada'
      ImageIndex = 18
      ShortCut = 16462
      OnExecute = ANotaDetalleExecute
    end
    object ABuscarNumSerie: TAction
      Caption = 'ABuscarNumSerie'
      Hint = 'Buscar Documentos por n'#250'meros de serie'
      ImageIndex = 85
      OnExecute = ABuscarNumSerieExecute
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
    object AInfoLotes: TAction
      Caption = 'Informaci'#243'n de Lotes'
      Hint = 'Informaci'#243'n de Lotes'
      ImageIndex = 120
      ShortCut = 16460
      OnExecute = AInfoLotesExecute
    end
    object AArticulo: TAction
      Caption = 'Ver Datos Art'#237'culo'
      Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Art'#237'culo'
      ShortCut = 49217
      OnExecute = AArticuloExecute
    end
    object AArticuloProv: TAction
      Caption = 'Ver Proveedores para el Art'#237'culo'
      Hint = 'Proveedores que venden este Art'#237'culo'
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
    object ANIFAlbaran: TAction
      Caption = 'Datos del Proveedor'
      Hint = 'Datos del Proveedor'
      ShortCut = 16452
      OnExecute = ANIFAlbaranExecute
    end
    object AProcedencia: TAction
      Caption = 'Procedencia'
      Hint = 'Procedencia de la linea'
      ImageIndex = 96
      OnExecute = AProcedenciaExecute
    end
    object ABuscarArticulos: TAction
      Caption = 'ABuscarArticulos'
      Hint = 'Buscar Documentos por articulo'
      ImageIndex = 109
      OnExecute = ABuscarArticulosExecute
    end
    object ACondicionesCompra: TAction
      Caption = 'Condiciones de Compra'
      Hint = 'Condiciones de Compra'
      ImageIndex = 143
      OnExecute = ACondicionesCompraExecute
    end
    object AIDOrden: TAction
      Caption = 'AIDOrden'
      OnExecute = AIDOrdenExecute
    end
    object AImpProduccion: TAction
      Caption = 'Imp. Producci'#243'n'
      Hint = 'Imputaci'#243'n de Compras a Ordenes de Producci'#243'n'
      ImageIndex = 92
      OnExecute = AImpProduccionExecute
    end
    object ABuscaNIFKRI: TAction
      Caption = 'Busca en proveedores varios'
      Hint = 'Busca albaranes de proveedores varios'
      ImageIndex = 54
      OnExecute = ABuscaNIFKRIExecute
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
    Left = 12
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
    Left = 216
    Top = 316
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 216
    Top = 354
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
    Left = 250
    Top = 318
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 248
    Top = 352
  end
end
