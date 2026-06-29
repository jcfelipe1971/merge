inherited FMUsuariosWeb: TFMUsuariosWeb
  Left = 421
  Top = 166
  Width = 645
  Height = 589
  HelpContext = 154
  ActiveControl = NavMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Usuarios Web'
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 635
    Height = 536
    inherited TBMain: TLFToolBar
      Width = 631
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = DMUsuariosWeb.DSQMUsuariosWeb
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEClave
        InsertaControl = DBEUsuarioId
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEUsuarioId
        Busca02 = DBEClave
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
        ImageIndex = 39
      end
    end
    inherited PCMain: TLFPageControl
      Width = 631
      Height = 506
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 623
          Height = 478
          inherited G2KTableLoc: TG2KTBLoc
            Left = 76
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'USUARIOS_WEB'
            CampoNum = 'USUARIOID'
            CampoStr = 'NOMBRE'
            OrdenadoPor.Strings = (
              'NOMBRE')
          end
          object LBLCodigo: TLFLabel
            Left = 65
            Top = 19
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo'
            FocusControl = DBEUsuarioId
          end
          object LBLTitulo: TLFLabel
            Left = 71
            Top = 41
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave'
            FocusControl = DBEClave
          end
          object LBLTipoEfecto: TLFLabel
            Left = 49
            Top = 107
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Usuario'
          end
          object LBLCuenta: TLFLabel
            Left = 32
            Top = 128
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Cli/Age/Sis'
          end
          object LNombre: TLFLabel
            Left = 61
            Top = 63
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
            FocusControl = DBENombre
          end
          object LEmail: TLFLabel
            Left = 70
            Top = 85
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'E-mail'
            FocusControl = DBEEMail
          end
          object LBLVista: TLFLabel
            Left = 74
            Top = 403
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Vista'
          end
          object LWebEmpresa: TLFLabel
            Left = 57
            Top = 238
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empresa'
            FocusControl = DBEEMail
          end
          object LWebEjercicio: TLFLabel
            Left = 58
            Top = 261
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
            FocusControl = DBEEMail
          end
          object LWebCanal: TLFLabel
            Left = 186
            Top = 260
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
            FocusControl = DBEEMail
          end
          object LWebSerie: TLFLabel
            Left = 305
            Top = 260
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
            FocusControl = DBEEMail
          end
          object LAlmacen: TLFLabel
            Left = 57
            Top = 283
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen'
            FocusControl = DBEEMail
          end
          object LWebTarifa: TLFLabel
            Left = 186
            Top = 282
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
            FocusControl = DBEEMail
          end
          object LUsuario: TLFLabel
            Left = 62
            Top = 325
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LDireccion: TLFLabel
            Left = 52
            Top = 172
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Direccion'
          end
          object LTelefono: TLFLabel
            Left = 56
            Top = 216
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Telefono'
          end
          object LSeccion: TLFLabel
            Left = 59
            Top = 348
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Secci'#243'n'
            FocusControl = DBEEMail
          end
          object LMaestro: TLFLabel
            Left = 59
            Top = 151
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Maestro'
          end
          object LBLImagen: TLFLabel
            Left = 62
            Top = 425
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LTercero: TLFLabel
            Left = 188
            Top = 151
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LContacto: TLFLabel
            Left = 54
            Top = 194
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contacto'
          end
          object LAlmacenDestino: TLFLabel
            Left = 35
            Top = 305
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen Dst.'
            FocusControl = DBEEMail
          end
          object DBEUsuarioId: TLFDbedit
            Left = 102
            Top = 15
            Width = 301
            Height = 21
            DataField = 'USUARIOID'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBEUsuarioIdChange
          end
          object DBEClave: TLFDbedit
            Left = 102
            Top = 37
            Width = 249
            Height = 21
            DataField = 'CONTRASENYA'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            PasswordChar = '*'
            TabOrder = 1
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 102
            Top = 125
            Width = 48
            Height = 21
            DataField = 'ID_CLIENTE_AGENTE'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'DEVWEB_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFClienteBusqueda
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBCBAceptar: TLFDBCheckBox
            Left = 233
            Top = 367
            Width = 70
            Height = 17
            Caption = '&Aceptar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 30
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACEPTAR'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBVTipoUsuario: TDBComboBoxValue
            Left = 102
            Top = 103
            Width = 107
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_USUARIO'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            ItemHeight = 13
            Items.Strings = (
              'Cliente'
              'Agente'
              'Sistema'
              'Almac'#233'n'
              'Visitante'
              'Empleado'
              'Seccion')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6')
            TabOrder = 6
            OnChange = DBCBVTipoUsuarioChange
          end
          object DBENombre: TLFDbedit
            Left = 102
            Top = 59
            Width = 301
            Height = 21
            DataField = 'NOMBRE'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 4
          end
          object DBEEMail: TLFDbedit
            Left = 102
            Top = 81
            Width = 301
            Height = 21
            DataField = 'EMAIL'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 5
          end
          object DBENombreCliAgeSis: TLFDbedit
            Left = 151
            Top = 125
            Width = 252
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_AGE_CLI_SIS'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBCBTipoVista: TDBComboBoxValue
            Left = 102
            Top = 399
            Width = 107
            Height = 21
            Style = csDropDownList
            DataField = 'VISTA'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            ItemHeight = 13
            Items.Strings = (
              'Fotos'
              'Tablas')
            Values.Strings = (
              'img'
              'nor')
            TabOrder = 32
          end
          object LFDBCBStock: TLFDBCheckBox
            Left = 330
            Top = 367
            Width = 70
            Height = 17
            Caption = 'Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 31
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'STOCK'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFWebEmpresa: TLFFibDBEditFind
            Left = 102
            Top = 235
            Width = 39
            Height = 21
            DataField = 'WEB_EMPRESA'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 16
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_EMPRESAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPRESA'
            CampoStr = 'TITULO'
            CampoADevolver = 'EMPRESA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPRESA')
          end
          object DBEWebEmpresa: TLFDbedit
            Left = 142
            Top = 235
            Width = 261
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMUsuariosWeb.DSxEmpresas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 17
          end
          object DBEFWebEjercicio: TLFFibDBEditFind
            Left = 102
            Top = 257
            Width = 70
            Height = 21
            DataField = 'WEB_EJERCICIO'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 18
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_EJERCICIOS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'APERTURA'
              'CIERRE')
            CampoNum = 'EJERCICIO'
            CampoStr = 'EJERCICIO'
            CampoADevolver = 'EJERCICIO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFWebEjercicioBusqueda
            OrdenadoPor.Strings = (
              'EJERCICIO desc')
          end
          object DBEFWebAlmacen: TLFFibDBEditFind
            Left = 102
            Top = 279
            Width = 70
            Height = 21
            DataField = 'WEB_ALMACEN'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 21
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            CampoADevolver = 'ALMACEN'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFWebAlmacenBusqueda
            OrdenadoPor.Strings = (
              'ALMACEN')
          end
          object DBCBAplicarTarifa: TLFDBCheckBox
            Left = 326
            Top = 281
            Width = 79
            Height = 17
            Caption = 'Aplica Tarifa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 23
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB_APLICA_TARIFA'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFWebCanal: TLFFibDBEditFind
            Left = 217
            Top = 257
            Width = 70
            Height = 21
            DataField = 'WEB_CANAL'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 19
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            CampoADevolver = 'CANAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFWebCanalBusqueda
            OrdenadoPor.Strings = (
              'CANAL')
          end
          object DBEFWebSerie: TLFFibDBEditFind
            Left = 333
            Top = 257
            Width = 70
            Height = 21
            DataField = 'WEB_SERIE'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 20
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            CampoADevolver = 'SERIE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFWebSerieBusqueda
            OrdenadoPor.Strings = (
              'SERIE')
          end
          object DBEFWebTarifa: TLFFibDBEditFind
            Left = 217
            Top = 279
            Width = 70
            Height = 21
            DataField = 'WEB_TARIFA'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 22
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            CampoADevolver = 'TARIFA'
            CondicionBusqueda = 'ACTIVA=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFWebTarifaBusqueda
            OrdenadoPor.Strings = (
              'TARIFA')
          end
          object DBEFUsuario: TLFDBEditFind2000
            Left = 102
            Top = 323
            Width = 70
            Height = 21
            DataField = 'USUARIO'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 25
            OnChange = DBEFUsuarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_USUARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'USUARIO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'USUARIO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBTelefono: TLFDbedit
            Left = 102
            Top = 213
            Width = 136
            Height = 21
            DataField = 'TELEFONO'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 15
          end
          object LFImatge: TLFPanel
            Left = 410
            Top = 15
            Width = 210
            Height = 159
            Align = alCustom
            BevelOuter = bvNone
            TabOrder = 37
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 210
              Height = 159
              Align = alClient
              Stretch = True
            end
          end
          object DBEFSeccion: TLFFibDBEditFind
            Left = 102
            Top = 345
            Width = 70
            Height = 21
            DataField = 'SECCION'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 27
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SECCION'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFSeccionBusqueda
            OrdenadoPor.Strings = (
              'SECCION')
          end
          object DBCBVerMaquinasHojasTrabajo: TLFDBCheckBox
            Left = 182
            Top = 346
            Width = 187
            Height = 17
            Caption = 'Ver m'#225'quinas en Hojas de Trabajo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 28
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'HOJA_TRABAJO_VER_MAQUINA'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPermisoModificaParametros: TLFDBCheckBox
            Left = 102
            Top = 367
            Width = 123
            Height = 17
            Caption = 'Modifica Par'#225'metros'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 29
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CONFIGURACION'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ETituloUsuario: TLFEdit
            Left = 173
            Top = 323
            Width = 230
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 26
            Text = 'ETituloUsuario'
          end
          object DBEMaestro: TLFDbedit
            Left = 102
            Top = 147
            Width = 73
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MAESTRO'
            DataSource = DMUsuariosWeb.DSxNombre
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 102
            Top = 421
            Width = 66
            Height = 21
            DataField = 'IMAGEN'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 33
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloImagen: TLFEdit
            Left = 169
            Top = 421
            Width = 363
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 34
          end
          object BCargarImagen: TButton
            Left = 485
            Top = 423
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde archivo'
            Caption = '...'
            TabOrder = 35
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 508
            Top = 423
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 36
            Visible = False
            OnClick = BClipboardClick
          end
          object DBETercero: TLFDbedit
            Left = 230
            Top = 147
            Width = 73
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMUsuariosWeb.DSxNombre
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            OnChange = DBETerceroChange
          end
          object DBEFDireccion: TLFDBEditFind2000
            Left = 102
            Top = 169
            Width = 48
            Height = 21
            DataField = 'DIRECCION'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 11
            OnChange = DBEFDireccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DIRECCION'
            CampoStr = 'DIR_COMPLETA_N'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFDireccionBusqueda
            OrdenadoPor.Strings = (
              'DIR_DEFECTO DESC, DIRECCION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EDireccion: TLFEdit
            Left = 151
            Top = 169
            Width = 252
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object BVerClave: TButton
            Left = 352
            Top = 37
            Width = 25
            Height = 21
            Hint = 'Muestra Clave'
            Caption = 'Ver'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = BVerClaveClick
          end
          object BModificarClave: TButton
            Left = 378
            Top = 37
            Width = 25
            Height = 21
            Hint = 'Genera una nueva clave'
            Caption = 'Gen.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = BModificarClaveClick
          end
          object DBEFContacto: TLFDBEditFind2000
            Left = 102
            Top = 191
            Width = 48
            Height = 21
            DataField = 'CONTACTO'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 13
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
            SalirSiVacio = False
            OnBusqueda = DBEFContactoBusqueda
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EContacto: TLFEdit
            Left = 151
            Top = 191
            Width = 252
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBEFWebAlmacenDestino: TLFFibDBEditFind
            Left = 102
            Top = 301
            Width = 70
            Height = 21
            DataField = 'WEB_ALMACEN_DST'
            DataSource = DMUsuariosWeb.DSQMUsuariosWeb
            TabOrder = 24
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            CampoADevolver = 'ALMACEN'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFWebAlmacenDestinoBusqueda
            OrdenadoPor.Strings = (
              'ALMACEN')
          end
        end
      end
      object TSDocs: TTabSheet [1]
        Caption = '&Documentos'
        ImageIndex = 2
        OnShow = TSDocsShow
        object DBGDocs: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 623
          Height = 454
          Align = alClient
          DataSource = DMUsuariosWeb.DSQMUsuariosWebDocs
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 1
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
          Transaction = DMUsuariosWeb.TUpdate
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'DEFECTO_DOC'
            'PERMISO_DOC')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
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
              FieldName = 'TIPO'
              ReadOnly = True
              Width = 36
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_DOC'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERMISO_DOC'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO_DOC'
              Width = 50
              Visible = True
            end>
        end
        object TBDocs: TLFToolBar
          Left = 0
          Top = 0
          Width = 623
          Height = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLInfoUsuarioDocumentos: TLFPanel
            Left = 0
            Top = 0
            Width = 305
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBEUsuarioDocumento: TLFDbedit
              Left = -1
              Top = 0
              Width = 81
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIOID'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 0
            end
            object DBENombreUsuarioDocumento: TLFDbedit
              Left = 81
              Top = 0
              Width = 218
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 1
            end
          end
          object NavDocs: THYMNavigator
            Left = 305
            Top = 0
            Width = 176
            Height = 22
            DataSource = DMUsuariosWeb.DSQMUsuariosWebDocs
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
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
      object TSMarcas: TTabSheet [2]
        Caption = '&Marcas'
        ImageIndex = 3
        OnShow = TSMarcasShow
        object TBMarcas: TLFToolBar
          Left = 0
          Top = 0
          Width = 623
          Height = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLInfoUsuarioMarca: TLFPanel
            Left = 0
            Top = 0
            Width = 305
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBEUsuarioMarca: TLFDbedit
              Left = 0
              Top = 0
              Width = 81
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIOID'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 0
            end
            object DBENombreUsuarioMarca: TLFDbedit
              Left = 82
              Top = 0
              Width = 217
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 1
            end
          end
          object NavMarcas: THYMNavigator
            Left = 305
            Top = 0
            Width = 198
            Height = 22
            DataSource = DMUsuariosWeb.DSQMUsuariosWebMarcas
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGMarcas
            InsertaControl = DBGMarcas
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGMarcas: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 623
          Height = 454
          Align = alClient
          DataSource = DMUsuariosWeb.DSQMUsuariosWebMarcas
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
          Transaction = DMUsuariosWeb.TUpdate
          BuscarNums = False
          Campos.Strings = (
            'ID_MARCA')
          CamposAMostrar.Strings = (
            'ID_MARCA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            'ID_MARCA')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ID_MARCA'
            'TITULO')
          CamposNoAccesibles.Strings = (
            'USUARIOID')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ID_MARCA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ART_ARTICULOS_MOD_MARCAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'ID_MARCA')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_MARCA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Visible = True
            end>
        end
      end
      object TSModulos: TTabSheet [3]
        Caption = 'M'#243'&dulos'
        OnShow = TSModulosShow
        object DBGUsuariosWebModulos: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 623
          Height = 454
          Align = alClient
          DataSource = DMUsuariosWeb.DSUsuariosWebModulos
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
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'COD_MODULO')
          CamposAMostrar.Strings = (
            'COD_MODULO'
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
            'COD_MODULO'
            'ORDEN')
          ColumnasCheckBoxes.Strings = (
            'ADMINISTRADOR')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'COD_MODULO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'WEB_MODULOS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO_MODULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'COD_MODULO')
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_MODULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_MODULO_USR'
              Width = 162
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_MODULO_USR'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADMINISTRADOR'
              Width = 38
              Visible = True
            end>
        end
        object TBModulos: TLFToolBar
          Left = 0
          Top = 0
          Width = 623
          Height = 24
          Caption = 'TBModulos'
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object PNLInfoUsuarioModulos: TLFPanel
            Left = 0
            Top = 0
            Width = 305
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBEUsuarioModulos: TLFDbedit
              Left = 0
              Top = 0
              Width = 81
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIOID'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 0
            end
            object DBENombreUsuarioModulos: TLFDbedit
              Left = 82
              Top = 0
              Width = 217
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 1
            end
          end
          object NavModulos: THYMNavigator
            Left = 305
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMUsuariosWeb.DSUsuariosWebModulos
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGUsuariosWebModulos
            InsertaControl = DBGUsuariosWebModulos
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 623
          Height = 478
          DataSource = DMUsuariosWeb.DSQMUsuariosWeb
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ACEPTAR'
            'CIUDAD'
            'CONTRASENYA'
            'CP'
            'DIRECCION'
            'EMAIL'
            'ID_CLIENTE_AGENTE'
            'NOMBRE'
            'PAIS'
            'PROVINCIA'
            'TELEFONO'
            'TIPO_USUARIO'
            'USUARIOID')
          Columns = <
            item
              Expanded = False
              FieldName = 'USUARIOID'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 264
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Width = 267
              Visible = True
            end>
        end
      end
      object TSFormasPago: TTabSheet
        Caption = 'Formas de Pago'
        ImageIndex = 5
        OnShow = TSFormasPagoShow
        object TBFormasPago: TLFToolBar
          Left = 0
          Top = 0
          Width = 623
          Height = 24
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object PNLInfoUsuarioFormasPago: TLFPanel
            Left = 0
            Top = 0
            Width = 305
            Height = 22
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object DBEUsuarioIdFormasPago: TLFDbedit
              Left = -1
              Top = 0
              Width = 81
              Height = 21
              Color = clInfoBk
              DataField = 'USUARIOID'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 0
            end
            object DBENombreFormasPago: TLFDbedit
              Left = 81
              Top = 0
              Width = 218
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMUsuariosWeb.DSQMUsuariosWeb
              Enabled = False
              TabOrder = 1
            end
          end
          object NavFormasPago: THYMNavigator
            Left = 305
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMUsuariosWeb.DSQMUsuariosWebFP
            Flat = True
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
        object DBGFFormasPago: TDBGridFind2000
          Left = 0
          Top = 24
          Width = 623
          Height = 454
          Align = alClient
          DataSource = DMUsuariosWeb.DSQMUsuariosWebFP
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 1
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
          Transaction = DMUsuariosWeb.TUpdate
          BuscarNums = False
          Campos.Strings = (
            'FORMA')
          CamposAMostrar.Strings = (
            'FORMA'
            '1'
            'FORMA')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          MensajeNoExiste = False
          Numericos.Strings = (
            'FORMA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'VER_FORMAS_PAGO_EMP')
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
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'FORMA'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 392
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 536
    Width = 635
  end
  inherited CEMain: TControlEdit
    Left = 414
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 466
    Top = 12
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 488
    Top = 38
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 522
    Top = 38
  end
  object OPImagen: TOpenPictureDialog
    Left = 516
    Top = 8
  end
end
