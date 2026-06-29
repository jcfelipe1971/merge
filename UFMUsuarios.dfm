inherited FMUsuarios: TFMUsuarios
  Left = 499
  Top = 208
  Width = 1000
  Height = 455
  HelpContext = 313
  ActiveControl = DBGLog
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Usuarios'
  Constraints.MinHeight = 455
  Constraints.MinWidth = 730
  PopupMenu = CENet2PhonePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 990
    Height = 402
    inherited TBMain: TLFToolBar
      Width = 986
      inherited NavMain: THYMNavigator
        DataSource = DMUsuarios.DSQMUsuarios
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBENombre
        InsertaControl = DBEUsuario
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object PNLSoloActivos: TLFPanel
        Left = 319
        Top = 0
        Width = 98
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object CBSoloActivos: TLFCheckBox
          Left = 3
          Top = 3
          Width = 94
          Height = 17
          Caption = 'Solo Activos'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBSoloActivosChange
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 986
      Height = 372
      ActivePage = TSLog
      TabIndex = 4
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 978
          Height = 344
          inherited G2KTableLoc: TG2KTBLoc
            Top = 10
            DataSource = DMUsuarios.DSQMUsuarios
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_USUARIOS'
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            OrdenadoPor.Strings = (
              'USUARIO')
          end
          object LUsuario: TLFLabel
            Left = 78
            Top = 11
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LNombre: TLFLabel
            Left = 77
            Top = 33
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LClave: TLFLabel
            Left = 87
            Top = 55
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave'
          end
          object LPerfil: TLFLabel
            Left = 91
            Top = 127
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perfil'
          end
          object LModoCF: TLFLabel
            Left = 65
            Top = 174
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo C.F.'
          end
          object LModoTab: TLFLabel
            Left = 62
            Top = 196
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo Tab.'
          end
          object LBLColorActivo: TLFLabel
            Left = 464
            Top = 93
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Navegador Activo'
          end
          object LBLColorInactivo: TLFLabel
            Left = 456
            Top = 115
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Navegador Inactivo'
          end
          object LColorMenuIzqAct: TLFLabel
            Left = 444
            Top = 138
            Width = 106
            Height = 13
            Alignment = taRightJustify
            Caption = 'Men'#250' Izquierda Activo'
          end
          object LColorMenuIzqInact: TLFLabel
            Left = 465
            Top = 183
            Width = 85
            Height = 13
            Alignment = taRightJustify
            Caption = 'Men'#250' Izq Inactivo'
          end
          object LColorMenuDerAct: TLFLabel
            Left = 446
            Top = 162
            Width = 104
            Height = 13
            Alignment = taRightJustify
            Caption = 'Men'#250' Derecho Activo'
          end
          object LColorMenuDerInact: TLFLabel
            Left = 459
            Top = 204
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Men'#250' Der. Inactivo'
          end
          object LColorEnlaceActivo: TLFLabel
            Left = 484
            Top = 226
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Enlace Activo'
          end
          object LAgente: TLFLabel
            Left = 80
            Top = 225
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LBLDiasCaducidad: TLFLabel
            Left = 37
            Top = 93
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as Caducidad'
          end
          object LBLFechaCambioPassw: TLFLabel
            Left = 216
            Top = 93
            Width = 97
            Height = 13
            Alignment = taRightJustify
            Caption = #218'ltimo Cambio Clave'
          end
          object LAccionInicio: TLFLabel
            Left = 52
            Top = 247
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Accion inicial'
          end
          object LColorCampoID: TLFLabel
            Left = 503
            Top = 247
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campo ID'
          end
          object LNivel: TLFLabel
            Left = 90
            Top = 144
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nivel'
          end
          object DBEUsuario: TLFDbedit
            Left = 120
            Top = 7
            Width = 43
            Height = 21
            DataField = 'USUARIO'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 0
          end
          object DBENombre: TLFDbedit
            Left = 120
            Top = 29
            Width = 291
            Height = 21
            DataField = 'NOMBRE'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 1
          end
          object DBEClave: TLFDbedit
            Left = 120
            Top = 51
            Width = 291
            Height = 21
            DataField = 'CLAVE'
            DataSource = DMUsuarios.DSQMUsuarios
            PasswordChar = '*'
            TabOrder = 2
          end
          object DBCBIconosSimples: TLFDBCheckBox
            Left = 480
            Top = 62
            Width = 170
            Height = 14
            Caption = 'Iconos simples'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 19
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ICONOS_SIMPLES'
            DataSource = DMUsuarios.DSQMUsuarios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object PInfo: TLFPanel
            Left = 22
            Top = 273
            Width = 411
            Height = 44
            Alignment = taRightJustify
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 16
            DesignSize = (
              411
              44)
            object LFechaTrabajo: TLFLabel
              Left = 34
              Top = 4
              Width = 58
              Height = 13
              Anchors = [akLeft, akBottom]
              Caption = 'Fecha Trab.'
            end
            object LEmpresa: TLFLabel
              Left = 50
              Top = 26
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Anchors = [akLeft, akBottom]
              Caption = 'Empresa'
            end
            object DBEFechaTrabajo: TLFDbedit
              Left = 97
              Top = 0
              Width = 121
              Height = 21
              TabStop = False
              Anchors = [akLeft, akBottom]
              Color = clInfoBk
              DataField = 'FECHA_TRABAJO'
              DataSource = DMUsuarios.DSQMUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEEmpresa: TLFDbedit
              Left = 97
              Top = 22
              Width = 43
              Height = 21
              TabStop = False
              Anchors = [akLeft, akBottom]
              Color = clInfoBk
              DataField = 'EMPRESA'
              DataSource = DMUsuarios.DSQMUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEEjercicio: TLFDbedit
              Left = 141
              Top = 22
              Width = 43
              Height = 21
              TabStop = False
              Anchors = [akLeft, akBottom]
              Color = clInfoBk
              DataField = 'EJERCICIO'
              DataSource = DMUsuarios.DSQMUsuarios
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBETitEmp: TLFDbedit
              Left = 185
              Top = 22
              Width = 202
              Height = 21
              TabStop = False
              Anchors = [akLeft, akBottom]
              Color = clInfoBk
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = DMUsuarios.DSxEmpresa
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
          object DBEF2000Perfil: TLFDBEditFind2000
            Left = 120
            Top = 119
            Width = 48
            Height = 21
            DataField = 'PERFIL'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 6
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_USUARIOS_PERFIL'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PERFIL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PERFIL')
            Filtros = []
          end
          object DBETituloPerfil: TLFDbedit
            Left = 169
            Top = 119
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMUsuarios.DSxUsuariosPerfil
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
          object EColorNavActivo: TLFEdit
            Left = 556
            Top = 89
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 20
            Text = '             ...'
            OnClick = EColorNavActivoClick
          end
          object EColorNavInactivo: TLFEdit
            Left = 556
            Top = 111
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            TabOrder = 21
            Text = '             ...'
            OnClick = EColorNavInactivoClick
          end
          object EColorMenuIzqActivo: TLFEdit
            Left = 556
            Top = 133
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 22
            Text = '             ...'
            OnClick = EColorMenuIzqActivoClick
          end
          object EColorMenuDerInactivo: TLFEdit
            Left = 556
            Top = 200
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 25
            Text = '             ...'
            OnClick = EColorMenuDerInactivoClick
          end
          object EColorMenuIzqInactivo: TLFEdit
            Left = 556
            Top = 178
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 24
            Text = '             ...'
            OnClick = EColorMenuIzqInactivoClick
          end
          object EColorMenuDerActivo: TLFEdit
            Left = 556
            Top = 156
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 23
            Text = '             ...'
            OnClick = EColorMenuDerActivoClick
          end
          object DBEFCierraForm: TLFDBEditFind2000
            Left = 120
            Top = 170
            Width = 48
            Height = 21
            DataField = 'MODO_CIERRA_FORM'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODO_CIERRA_FORM'
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
          object DBETitCierraForm: TLFDbedit
            Left = 169
            Top = 170
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMUsuarios.DSxCierraForm
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
          object DBEFModoTab: TLFDBEditFind2000
            Left = 120
            Top = 192
            Width = 48
            Height = 21
            DataField = 'MODO_ENTER'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 11
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODO_TAB'
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
          object DBETitModoTab: TLFDbedit
            Left = 169
            Top = 192
            Width = 242
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMUsuarios.DSxModoTab
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
          object EColorEnlaceActivo: TLFEdit
            Left = 556
            Top = 222
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 26
            Text = '             ...'
            OnClick = EColorEnlaceActivoClick
          end
          object DBEFAgente: TLFDBEditFind2000
            Left = 120
            Top = 221
            Width = 48
            Height = 21
            DataField = 'AGENTE'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 13
            OnChange = DBEFAgenteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'agente')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object EAgente: TLFEdit
            Left = 169
            Top = 221
            Width = 242
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
          object DBEDiasCaducidad: TLFDbedit
            Left = 120
            Top = 89
            Width = 43
            Height = 21
            DataField = 'DIAS_CADUCIDAD'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 4
          end
          object DBDTPFechaCambioPassw: TLFDBDateEdit
            Left = 319
            Top = 89
            Width = 92
            Height = 21
            DataField = 'FECHA_CAMBIO_PASSW'
            DataSource = DMUsuarios.DSQMUsuarios
            CheckOnExit = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 5
          end
          object DBCBCuentaNuncaCaduca: TLFDBCheckBox
            Left = 120
            Top = 73
            Width = 170
            Height = 15
            Caption = 'La contrase'#241'a nunca caduca'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CUENTA_NUNCA_CADUCA'
            DataSource = DMUsuarios.DSQMUsuarios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCuentaDeshabilitada: TLFDBCheckBox
            Left = 480
            Top = 24
            Width = 170
            Height = 15
            Hint = 'Evita que el usuario acceda a la aplicacion'
            Caption = 'Cuenta deshabilitada'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CUENTA_DESHABILITADA'
            DataSource = DMUsuarios.DSQMUsuarios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBAccionInicio: TLFDBComboBoxValue
            Left = 120
            Top = 243
            Width = 291
            Height = 21
            DataField = 'ACCION_INICIO'
            DataSource = DMUsuarios.DSQMUsuarios
            DropDownCount = 20
            ItemHeight = 13
            TabOrder = 15
          end
          object EColorCampoID: TLFEdit
            Left = 556
            Top = 244
            Width = 92
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 27
            Text = '             ...'
            OnClick = EColorCampoIDClick
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 480
            Top = 43
            Width = 170
            Height = 15
            Hint = 'Evita que se pueda seleccionar este usuarios'
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 18
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMUsuarios.DSQMUsuarios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBNivel: TLFDBComboBoxValue
            Left = 120
            Top = 141
            Width = 291
            Height = 21
            DataField = 'NIVEL'
            DataSource = DMUsuarios.DSQMUsuarios
            DropDownCount = 20
            ItemHeight = 13
            Items.Strings = (
              '9-Administrador'
              '8'
              '7'
              '6'
              '5'
              '4'
              '3'
              '2'
              '1'
              '0-Usuario')
            Values.Strings = (
              '9'
              '8'
              '7'
              '6'
              '5'
              '4'
              '3'
              '2'
              '1'
              '0')
            TabOrder = 8
          end
          object BColoresPorDefecto: TButton
            Left = 656
            Top = 88
            Width = 75
            Height = 25
            Hint = 'ColoresPorDefecto'
            Caption = 'Por Defecto'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 28
            Visible = False
            OnClick = BColoresPorDefectoClick
          end
        end
      end
      object TSPermisos: TTabSheet [1]
        Caption = '&Permisos TPV'
        ImageIndex = -1
        object TBPermisos: TLFToolBar
          Left = 0
          Top = 0
          Width = 978
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavPermisos: THYMNavigator
            Left = 0
            Top = 0
            Width = 176
            Height = 22
            DataSource = DMUsuarios.DSQMPermisos
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPermisosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGPermisos
            Exclusivo = True
            ControlEdit = CEPermisos
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TSep1: TToolButton
            Left = 176
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object DBENombreUsuarioPermisosTPV: TLFDbedit
            Left = 184
            Top = 0
            Width = 210
            Height = 22
            Color = clInfoBk
            DataField = 'NOMBRE'
            DataSource = DMUsuarios.DSQMUsuarios
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
        end
        object DBGPermisos: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 978
          Height = 322
          Align = alClient
          DataSource = DMUsuarios.DSQMPermisos
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMUsuarios.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'LOGUEAR'
            'ALMACENAR'
            'AUTORIZADO')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
            '0')
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
              FieldName = 'PERMISO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGUEAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACENAR'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUTORIZADO'
              Width = 83
              Visible = True
            end>
        end
      end
      object TSEmail: TTabSheet [2]
        Caption = '&Email'
        ImageIndex = -1
        object TBEmail: TLFToolBar
          Left = 0
          Top = 0
          Width = 978
          Height = 24
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object LFPanel1: TLFPanel
            Left = 0
            Top = 0
            Width = 340
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBENumUsuarioEmail: TLFDbedit
              Left = 0
              Top = 0
              Width = 43
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIO'
              DataSource = DMUsuarios.DSQMUsuarios
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
            object DBENombreUsuarioEmail: TLFDbedit
              Left = 44
              Top = 0
              Width = 291
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuarios.DSQMUsuarios
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
            Left = 340
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavEmail: THYMNavigator
            Left = 348
            Top = 0
            Width = 44
            Height = 22
            DataSource = DMUsuarios.DSQMUsuarios
            VisibleButtons = [nbEdit, nbPost]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEEmailPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBENombreCorreo
            InsertaControl = DBENombreCorreo
            OnClickBefore = NavRestriccionesClickBefore
            Exclusivo = True
            ControlEdit = CEEmail
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLEmail: TLFPanel
          Left = 0
          Top = 24
          Width = 978
          Height = 320
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LUsuarioSMTP: TLFLabel
            Left = 84
            Top = 141
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id de Usuario'
          end
          object LSMTP: TLFLabel
            Left = 75
            Top = 99
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Servidor SMTP'
          end
          object LNombreCorreo: TLFLabel
            Left = 76
            Top = 54
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre Correo'
          end
          object LPasswordSMTP: TLFLabel
            Left = 93
            Top = 163
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contrase'#241'a'
          end
          object LPuertoSMTP: TLFLabel
            Left = 116
            Top = 119
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Puerto'
          end
          object LEmail: TLFLabel
            Left = 61
            Top = 76
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Correo electr'#243'nico'
          end
          object LCopiaOculta: TLFLabel
            Left = 153
            Top = 240
            Width = 375
            Height = 13
            Hint = 'Lista de direcciones para enviar copia oculta del mensaje'
            Caption = 
              'Lista de direcciones para enviar copia oculta del mensaje (separ' +
              'adas por coma)'
            ParentShowHint = False
            ShowHint = True
          end
          object DBCBAutentificarSMTP: TLFDBCheckBox
            Left = 69
            Top = 189
            Width = 97
            Height = 14
            Caption = 'Autentificar'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SMTP_AUTENTIFICAR'
            DataSource = DMUsuarios.DSQMUsuarios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBCifrarTSL: TLFDBCheckBox
            Left = 69
            Top = 211
            Width = 97
            Height = 14
            Caption = 'Cifrado TSL'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SMTP_TSL'
            DataSource = DMUsuarios.DSQMUsuarios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEDirCorreo: TLFDbedit
            Left = 153
            Top = 72
            Width = 289
            Height = 21
            AutoSize = False
            DataField = 'DIR_CORREO'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 1
          end
          object DBENombreCorreo: TLFDbedit
            Left = 153
            Top = 50
            Width = 289
            Height = 21
            AutoSize = False
            DataField = 'NOMBRE_CORREO'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 0
          end
          object DBEPasswordSMTP: TLFDbedit
            Left = 153
            Top = 160
            Width = 289
            Height = 21
            AutoSize = False
            DataField = 'SMTP_PASSWORD'
            DataSource = DMUsuarios.DSQMUsuarios
            PasswordChar = '*'
            TabOrder = 5
          end
          object DBEPuertoSMTP: TLFDbedit
            Left = 153
            Top = 116
            Width = 40
            Height = 21
            AutoSize = False
            DataField = 'SMTP_PUERTO'
            DataSource = DMUsuarios.DSQMUsuarios
            MaxLength = 4
            TabOrder = 3
          end
          object DBEServidorSMTP: TLFDbedit
            Left = 153
            Top = 94
            Width = 289
            Height = 21
            AutoSize = False
            DataField = 'SMTP_SERVIDOR'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 2
          end
          object DBEUsuarioSMTP: TLFDbedit
            Left = 153
            Top = 138
            Width = 289
            Height = 21
            AutoSize = False
            DataField = 'SMTP_USUARIO'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 4
          end
          object DBECopiaOculta: TLFDbedit
            Left = 153
            Top = 255
            Width = 808
            Height = 21
            Hint = 'Lista de direcciones para enviar copia oculta del mensaje'
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            DataField = 'COPIA_OCULTA_CORREO'
            DataSource = DMUsuarios.DSQMUsuarios
            ParentShowHint = False
            ShowHint = True
            TabOrder = 8
          end
        end
      end
      object TSRestricciones: TTabSheet [3]
        Caption = '&Restricciones'
        ImageIndex = 3
        OnShow = TSRestriccionesShow
        object PNRestriccion: TLFPanel
          Left = 0
          Top = 0
          Width = 978
          Height = 344
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBRestriccion: TLFToolBar
            Left = 0
            Top = 0
            Width = 978
            Height = 24
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object PNLDatosUsuarioRestricciones: TLFPanel
              Left = 0
              Top = 0
              Width = 340
              Height = 22
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object DBENumUsuarioRestricciones: TLFDbedit
                Left = 0
                Top = 0
                Width = 43
                Height = 21
                Color = clInfoBk
                DataField = 'USUARIO'
                DataSource = DMUsuarios.DSQMUsuarios
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                OnChange = DBENumUsuarioRestriccionesChange
              end
              object DBENombreUsuarioRestricciones: TLFDbedit
                Left = 44
                Top = 0
                Width = 291
                Height = 21
                Color = clInfoBk
                DataField = 'NOMBRE'
                DataSource = DMUsuarios.DSQMUsuarios
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
              Left = 340
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object NavRestricciones: THYMNavigator
              Left = 348
              Top = 0
              Width = 44
              Height = 22
              DataSource = DMUsuarios.DSQMUsuarios
              VisibleButtons = [nbEdit, nbPost]
              Flat = True
              ParentShowHint = False
              PopupMenu = CERestriccionesPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = GBDocumentos
              InsertaControl = GBDocumentos
              OnClickBefore = NavRestriccionesClickBefore
              Exclusivo = True
              ControlEdit = CERestricciones
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object PNPermiso: TLFPanel
            Left = 0
            Top = 24
            Width = 978
            Height = 320
            Align = alClient
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object LSerieRestringida: TLFLabel
              Left = 29
              Top = 8
              Width = 80
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie Restringida'
            end
            object LAlmacenRestringido: TLFLabel
              Left = 13
              Top = 29
              Width = 97
              Height = 13
              Alignment = taRightJustify
              Caption = 'Almac'#233'n Restringido'
            end
            object GBDocumentos: TGroupBox
              Left = 8
              Top = 65
              Width = 409
              Height = 190
              Hint = 
                'Documentos que podr'#225' modificar este usuario despues de haber sid' +
                'o impresos.'
              Caption = 
                'Documentos que podr'#225' modificar este usuario despu'#233's de haber sid' +
                'o impresos'
              Ctl3D = True
              ParentCtl3D = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 4
              object LBCompras: TLFLabel
                Left = 8
                Top = 23
                Width = 392
                Height = 12
                Alignment = taCenter
                AutoSize = False
                Caption = 'Documentos de Compras'
              end
              object LBVentas: TLFLabel
                Left = 8
                Top = 120
                Width = 392
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Documentos de Ventas'
              end
              object CBPedCompras: TLFCheckBox
                Left = 16
                Top = 65
                Width = 140
                Height = 17
                Caption = 'Pedidos'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBAlbCompras: TLFCheckBox
                Left = 216
                Top = 65
                Width = 140
                Height = 17
                Caption = 'Albaranes'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBFacCompras: TLFCheckBox
                Left = 16
                Top = 87
                Width = 140
                Height = 17
                Caption = 'Facturas'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 4
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBOfertasVentas: TLFCheckBox
                Left = 16
                Top = 140
                Width = 140
                Height = 17
                Caption = 'Ofertas'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 6
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBFacturasAAcr: TLFCheckBox
                Left = 216
                Top = 87
                Width = 140
                Height = 17
                Caption = 'Facturas Acreedor'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 5
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBPedidosVentas: TLFCheckBox
                Left = 216
                Top = 140
                Width = 140
                Height = 17
                Caption = 'Pedidos'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 7
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBAlbaranesVentas: TLFCheckBox
                Left = 16
                Top = 162
                Width = 140
                Height = 17
                Caption = 'Albaranes'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 8
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBFacturasVentas: TLFCheckBox
                Left = 216
                Top = 162
                Width = 140
                Height = 17
                Caption = 'Facturas'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 9
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBPropuesta: TLFCheckBox
                Left = 16
                Top = 43
                Width = 140
                Height = 17
                Caption = 'Propuestas'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
              end
              object CBPropuestaConfirmada: TLFCheckBox
                Left = 216
                Top = 43
                Width = 140
                Height = 17
                Caption = 'Propuestas Confirmadas'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
              end
            end
            object DBEFSerieRestringida: TLFDBEditFind2000
              Left = 113
              Top = 6
              Width = 56
              Height = 21
              DataField = 'SERIE'
              DataSource = DMUsuarios.DSQMUsuarios
              TabOrder = 0
              OnChange = DBEFSerieRestringidaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_SERIES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'SERIE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'serie')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFAlmacenRestringido: TLFDBEditFind2000
              Left = 113
              Top = 28
              Width = 56
              Height = 21
              DataField = 'ALMACEN'
              DataSource = DMUsuarios.DSQMUsuarios
              TabOrder = 2
              OnChange = DBEFAlmacenRestringidoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ART_ALMACENES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ALMACEN'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'almacen')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBCBDelegacion: TLFDBCheckBox
              Left = 441
              Top = 96
              Width = 250
              Height = 17
              Caption = 'Delegaci'#243'n'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 9
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DELEGACION'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBContabilidadRestringida: TLFDBCheckBox
              Left = 441
              Top = 140
              Width = 250
              Height = 17
              Caption = 'Contabilidad Restringida'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 11
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'CONTABILIDAD_RESTRINGIDA'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBEDI: TLFDBCheckBox
              Left = 441
              Top = 52
              Width = 250
              Height = 17
              Caption = 'EDI Habilitado'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 7
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'EDI_HABILIDADO'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBCheckBox1: TLFDBCheckBox
              Left = 441
              Top = 162
              Width = 250
              Height = 17
              Caption = 'Albar'#225'n Restringido'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 12
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ALBARAN_RESTRINGIDO'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBRestriccionLimitePEPKri: TLFDBCheckBox
              Left = 441
              Top = 184
              Width = 250
              Height = 17
              Caption = 'Restringir modificar l'#237'mite Ped. a Proveedor'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 13
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'RESTRINGIR_IMPORTE_MAX_PEP'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object EAlmacenRestringido: TLFEdit
              Left = 171
              Top = 28
              Width = 247
              Height = 21
              TabStop = False
              Color = clInfoBk
              ReadOnly = True
              TabOrder = 3
            end
            object ESerieRestringida: TLFEdit
              Left = 171
              Top = 6
              Width = 247
              Height = 21
              TabStop = False
              Color = clInfoBk
              ReadOnly = True
              TabOrder = 1
            end
            object DBCBRestriccionPorAgente: TLFDBCheckBox
              Left = 441
              Top = 118
              Width = 250
              Height = 17
              Caption = 'Restringir la selecci'#243'n de clientes por agente'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 10
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'RESTRINGIR_AGENTE'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBVerSoloArticulosDisponibles: TLFDBCheckBox
              Left = 441
              Top = 74
              Width = 250
              Height = 17
              Caption = 'Ver solo articulos disponibles'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 8
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VER_SOLO_ART_DISPONIBLE'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBGuardaFiltros: TLFDBCheckBox
              Left = 441
              Top = 30
              Width = 250
              Height = 17
              Caption = 'Guarda filtros'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'GUARDA_FILTROS'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBDatosAbiertos: TLFDBCheckBox
              Left = 441
              Top = 8
              Width = 250
              Height = 17
              Caption = 'Abre formularios con datos abiertos'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DATOS_ABIERTOS'
              DataSource = DMUsuarios.DSQMUsuarios
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
        end
      end
      object TSLog: TTabSheet [4]
        Caption = 'Ver &Log'
        OnShow = TSLogShow
        object TBLog: TLFToolBar
          Left = 0
          Top = 0
          Width = 978
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object PNLDatosUsuarioLog: TLFPanel
            Left = 0
            Top = 0
            Width = 340
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBENumUsuarioLog: TLFDbedit
              Left = 0
              Top = 0
              Width = 43
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIO'
              DataSource = DMUsuarios.DSQMUsuarios
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
            object DBENombreUsuarioLog: TLFDbedit
              Left = 44
              Top = 0
              Width = 291
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuarios.DSQMUsuarios
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
          object ToolButton5: TToolButton
            Left = 340
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object HYMNVerLog: THYMNavigator
            Left = 348
            Top = 0
            Width = 88
            Height = 22
            DataSource = DMUsuarios.DSxVerLog
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Align = alClient
            Flat = True
            ParentShowHint = False
            PopupMenu = CEVerLogPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEVerLog
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton3: TToolButton
            Left = 436
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtValidos: TToolButton
            Tag = 1
            Left = 444
            Top = 0
            Hint = 'Ver las entradas v'#225'lidas'
            Caption = 'Validos'
            Grouped = True
            ImageIndex = 7
            Style = tbsCheck
            OnClick = VerLogFiltrado
          end
          object TButtInvalidos: TToolButton
            Tag = -1
            Left = 467
            Top = 0
            Hint = 'Ver las entradas no v'#225'lidas'
            Caption = 'Invalidos'
            Grouped = True
            ImageIndex = 6
            Style = tbsCheck
            OnClick = VerLogFiltrado
          end
          object TButtTodos: TToolButton
            Left = 490
            Top = 0
            Hint = 'Ver todas las entradas'
            Caption = 'Todos'
            Grouped = True
            ImageIndex = 8
            Style = tbsCheck
            OnClick = VerLogFiltrado
          end
          object TButSep1: TToolButton
            Left = 513
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButBuscaEntrada: TToolButton
            Left = 521
            Top = 0
            Hint = 'Buscar Entrada en todos los usuarios'
            Caption = 'Buscar Entrada'
            ImageIndex = 83
            OnClick = TButBuscaEntradaClick
          end
        end
        object DBGLog: THYTDBGrid
          Left = 0
          Top = 22
          Width = 978
          Height = 322
          Align = alClient
          Color = clInfoBk
          DataSource = DMUsuarios.DSxVerLog
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
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
          AutoDeseleccionar = True
          PermutaPaneles = False
          CamposAOrdenar.Strings = (
            'ENTRADA'
            'F_ENTRADA'
            'F_SALIDA')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_ENTRADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'F_SALIDA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UBICACION'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGIN'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 95
              Visible = True
            end>
        end
      end
      object TSFirma: TTabSheet [5]
        Caption = 'F&irma digital'
        OnShow = TSFirmaShow
        object TBFirmaDigital: TLFToolBar
          Left = 0
          Top = 0
          Width = 978
          Height = 24
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLDatosUsuarioFirmaDigital: TLFPanel
            Left = 0
            Top = 0
            Width = 340
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBENumUsuarioFirmaDigital: TLFDbedit
              Left = 0
              Top = 0
              Width = 43
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIO'
              DataSource = DMUsuarios.DSQMUsuarios
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
            object DBENombreUsuarioFirmaDigital: TLFDbedit
              Left = 44
              Top = 0
              Width = 291
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuarios.DSQMUsuarios
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
          object TSep3: TToolButton
            Left = 340
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavFirma: THYMNavigator
            Left = 348
            Top = 0
            Width = 44
            Height = 22
            DataSource = DMUsuarios.DSQMUsuarios
            VisibleButtons = [nbEdit, nbPost]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFirmaPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEClaveFirmaDigital
            Exclusivo = True
            ControlEdit = CEFirma
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PnFirmas: TLFPanel
          Left = 0
          Top = 24
          Width = 978
          Height = 320
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LClaveFirmaDigital: TLFLabel
            Left = 73
            Top = 32
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave'
          end
          object SBCargaFirmaDigital: TSpeedButton
            Left = 108
            Top = 80
            Width = 161
            Height = 33
            Caption = 'Cargar firma'
            Flat = True
            OnClick = SBCargaFirmaDigitalClick
          end
          object DBEClaveFirmaDigital: TLFDbedit
            Left = 108
            Top = 29
            Width = 161
            Height = 21
            DataField = 'CLAVE_FIRMA'
            DataSource = DMUsuarios.DSQMUsuarios
            PasswordChar = '*'
            TabOrder = 0
          end
          object DBCBPuedeFirmar: TLFDBCheckBox
            Left = 11
            Top = 56
            Width = 109
            Height = 17
            Caption = 'Puede Firmar'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PUEDE_FIRMAR'
            DataSource = DMUsuarios.DSQMUsuarios
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSUsuariosWeb: TTabSheet [6]
        Caption = 'Usuarios Web'
        ImageIndex = 7
        object TBUsuariosWeb: TLFToolBar
          Left = 0
          Top = 0
          Width = 978
          Height = 24
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLDatosUsuarioUsuariosWeb: TLFPanel
            Left = 0
            Top = 0
            Width = 340
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBEUsuariosWebUsuario: TLFDbedit
              Left = 0
              Top = 0
              Width = 43
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIO'
              DataSource = DMUsuarios.DSQMUsuarios
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
            object DBEUsuariosWebNombre: TLFDbedit
              Left = 44
              Top = 0
              Width = 291
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuarios.DSQMUsuarios
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
          object TBSep1: TToolButton
            Left = 340
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavUsuariosWeb: THYMNavigator
            Left = 348
            Top = 0
            Width = 120
            Height = 22
            DataSource = DMUsuarios.DSxUsuariosWeb
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFirmaPMEdit
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
        object PNLUsuariosWeb: TLFPanel
          Left = 0
          Top = 24
          Width = 978
          Height = 320
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGUsuariosWeb: THYTDBGrid
            Left = 0
            Top = 0
            Width = 978
            Height = 320
            Align = alClient
            Color = clInfoBk
            DataSource = DMUsuarios.DSxUsuariosWeb
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'ENTRADA'
              'F_ENTRADA'
              'F_SALIDA')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'USUARIOID'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Width = 200
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
                FieldName = 'WEB_EMPRESA'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEB_EJERCICIO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEB_CANAL'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEB_SERIE'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEB_ALMACEN'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'WEB_TARIFA'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SECCION'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIRECCION_AMPLIADA'
                Width = 200
                Visible = True
              end>
          end
        end
      end
      object TSNet2Phone: TTabSheet [7]
        Caption = 'Net2Phone'
        ImageIndex = 7
        object PNLNet2Phone: TLFPanel
          Left = 0
          Top = 24
          Width = 978
          Height = 320
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          DesignSize = (
            978
            320)
          object LNet2PhoneExtension: TLFLabel
            Left = 54
            Top = 32
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Extension'
          end
          object LNet2PhoneToken: TLFLabel
            Left = 69
            Top = 56
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Token'
          end
          object DBENet2PhoneToken: TLFDbedit
            Left = 108
            Top = 53
            Width = 837
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            DataField = 'NET2PHONE_TOKEN'
            DataSource = DMUsuarios.DSQMUsuarios
            PasswordChar = '*'
            TabOrder = 1
          end
          object DBENet2PhoneExtension: TLFDbedit
            Left = 108
            Top = 29
            Width = 161
            Height = 21
            DataField = 'NET2PHONE_EXTENSION'
            DataSource = DMUsuarios.DSQMUsuarios
            TabOrder = 0
          end
        end
        object TBNet2Phone: TLFToolBar
          Left = 0
          Top = 0
          Width = 978
          Height = 24
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object PNLNet2PhoneUsuario: TLFPanel
            Left = 0
            Top = 0
            Width = 340
            Height = 22
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object DBENet2PhoneUsuario: TLFDbedit
              Left = 0
              Top = 0
              Width = 43
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIO'
              DataSource = DMUsuarios.DSQMUsuarios
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
            object DBENet2PhoneNombre: TLFDbedit
              Left = 44
              Top = 0
              Width = 291
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuarios.DSQMUsuarios
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
            Left = 340
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object NavNet2Phone: THYMNavigator
            Left = 348
            Top = 0
            Width = 44
            Height = 22
            DataSource = DMUsuarios.DSQMUsuarios
            VisibleButtons = [nbEdit, nbPost]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENet2PhonePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBENet2PhoneExtension
            Exclusivo = True
            ControlEdit = CENet2Phone
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 978
          Height = 344
          DataSource = DMUsuarios.DSQMUsuarios
          OnDblClick = DBGMainDblClick
          OnKeyUp = DBGMainKeyUp
          OnMouseUp = DBGMainMouseUp
          CamposAMarcar.Strings = (
            'ACTIVO'
            'CONTABILIDAD_RESTRINGIDA'
            'CUENTA_DESHABILITADA'
            'CUENTA_NUNCA_CADUCA'
            'DATOS_ABIERTOS'
            'DELEGACION'
            'EDI_HABILIDADO'
            'GUARDA_FILTROS'
            'ICONOS_SIMPLES'
            'MEMORIZAR_FECHA'
            'MODO_CIERRA_FORM'
            'MODO_ENTER'
            'PUEDE_FIRMAR'
            'RESTRINGIR_AGENTE'
            'RESTRINGIR_IMPORTE_MAX_PEP'
            'TACTIL'
            'VER_SOLO_ART_DISPONIBLE')
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
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'AGENTE'
            'CONTABILIDAD_RESTRINGIDA'
            'CUENTA_DESHABILITADA'
            'DELEGACION'
            'DIR_CORREO'
            'EDI_HABILIDADO'
            'EMPLEADO'
            'FECHA_CAMBIO_PASSW'
            'LENGUA'
            'NET2PHONE_EXTENSION'
            'NIVEL'
            'NOMBRE'
            'NOMBRE_CORREO'
            'PERFIL'
            'USUARIO')
          Columns = <
            item
              Expanded = False
              FieldName = 'USUARIO'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 268
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIVEL'
              Title.Alignment = taRightJustify
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERFIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_DESHABILITADA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 402
    Width = 990
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEVerLog
    Left = 8
    Top = 72
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 40
    Top = 72
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 512
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBSoloActivos.Checked')
    Left = 480
    Top = 0
  end
  object CEVerLog: TControlEdit
    EnlazadoA = CERestricciones
    FichaEdicion = TSLog
    FichaExclusiva = TSLog
    PopUpMenu = CEVerLogPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 104
  end
  object CEVerLogPMEdit: TPopUpTeclas
    Left = 40
    Top = 104
    object CEVerLogMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEVerLogMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEVerLogMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEVerLogMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEVerLogMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEVerLogMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEVerLogMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEVerLogMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEVerLogMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEVerLogMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CERestricciones: TControlEdit
    EnlazadoA = CEFirma
    FichaEdicion = TSRestricciones
    FichaExclusiva = TSRestricciones
    PanelEdicion = PNPermiso
    SubComplementario = ALMain
    PopUpMenu = CERestriccionesPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 136
  end
  object CERestriccionesPMEdit: TPopUpTeclas
    Left = 40
    Top = 136
    object CERestriccionesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CERestriccionesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CERestriccionesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CERestriccionesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CERestriccionesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CERestriccionesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CERestriccionesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CERestriccionesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CERestriccionesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CERestriccionesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEFirma: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PnFirmas
    PopUpMenu = CEFirmaPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 168
  end
  object CEFirmaPMEdit: TPopUpTeclas
    Left = 40
    Top = 168
    object CEFirmaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEFirmaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFirmaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFirmaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEFirmaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEFirmaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEFirmaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEFirmaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEFirmaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEFirmaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEEmail: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PNLEmail
    SubComplementario = ALMain
    PopUpMenu = CEEmailPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 200
  end
  object CEEmailPMEdit: TPopUpTeclas
    Left = 40
    Top = 200
    object CEEmailMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEEmailMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CEEmailMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CEEmailMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEEmailMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEEmailMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEEmailMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEEmailMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEEmailMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEEmailMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CEPermisos: TControlEdit
    EnlazadoA = CEVerLog
    FichaEdicion = TSPermisos
    FichaExclusiva = TSPermisos
    PopUpMenu = CEPermisosPMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 232
  end
  object CEPermisosPMEdit: TPopUpTeclas
    Left = 40
    Top = 232
    object CEPermisosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPermisosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPermisosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPermisosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPermisosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 45
      Visible = False
    end
    object CEPermisosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 46
      Visible = False
    end
    object CEPermisosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPermisosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPermisosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPermisosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CENet2Phone: TControlEdit
    EnlazadoA = CEMain
    PanelEdicion = PNLNet2Phone
    PopUpMenu = CENet2PhonePMEdit
    Teclas = DMMain.Teclas
    Left = 8
    Top = 264
  end
  object CENet2PhonePMEdit: TPopUpTeclas
    Left = 40
    Top = 264
    object CENet2PhoneMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENet2PhoneMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENet2PhoneMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENet2PhoneMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENet2PhoneMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENet2PhoneMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENet2PhoneMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENet2PhoneMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENet2PhoneMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CENet2PhoneMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
