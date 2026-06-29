inherited ProFMMaquinas: TProFMMaquinas
  Left = 477
  Top = 224
  Width = 766
  Height = 576
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de las M'#225'quinas'
  PopupMenu = CEDetReparacionesPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 289
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = ProDMMaquinas.DSQMMaquinasC
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEFTipo
        InsertaControl = DBEFTipo
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
      object TBDocumentos: TToolButton
        Left = 319
        Top = 0
        Action = ADocumentos
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 342
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMaqRevision: TToolButton
        Left = 350
        Top = 0
        Action = AMaqRevision
      end
      object TSep1: TToolButton
        Left = 373
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object CBSeccion: TLFComboBox
        Left = 381
        Top = 0
        Width = 180
        Height = 21
        ItemHeight = 13
        TabOrder = 2
        Text = 'CBSeccion'
        OnChange = CBSeccionChange
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 259
      OnChanging = PCMainChanging
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 744
          Height = 231
          inherited G2KTableLoc: TG2KTBLoc
            Top = 31
            DataSource = ProDMMaquinas.DSQMMaquinasC
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODMAQ')
          end
          object LCodigo: TLFLabel
            Left = 39
            Top = 8
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
            FocusControl = DBECodigo
          end
          object LTipo: TLFLabel
            Left = 137
            Top = 8
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LCodId: TLFLabel
            Left = 20
            Top = 31
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Ident.'
            FocusControl = DBECodIdentificacion
          end
          object LFechaCompra: TLFLabel
            Left = 261
            Top = 31
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Compra'
          end
          object LFabricante: TLFLabel
            Left = 22
            Top = 54
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fabricante'
            FocusControl = DBEFabricante
          end
          object LNSerie: TLFLabel
            Left = 291
            Top = 54
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Serie'
            FocusControl = DBENSerie
          end
          object LblDescripcion: TLFLabel
            Left = 16
            Top = 76
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object LSeccion: TLFLabel
            Left = 33
            Top = 120
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Secci'#243'n'
          end
          object LFrecuencia: TLFLabel
            Left = 19
            Top = 185
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Frecuencia'
            FocusControl = DBEFrecuencia
          end
          object LblFechaCert: TLFLabel
            Left = 239
            Top = 185
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Certificaci'#243'n'
          end
          object LblRecurso: TLFLabel
            Left = 32
            Top = 142
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recurso'
          end
          object LblCalendario: TLFLabel
            Left = 22
            Top = 163
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calendario'
          end
          object LblHorario: TLFLabel
            Left = 240
            Top = 162
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
          end
          object LBLImagen: TLFLabel
            Left = 462
            Top = 8
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object Imagen: TImage
            Left = 456
            Top = 29
            Width = 286
            Height = 73
            Anchors = [akLeft, akTop, akRight]
            Center = True
            IncrementalDisplay = True
            Proportional = True
          end
          object LCentroTrabajo: TLFLabel
            Left = 2
            Top = 98
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Centro Trabajo'
          end
          object DBECodigo: TLFDbedit
            Left = 76
            Top = 5
            Width = 41
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODMAQ'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 21
          end
          object DBECodIdentificacion: TLFDbedit
            Left = 76
            Top = 27
            Width = 154
            Height = 21
            DataField = 'CODIDE'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 1
          end
          object DBDTPFechaCompra: TLFDBDateEdit
            Left = 334
            Top = 27
            Width = 120
            Height = 21
            DataField = 'FECHA_COMPRA'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBEFabricante: TLFDbedit
            Left = 76
            Top = 49
            Width = 154
            Height = 21
            DataField = 'FABRICANTE'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 3
          end
          object DBENSerie: TLFDbedit
            Left = 334
            Top = 49
            Width = 120
            Height = 21
            DataField = 'NSERIE'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 4
          end
          object DBEDescripcion: TLFDbedit
            Left = 76
            Top = 71
            Width = 378
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 5
          end
          object DBMNotas: TLFDBMemo
            Left = 456
            Top = 104
            Width = 286
            Height = 76
            Anchors = [akLeft, akTop, akRight]
            DataField = 'OBSERVACION'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            ScrollBars = ssVertical
            TabOrder = 20
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 163
            Top = 5
            Width = 41
            Height = 21
            DataField = 'TIPO'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 0
            OnChange = DBEFTipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_TIPO_MAQUINAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFSeccion: TLFDBEditFind2000
            Left = 76
            Top = 115
            Width = 43
            Height = 21
            DataField = 'SECCION'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 7
            OnChange = DBEFSeccionChange
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
            OrdenadoPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFrecuencia: TLFDbedit
            Left = 76
            Top = 181
            Width = 43
            Height = 21
            DataField = 'FRECUENCIA'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 11
          end
          object DBDTPFechaCert: TLFDBDateEdit
            Left = 334
            Top = 181
            Width = 120
            Height = 21
            DataField = 'FECHA_CERT'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 13
          end
          object DBCBCertificado: TLFDBCheckBox
            Left = 128
            Top = 184
            Width = 81
            Height = 17
            Caption = 'Certificaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CERTIFICACION'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFRecurso: TLFDBEditFind2000
            Left = 76
            Top = 137
            Width = 43
            Height = 21
            DataField = 'RECURSO'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 8
            OnChange = DBEFRecursoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tiporecurso='#39'HM'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'RECURSO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBERecurso: TLFDbedit
            Left = 120
            Top = 137
            Width = 334
            Height = 21
            Color = clInfoBk
            DataSource = ProDMMaquinas.DSQMMaquinasC
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 22
          end
          object DBEFCalendario: TLFDBEditFind2000
            Left = 76
            Top = 159
            Width = 43
            Height = 21
            DataField = 'CALENDARIO'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 9
            OnChange = DBEFCalendarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_CALENDARIO_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CALENDARIO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CALENDARIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBECalendario: TLFDbedit
            Left = 120
            Top = 159
            Width = 105
            Height = 21
            Color = clInfoBk
            DataSource = ProDMMaquinas.DSQMMaquinasC
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 23
          end
          object DBEFHorario: TLFDBEditFind2000
            Left = 279
            Top = 159
            Width = 43
            Height = 21
            DataField = 'HORARIO'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 10
            OnChange = DBEFHorarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_HORARIOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'HORARIO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'HORARIO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescHorario: TLFHYDBDescription
            Left = 323
            Top = 159
            Width = 131
            Height = 21
            Color = clInfoBk
            DataSource = ProDMMaquinas.DSQMMaquinasC
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 24
            Tabla_a_buscar = 'OPE_HORARIOS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'HORARIO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'HORARIO')
          end
          object DescTipo: TLFHYDBDescription
            Left = 205
            Top = 5
            Width = 249
            Height = 21
            Color = clInfoBk
            DataSource = ProDMMaquinas.DSQMMaquinasC
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 25
            Tabla_a_buscar = 'PRO_TIPO_MAQUINAS'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'TIPO')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'TIPO')
          end
          object DescSeccion: TLFHYDBDescription
            Left = 120
            Top = 115
            Width = 334
            Height = 21
            Color = clInfoBk
            DataSource = ProDMMaquinas.DSQMMaquinasC
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 26
            Tabla_a_buscar = 'OPE_SECCIONES'
            Campo_Descripcion = 'DESCRIPCION'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'SECCION')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'SECCION')
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 502
            Top = 5
            Width = 42
            Height = 21
            DataField = 'ID_IMAGEN'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 16
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
            Left = 544
            Top = 5
            Width = 198
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object BCargarImagen: TButton
            Left = 695
            Top = 7
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 18
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 718
            Top = 7
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 19
            Visible = False
            OnClick = BClipboardClick
          end
          object DBCBVirtual: TLFDBCheckBox
            Left = 74
            Top = 206
            Width = 121
            Height = 17
            Caption = 'M'#225'quina Virtual'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VIRTUAL'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBWeb: TLFDBCheckBox
            Left = 194
            Top = 206
            Width = 61
            Height = 17
            Caption = 'Web'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'WEB'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFCentroTrabajo: TLFDBEditFind2000
            Left = 76
            Top = 93
            Width = 43
            Height = 21
            DataField = 'CENTRO'
            DataSource = ProDMMaquinas.DSQMMaquinasC
            TabOrder = 6
            OnChange = DBEFCentroTrabajoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_CENT_TRABAJO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CENTRO'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CENTRO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECentroTrabajo: TLFEdit
            Left = 120
            Top = 93
            Width = 334
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 27
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 231
          DataSource = ProDMMaquinas.DSQMMaquinasC
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'CALENDARIO'
            'CENTRO'
            'CERTIFICACION'
            'CODIDE'
            'CODMAQ'
            'DESCRIPCION'
            'FABRICANTE'
            'FECHA_CERT'
            'FECHA_COMPRA'
            'FRECUENCIA'
            'HORARIO'
            'NSERIE'
            'RECURSO'
            'SECCION'
            'TIPO'
            'VIRTUAL'
            'WEB')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODMAQ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescTipo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_COMPRA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FABRICANTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescSECCION'
              Visible = True
            end>
        end
      end
      object TSParametros: TTabSheet
        Caption = '&Parametros'
        ImageIndex = 2
        OnShow = TSParametrosShow
        object PEditParametros: TPanel
          Left = 0
          Top = 0
          Width = 744
          Height = 231
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LFLabel1: TLFLabel
            Left = 32
            Top = 63
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'M. Prep.'
            FocusControl = DBEMPrep
          end
          object LFLabel2: TLFLabel
            Left = 29
            Top = 85
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'ML. Prep'
            FocusControl = DBEMLPrep
          end
          object LFLabel3: TLFLabel
            Left = 279
            Top = 64
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho Max. 1'
            FocusControl = DBEAnchoMax1
          end
          object LFLabel4: TLFLabel
            Left = 25
            Top = 107
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Velocidad'
            FocusControl = DBEVelocidad
          end
          object LFLabel5: TLFLabel
            Left = 279
            Top = 107
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho Max. 3'
            FocusControl = DBEAnchoMax3
          end
          object LFLabel6: TLFLabel
            Left = 290
            Top = 42
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho Min.'
            FocusControl = DBEAnchoMin
          end
          object LFLabel7: TLFLabel
            Left = 279
            Top = 86
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho Max. 2'
            FocusControl = DBEAnchoMax2
          end
          object LFase: TLFLabel
            Left = 49
            Top = 42
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object DBEMPrep: TLFDbedit
            Left = 76
            Top = 59
            Width = 184
            Height = 21
            DataField = 'MINUTOS_PREPARACION'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 0
          end
          object DBEMLPrep: TLFDbedit
            Left = 76
            Top = 81
            Width = 184
            Height = 21
            DataField = 'ML_PREPARACION'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 1
          end
          object DBEAnchoMax1: TLFDbedit
            Left = 350
            Top = 59
            Width = 184
            Height = 21
            DataField = 'ANCHO_MAXIMO_1'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 4
          end
          object DBEVelocidad: TLFDbedit
            Left = 76
            Top = 103
            Width = 184
            Height = 21
            DataField = 'VELOCIDAD'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 2
          end
          object DBEAnchoMax3: TLFDbedit
            Left = 350
            Top = 103
            Width = 184
            Height = 21
            DataField = 'ANCHO_MAXIMO_3'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 6
          end
          object DBEAnchoMin: TLFDbedit
            Left = 350
            Top = 37
            Width = 184
            Height = 21
            DataField = 'ANCHO_MINIMO'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 3
          end
          object DBEAnchoMax2: TLFDbedit
            Left = 350
            Top = 81
            Width = 184
            Height = 21
            DataField = 'ANCHO_MAXIMO_2'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 5
          end
          object TBDetalleTBCostes: TLFToolBar
            Left = 0
            Top = 0
            Width = 744
            Height = 24
            ButtonHeight = 21
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 7
            Separators = True
            object DBECodMaqEti: TLFDbedit
              Left = 0
              Top = 0
              Width = 81
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CODMAQ'
              DataSource = ProDMMaquinas.DSQMMaquinasC
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = DBECodMaqEtiChange
            end
            object EDescripcionMaquina: TLFEdit
              Left = 81
              Top = 0
              Width = 239
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 2
            end
            object Navparametros: THYMNavigator
              Left = 320
              Top = 0
              Width = 80
              Height = 21
              DataSource = ProDMMaquinas.DSQMMaquinasEti
              VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBEFFase: TLFDBEditFind2000
            Left = 76
            Top = 37
            Width = 43
            Height = 21
            DataField = 'FASE'
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            TabOrder = 8
            OnChange = DBEFFaseChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'FASE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DescFase: TLFHYDBDescription
            Left = 120
            Top = 37
            Width = 140
            Height = 21
            Color = clInfoBk
            DataSource = ProDMMaquinas.DSQMMaquinasEti
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 9
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'FASE')
            CamposWhereTabla.Strings = (
              'FASE')
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 756
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 289
    Width = 756
    Height = 234
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 756
      Height = 22
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDet: THYMNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = ProDMMaquinas.DSQMMaquinasD
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFDetalle
        InsertaControl = DBGFDetalle
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = True
      end
      object ToolButton1: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtNotasDetalle: TToolButton
        Left = 248
        Top = 0
        Action = ANotasDetalle
        ParentShowHint = False
        ShowHint = True
      end
      object PNLColores: TLFPanel
        Left = 271
        Top = 0
        Width = 218
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LColorLanzada: TLFLabel
          Left = 2
          Top = 0
          Width = 70
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Lanzada'
          Color = clLime
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object LColorReservada: TLFLabel
          Left = 74
          Top = 0
          Width = 70
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Reservada'
          Color = clSkyBlue
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
        object LColorCerradaParcialmente: TLFLabel
          Left = 145
          Top = 0
          Width = 70
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = 'Cerrada Parc.'
          Color = clFuchsia
          ParentColor = False
          Layout = tlCenter
          Visible = False
        end
      end
      object Butt1: TToolButton
        Left = 489
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtAsignar: TToolButton
        Left = 497
        Top = 0
        Action = AAsignar
      end
      object TButtDesasignar: TToolButton
        Left = 520
        Top = 0
        Action = ADesasignar
      end
      object Butt2: TToolButton
        Left = 543
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
    end
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 22
      Width = 756
      Height = 212
      ActivePage = TSRevision
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabPosition = tpBottom
      OnChange = PCDetalleChange
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSRevision: TTabSheet
        Caption = '&Revisiones'
        OnShow = TSRevisionShow
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 748
          Height = 122
          Align = alClient
          DataSource = ProDMMaquinas.DSQMMaquinasD
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
            'ID_REVISION')
          CamposAMostrar.Strings = (
            'ID_REVISION'
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
            'FECHA_PROXIMA'
            'FECHA_REVISION'
            'LABORATORIO'
            'RESULTADO'
            'LINEA'
            'FECHA_PREVISTA_REVISION')
          ColumnasCheckBoxes.Strings = (
            'REVISADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ID')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'PRO_TIPO_MAQUINAS_REVISIONES')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'DENOMINACION')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
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
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_REVISION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PREVISTA_REVISION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REVISION'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PROXIMA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RESULTADO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABORATORIO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REVISADO'
              Width = 53
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_REV'
              Visible = True
            end>
        end
        object LFDBNotasRev: TLFDBMemo
          Left = 0
          Top = 122
          Width = 748
          Height = 64
          Align = alBottom
          DataField = 'NOTAS'
          DataSource = ProDMMaquinas.DSQMMaquinasD
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TSReparaciones: TTabSheet
        Caption = 'R&eparaciones'
        ImageIndex = 1
        OnShow = TSReparacionesShow
        object DBGFDetRep: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 748
          Height = 146
          Align = alClient
          DataSource = ProDMMaquinas.DSQMMaquinasRep
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
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
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
              Expanded = False
              FieldName = 'FECHA_DETECCION'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_REPARACION'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LABORATORIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COSTE_REP'
              Visible = True
            end>
        end
        object LFDBNotasRep: TLFDBMemo
          Left = 0
          Top = 146
          Width = 748
          Height = 64
          Align = alBottom
          DataField = 'NOTAS'
          DataSource = ProDMMaquinas.DSQMMaquinasRep
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TSCola: TTabSheet
        Caption = 'Cola'
        ImageIndex = 2
        OnShow = TSColaShow
        object DBGFCola: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 748
          Height = 210
          Align = alClient
          DataSource = ProDMMaquinas.DSxCola
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFColaCellClick
          OnDrawColumnCell = DBGFColaDrawColumnCell
          OnDblClick = DBGFColaDblClick
          Insercion = False
          ColumnaInicial = 1
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
            'MAQUINA')
          CamposAMostrar.Strings = (
            'MAQUINA'
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
            'CANTIDAD'
            'COMENTARIO'
            'DESC_UTILLAJE'
            'ESTADO'
            'ID_ORDEN'
            'ID_UTILLAJE'
            'LINEA_FASE'
            'MAQUINA'
            'LINEA_TAREA'
            'ORDEN_COLA_MAQUINA'
            'PRODUCIENDO'
            'RECURSO'
            'RIG_OF'
            'SECCION'
            'SERIES'
            'SITUACION'
            'TAREA'
            'TIPOTAREA'
            'FECHA_ENTREGA'
            'IDENTIFICADOR')
          ColumnasCheckBoxes.Strings = (
            'PRODUCIENDO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CODMAQ')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'PRO_MAQUINAS_C')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'DESCRIPCION')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CODMAQ')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTADO_HOJA_TRABAJO'
              ReadOnly = True
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN_COLA_MAQUINA'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PRODUCIENDO'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIFICADOR'
              ReadOnly = True
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'FECHA_ENTREGA'
              ReadOnly = True
              Width = 72
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
              FieldName = 'RIG_OF'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_FASE'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_TAREA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMPUESTO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES_PEND'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TAREA'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPOTAREA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMENTARIO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RECURSO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CANTIDAD'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ESTADO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID_UTILLAJE'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESC_UTILLAJE'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SECCION'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SITUACION'
              ReadOnly = True
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 616
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 656
    Top = 8
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 384
    Top = 16
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object AListadoMaquinas: TAction
      Category = 'Listado'
      Caption = 'Listado M'#225'quinas'
      ImageIndex = 14
      OnExecute = AListadoMaquinasExecute
    end
    object ALstCodBarrasMaq: TAction
      Category = 'Listado'
      Caption = 'Listado de c'#243'digo de barras'
      ImageIndex = 38
      OnExecute = ALstCodBarrasMaqExecute
    end
    object ALstRevision: TAction
      Category = 'Listado'
      Caption = 'Listado Revisiones'
      ImageIndex = 14
      OnExecute = ALstRevisionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listado;ListadoConf'
      Caption = 'Configuraci'#243'n Listados'
      ImageIndex = 77
    end
    object ALstConfig: TAction
      Category = 'Listado;ListadoConf'
      Caption = 'Configuraci'#243'n Listado M'#225'quinas'
      ImageIndex = 77
      OnExecute = ALstConfigExecute
    end
    object ALstConfigMaqRevision: TAction
      Category = 'Listado;ListadoConf'
      Caption = 'Configuraci'#243'n Listado M'#225'quinas Revisi'#243'n'
      ImageIndex = 77
      OnExecute = ALstConfigMaqRevisionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 578
    Top = 10
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 615
    Top = 40
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 656
    Top = 40
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDetReparaciones: TControlEdit
    DataSource = ProDMMaquinas.DSQMMaquinasRep
    FichaEdicion = TSReparaciones
    FichaExclusiva = TSReparaciones
    PopUpMenu = CEDetReparacionesPMEdit
    Teclas = DMMain.Teclas
    Left = 616
    Top = 72
  end
  object CEDetReparacionesPMEdit: TPopUpTeclas
    Left = 656
    Top = 72
  end
  object ALMaquinas: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 472
    Top = 16
    object ADocumentos: TAction
      Caption = 'Documentos de m'#225'quinas'
      Hint = 'Documentos de m'#225'quinas'
      ImageIndex = 87
      OnExecute = ADocumentosExecute
    end
    object ANotasDetalle: TAction
      Caption = 'ANotasDetalle'
      Hint = 'Notas detalle'
      ImageIndex = 18
      OnExecute = ANotasDetalleExecute
    end
    object AMaqRevision: TAction
      Caption = 'AMaqRevision'
      Hint = 'M'#225'quinas Revisi'#243'n'
      ImageIndex = 119
      OnExecute = AMaqRevisionExecute
    end
    object AAsignar: TAction
      Caption = 'Asignar'
      Hint = 'Asigna la hoja de trabajo a la maquina'
      ImageIndex = 7
      OnExecute = AAsignarExecute
    end
    object ADesasignar: TAction
      Caption = 'Desasignar'
      Hint = 'Desasigna la hoja de trabajo de esta maquina'
      ImageIndex = 8
      OnExecute = ADesasignarExecute
    end
  end
end
