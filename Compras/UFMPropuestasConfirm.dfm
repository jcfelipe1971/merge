inherited FMPropuestasConfirm: TFMPropuestasConfirm
  Left = 405
  Top = 201
  Width = 982
  Height = 600
  HelpContext = 164
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Propuestas Confirmadas'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 960
  FormStyle = fsNormal
  OldCreateOrder = False
  PopupMenu = CEDirEntregaPMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 972
    Height = 251
    BorderWidth = 3
    Constraints.MinHeight = 251
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Left = 3
      Top = 3
      Width = 966
      EdgeBorders = [ebBottom]
      TabOrder = 1
      DesignSize = (
        962
        22)
      inherited NavMain: THYMNavigator
        DataSource = DMPropuestasConfirm.DSCabecera
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        DelMessage = #191'Desea borrar la propuesta confirmada?'
        EditaControl = DBEFProveedor
        InsertaControl = DBEFProveedor
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMPropuestasConfirm.DSCabecera
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
        Hint = 'Informe Propuesta Confirmada'
        Caption = 'Informe Propuesta Confirmada'
        ImageIndex = 14
        ParentShowHint = False
        ShowHint = True
        OnClick = AInformePropConfExecute
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
        CondicionBusqueda = 'tipo='#39'OCP'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_CABECERAS_E_FAC_NIF'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'NOMBRE')
        Filtros = [obEmpresa, obCanal]
        Entorno = DMPropuestasConfirm.EntornoDoc
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
      object LTelefono: TLFLabel
        Left = 656
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
        Left = 776
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
        Left = 836
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
        Left = 896
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
      Width = 966
      Height = 219
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
        inherited PEdit: TLFPanel
          Width = 958
          Height = 191
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'SU_REFERENCIA'
              'FECHA'
              'NOMBRE_COMERCIAL')
            DataSource = DMPropuestasConfirm.DSCabecera
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERAS_OCP'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMPropuestasConfirm.EntornoDoc
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LPropuesta: TLFLabel
            Left = 25
            Top = 2
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Propuesta'
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
          object LFechaCabecera: TLFLabel
            Left = 422
            Top = 2
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LProveedor: TLFLabel
            Left = 24
            Top = 24
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LDtoPP: TLFLabel
            Left = 796
            Top = 24
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. PP.'
          end
          object LDtoCial: TLFLabel
            Left = 793
            Top = 2
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dto. Cial.'
          end
          object LAlmacen: TLFLabel
            Left = 32
            Top = 90
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LBLFormaPago: TLFLabel
            Left = 16
            Top = 68
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LBLReferencia: TLFLabel
            Left = 400
            Top = 46
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
            FocusControl = DBESuReferencia
          end
          object LFechaPrevista: TLFLabel
            Left = 395
            Top = 23
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha prev.'
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
            DataSource = DMPropuestasConfirm.DSCabecera
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
            Top = 173
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Observaciones'
            FocusControl = DBEObservaciones
          end
          object LProyectoFicha: TLFLabel
            Left = 412
            Top = 90
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
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 0
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 458
            Top = 0
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMPropuestasConfirm.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 11
          end
          object DBEDtoPP: TLFDbedit
            Left = 842
            Top = 22
            Width = 64
            Height = 21
            DataField = 'DTO_PP'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 18
          end
          object DBEDtoCial: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'DTO_CIAL'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 17
          end
          object EFAlmacen: TLFDBEditFind2000
            Left = 79
            Top = 88
            Width = 64
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ALMACEN'
            DataSource = DMPropuestasConfirm.DSCabecera
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
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMPropuestasConfirm.EntornoDoc
          end
          object DBETituloAlmacen: TLFDbedit
            Left = 144
            Top = 88
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPropuestasConfirm.DSxAlmacenes
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
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMPropuestasConfirm.DSxProveedor
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
            DataSource = DMPropuestasConfirm.DSCabecera
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
            Entorno = DMPropuestasConfirm.EntornoDoc
          end
          object DBEFFormaPago: TLFDBEditFind2000
            Left = 79
            Top = 66
            Width = 64
            Height = 21
            DataField = 'FORMA_DE_PAGO'
            DataSource = DMPropuestasConfirm.DSCabecera
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
              'FORMA_PAGO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPropuestasConfirm.EntornoDoc
          end
          object DBEFormaPago: TLFDbedit
            Left = 144
            Top = 66
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPropuestasConfirm.DSxFormasPago
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
            DataSource = DMPropuestasConfirm.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = DBETituloEstadoChange
          end
          object DBESuReferencia: TLFDbedit
            Left = 458
            Top = 44
            Width = 298
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'SU_REFERENCIA'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 13
          end
          object DBDTPFechaPrevista: TLFDBDateEdit
            Left = 458
            Top = 22
            Width = 87
            Height = 21
            DataField = 'FECHA_PRE_CAB'
            DataSource = DMPropuestasConfirm.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 12
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
            DataSource = DMPropuestasConfirm.DSxInfoActualizada
            ValueChecked = '512'
            ValueUnchecked = '0'
          end
          object DBEFMonedaFicha: TLFDBEditFind2000
            Left = 842
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMPropuestasConfirm.DSCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
            Entorno = DMPropuestasConfirm.EntornoDoc
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'DIRECCION'
            DataSource = DMPropuestasConfirm.DSCabecera
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
            DataSource = DMPropuestasConfirm.DSxDirecciones
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
            Left = 459
            Top = 68
            Width = 127
            Height = 17
            Caption = 'Acepta Entrega Parcial'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            OnClick = DBCHKListadoClick
            Alignment = taLeftJustify
            DataField = 'ACEPTA_ENTREGA_PARCIAL'
            DataSource = DMPropuestasConfirm.DSCabecera
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
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 20
          end
          object DBEProyectoFicha: TLFDbedit
            Left = 523
            Top = 88
            Width = 232
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMPropuestasConfirm.DSxProyectos
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
          object DBEFProyectoFicha: TLFDBEditFind2000
            Left = 458
            Top = 88
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 15
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
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMPropuestasConfirm.EntornoDoc
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
          Width = 958
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
              Left = 542
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
              DataSource = DMPropuestasConfirm.DSxProveedor
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
            DataSource = DMPropuestasConfirm.DSCabecera
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
        object PEdOtros: TLFPanel
          Left = 0
          Top = 22
          Width = 958
          Height = 169
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
          object LBLProyecto: TLFLabel
            Left = 31
            Top = 2
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = EFProyecto
          end
          object LPorcentajeFinanciacion: TLFLabel
            Left = 801
            Top = 2
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Financ.'
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
          object DBEFMoneda: TLFDBEditFind2000
            Left = 79
            Top = 44
            Width = 64
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMPropuestasConfirm.DSCabecera
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
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
            Entorno = DMPropuestasConfirm.EntornoDoc
          end
          object DBETitMoneda: TLFDbedit
            Left = 144
            Top = 44
            Width = 240
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMPropuestasConfirm.DSxMonedas
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
            DataSource = DMPropuestasConfirm.DSxProyectos
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
          object EFProyecto: TLFDBEditFind2000
            Left = 79
            Top = 0
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMPropuestasConfirm.DSCabecera
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
              'PROYECTO')
            Filtros = [obEmpresa]
            Entorno = DMPropuestasConfirm.EntornoDoc
          end
          object DBEFinanciacion: TLFDbedit
            Left = 842
            Top = 0
            Width = 64
            Height = 21
            DataField = 'POR_FINANCIACION'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 4
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
            DataSource = DMPropuestasConfirm.DSCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEValorCambio: TLFDbedit
            Left = 237
            Top = 66
            Width = 64
            Height = 21
            DataField = 'VALOR_CAMB_FIJO'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 3
          end
          object CKInversionSujetoPasivo: TLFDBCheckBox
            Left = 797
            Top = 24
            Width = 120
            Height = 17
            Caption = 'Inv. Sujeto Pasivo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INVERSION_SUJETO_PASIVO'
            DataSource = DMPropuestasConfirm.DSCabecera
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
            DataSource = DMPropuestasConfirm.DSCabecera
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
          object EUsuarioCreacion: TLFEdit
            Left = 144
            Top = 146
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 9
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
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 10
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
            Entorno = DMPropuestasConfirm.EntornoDoc
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
            TabOrder = 11
          end
        end
      end
      inherited TSTabla: TTabSheet
        ImageIndex = -1
        inherited DBGMain: THYTDBGrid
          Width = 958
          Height = 191
          DataSource = DMPropuestasConfirm.DSCabecera
          OnCellClick = DBGMainCellClick
          OnKeyDown = DBGMainKeyDown
          OnKeyUp = DBGMainKeyUp
          CamposAMarcar.Strings = (
            'ACEPTA_ENTREGA_PARCIAL'
            'CAMBIO_FIJO'
            'INVERSION_SUJETO_PASIVO'
            'MODIFICA_DOC')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'FECHA'
            'LIQUIDO'
            'MONEDA'
            'PROVEEDOR'
            'PROYECTO'
            'RIG'
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
              Width = 52
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
              Width = 398
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
              FieldName = 'TOTAL_CANAL'
              Title.Alignment = taRightJustify
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROYECTO'
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
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_MINIMO_PORTE'
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
      end
      object TSNotas: TTabSheet
        Caption = '&Notas'
        ImageIndex = -1
        OnShow = TSNotasShow
        object PEdNotas: TLFPanel
          Left = 0
          Top = 22
          Width = 958
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 958
            Height = 169
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 0
          end
        end
        object PCabNotas: TLFPanel
          Left = 0
          Top = 0
          Width = 958
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
            object LFecha: TLFLabel
              Left = 542
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
              DataSource = DMPropuestasConfirm.DSxProveedor
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
            DataSource = DMPropuestasConfirm.DSCabecera
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
          Width = 958
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
              DataSource = DMPropuestasConfirm.DSxProveedor
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
              DataSource = DMPropuestasConfirm.DSCabecera
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
            DataSource = DMPropuestasConfirm.DSCabecera
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
          Width = 958
          Height = 169
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object DBMDirEntrega: TLFDBMemo
            Left = 0
            Top = 0
            Width = 958
            Height = 169
            Align = alClient
            DataField = 'DIR_ENTREGA_MANUAL'
            DataSource = DMPropuestasConfirm.DSCabecera
            TabOrder = 0
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 251
    Width = 972
    Height = 296
    inherited TBDetalle: TLFToolBar
      Width = 972
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 2
      inherited NavDetalle: THYMNavigator
        DataSource = DMPropuestasConfirm.DSDetalle
        Hints.Strings = ()
        BeforeAction = NavDetalleBeforeAction
        DelMessage = #191'Desea borrar la l'#237'nea?'
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
        Hint = 'Tarifas del Proveedor'
        Caption = 'Tarifa Prov.'
        ImageIndex = 17
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtArtTarifaClick
      end
      object ToolButton2: TToolButton
        Left = 366
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBArtProv: TToolButton
        Left = 374
        Top = 0
        Hint = 'Proveedores que venden este Art'#237'culo'
        Action = AArticuloProv
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton1: TToolButton
        Left = 397
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtBuscarArticulo: TToolButton
        Left = 405
        Top = 0
        Action = ABuscarArticulo
        Style = tbsCheck
      end
      object TButtCondicionesCompra: TToolButton
        Left = 428
        Top = 0
        Action = ACondicionesCompra
      end
      object TButtDuplicarLinea: TToolButton
        Left = 451
        Top = 0
        Action = ADuplicarLinea
      end
      object TButtImportarDetalle: TToolButton
        Left = 474
        Top = 0
        Action = AImportarDetalle
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 972
      Height = 219
      DataSource = DMPropuestasConfirm.DSDetalle
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
        ''
        ''
        'ARTICULO'
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
        '1')
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'ORDEN'
        'FECHA_PRE_DET'
        'TITULO'
        'LINEA'
        'PRECIO')
      ColumnasCheckBoxes.Strings = (
        'APLICA_UNIDADES_SECUNDARIAS'
        'INVERSION_SUJETO_PASIVO')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      Numericos.Strings = (
        'BARRAS'
        'CODIGO_PROVEEDOR'
        'ARTICULO'
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
        'ART_ARTICULOS_CODPROV'
        'VER_ARTICULOS_EF'
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
        'PROVEEDOR'
        'TITULO'
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
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Title.Alignment = taRightJustify
          Width = 92
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
          Expanded = False
          FieldName = 'FECHA_PRE_DET'
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
      Top = 241
      Width = 972
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
          Width = 964
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
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBESumUdsSec: TLFDbedit
              Left = 179
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_SEC'
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBESumUdsLog: TLFDbedit
              Left = 123
              Top = 0
              Width = 55
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'SUM_UNIDADES_LOGISTICAS'
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
            Width = 561
            Height = 25
            Align = alClient
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 2
            object LLiquido: TLFLabel
              Left = 520
              Top = 4
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'quido'
              Layout = tlCenter
            end
            object LBaseImponible: TLFLabel
              Left = 0
              Top = 4
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base Imponible'
              Layout = tlCenter
            end
            object LCuotaIVAyRec: TLFLabel
              Left = 171
              Top = 4
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA/Rec/Adic'
              Layout = tlCenter
            end
            object DBECuotaImpuestoAdic: TLFDbedit
              Left = 425
              Top = 0
              Width = 91
              Height = 21
              Color = clInfoBk
              DataField = 'S_CUOTA_IMPUESTO_ADICIONAL'
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
              Left = 243
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_IVA'
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
              Left = 334
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_CUOTA_RE'
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
              Left = 561
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'LIQUIDO'
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBES_Bases: TLFDbedit
              Left = 76
              Top = 0
              Width = 90
              Height = 21
              AutoSize = False
              Color = clInfoBk
              DataField = 'S_BASES'
              DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
          object LBaseDtoLinea: TLFLabel
            Left = 292
            Top = 6
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Dto. Lineal'
            FocusControl = DBEBaseDtoEnLinea
            Layout = tlCenter
          end
          object LImporte: TLFLabel
            Left = 477
            Top = 6
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
            Layout = tlCenter
          end
          object LImporteBases: TLFLabel
            Left = 618
            Top = 6
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imp. Bases'
            Layout = tlCenter
          end
          object LImporteFinanciacion: TLFLabel
            Left = 86
            Top = 6
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe Financiaci'#243'n'
            FocusControl = DBEImpFinanciacion
            Layout = tlCenter
          end
          object DBEBaseDtoEnLinea: TLFDbedit
            Left = 374
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'B_DTO_LINEAS'
            DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
            Left = 516
            Top = 2
            Width = 90
            Height = 21
            Color = clInfoBk
            DataField = 'I_DTO_LINEAS'
            DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
            DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
            TabStop = False
            Color = clInfoBk
            DataField = 'I_FINANCIACION'
            DataSource = DMPropuestasConfirm.DSxInfoActualizada
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
    Width = 972
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Complementario = TBDetalle
    Left = 142
    Top = 332
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 142
    Top = 365
    object MISepEnlaces: TMenuItem
      Caption = '-'
    end
    object MIVerDatosProveedor: TMenuItem
      Action = AAProveedor
    end
  end
  inherited ALMain: TLFActionList
    Left = 80
    Top = 332
    object AInformePropConf: TAction
      Category = 'Listados'
      Caption = 'Informe Propuestas Confirmadas'
      Hint = 'Informe Propuestas Confirmadas'
      ImageIndex = 14
      OnExecute = AInformePropConfExecute
    end
    object AHerencia: TAction
      Category = 'Otros'
      Caption = 'Herencia'
      Hint = 'Herencia'
      ImageIndex = 97
      OnExecute = AHerenciaExecute
    end
    object ATraspasoAPedido: TAction
      Category = 'Procesos'
      Caption = 'Traspaso a Pedido'
      ImageIndex = 62
      OnExecute = ATraspasoAPedidoExecute
    end
    object AFiltroTodos: TAction
      Category = 'Filtros'
      Caption = 'Todos'
      Hint = 'Muestra todos los documentos'
      ImageIndex = 5
      OnExecute = AFiltroTodosExecute
    end
    object AAdjuntoPropuestaConfirmada: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de Propuesta Confirmada'
      ImageIndex = 59
      OnExecute = AAdjuntoPropuestaConfirmadaExecute
    end
    object AVisualizarPropConfFiltradas: TAction
      Category = 'Listados'
      Caption = 'Visualizar Propuestas Confirmadas Filtradas'
      Hint = 'Visualizar Propuestas Confirmadas Filtradas'
      ImageIndex = 14
      OnExecute = AVisualizarPropConfFiltradasExecute
    end
    object AImprimirPropConfFiltradas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Propuestas Confirmadas Filtradas'
      Hint = 'Imprimir Propuestas Confirmadas Filtradas'
      ImageIndex = 14
      OnExecute = AImprimirPropConfFiltradasExecute
    end
    object AVisualizaPropConfMail: TAction
      Category = 'Listados'
      Caption = 'Visualizar Propuestas Confirmadas e-mail'
      Hint = 'Visualizar Propuestas Confirmadas e-mail'
      ImageIndex = 34
      OnExecute = AVisualizaPropConfMailExecute
    end
    object AEnviarPropConfEmail: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Propuesta Confirm. por e-mail'
      Hint = 'Enviar Propuesta Confirm. por e-mail'
      ImageIndex = 34
      OnExecute = AEnviarPropConfEmailExecute
    end
    object AEnviarPropConfMailPdf: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Prop. Confirm. por e-mail en Pdf'
      Hint = 'Enviar Prop. Confirm. por e-mail en Pdf'
      ImageIndex = 34
      ShortCut = 49229
      OnExecute = AEnviarPropConfMailPdfExecute
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
    object AResumenPropConf: TAction
      Category = 'Listados'
      Caption = 'Resumen de Propuestas Confirmadas'
      Hint = 'Resumen de Propuestas Confirmadas'
      ImageIndex = 14
      OnExecute = AResumenPropConfExecute
    end
    object AResumenPropConfFiltradas: TAction
      Category = 'Listados'
      Caption = 'Resumen de Propuestas Confirmadas Filtradas'
      Hint = 'Resumen de Propuestas Confirmadas Filtradas'
      ImageIndex = 14
      OnExecute = AResumenPropConfFiltradasExecute
    end
    object AImprimirResumenPropConfFiltradas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Resumen de Propuestas Confirmadas Filtradas'
      Hint = 'Imprimir Resumen de Propuestas Confirmadas Filtradas'
      ImageIndex = 14
      OnExecute = AImprimirResumenPropConfFiltradasExecute
    end
    object ASep2: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AConfListadoPropConf: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Propuestas Confirmadas'
      Hint = 'Listado de Propuestas Confirmadas'
      ImageIndex = 77
      OnExecute = AConfListadoPropConfExecute
    end
    object AConfListadoResumenPropConf: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Resumen de Propuestas Confirmadas'
      Hint = 'Listado Resumen de Propuestas Confirmadas'
      ImageIndex = 77
      OnExecute = AConfListadoResumenPropConfExecute
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
    object AMultiCanal: TAction
      Category = 'Procesos'
      Caption = 'Traspaso de Propuestas Confirmadas Multi-Canal'
      Hint = 'Traspaso de Propuestas Confirmadas Multi-Canal'
      ImageIndex = 86
      OnExecute = AMultiCanalExecute
    end
    object ASep1: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ADuplicar: TAction
      Category = 'Procesos'
      Caption = 'Duplicar Propuesta'
      Hint = 'Duplicar Propuesta'
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
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AEnviarPropMailPDF2: TAction
      Category = 'Listados;"EnvioMail"'
      Caption = 'Enviar Propuesta por e-mail en Pdf (mensaje)'
      Hint = 'Enviar propuesta por e-mail en Pdf con el cliente de correo'
      ImageIndex = 34
      OnExecute = AEnviarPropMailPDF2Execute
    end
    object AOrdenaLineas: TAction
      Category = 'Otros'
      Caption = 'Reordenar L'#237'neas'
      Hint = 'Reordena las l'#237'neas del documento'
      ImageIndex = 122
      OnExecute = AOrdenaLineasExecute
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object LFCategoryActionAdjuntos: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosProveedor: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de Proveedor'
      ImageIndex = 59
      OnExecute = AAdjuntosProveedorExecute
    end
    object AAdjuntosTercero: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de Tercero'
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
    object AAbrirCerrar: TAction
      Category = 'Procesos'
      Caption = 'Cerrar documento'
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
  end
  inherited FSMain: TLFFibFormStorage
    Left = 32
    Top = 365
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    SubComplementario = ALMain
    Left = 180
    Top = 332
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 180
    Top = 365
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
    Left = 218
    Top = 332
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 218
    Top = 365
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
  object ALPropConfirm: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 80
    Top = 365
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
    object AArticulo: TAction
      Caption = 'Ver Datos Articulo'
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
      Hint = 'Busca propuestas confirmadas de proveedores varios'
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
    Left = 32
    Top = 332
  end
  object CEOtros: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSOtros
    FichaExclusiva = TSOtros
    PanelEdicion = PEdOtros
    Complementario = TBDetalle
    SubComplementario = ALMain
    PopUpMenu = CEOtrosPMEdit
    Teclas = DMMain.Teclas
    Left = 256
    Top = 332
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 256
    Top = 365
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
    Left = 37
    Top = 395
  end
  object RelojEmail: TTimer
    OnTimer = RelojEmailTimer
    Left = 40
    Top = 432
  end
end
