inherited FMProyectos: TFMProyectos
  Left = 454
  Top = 171
  Width = 1053
  Height = 554
  HelpContext = 23
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Proyectos'
  Constraints.MinHeight = 554
  Constraints.MinWidth = 865
  FormStyle = fsNormal
  PopupMenu = CEOrdenesPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1043
    Height = 265
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 1039
      inherited NavMain: THYMNavigator
        DataSource = DMProyectos.DSQMProyectos
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 100
        VisibleButtons = [neBuscar, neImprime, neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton
        Left = 328
      end
      inherited TbuttComp: TToolButton
        Left = 336
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1039
      Height = 235
      ParentFont = False
      inherited TSFicha: TTabSheet
        object SBACliente: TSpeedButton [0]
          Left = 126
          Top = 47
          Width = 355
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          Caption = 'Ver Datos Cliente'
          OnDblClick = SBAClienteDblClick
        end
        object SBATercero: TSpeedButton [1]
          Left = 128
          Top = 68
          Width = 353
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          Caption = 'Ver Datos Cliente'
          OnDblClick = SBATerceroDblClick
        end
        object SBAAgente: TSpeedButton [2]
          Left = 134
          Top = 55
          Width = 355
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Agente'
          GroupIndex = -1
          Caption = 'Ver Datos Agente'
          OnDblClick = SBAAgenteDblClick
        end
        inherited PEdit: TLFPanel
          Width = 1031
          Height = 207
          inherited G2KTableLoc: TG2KTBLoc
            Left = 39
            CamposADesplegar.Strings = (
              'CODIGO_INTERNO')
            Tabla_a_buscar = 'VER_EMP_PROYECTOS'
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'PROYECTO')
          end
          object LProyecto: TLFLabel
            Left = 16
            Top = 7
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = DBEProyecto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LCanal: TLFLabel
            Left = 990
            Top = 173
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object LCliente: TLFLabel
            Left = 25
            Top = 51
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LCierre: TLFLabel
            Left = 548
            Top = 29
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cierre'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LApertura: TLFLabel
            Left = 535
            Top = 7
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Apertura'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LNotas: TLFLabel
            Left = 702
            Top = 117
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LCodigoInterno: TLFLabel
            Left = 0
            Top = 29
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'd. Interno'
            FocusControl = DBEProyecto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LTercero: TLFLabel
            Left = 20
            Top = 95
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LFLabel1: TLFLabel
            Left = 1
            Top = 117
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dir. Tercero'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LKilometrosDestino: TLFLabel
            Left = 519
            Top = 51
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Km. Destino'
            FocusControl = DBEProyecto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LSerie: TLFLabel
            Left = 993
            Top = 151
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
            FocusControl = DBEProyecto
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object LVentas: TLFLabel
            Left = 543
            Top = 161
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ventas'
          end
          object LOtros: TLFLabel
            Left = 551
            Top = 117
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'Otros'
          end
          object LCompras: TLFLabel
            Left = 535
            Top = 95
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Compras'
          end
          object LBeneficios: TLFLabel
            Left = 527
            Top = 183
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Beneficios'
          end
          object LLocalidad: TLFLabel
            Left = 11
            Top = 139
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Localidad'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LCodPostal: TLFLabel
            Left = 3
            Top = 161
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Postal'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LProvincia: TLFLabel
            Left = 133
            Top = 161
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LPais: TLFLabel
            Left = 35
            Top = 183
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LHorario: TLFLabel
            Left = 695
            Top = 95
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LHorarioSep1: TLFLabel
            Left = 793
            Top = 95
            Width = 3
            Height = 13
            Caption = '-'
          end
          object LHorarioSep2: TLFLabel
            Left = 929
            Top = 95
            Width = 3
            Height = 13
            Caption = '-'
          end
          object LAgente: TLFLabel
            Left = 23
            Top = 73
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LDirManual: TLFLabel
            Left = 714
            Top = 7
            Width = 16
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dir.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LEmpleados: TLFLabel
            Left = 524
            Top = 139
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Empleados'
          end
          object DBEFCanal: TLFDBEditFind2000
            Left = 1022
            Top = 169
            Width = 64
            Height = 21
            DataField = 'CANAL_NULL'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 31
            Visible = False
            OnChange = DBEFCanalChange
            AutoCambiarFoco = True
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'canal'
            CampoStr = 'titulo'
            CampoADevolver = 'canal'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMProyectos.EntornoBusqueda
          end
          object ESerie: TLFEdit
            Left = 1087
            Top = 147
            Width = 74
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 33
            Visible = False
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 1022
            Top = 147
            Width = 64
            Height = 21
            DataField = 'SERIE'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 30
            Visible = False
            OnChange = DBEFSerieChange
            AutoCambiarFoco = True
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'SERIE'
              'TITULO')
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            CampoADevolver = 'SERIE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFSerieBusqueda
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEProyecto: TLFDbedit
            Left = 62
            Top = 3
            Width = 64
            Height = 21
            DataField = 'PROYECTO'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object ECanal: TLFEdit
            Left = 1087
            Top = 169
            Width = 74
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 32
            Visible = False
          end
          object ECliente: TLFEdit
            Left = 127
            Top = 47
            Width = 360
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBDTPInicio: TLFDBDateEdit
            Left = 580
            Top = 3
            Width = 101
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMProyectos.DSQMProyectos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 15
          end
          object DBDTPFinal: TLFDBDateEdit
            Left = 580
            Top = 25
            Width = 101
            Height = 21
            DataField = 'FECHA_FINAL'
            DataSource = DMProyectos.DSQMProyectos
            CheckOnExit = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 16
          end
          object DBETitulo: TLFDbedit
            Left = 127
            Top = 3
            Width = 360
            Height = 21
            DataField = 'TITULO'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBCBCerrado: TLFDBCheckBox
            Left = 580
            Top = 70
            Width = 101
            Height = 16
            Caption = 'Cerrado'
            ClicksDisabled = False
            ColorCheck = 57088
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 18
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CERRADO'
            DataSource = DMProyectos.DSQMProyectos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMNotas: TLFDBMemo
            Left = 735
            Top = 113
            Width = 285
            Height = 87
            Anchors = [akLeft, akTop, akRight]
            DataField = 'NOTAS'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 29
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 62
            Top = 47
            Width = 64
            Height = 21
            DataField = 'CLIENTE_NULL'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnChange = DBEFClienteChange
            AutoCambiarFoco = True
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            CampoADevolver = 'CLIENTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            Filtros = [obEmpresa]
            Entorno = DMProyectos.EntornoBusqueda
          end
          object DBECodigoInterno: TLFDbedit
            Left = 62
            Top = 25
            Width = 425
            Height = 21
            DataField = 'CODIGO_INTERNO'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 62
            Top = 91
            Width = 64
            Height = 21
            DataField = 'TERCERO_NULL'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
            OnChange = DBEFTerceroChange
            AutoCambiarFoco = True
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TERCERO'
              'NOMBRE_R_SOCIAL')
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_COMERCIAL'
            CampoADevolver = 'TERCERO'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
            Entorno = DMProyectos.EntornoBusqueda
          end
          object ETercero: TLFEdit
            Left = 127
            Top = 91
            Width = 360
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBEFDireccionTercero: TLFDBEditFind2000
            Left = 62
            Top = 113
            Width = 64
            Height = 21
            DataField = 'DIRECCION_TERCERO_NULL'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            AutoCambiarFoco = True
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_DIRECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'COD_POSTAL'
              'LOCALIDAD')
            CampoNum = 'DIRECCION'
            CampoStr = 'TITULO'
            CampoADevolver = 'DIRECCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFDireccionTerceroBusqueda
            OrdenadoPor.Strings = (
              'DIRECCION')
            Filtros = []
            Entorno = DMProyectos.EntornoBusqueda
          end
          object DBEKilometrosDestino: TLFDbedit
            Left = 580
            Top = 47
            Width = 101
            Height = 21
            DataField = 'KILOMETROS_DESTINO'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object DBEBeneficios: TLFDbedit
            Left = 580
            Top = 179
            Width = 101
            Height = 21
            Color = clInfoBk
            DataField = 'BENEFICIOS'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 23
          end
          object DBEVentas: TLFDbedit
            Left = 580
            Top = 157
            Width = 101
            Height = 21
            Color = clInfoBk
            DataField = 'VENTAS'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 22
          end
          object DBEOtros: TLFDbedit
            Left = 580
            Top = 113
            Width = 101
            Height = 21
            Color = clInfoBk
            DataField = 'OTROS'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 20
          end
          object DBECompras: TLFDbedit
            Left = 580
            Top = 91
            Width = 101
            Height = 21
            Color = clInfoBk
            DataField = 'COMPRAS'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 19
          end
          object DBETituloDireccion: TLFDbedit
            Left = 127
            Top = 113
            Width = 360
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_DIRECCION'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBETitulo_Localidad: TLFDbedit
            Left = 62
            Top = 135
            Width = 425
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_LOCALIDAD'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object DBECodigoPostal: TLFDbedit
            Left = 62
            Top = 157
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'CODIGO_POSTAL'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBEProvincia: TLFDbedit
            Left = 182
            Top = 157
            Width = 305
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_PROVINCIA'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 13
          end
          object DBEPais: TLFDbedit
            Left = 62
            Top = 179
            Width = 425
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_PAIS'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DTPHorario1Desde: TDBDateTimePicker
            Left = 735
            Top = 91
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 45572.3871174653
            Format = 'HH:mm'
            Time = 45572.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 25
            DataField = 'HORARIO_1_DESDE'
            DataSource = DMProyectos.DSQMProyectos
          end
          object DTPHorario1Hasta: TDBDateTimePicker
            Left = 799
            Top = 91
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 43536.3871174653
            Format = 'HH:mm'
            Time = 43536.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 26
            DataField = 'HORARIO_1_HASTA'
            DataSource = DMProyectos.DSQMProyectos
          end
          object DTPHorario2Desde: TDBDateTimePicker
            Left = 871
            Top = 91
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 43536.3871174653
            Format = 'HH:mm'
            Time = 43536.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 27
            DataField = 'HORARIO_2_DESDE'
            DataSource = DMProyectos.DSQMProyectos
          end
          object DTPHorario2Hasta: TDBDateTimePicker
            Left = 935
            Top = 91
            Width = 56
            Height = 21
            CalAlignment = dtaLeft
            Date = 43536.3871174653
            Format = 'HH:mm'
            Time = 43536.3871174653
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 28
            DataField = 'HORARIO_2_HASTA'
            DataSource = DMProyectos.DSQMProyectos
          end
          object DBEFAgente: TLFDBEditFind2000
            Left = 62
            Top = 69
            Width = 64
            Height = 21
            DataField = 'AGENTE_NULL'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            OnChange = DBEFAgenteChange
            AutoCambiarFoco = True
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            CampoADevolver = 'AGENTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMProyectos.EntornoBusqueda
          end
          object EAgente: TLFEdit
            Left = 127
            Top = 69
            Width = 360
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBMDirManual: TLFDBMemo
            Left = 735
            Top = 3
            Width = 285
            Height = 87
            Anchors = [akLeft, akTop, akRight]
            DataField = 'DIRECCION_MANUAL'
            DataSource = DMProyectos.DSQMProyectos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
          end
          object DBEEmpleados: TLFDbedit
            Left = 580
            Top = 135
            Width = 101
            Height = 21
            Color = clInfoBk
            DataField = 'EMPLEADOS'
            DataSource = DMProyectos.DSQMProyectos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1031
          Height = 207
          DataSource = DMProyectos.DSQMProyectos
          ReadOnly = True
          TitleFont.Color = clGrayText
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ACTUALIZA_ESTRUCTURA_ANALITICA'
            'CERRADO'
            'CONTABILIDAD_ANALITICA')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ACTUALIZA_ESTRUCTURA_ANALITICA'
            'BENEFICIOS'
            'CANAL_NULL'
            'CERRADO'
            'CLIENTE_NULL'
            'CODIGO_INTERNO'
            'CODIGO_POSTAL'
            'COMPRAS'
            'CONTABILIDAD_ANALITICA'
            'DIRECCION_TERCERO_NULL'
            'FECHA_FINAL'
            'FECHA_INICIO'
            'HORARIO_1_DESDE'
            'HORARIO_1_HASTA'
            'HORARIO_2_DESDE'
            'HORARIO_2_HASTA'
            'ID_P'
            'INDICE_SUFIJO'
            'KILOMETROS_DESTINO'
            'OTROS'
            'PROYECTO'
            'SERIE'
            'SUFIJO_CONTABLE'
            'TERCERO_NULL'
            'TITULO'
            'TITULO_DIRECCION'
            'TITULO_LOCALIDAD'
            'TITULO_PAIS'
            'TITULO_PROVINCIA'
            'VENTAS')
          Columns = <
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
              FieldName = 'TITULO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE_NULL'
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
              FieldName = 'NOMBRE_R_SOCIAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENTE_NULL'
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
              FieldName = 'NOMBRE_AGENTE'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FINAL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CERRADO'
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
              FieldName = 'COMPRAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VENTAS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OTROS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BENEFICIOS'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL_NULL'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 40
              Visible = True
            end>
        end
      end
      object TSContaAnalitica: TTabSheet
        Caption = '&Contabilidad Anal'#237'tica'
        ImageIndex = 2
        object LBLSufContable: TLFLabel
          Left = 11
          Top = 45
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sufijo Contable'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object LBLIndiceSuf: TLFLabel
          Left = 191
          Top = 45
          Width = 75
          Height = 13
          Alignment = taRightJustify
          Caption = #205'ndice del Sufijo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
        end
        object GBPlanContOrigen: TGroupBox
          Left = 14
          Top = 66
          Width = 560
          Height = 75
          Caption = ' Plan Cont. Anal'#237'tico de Origen '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          object LBLPlanContOri: TLFLabel
            Left = 10
            Top = 24
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plan Contable'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLSufContOri: TLFLabel
            Left = 6
            Top = 46
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Sufijo Contable'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object LBLIndiceSufOri: TLFLabel
            Left = 245
            Top = 46
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = #205'ndice del Sufijo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBEFPlanContOrigen: TLFDbedit
            Left = 81
            Top = 21
            Width = 87
            Height = 21
            Color = clInfoBk
            DataField = 'PLAN_CONTABLE'
            DataSource = DMProyectos.DSQMProyectos
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
          object DBESufijoContOrigen: TLFDbedit
            Left = 81
            Top = 43
            Width = 87
            Height = 21
            Color = clInfoBk
            DataField = 'SUFIJO_CONTABLE'
            DataSource = DMProyectos.DSxPlanContableOrigen
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
          object DBEPlanContOrigen: TLFDbedit
            Left = 169
            Top = 21
            Width = 374
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProyectos.DSxPlanContableOrigen
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEIndiceSufOrigen: TLFDbedit
            Left = 325
            Top = 43
            Width = 56
            Height = 21
            Color = clInfoBk
            DataField = 'INDICE_SUFIJO'
            DataSource = DMProyectos.DSxPlanContableOrigen
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
        object DBESufijoCont: TLFDbedit
          Left = 87
          Top = 42
          Width = 87
          Height = 21
          DataField = 'SUFIJO_CONTABLE'
          DataSource = DMProyectos.DSQMProyectos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBCBContabilidadAnalitica: TLFDBCheckBox
          Left = 585
          Top = 44
          Width = 145
          Height = 16
          Caption = 'Contabilidad Anal'#237'tica'
          ClicksDisabled = False
          ColorCheck = 57088
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'CONTABILIDAD_ANALITICA'
          DataSource = DMProyectos.DSQMProyectos
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCBActEstAnalitica: TLFDBCheckBox
          Left = 585
          Top = 67
          Width = 267
          Height = 16
          Caption = 'Actualiza Estructura Anal'#237'tica autom'#225'ticamente'
          ClicksDisabled = False
          ColorCheck = 57088
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'ACTUALIZA_ESTRUCTURA_ANALITICA'
          DataSource = DMProyectos.DSQMProyectos
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBEIndiceSufijo: TLFDbedit
          Left = 271
          Top = 42
          Width = 56
          Height = 21
          DataField = 'INDICE_SUFIJO'
          DataSource = DMProyectos.DSQMProyectos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object PaOtros: TLFPanel
          Left = 0
          Top = 0
          Width = 1031
          Height = 21
          Align = alTop
          AutoSize = True
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 5
          object LProyectoConta: TLFLabel
            Left = 0
            Top = 3
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object DBEProyectoConta: TLFDbedit
            Left = 47
            Top = 0
            Width = 85
            Height = 21
            Color = clInfoBk
            DataField = 'PROYECTO'
            DataSource = DMProyectos.DSQMProyectos
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
          object DBETituloConta: TLFDbedit
            Left = 133
            Top = 0
            Width = 375
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMProyectos.DSQMProyectos
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
    end
  end
  inherited TBActions: TLFToolBar
    Top = 501
    Width = 1043
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 265
    Width = 1043
    Height = 236
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 0
      Width = 1043
      Height = 236
      ActivePage = TSVentas
      Align = alClient
      OwnerDraw = True
      TabIndex = 2
      TabOrder = 0
      OnChange = PCDetalleChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSOfertas: TTabSheet
        Caption = '&Ofertas'
        ImageIndex = 1
        OnShow = TSOfertasShow
        object PCOfertas: TLFPageControl
          Left = 0
          Top = 22
          Width = 1035
          Height = 186
          ActivePage = TSTablaOfertas
          Align = alClient
          OwnerDraw = True
          TabIndex = 1
          TabOrder = 0
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSFichaOfertas: TTabSheet
            Caption = 'Ficha'
            object PNLEdOferas: TLFPanel
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LUdsMaxOfertas: TLFLabel
                Left = 388
                Top = 81
                Width = 70
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Unidades M'#225'x.'
                FocusControl = DBELineaOfertas
                Visible = False
              end
              object LTipoOfertas: TLFLabel
                Left = 183
                Top = 7
                Width = 33
                Height = 13
                AutoSize = False
                Caption = 'Tipo'
                FocusControl = DBETipoOfertas
              end
              object LSerieOfertas: TLFLabel
                Left = 106
                Top = 7
                Width = 44
                Height = 13
                AutoSize = False
                Caption = 'Serie'
                FocusControl = DBESerieOfertas
              end
              object LRIGOfertas: TLFLabel
                Left = 217
                Top = 7
                Width = 64
                Height = 13
                AutoSize = False
                Caption = 'RIG'
                FocusControl = DBERIGOfertas
              end
              object LPrecioUnitarioOfertas: TLFLabel
                Left = 530
                Top = 81
                Width = 85
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Precio Unitario'
                Visible = False
              end
              object LLineaOfertas: TLFLabel
                Left = 282
                Top = 7
                Width = 64
                Height = 13
                AutoSize = False
                Caption = 'L'#237'nea'
                FocusControl = DBELineaOfertas
                Visible = False
              end
              object LEjercicioOfertas: TLFLabel
                Left = 8
                Top = 7
                Width = 57
                Height = 13
                AutoSize = False
                Caption = 'Ejercicio'
                FocusControl = DBEEjercicioOfertas
              end
              object LCanalOfertas: TLFLabel
                Left = 66
                Top = 7
                Width = 39
                Height = 13
                AutoSize = False
                Caption = 'Canal'
                FocusControl = DBECanalOfertas
              end
              object LUnidadesOfertas: TLFLabel
                Left = 459
                Top = 81
                Width = 70
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Unidades'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
                Visible = False
              end
              object LTotalOfertas: TLFLabel
                Left = 616
                Top = 81
                Width = 85
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Total l'#237'nea'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
              end
              object LSuReferenciaOfertas: TLFLabel
                Left = 8
                Top = 81
                Width = 79
                Height = 13
                AutoSize = False
                Caption = 'Su Referencia'
                FocusControl = DBELineaOfertas
                Visible = False
              end
              object DBEArticuloOfertas: TLFDbedit
                Left = 8
                Top = 96
                Width = 379
                Height = 21
                Color = clInfoBk
                DataField = 'SU_REFERENCIA'
                DataSource = DMProyectos.DSQMOfertas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEUdsMaxOfertas: TLFDbedit
                Left = 388
                Top = 96
                Width = 70
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
                Visible = False
              end
              object DBETipoOfertas: TLFDbedit
                Left = 183
                Top = 22
                Width = 33
                Height = 21
                Color = clInfoBk
                DataField = 'TIPO'
                DataSource = DMProyectos.DSQMOfertas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBESerieOfertas: TLFDbedit
                Left = 106
                Top = 22
                Width = 76
                Height = 21
                Color = clInfoBk
                DataField = 'SERIE'
                DataSource = DMProyectos.DSQMOfertas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBERIGOfertas: TLFDbedit
                Left = 217
                Top = 22
                Width = 64
                Height = 21
                Color = clInfoBk
                DataField = 'RIG'
                DataSource = DMProyectos.DSQMOfertas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBELineaOfertas: TLFDbedit
                Left = 282
                Top = 22
                Width = 47
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
                Visible = False
              end
              object DBEImporteOfertas: TLFDbedit
                Left = 530
                Top = 96
                Width = 85
                Height = 21
                Color = clInfoBk
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
                Visible = False
              end
              object DBEEjercicioOfertas: TLFDbedit
                Left = 8
                Top = 22
                Width = 57
                Height = 21
                Color = clInfoBk
                DataField = 'EJERCICIO'
                DataSource = DMProyectos.DSQMOfertas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBECanalOfertas: TLFDbedit
                Left = 66
                Top = 22
                Width = 39
                Height = 21
                Color = clInfoBk
                DataField = 'CANAL'
                DataSource = DMProyectos.DSQMOfertas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBCBAfecTotalOfertas: TLFDBCheckBox
                Left = 8
                Top = 57
                Width = 109
                Height = 19
                Caption = 'Afectaci'#243'n Total'
                ClicksDisabled = False
                ColorCheck = 57088
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                TabStop = True
                Visible = False
                Alignment = taLeftJustify
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEUnidadesOfertas: TLFDbedit
                Left = 459
                Top = 96
                Width = 70
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
                Visible = False
              end
              object DBETotalOfertas: TLFDbedit
                Left = 616
                Top = 96
                Width = 85
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL'
                DataSource = DMProyectos.DSQMOfertas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
            end
          end
          object TSTablaOfertas: TTabSheet
            Caption = 'Tabla'
            ImageIndex = 1
            object DBGOfertas: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              Color = clInfoBk
              DataSource = DMProyectos.DSQMOfertas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clGrayText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGOfertasCellClick
              OnDrawColumnCell = DBGOfertasDrawColumnCell
              OnDblClick = DBGOfertasDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              ControlEdit = CEOfertas
              PermutaPaneles = True
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 46
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
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
                  FieldName = 'TIPO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 82
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 52
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SU_REFERENCIA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 154
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Visible = True
                end>
            end
          end
        end
        object TBOfertas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1035
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object NavOfertas: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMProyectos.DSQMOfertas
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            OnClickBefore = NavOfertasClickBefore
            Exclusivo = True
            ControlEdit = CEMain
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSCompras: TTabSheet
        Caption = '&Compras'
        ImageIndex = 2
        OnShow = TSComprasShow
        object TBCompras: TLFToolBar
          Left = 0
          Top = 0
          Width = 1035
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCompras: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMProyectos.DSQMCompras
            Flat = True
            ParentShowHint = False
            PopupMenu = CEComprasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            OnClickBefore = NavComprasClickBefore
            Exclusivo = True
            ControlEdit = CECompras
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLCompras: TLFPanel
            Left = 220
            Top = 0
            Width = 173
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object LTipoDocumentoCompra: TLFLabel
              Left = -53
              Top = 4
              Width = 150
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Tipo Documento'
            end
            object CBTipoDocumentoCompras: TLFComboBox
              Left = 102
              Top = 0
              Width = 56
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Text = 'Todos'
              OnChange = CBTipoDocumentoComprasChange
              Items.Strings = (
                'Todos'
                'OFP'
                'OCP'
                'PEP'
                'ALP'
                'FAP'
                'FCR')
            end
          end
        end
        object PCCompras: TLFPageControl
          Left = 0
          Top = 22
          Width = 1035
          Height = 186
          ActivePage = TScTabla
          Align = alClient
          OwnerDraw = True
          TabIndex = 1
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TScFicha: TTabSheet
            Caption = '&Ficha'
            object PNLEdCompras: TLFPanel
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object LUnidadesMaxCompras: TLFLabel
                Left = 388
                Top = 81
                Width = 70
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Unidades M'#225'x.'
                FocusControl = DBEcLinea
              end
              object LTipoCompras: TLFLabel
                Left = 183
                Top = 7
                Width = 33
                Height = 13
                AutoSize = False
                Caption = 'Tipo'
                FocusControl = DBEcTipo
              end
              object LSerieCompras: TLFLabel
                Left = 106
                Top = 7
                Width = 76
                Height = 13
                AutoSize = False
                Caption = 'Serie'
                FocusControl = DBEcSerie
              end
              object LRIGCompras: TLFLabel
                Left = 217
                Top = 7
                Width = 64
                Height = 13
                AutoSize = False
                Caption = 'RIG'
                FocusControl = DBEcRig
              end
              object LPrecioUnitarioCompras: TLFLabel
                Left = 530
                Top = 81
                Width = 85
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Precio Unitario'
              end
              object LLineaCompras: TLFLabel
                Left = 282
                Top = 7
                Width = 47
                Height = 13
                AutoSize = False
                Caption = 'L'#237'nea'
                FocusControl = DBEcLinea
              end
              object LEjercicioCompras: TLFLabel
                Left = 8
                Top = 7
                Width = 57
                Height = 13
                AutoSize = False
                Caption = 'Ejercicio'
                FocusControl = DBEcEjercicio
              end
              object LCanalCompras: TLFLabel
                Left = 66
                Top = 7
                Width = 39
                Height = 13
                AutoSize = False
                Caption = 'Canal'
                FocusControl = DBEcCanal
              end
              object LUnidadesCompras: TLFLabel
                Left = 459
                Top = 81
                Width = 70
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Unidades'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
              end
              object LTotalLineaCompras: TLFLabel
                Left = 616
                Top = 81
                Width = 85
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Total l'#237'nea'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
              end
              object LTituloCompras: TLFLabel
                Left = 114
                Top = 81
                Width = 83
                Height = 13
                AutoSize = False
                Caption = 'T'#237'tulo Art'#237'culo'
                FocusControl = DBEcLinea
              end
              object LArticuloCompras: TLFLabel
                Left = 8
                Top = 81
                Width = 83
                Height = 13
                AutoSize = False
                Caption = 'Art'#237'culo'
                FocusControl = DBEcLinea
              end
              object DBEcArticulo: TLFDbedit
                Left = 8
                Top = 96
                Width = 105
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEcUniMax: TLFDbedit
                Left = 388
                Top = 96
                Width = 70
                Height = 21
                Color = clInfoBk
                DataField = 'UNI_MAX'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBEcTitulo: TLFDbedit
                Left = 114
                Top = 96
                Width = 273
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 8
              end
              object DBEcTipo: TLFDbedit
                Left = 183
                Top = 22
                Width = 33
                Height = 21
                Color = clInfoBk
                DataField = 'TIPO'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 3
              end
              object DBEcSerie: TLFDbedit
                Left = 106
                Top = 22
                Width = 76
                Height = 21
                Color = clInfoBk
                DataField = 'SERIE'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 2
              end
              object DBEcRig: TLFDbedit
                Left = 217
                Top = 22
                Width = 64
                Height = 21
                Color = clInfoBk
                DataField = 'RIG'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBEcPrecio: TLFDbedit
                Left = 530
                Top = 96
                Width = 85
                Height = 21
                Color = clInfoBk
                DataField = 'IMPORTE'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 11
              end
              object DBEcLinea: TLFDbedit
                Left = 282
                Top = 22
                Width = 47
                Height = 21
                Color = clInfoBk
                DataField = 'LINEA'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBEcEjercicio: TLFDbedit
                Left = 8
                Top = 22
                Width = 57
                Height = 21
                Color = clInfoBk
                DataField = 'EJERCICIO'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
              object DBEcCanal: TLFDbedit
                Left = 66
                Top = 22
                Width = 39
                Height = 21
                Color = clInfoBk
                DataField = 'CANAL'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 1
              end
              object DBCBcAfecTotal: TLFDBCheckBox
                Left = 8
                Top = 57
                Width = 109
                Height = 19
                Caption = 'Afectaci'#243'n Total'
                ClicksDisabled = False
                ColorCheck = 57088
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'AFEC_TOTAL'
                DataSource = DMProyectos.DSQMCompras
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEcUnidades: TLFDbedit
                Left = 459
                Top = 96
                Width = 70
                Height = 21
                DataField = 'UNIDADES'
                DataSource = DMProyectos.DSQMCompras
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
              object DBEcTotal: TLFDbedit
                Left = 616
                Top = 96
                Width = 85
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL'
                DataSource = DMProyectos.DSQMCompras
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 12
              end
            end
          end
          object TScTabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TScTablaShow
            object DBGCompras: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              Color = clInfoBk
              DataSource = DMProyectos.DSQMCompras
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clGrayText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGComprasCellClick
              OnDrawColumnCell = DBGComprasDrawColumnCell
              OnDblClick = DBGComprasDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              ControlEdit = CECompras
              PermutaPaneles = True
              CamposAMarcar.Strings = (
                'AFEC_TOTAL')
              CamposChecked.Strings = (
                '1')
              CamposNoChecked.Strings = (
                '0')
              CamposAOrdenar.Strings = (
                'ARTICULO'
                'FECHA'
                'IMPORTE'
                'RIG')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 46
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 28
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 53
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RIG'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
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
                  FieldName = 'RAZON_SOCIAL'
                  Width = 202
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 26
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 153
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AFEC_TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNI_MAX'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end>
            end
          end
        end
      end
      object TSVentas: TTabSheet
        Caption = '&Ventas'
        OnShow = TSVentasShow
        object TBVentas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1035
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavVentas: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMProyectos.DSQMVentas
            Flat = True
            ParentShowHint = False
            PopupMenu = CEVentasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBCBvAfecTotal
            OnClickBefore = NavVentasClickBefore
            Exclusivo = True
            ControlEdit = CEVentas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object PNLVentas: TLFPanel
            Left = 220
            Top = 0
            Width = 173
            Height = 22
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object LTipoDocumentoVentas: TLFLabel
              Left = -53
              Top = 4
              Width = 150
              Height = 13
              Alignment = taRightJustify
              AutoSize = False
              Caption = 'Tipo Documento'
            end
            object CBTipoDocumentoVentas: TLFComboBox
              Left = 102
              Top = 0
              Width = 56
              Height = 21
              ItemHeight = 13
              TabOrder = 0
              Text = 'Todos'
              OnChange = CBTipoDocumentoVentasChange
              Items.Strings = (
                'Todos'
                'OFC'
                'PEC'
                'ALB'
                'FAC')
            end
          end
        end
        object PCVentas: TLFPageControl
          Left = 0
          Top = 22
          Width = 1035
          Height = 186
          ActivePage = TSvTabla
          Align = alClient
          OwnerDraw = True
          TabIndex = 1
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSvFicha: TTabSheet
            Caption = '&Ficha'
            object PNLEdVentas: TLFPanel
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              object LUnidadesMaxVentas: TLFLabel
                Left = 388
                Top = 81
                Width = 70
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Unidades M'#225'x.'
                FocusControl = DBEvLinea
              end
              object LTipoVentas: TLFLabel
                Left = 183
                Top = 7
                Width = 33
                Height = 13
                AutoSize = False
                Caption = 'Tipo'
                FocusControl = DBEvTipo
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LSerieVientas: TLFLabel
                Left = 106
                Top = 7
                Width = 76
                Height = 13
                AutoSize = False
                Caption = 'Serie'
                FocusControl = DBEvSerie
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LRIGVentas: TLFLabel
                Left = 217
                Top = 7
                Width = 64
                Height = 13
                AutoSize = False
                Caption = 'RIG'
                FocusControl = DBEvRig
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LPrecioUnitarioVentas: TLFLabel
                Left = 530
                Top = 81
                Width = 85
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Precio Unitario'
              end
              object LLineaVentas: TLFLabel
                Left = 282
                Top = 7
                Width = 47
                Height = 13
                AutoSize = False
                Caption = 'L'#237'nea'
                FocusControl = DBEvLinea
              end
              object LEjercicioVentas: TLFLabel
                Left = 8
                Top = 7
                Width = 57
                Height = 13
                AutoSize = False
                Caption = 'Ejercicio'
                FocusControl = DBEvEjercicio
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LCanalVentas: TLFLabel
                Left = 66
                Top = 7
                Width = 39
                Height = 13
                AutoSize = False
                Caption = 'Canal'
                FocusControl = DBEvCanal
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LTotalLineaVentas: TLFLabel
                Left = 616
                Top = 81
                Width = 85
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Total l'#237'nea'
                Layout = tlCenter
              end
              object LUnidadesVentas: TLFLabel
                Left = 459
                Top = 81
                Width = 70
                Height = 13
                Alignment = taCenter
                AutoSize = False
                Caption = 'Unidades'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                Layout = tlCenter
              end
              object LTituloVentas: TLFLabel
                Left = 114
                Top = 81
                Width = 83
                Height = 13
                AutoSize = False
                Caption = 'T'#237'tulo Art'#237'culo'
                FocusControl = DBEcLinea
              end
              object LArticuloVentas: TLFLabel
                Left = 8
                Top = 81
                Width = 83
                Height = 13
                AutoSize = False
                Caption = 'Art'#237'culo'
                FocusControl = DBEcLinea
              end
              object DBEvArticulo: TLFDbedit
                Left = 8
                Top = 96
                Width = 105
                Height = 21
                Color = clInfoBk
                DataField = 'ARTICULO'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 7
              end
              object DBEvTitulo: TLFDbedit
                Left = 114
                Top = 96
                Width = 273
                Height = 21
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 8
              end
              object DBEvTipo: TLFDbedit
                Left = 183
                Top = 22
                Width = 33
                Height = 21
                Color = clInfoBk
                DataField = 'TIPO'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBEvSerie: TLFDbedit
                Left = 106
                Top = 22
                Width = 76
                Height = 21
                Color = clInfoBk
                DataField = 'SERIE'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 2
              end
              object DBEvRig: TLFDbedit
                Left = 217
                Top = 22
                Width = 64
                Height = 21
                Color = clInfoBk
                DataField = 'RIG'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 4
              end
              object DBEvMax: TLFDbedit
                Left = 388
                Top = 96
                Width = 70
                Height = 21
                Color = clInfoBk
                DataField = 'UNI_MAX'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 9
              end
              object DBEvLinea: TLFDbedit
                Left = 282
                Top = 22
                Width = 47
                Height = 21
                Color = clInfoBk
                DataField = 'LINEA'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
              end
              object DBEvImporte: TLFDbedit
                Left = 530
                Top = 96
                Width = 85
                Height = 21
                Color = clInfoBk
                DataField = 'IMPORTE'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 11
              end
              object DBEvEjercicio: TLFDbedit
                Left = 8
                Top = 22
                Width = 57
                Height = 21
                Color = clInfoBk
                DataField = 'EJERCICIO'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEvCanal: TLFDbedit
                Left = 66
                Top = 22
                Width = 39
                Height = 21
                Color = clInfoBk
                DataField = 'CANAL'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
              object DBCBvAfecTotal: TLFDBCheckBox
                Left = 8
                Top = 57
                Width = 109
                Height = 19
                Caption = 'Afectaci'#243'n Total'
                ClicksDisabled = False
                ColorCheck = 57088
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'AFEC_TOTAL'
                DataSource = DMProyectos.DSQMVentas
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEvTotal: TLFDbedit
                Left = 616
                Top = 96
                Width = 85
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL'
                DataSource = DMProyectos.DSQMVentas
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 12
              end
              object DBEvUnidades: TLFDbedit
                Left = 459
                Top = 96
                Width = 70
                Height = 21
                DataField = 'UNIDADES'
                DataSource = DMProyectos.DSQMVentas
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 10
              end
            end
          end
          object TSvTabla: TTabSheet
            Caption = '&Tabla'
            ImageIndex = 1
            OnShow = TSvTablaShow
            object DBGVentas: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              Color = clInfoBk
              DataSource = DMProyectos.DSQMVentas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clGrayText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnCellClick = DBGVentasCellClick
              OnDrawColumnCell = DBGVentasDrawColumnCell
              OnDblClick = DBGVentasDblClick
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              ControlEdit = CEVentas
              PermutaPaneles = True
              CamposAMarcar.Strings = (
                'AFEC_TOTAL')
              CamposChecked.Strings = (
                '1')
              CamposNoChecked.Strings = (
                '0')
              CamposAOrdenar.Strings = (
                'ARTICULO'
                'FECHA'
                'IMPORTE'
                'RIG')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'EJERCICIO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 46
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CANAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 28
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERIE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
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
                  FieldName = 'RIG'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 75
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'RAZON_SOCIAL'
                  Width = 175
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LINEA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 26
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 153
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AFEC_TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNI_MAX'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Alignment = taRightJustify
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO_DOC_TRIBUTARIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FOLIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'NIF'
                  Visible = True
                end>
            end
          end
        end
      end
      object TSOtros: TTabSheet
        Caption = '&Otros'
        ImageIndex = 3
        OnShow = TSOtrosShow
        object TBOtros: TLFToolBar
          Left = 0
          Top = 0
          Width = 1035
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
          object NavOtros: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMProyectos.DSQMOtros
            Flat = True
            ParentShowHint = False
            PopupMenu = CEOtrosPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavOtrosBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEUnidades
            InsertaControl = DBDateTimeFecha
            Exclusivo = True
            ControlEdit = CEOtros
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCOtros: TLFPageControl
          Left = 0
          Top = 22
          Width = 1035
          Height = 186
          ActivePage = TSoFicha
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSoFicha: TTabSheet
            Caption = 'F&icha'
            object PNLEdOtros: TLFPanel
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              DesignSize = (
                1027
                160)
              object LMoneda: TLFLabel
                Left = 434
                Top = 51
                Width = 39
                Height = 13
                Alignment = taRightJustify
                Caption = 'Moneda'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LFecha: TLFLabel
                Left = 239
                Top = 8
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
              object LTitulo: TLFLabel
                Left = 26
                Top = 51
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'T'#237'tulo'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LNotasOtros: TLFLabel
                Left = 26
                Top = 95
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'Notas'
              end
              object LUnidades: TLFLabel
                Left = 9
                Top = 74
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Unidades'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LImporte: TLFLabel
                Left = 211
                Top = 74
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Importe'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LTotal: TLFLabel
                Left = 449
                Top = 74
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LSemana: TLFLabel
                Left = 369
                Top = 8
                Width = 56
                Height = 13
                Caption = 'Semana %d'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LLinea: TLFLabel
                Left = 26
                Top = 8
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'L'#237'nea'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LUsuario: TLFLabel
                Left = 20
                Top = 30
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Usuario'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBEMoneda: TLFDbedit
                Left = 479
                Top = 48
                Width = 55
                Height = 21
                Color = clInfoBk
                DataField = 'MONEDA'
                DataSource = DMProyectos.DSQMOtros
                Enabled = False
                ReadOnly = True
                TabOrder = 7
              end
              object DBDateTimeFecha: TLFDBDateEdit
                Left = 276
                Top = 4
                Width = 87
                Height = 21
                DataField = 'FECHA'
                DataSource = DMProyectos.DSQMOtros
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 1
                OnChange = DBDateTimeFechaChange
              end
              object DBETituloOtro: TLFDbedit
                Left = 60
                Top = 48
                Width = 303
                Height = 21
                DataField = 'TITULO'
                DataSource = DMProyectos.DSQMOtros
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBNotasOtros: TLFDBMemo
                Left = 60
                Top = 92
                Width = 960
                Height = 65
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'NOTAS'
                DataSource = DMProyectos.DSQMOtros
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 9
              end
              object DBEUnidades: TLFDbedit
                Left = 60
                Top = 70
                Width = 110
                Height = 21
                DataField = 'UNIDADES'
                DataSource = DMProyectos.DSQMOtros
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBImporte: TLFDbedit
                Left = 252
                Top = 70
                Width = 111
                Height = 21
                DataField = 'IMPORTE'
                DataSource = DMProyectos.DSQMOtros
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 6
              end
              object DBETotal: TLFDbedit
                Left = 479
                Top = 70
                Width = 111
                Height = 21
                Color = clInfoBk
                DataField = 'TOTAL'
                DataSource = DMProyectos.DSQMOtros
                Enabled = False
                ReadOnly = True
                TabOrder = 8
              end
              object DBELinea: TLFDbedit
                Left = 60
                Top = 4
                Width = 65
                Height = 21
                Color = clInfoBk
                DataField = 'LINEA'
                DataSource = DMProyectos.DSQMOtros
                Enabled = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEFUsuario: TLFDBEditFind2000
                Left = 60
                Top = 26
                Width = 65
                Height = 21
                DataField = 'USUARIO'
                DataSource = DMProyectos.DSQMOtros
                ReadOnly = True
                TabOrder = 2
                OnChange = DBEFUsuarioChange
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
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'NOMBRE')
                Filtros = []
              end
              object EUsuario: TLFEdit
                Left = 127
                Top = 26
                Width = 236
                Height = 21
                TabStop = False
                Color = clInfoBk
                Enabled = False
                TabOrder = 3
              end
            end
          end
          object TSoTabla: TTabSheet
            Caption = 'T&abla'
            ImageIndex = 1
            OnShow = TSoTablaShow
            object DBGOtros: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              DataSource = DMProyectos.DSQMOtros
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clGrayText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              ControlEdit = CEOtros
              TabFicha = TSoFicha
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'FECHA'
                'LINEA'
                'TOTAL'
                'UNIDADES')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
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
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Width = 97
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
                  Width = 249
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'MONEDA'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
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
                  FieldName = 'TOTAL'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clGrayText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  Title.Font.Charset = DEFAULT_CHARSET
                  Title.Font.Color = clWindowText
                  Title.Font.Height = -11
                  Title.Font.Name = 'MS Sans Serif'
                  Title.Font.Style = []
                  Visible = True
                end>
            end
          end
        end
      end
      object TSEmpleados: TTabSheet
        Caption = 'Empleados'
        ImageIndex = 6
        OnShow = TSEmpleadosShow
        object TBEmpleados: TLFToolBar
          Left = 0
          Top = 0
          Width = 1035
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
          object NavEmpleados: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMProyectos.DSQMEmpleados
            Flat = True
            ParentShowHint = False
            PopupMenu = CEEmpleadosPMEdit
            ShowHint = True
            TabOrder = 0
            BeforeAction = NavEmpleadosBeforeAction
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBEFEmpleado
            InsertaControl = DBEFEmpleado
            Exclusivo = True
            ControlEdit = CEEmpleados
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCEmpleados: TLFPageControl
          Left = 0
          Top = 22
          Width = 1035
          Height = 186
          ActivePage = TSTablaEmpleado
          Align = alClient
          MultiLine = True
          OwnerDraw = True
          TabIndex = 1
          TabOrder = 1
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSFichaEmpleado: TTabSheet
            Caption = 'Ficha'
            object PNLEdEmpleados: TLFPanel
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              DesignSize = (
                1027
                160)
              object LFLabel3: TLFLabel
                Left = 239
                Top = 8
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
              object LFLabel5: TLFLabel
                Left = 26
                Top = 73
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'Notas'
              end
              object LFLabel6: TLFLabel
                Left = 9
                Top = 52
                Width = 45
                Height = 13
                Alignment = taRightJustify
                Caption = 'Unidades'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LFLabel7: TLFLabel
                Left = 211
                Top = 52
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Importe'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LFLabel8: TLFLabel
                Left = 449
                Top = 52
                Width = 24
                Height = 13
                Alignment = taRightJustify
                Caption = 'Total'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LSemanaEmpleado: TLFLabel
                Left = 369
                Top = 8
                Width = 56
                Height = 13
                Caption = 'Semana %d'
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentColor = False
                ParentFont = False
              end
              object LFLabel10: TLFLabel
                Left = 26
                Top = 8
                Width = 28
                Height = 13
                Alignment = taRightJustify
                Caption = 'L'#237'nea'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object LEmpleado: TLFLabel
                Left = 9
                Top = 30
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Empleado'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object DBDEEmpleadoFecha: TLFDBDateEdit
                Left = 276
                Top = 4
                Width = 87
                Height = 21
                DataField = 'FECHA'
                DataSource = DMProyectos.DSQMEmpleados
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 1
                OnChange = DBDEEmpleadoFechaChange
              end
              object DBEEmpleadoTitulo: TLFDbedit
                Left = 126
                Top = 26
                Width = 303
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TITULO'
                DataSource = DMProyectos.DSQMEmpleados
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
              end
              object DBMEmpleadoNotas: TLFDBMemo
                Left = 60
                Top = 70
                Width = 960
                Height = 87
                Anchors = [akLeft, akTop, akRight, akBottom]
                DataField = 'NOTAS'
                DataSource = DMProyectos.DSQMEmpleados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 7
              end
              object DBEEmpleadosUnidades: TLFDbedit
                Left = 60
                Top = 48
                Width = 110
                Height = 21
                DataField = 'UNIDADES'
                DataSource = DMProyectos.DSQMEmpleados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 4
              end
              object DBEEmpleadoImporte: TLFDbedit
                Left = 252
                Top = 48
                Width = 111
                Height = 21
                DataField = 'IMPORTE'
                DataSource = DMProyectos.DSQMEmpleados
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 5
              end
              object DBEEmpleadoTotal: TLFDbedit
                Left = 479
                Top = 48
                Width = 111
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'TOTAL'
                DataSource = DMProyectos.DSQMEmpleados
                Enabled = False
                ReadOnly = True
                TabOrder = 6
              end
              object DBEEmpleadoLinea: TLFDbedit
                Left = 60
                Top = 4
                Width = 65
                Height = 21
                TabStop = False
                Color = clInfoBk
                DataField = 'LINEA'
                DataSource = DMProyectos.DSQMEmpleados
                Enabled = False
                ReadOnly = True
                TabOrder = 0
              end
              object DBEFEmpleado: TLFDBEditFind2000
                Left = 60
                Top = 26
                Width = 65
                Height = 21
                DataField = 'EMPLEADO'
                DataSource = DMProyectos.DSQMEmpleados
                TabOrder = 2
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_EMPLEADOS_EF'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'EMPLEADO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'ACTIVO = 1'
                ReemplazarCaracter = True
                SalirSiNoExiste = False
                SalirSiVacio = False
                OrdenadoPor.Strings = (
                  'EMPLEADO')
                Filtros = []
              end
            end
          end
          object TSTablaEmpleado: TTabSheet
            Caption = 'Tabla'
            ImageIndex = 1
            object DBGEmpleados: THYTDBGrid
              Left = 0
              Top = 0
              Width = 1027
              Height = 160
              Align = alClient
              DataSource = DMProyectos.DSQMEmpleados
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clGrayText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              ControlEdit = CEEmpleados
              TabFicha = TSoFicha
              PermutaPaneles = True
              CamposAOrdenar.Strings = (
                'FECHA'
                'LINEA'
                'TOTAL'
                'UNIDADES')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'EMPLEADO'
                  Width = 60
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TITULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'IMPORTE'
                  Width = 80
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TOTAL'
                  Width = 80
                  Visible = True
                end>
            end
          end
        end
      end
      object TSReparaciones: TTabSheet
        Caption = '&Reparaciones'
        ImageIndex = 4
        OnShow = TSReparacionesShow
        object TBReparaciones: TLFToolBar
          Left = 0
          Top = 0
          Width = 1035
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavReparaciones: THYMNavigator
            Left = 0
            Top = 0
            Width = 110
            Height = 22
            DataSource = DMProyectos.DSQMReparaciones
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEReparacionesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            OnClickBefore = NavOfertasClickBefore
            Exclusivo = True
            ControlEdit = CEReparaciones
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLReparaciones: TLFPanel
          Left = 0
          Top = 22
          Width = 1035
          Height = 186
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGReparaciones: THYTDBGrid
            Left = 0
            Top = 0
            Width = 1035
            Height = 186
            Align = alClient
            Color = clInfoBk
            DataSource = DMProyectos.DSQMReparaciones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clGrayText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGReparacionesCellClick
            OnDrawColumnCell = DBGReparacionesDrawColumnCell
            OnDblClick = DBGReparacionesDblClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            ControlEdit = CEReparaciones
            PermutaPaneles = True
            CamposAOrdenar.Strings = (
              'ARTICULO'
              'FECHA_ENTRADA'
              'FECHA_SALIDA'
              'REPARACION'
              'TITULO_ART'
              'TITULO_TIPO')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
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
                FieldName = 'SERIE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'REPARACION'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 67
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LINEA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 32
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_ENTRADA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ARTICULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_ART'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 153
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 55
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO_VENTA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_SALIDA'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_TIPO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
      end
      object TSOrdenes: TTabSheet
        Caption = '&Ordenes'
        ImageIndex = 5
        object PNLOrdenes: TLFPanel
          Left = 0
          Top = 22
          Width = 1035
          Height = 186
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGOrdenes: THYTDBGrid
            Left = 0
            Top = 0
            Width = 1035
            Height = 186
            Align = alClient
            Color = clInfoBk
            DataSource = DMProyectos.DSQMOrdenes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clGrayText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGOrdenesCellClick
            OnDrawColumnCell = DBGOrdenesDrawColumnCell
            OnDblClick = DBGOrdenesDblClick
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            ControlEdit = CEOrdenes
            PermutaPaneles = True
            CamposAOrdenar.Strings = (
              'ARTICULO'
              'FECHA_ENTRADA'
              'FECHA_SALIDA'
              'REPARACION'
              'TITULO_ART'
              'TITULO_TIPO')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ID_ORDEN'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'EJERCICIO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 46
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
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
                FieldName = 'SERIES'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 79
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RIG_OF'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_ORD'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Width = 69
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPUESTO'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_SITUACION'
                Title.Font.Charset = DEFAULT_CHARSET
                Title.Font.Color = clWindowText
                Title.Font.Height = -11
                Title.Font.Name = 'MS Sans Serif'
                Title.Font.Style = []
                Visible = True
              end>
          end
        end
        object TBOrdenes: TLFToolBar
          Left = 0
          Top = 0
          Width = 1035
          Height = 22
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 1
          Separators = True
          object NavOrdenes: THYMNavigator
            Left = 0
            Top = 0
            Width = 110
            Height = 22
            DataSource = DMProyectos.DSQMOrdenes
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEOrdenesPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            OnClickBefore = NavOfertasClickBefore
            Exclusivo = True
            ControlEdit = CEOrdenes
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CECompras
    Left = 720
    Top = 260
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 720
    Top = 294
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    Left = 754
    Top = 6
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object ACreaPlanCont: TAction
      Category = 'Procesos'
      Caption = 'Crear Plan Cont. Analitico para el Proyecto'
      Hint = 'Crear Plan Cont. Analitico para el Proyecto'
      ImageIndex = 94
      OnExecute = ACreaPlanContExecute
    end
    object ADestruyePlanCont: TAction
      Category = 'Procesos'
      Caption = 'Eliminar Plan Contable Analitico para el Proyecto'
      Hint = 'Eliminar Plan Contable Analitico para el Proyecto'
      OnExecute = ADestruyePlanContExecute
    end
    object AListarProyectos: TAction
      Category = 'Listados'
      Caption = 'Listado Proyectos'
      Hint = 'Imprimir Proyectos'
      ImageIndex = 14
      OnExecute = AListarProyectosExecute
    end
    object AConfListadoProyectos: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listado'
      Hint = 'Configuraci'#243'n Listado Proyectos'
      ImageIndex = 77
      OnExecute = AConfListadoProyectosExecute
    end
    object AAsignaHistorico: TAction
      Category = 'Procesos'
      Caption = 'Asignar Proyectos a Hist'#243'rico de Documentos'
      Hint = 'Asignar Proyectos a Hist'#243'rico de Documentos de Compras y Ventas'
      ImageIndex = 43
      OnExecute = AAsignaHistoricoExecute
    end
    object AAdjuntosProyecto: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del proyecto'
      ImageIndex = 59
      OnExecute = AAdjuntosProyectoExecute
    end
    object AAccionComercial: TAction
      Category = 'Procesos'
      Caption = 'Crea Accion Comercial'
      Hint = 'Crea Accion Comercial asociada al Proyecto'
      ImageIndex = 59
      OnExecute = AAccionComercialExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 720
    Top = 6
  end
  object CEVentas: TControlEdit
    EnlazadoA = CEOtros
    FichaEdicion = TSvFicha
    FichaExclusiva = TSVentas
    PanelEdicion = PNLEdVentas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEVentasPMEdit
    Teclas = DMMain.Teclas
    Left = 836
    Top = 260
  end
  object CECompras: TControlEdit
    EnlazadoA = CEVentas
    FichaEdicion = TScFicha
    FichaExclusiva = TSCompras
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEComprasPMEdit
    Teclas = DMMain.Teclas
    Left = 798
    Top = 260
  end
  object CEComprasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 798
    Top = 294
    object CEComprasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEComprasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEComprasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEComprasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEComprasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEComprasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEComprasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEComprasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEComprasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEComprasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEVentasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 836
    Top = 294
    object CEVentasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEVentasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEVentasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEVentasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEVentasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEVentasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEVentasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEVentasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEVentasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEVentasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEOtros: TControlEdit
    DataSource = DMProyectos.DSQMOtros
    EnlazadoA = CEEmpleados
    FichaEdicion = TSoFicha
    FichaExclusiva = TSOtros
    PanelEdicion = PNLEdOtros
    SubComplementario = ALMain
    PopUpMenu = CEOtrosPMEdit
    Teclas = DMMain.Teclas
    Left = 874
    Top = 260
  end
  object CEOtrosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 874
    Top = 294
    object CEOtrosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEOtrosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEOtrosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEOtrosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEOtrosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEOtrosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
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
    end
  end
  object CEEmpleados: TControlEdit
    DataSource = DMProyectos.DSQMEmpleados
    EnlazadoA = CEReparaciones
    FichaEdicion = TSFichaEmpleado
    FichaExclusiva = TSEmpleados
    PanelEdicion = PNLEdEmpleados
    SubComplementario = ALMain
    PopUpMenu = CEEmpleadosPMEdit
    Teclas = DMMain.Teclas
    Left = 986
    Top = 260
  end
  object CEEmpleadosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 986
    Top = 294
    object CEEmpleadosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEEmpleadosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEEmpleadosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEEmpleadosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEEmpleadosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEEmpleadosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEEmpleadosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEEmpleadosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEEmpleadosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEEmpleadosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEOfertas: TControlEdit
    DataSource = DMProyectos.DSQMOfertas
    EnlazadoA = CECompras
    FichaEdicion = TSFichaOfertas
    FichaExclusiva = TSOfertas
    SubComplementario = ALMain
    PopUpMenu = CEOfertasPMEdit
    Teclas = DMMain.Teclas
    Left = 762
    Top = 260
  end
  object CEOfertasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 762
    Top = 294
    object CEOfertasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEOfertasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEOfertasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEOfertasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEOfertasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEOfertasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEOfertasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEOfertasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEOfertasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEOfertasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEReparaciones: TControlEdit
    DataSource = DMProyectos.DSQMReparaciones
    EnlazadoA = CEMain
    FichaEdicion = TSReparaciones
    FichaExclusiva = TSReparaciones
    PanelEdicion = PNLReparaciones
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEReparacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 912
    Top = 260
  end
  object CEReparacionesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 912
    Top = 294
    object MenuItem11: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem12: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem13: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem14: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem15: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem16: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem17: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem18: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem19: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem20: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem21: TMenuItem
      Caption = '-'
    end
    object MenuItem22: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem23: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem24: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem25: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem26: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object MenuItem27: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object MenuItem28: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
      Visible = False
    end
    object MenuItem29: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object MenuItem30: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
      Visible = False
    end
    object MenuItem31: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
  end
  object CEOrdenes: TControlEdit
    DataSource = DMProyectos.DSQMOrdenes
    EnlazadoA = CEMain
    FichaEdicion = TSOrdenes
    FichaExclusiva = TSOrdenes
    PanelEdicion = PNLOrdenes
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CEOrdenesPMEdit
    Teclas = DMMain.Teclas
    Left = 948
    Top = 260
  end
  object CEOrdenesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 948
    Top = 294
    object MenuItem1: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object MenuItem2: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object MenuItem3: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object MenuItem4: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object MenuItem5: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object MenuItem6: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object MenuItem7: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object MenuItem8: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object MenuItem9: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object MenuItem10: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object MenuItem32: TMenuItem
      Caption = '-'
    end
    object MenuItem33: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object MenuItem34: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object MenuItem35: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object MenuItem36: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object MenuItem37: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
      Visible = False
    end
    object MenuItem38: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object MenuItem39: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
      Visible = False
    end
    object MenuItem40: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object MenuItem41: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
      Visible = False
    end
    object MenuItem42: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
  end
end
