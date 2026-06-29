inherited ProFMUtillajes: TProFMUtillajes
  Left = 425
  Top = 211
  Width = 600
  Height = 479
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Utillajes'
  PopupMenu = CEIntervencionPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 426
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = ProDMUtillajes.DSQMProSysUtillajes
        Hints.Strings = ()
        EditaControl = DBDescripcion
        InsertaControl = DBCodigo
        OnChangeState = NavMainChangeState
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 396
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        object SBAArticulo: TSpeedButton [0]
          Left = 170
          Top = 60
          Width = 220
          Height = 20
          Hint = 'Doble click o Ctrl+Alt+T para ver los datos del Art'#237'culo'
          GroupIndex = -1
          OnDblClick = SBAArticuloDblClick
        end
        object SBACliente: TSpeedButton [1]
          Left = 164
          Top = 120
          Width = 311
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          Caption = 'Ver Datos Cliente'
          OnDblClick = SBAClienteDblClick
        end
        object SBAProyecto: TSpeedButton [2]
          Left = 130
          Top = 94
          Width = 162
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+A para ver los datos del Agente'
          GroupIndex = -1
          OnDblClick = SBAProyectoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 578
          Height = 368
          OnResize = PEditResize
          inherited G2KTableLoc: TG2KTBLoc
            Top = 1
            DataSource = ProDMUtillajes.DSQMProSysUtillajes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_SYS_UTILLAJES'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object Imagen: TImage
            Left = 249
            Top = 193
            Width = 329
            Height = 175
            Align = alClient
            Center = True
            Proportional = True
          end
          object Splitter1: TSplitter
            Left = 241
            Top = 193
            Width = 8
            Height = 175
            Cursor = crHSplit
            Color = clGray
            ParentColor = False
          end
          object PNLEditDatos: TLFPanel
            Left = 0
            Top = 0
            Width = 578
            Height = 193
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            OnResize = PNLEditDatosResize
            DesignSize = (
              578
              193)
            object LblUtillaje: TLFLabel
              Left = 40
              Top = 12
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Utillaje'
            end
            object LblImagen: TLFLabel
              Left = 34
              Top = 77
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Imagen'
            end
            object LblDescripcion: TLFLabel
              Left = 15
              Top = 35
              Width = 56
              Height = 13
              Alignment = taRightJustify
              Caption = 'Descripci'#243'n'
            end
            object LblArticulo: TLFLabel
              Left = 34
              Top = 57
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Art'#237'culo'
            end
            object LNotas: TLFLabel
              Left = 0
              Top = 180
              Width = 578
              Height = 13
              Align = alBottom
              Caption = 'Notas'
            end
            object LCliente: TLFLabel
              Left = 38
              Top = 100
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cliente'
            end
            object LProyecto: TLFLabel
              Left = 28
              Top = 122
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Proyecto'
            end
            object DBETituloCliente: TLFDbedit
              Left = 146
              Top = 96
              Width = 427
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clAqua
              DataField = 'NOMBRE_R_SOCIAL'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
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
            object ETituloImagen: TLFEdit
              Left = 146
              Top = 74
              Width = 427
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
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
            object DBETituloArticulo: TLFDbedit
              Left = 169
              Top = 52
              Width = 404
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clAqua
              DataField = 'TITULO_ART'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
              OnDblClick = DBETituloArticuloDblClick
            end
            object EFArticulo: TLFDBEditFind2000
              Left = 74
              Top = 52
              Width = 94
              Height = 21
              AutoSize = False
              DataField = 'ARTICULO'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              TabOrder = 2
              OnChange = EFArticuloChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ART_ARTICULOS'
              Tabla_asociada.DesplegarBusqueda = False
              Campos_Desplegar.Strings = (
                '')
              CampoNum = 'ARTICULO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'ARTICULO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFImagen: TLFFibDBEditFind
              Left = 74
              Top = 74
              Width = 71
              Height = 21
              DataField = 'IMAGEN'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              TabOrder = 4
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
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'CODIGO')
            end
            object DBDescripcion: TLFDbedit
              Left = 74
              Top = 30
              Width = 499
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'DESCRIPCION'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              TabOrder = 1
            end
            object DBCodigo: TLFDbedit
              Left = 74
              Top = 8
              Width = 71
              Height = 21
              DataField = 'CODIGO'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              TabOrder = 0
            end
            object BClipboard: TButton
              Left = 548
              Top = 76
              Width = 23
              Height = 19
              Hint = 'Cargar imagen desde porta papeles'
              Anchors = [akTop, akRight]
              Caption = 'P'
              TabOrder = 7
              Visible = False
              OnClick = BClipboardClick
            end
            object BCargarImagen: TButton
              Left = 525
              Top = 76
              Width = 23
              Height = 19
              Anchors = [akTop, akRight]
              Caption = '...'
              TabOrder = 6
              Visible = False
              OnClick = BCargarImagenClick
            end
            object DBEFCliente: TLFDBEditFind2000
              Left = 74
              Top = 96
              Width = 71
              Height = 21
              DataField = 'CLIENTE'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              TabOrder = 8
              OnChange = DBEFClienteChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_CLIENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CLIENTE'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = True
              SalirSiVacio = True
              OrdenadoPor.Strings = (
                'CLIENTE')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBCBActivo: TLFDBCheckBox
              Left = 74
              Top = 143
              Width = 121
              Height = 17
              Caption = 'Activo'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 12
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ACTIVO'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBBaja: TLFDBCheckBox
              Left = 74
              Top = 162
              Width = 121
              Height = 17
              Caption = 'Baja'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 13
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'BAJA'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEFProyecto: TLFDBEditFind2000
              Left = 74
              Top = 118
              Width = 71
              Height = 21
              DataField = 'PROYECTO'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
              TabOrder = 10
              OnChange = DBEFClienteChange
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
              OrdenadoPor.Strings = (
                'PROYECTO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBETituloProyecto: TLFDbedit
              Left = 146
              Top = 118
              Width = 427
              Height = 21
              TabStop = False
              Anchors = [akLeft, akTop, akRight]
              AutoSize = False
              Color = clAqua
              DataField = 'TITULO_PROYECTO'
              DataSource = ProDMUtillajes.DSQMProSysUtillajes
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
          end
          object DBMNotas: TLFDBMemo
            Left = 0
            Top = 193
            Width = 241
            Height = 175
            Align = alLeft
            DataField = 'NOTAS'
            DataSource = ProDMUtillajes.DSQMProSysUtillajes
            TabOrder = 1
          end
        end
      end
      object TSUtilizacion: TTabSheet [1]
        Caption = 'Utilizacion'
        ImageIndex = 119
        OnShow = TSUtilizacionShow
        object PNLTituloUtilizacion: TLFPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          DesignSize = (
            578
            22)
          object LUtillajeUtilizacion: TLFLabel
            Left = 16
            Top = 4
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Utillaje'
          end
          object DBEUtillajeUtilizacion: TLFDbedit
            Left = 54
            Top = 1
            Width = 71
            Height = 21
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = ProDMUtillajes.DSQMProSysUtillajes
            Enabled = False
            TabOrder = 0
          end
          object DBETituloUtillajeUtilizacion: TLFDbedit
            Left = 126
            Top = 1
            Width = 450
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ProDMUtillajes.DSQMProSysUtillajes
            Enabled = False
            TabOrder = 1
          end
        end
        object PNLUtilizacion: TLFPanel
          Left = 0
          Top = 22
          Width = 578
          Height = 346
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBUtilizacion: TLFToolBar
            Left = 0
            Top = 0
            Width = 578
            Height = 24
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            TabOrder = 0
            Separators = True
            object NavUtilizacion: THYMNavigator
              Left = 0
              Top = 2
              Width = 220
              Height = 22
              DataSource = ProDMUtillajes.DSUtilizacion
              Flat = True
              ParentShowHint = False
              PopupMenu = CEPMImatges
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBDescripcion
              InsertaControl = DBCodigo
              Exclusivo = True
              ControlEdit = CEImatgesUtil
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGUtilizacion: THYTDBGrid
            Left = 0
            Top = 24
            Width = 578
            Height = 322
            Align = alClient
            Color = clInfoBk
            DataSource = ProDMUtillajes.DSUtilizacion
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGUtilizacionCellClick
            OnDrawColumnCell = DBGUtilizacionDrawColumnCell
            OnDblClick = DBGUtilizacionDblClick
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            Idioma = 'CAS'
            AutoDeseleccionar = True
            ControlEdit = CEMain
            TabFicha = TSFicha
            PermutaPaneles = False
            CamposAOrdenar.Strings = (
              'ALMACEN_ENT'
              'ALMACEN_LAN'
              'ALMACEN_SAL'
              'ARTICULO'
              'CANAL'
              'CANTIDAD'
              'CANTIDAD_IMPUTADA'
              'CANTIDAD_UTIL'
              'CLIENTE'
              'COMENTARIO'
              'COMPUESTO'
              'CONT_SUBORDEN'
              'EJERCICIO'
              'ESCANDALLO'
              'ESTADO'
              'FECHA_ENTREGA'
              'FECHA_FIN'
              'FECHA_FIN_TAREA'
              'FECHA_INI'
              'FECHA_INICIO_TAREA'
              'FECHA_ORD'
              'FECHA_PED'
              'HORAS_MAQUINA'
              'HORAS_OPERARIO'
              'HORAS_TOTALES'
              'ID_ORDEN'
              'IDENTIFICADOR'
              'ISO_APROBADO'
              'ISO_VALIDADO'
              'ISO_VERIFICADO'
              'LINEA_PED'
              'MAQUINA'
              'MERMA'
              'ORDEN'
              'PEDIDO'
              'PRIORIDAD'
              'RECURSO'
              'REFERENCIA'
              'RIG_OF'
              'SERIES'
              'SITUACION'
              'SUBORDEN'
              'TAREA'
              'TIEMPO'
              'TIEMPO_PRODUCCION'
              'TIEMPO_UTIL'
              'TIPO_LANZAMIENTO'
              'TIPO_RESERVA'
              'TIPOTAREA'
              'TOTAL'
              'TOTAL_HORAS'
              'UDS_FABRICADAS'
              'UNI_MANUAL'
              'UNI_PEDID'
              'UNI_PENDIENTES'
              'UNI_PRODUC'
              'UNI_TOTAL')
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'SITUACION'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_ORDEN'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SERIES'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RIG_OF'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SUBORDEN'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_ORD'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPUESTO'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ESCANDALLO'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNI_PEDID'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNI_MANUAL'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNI_TOTAL'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNI_PRODUC'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNI_PENDIENTES'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_INI'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_FIN'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HORAS_TOTALES'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HORAS_OPERARIO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HORAS_MAQUINA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TAREA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RECURSO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANTIDAD'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANTIDAD_UTIL'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIEMPO'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIEMPO_UTIL'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UDS_FABRICADAS'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANTIDAD_IMPUTADA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TOTAL_HORAS'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAQUINA'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIEMPO_PRODUCCION'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_INICIO_TAREA'
                Width = 100
                Visible = True
              end>
          end
        end
      end
      object TSIntervencion: TTabSheet [2]
        Caption = 'Intervencion'
        ImageIndex = 3
        OnShow = TSIntervencionShow
        object PNLTituloIntervencion: TLFPanel
          Left = 0
          Top = 0
          Width = 578
          Height = 22
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          DesignSize = (
            578
            22)
          object LUtillajeIntervencion: TLFLabel
            Left = 16
            Top = 4
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Utillaje'
          end
          object DBEUtillajeIntervencion: TLFDbedit
            Left = 54
            Top = 1
            Width = 71
            Height = 21
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = ProDMUtillajes.DSQMProSysUtillajes
            Enabled = False
            TabOrder = 0
          end
          object DBETituloUtillajeIntervencion: TLFDbedit
            Left = 126
            Top = 1
            Width = 450
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ProDMUtillajes.DSQMProSysUtillajes
            Enabled = False
            TabOrder = 1
          end
        end
        object TBIntervencion: TLFToolBar
          Left = 0
          Top = 344
          Width = 578
          Height = 24
          Align = alBottom
          AutoSize = True
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object NavIntervencion: THYMNavigator
            Left = 0
            Top = 2
            Width = 220
            Height = 22
            DataSource = ProDMUtillajes.DSQMIntervencion
            Flat = True
            ParentShowHint = False
            PopupMenu = CEIntervencionPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBDescInterv
            InsertaControl = DBDTPFecha
            Exclusivo = True
            ControlEdit = CEIntervencion
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PCIntervencion: TPageControl
          Left = 0
          Top = 22
          Width = 578
          Height = 322
          ActivePage = TSIntervencionFicha
          Align = alClient
          TabIndex = 0
          TabOrder = 2
          TabPosition = tpBottom
          object TSIntervencionFicha: TTabSheet
            Caption = 'Ficha'
            object PEditIntervencion: TLFPanel
              Left = 0
              Top = 0
              Width = 570
              Height = 296
              Align = alClient
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 0
              DesignSize = (
                570
                296)
              object LMaquina: TLFLabel
                Left = 35
                Top = 71
                Width = 41
                Height = 13
                Alignment = taRightJustify
                Caption = 'M'#225'quina'
              end
              object LDireccionesTelefonos: TLFLabel
                Left = 20
                Top = 27
                Width = 56
                Height = 13
                Alignment = taRightJustify
                Caption = 'Descripci'#243'n'
                FocusControl = DBEDescric
              end
              object LFecha: TLFLabel
                Left = 7
                Top = 198
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Calidad'
              end
              object LMatricero: TLFLabel
                Left = 18
                Top = 50
                Width = 58
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Matricero'
              end
              object LVerificador: TLFLabel
                Left = 18
                Top = 176
                Width = 58
                Height = 13
                Alignment = taRightJustify
                AutoSize = False
                Caption = 'Verificador'
              end
              object LIntervencionFecha: TLFLabel
                Left = 46
                Top = 5
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object LInicio: TLFLabel
                Left = 17
                Top = 122
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Inicio'
              end
              object LFinal: TLFLabel
                Left = 19
                Top = 146
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Final'
              end
              object LDescInterv: TLFLabel
                Left = 18
                Top = 101
                Width = 58
                Height = 13
                Alignment = taRightJustify
                Caption = 'Desc. Interv'
                FocusControl = DBDescInterv
              end
              object DBEFCodMaq: TLFDBEditFind2000
                Left = 79
                Top = 68
                Width = 95
                Height = 21
                DataField = 'CODMAQ'
                DataSource = ProDMUtillajes.DSQMIntervencion
                TabOrder = 4
                OnChange = DBEFCodMaqChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'PRO_MAQUINAS_C'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'CODMAQ'
                CampoStr = 'DESCRIPCION'
                CampoADevolver = 'CODMAQ'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'CODMAQ')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEDescric: TLFDbedit
                Left = 79
                Top = 24
                Width = 466
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'DESCRIPCION_AVERIA'
                DataSource = ProDMUtillajes.DSQMIntervencion
                TabOrder = 1
              end
              object DBDTPFecha: TLFDBDateEdit
                Left = 79
                Top = 2
                Width = 95
                Height = 21
                DataField = 'FECHA'
                DataSource = ProDMUtillajes.DSQMIntervencion
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 0
              end
              object DBEFMatricero: TLFDBEditFind2000
                Left = 79
                Top = 46
                Width = 95
                Height = 21
                Color = clWhite
                DataField = 'MATRICERO'
                DataSource = ProDMUtillajes.DSQMIntervencion
                TabOrder = 2
                OnChange = DBEFMatriceroChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
                Tabla_asociada.CampoCodigo = 'EMPLEADO'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'EMPLEADO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'EMPLEADO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EDescMatricero: TLFEdit
                Left = 175
                Top = 46
                Width = 370
                Height = 21
                TabStop = False
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Color = clInfoBk
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 3
                OnDblClick = EDescMatriceroDblClick
              end
              object DBEFVerificador: TLFDBEditFind2000
                Left = 79
                Top = 172
                Width = 95
                Height = 21
                Color = clWhite
                DataField = 'VERIFICADOR'
                DataSource = ProDMUtillajes.DSQMIntervencion
                TabOrder = 9
                OnChange = DBEFVerificadorChange
                AutoCambiarFoco = False
                Base_de_datos = DMMain.DataBase
                BuscarNums = False
                Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
                Tabla_asociada.CampoCodigo = 'EMPLEADO'
                Tabla_asociada.DesplegarBusqueda = False
                CampoNum = 'EMPLEADO'
                CampoStr = 'TITULO'
                ReemplazarCaracter = True
                SalirSiNoExiste = True
                SalirSiVacio = True
                OrdenadoPor.Strings = (
                  'EMPLEADO')
                Filtros = [obEmpresa, obEjercicio, obCanal]
                Entorno = DMMain.EntornoBusqueda
              end
              object EDescVerificador: TLFEdit
                Left = 175
                Top = 172
                Width = 302
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
                OnDblClick = EDescVerificadorDblClick
              end
              object DBDTPFechaCalidad: TLFDBDateEdit
                Left = 79
                Top = 194
                Width = 95
                Height = 21
                DataField = 'FECHA_CALIDAD'
                DataSource = ProDMUtillajes.DSQMIntervencion
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 11
              end
              object DBDTPInicioRep: TLFDBDateEdit
                Left = 79
                Top = 120
                Width = 95
                Height = 21
                DataField = 'INICIO_REPARACION'
                DataSource = ProDMUtillajes.DSQMIntervencion
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 7
              end
              object DBDTPFinalRep: TLFDBDateEdit
                Left = 79
                Top = 142
                Width = 95
                Height = 21
                DataField = 'FINAL_REPARACION'
                DataSource = ProDMUtillajes.DSQMIntervencion
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 8
              end
              object DBDescInterv: TLFDbedit
                Left = 79
                Top = 98
                Width = 466
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                DataField = 'DESCRIPCION_INTERVENCION'
                DataSource = ProDMUtillajes.DSQMIntervencion
                TabOrder = 6
              end
              object DBCBConformidad: TLFDBCheckBox
                Left = 79
                Top = 216
                Width = 88
                Height = 17
                Caption = 'Conformidad'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 12
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'CONFORMIDAD'
                DataSource = ProDMUtillajes.DSQMIntervencion
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object EDescMaquina: TLFEdit
                Left = 175
                Top = 68
                Width = 370
                Height = 21
                TabStop = False
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Color = clInfoBk
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 5
                OnDblClick = EDescMatriceroDblClick
              end
            end
          end
          object TSIntervencionTabla: TTabSheet
            Caption = 'Tabla'
            ImageIndex = 1
            object DBGIntervencion: THYTDBGrid
              Left = 0
              Top = 0
              Width = 570
              Height = 296
              Align = alClient
              Color = clInfoBk
              DataSource = ProDMUtillajes.DSQMIntervencion
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              Idioma = 'CAS'
              AutoDeseleccionar = True
              ControlEdit = CEMain
              TabFicha = TSFicha
              PermutaPaneles = True
              CamposAMarcar.Strings = (
                'CONFORMIDAD')
              CamposChecked.Strings = (
                '1')
              CamposNoChecked.Strings = (
                '0')
              CamposAOrdenar.Strings = (
                'CODIGO'
                'CODMAQ'
                'CONFORMIDAD'
                'DESCRIPCION_AVERIA'
                'DESCRIPCION_INTERVENCION'
                'FECHA'
                'FECHA_CALIDAD'
                'FINAL_REPARACION'
                'ID_INTERVENCION'
                'INICIO_REPARACION'
                'MATRICERO'
                'VERIFICADOR')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ID_INTERVENCION'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CODMAQ'
                  Width = 60
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION_AVERIA'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MATRICERO'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INICIO_REPARACION'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FINAL_REPARACION'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCRIPCION_INTERVENCION'
                  Width = 200
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_CALIDAD'
                  Width = 100
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VERIFICADOR'
                  Width = 50
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONFORMIDAD'
                  Width = 65
                  Visible = True
                end>
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 368
          DataSource = ProDMUtillajes.DSQMProSysUtillajes
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ACTIVO'
            'BAJA')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'ARTICULO'
            'BAJA'
            'CLIENTE'
            'CODIGO'
            'COMPUESTO_ORDEN'
            'DESCRIPCION'
            'FECHA_INI_ORDEN'
            'GOLPES_ACUMULADOS'
            'NOMBRE_COMERCIAL'
            'NOMBRE_R_SOCIAL'
            'PROYECTO'
            'TITULO_ART')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GOLPES_ACUMULADOS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAJA'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPUESTO_ORDEN'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INI_ORDEN'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN_ORDEN'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO_ART'
              Width = 250
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
              FieldName = 'TITULO_PROYECTO'
              Width = 250
              Visible = True
            end>
        end
      end
      object TSProyectos: TTabSheet
        Caption = 'Proyectos'
        ImageIndex = 4
        TabVisible = False
        object DBGProyectos: THYTDBGrid
          Left = 0
          Top = 0
          Width = 578
          Height = 368
          Align = alClient
          Color = clInfoBk
          DataSource = ProDMUtillajes.DSQMProSysUtillajes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGMainDrawColumnCell
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          ControlEdit = CEMain
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'CODIGO'
            'DESCRIPCION'
            'GOLPES_ACUMULADOS'
            'PROYECTO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 368
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 426
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEImatgesUtil
    Left = 512
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 552
    Top = 0
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 472
    Top = 0
  end
  object CEImatgesUtil: TControlEdit
    EnlazadoA = CEIntervencion
    Complementario = TBMain
    PopUpMenu = CEPMImatges
    Teclas = DMMain.Teclas
    Left = 512
    Top = 32
  end
  object CEPMImatges: TPopUpTeclas
    Left = 552
    Top = 32
    object CEImatgesUtilMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEImatgesUtilMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEImatgesUtilMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEImatgesUtilMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEImatgesUtilMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEImatgesUtilMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEImatgesUtilMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImatgesUtilMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImatgesUtilMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImatgesUtilMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ALOperario: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 440
    Top = 32
    object AAMatricero: TAction
      Caption = 'AAMatricero'
      OnExecute = AAMatriceroExecute
    end
    object AAVerificador: TAction
      Caption = 'AAVerificador'
      OnExecute = AAVerificadorExecute
    end
  end
  object CEIntervencion: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSIntervencionFicha
    PanelEdicion = PEditIntervencion
    PopUpMenu = CEIntervencionPMEdit
    Teclas = DMMain.Teclas
    Left = 512
    Top = 64
  end
  object CEIntervencionPMEdit: TPopUpTeclas
    Left = 552
    Top = 64
    object CEIntervencionMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEIntervencionMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEIntervencionMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEIntervencionMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEIntervencionMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEIntervencionMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEIntervencionMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEIntervencionMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEIntervencionMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEIntervencionMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
