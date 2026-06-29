inherited FMPresencia: TFMPresencia
  Left = 289
  Top = 241
  Width = 1021
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Control de Presencia'
  PopupMenu = CENotasPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1011
    Height = 177
    inherited TBMain: TLFToolBar
      Width = 1007
      inherited NavMain: THYMNavigator
        DataSource = DMPresencia.DSQMProCabPre
        Hints.Strings = ()
        EditaControl = DBEFOperario
        InsertaControl = DBEFOperario
      end
      inherited EPMain: THYMEditPanel
        Width = 69
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 297
      end
      inherited TbuttComp: TToolButton
        Left = 305
      end
      object PNLFiltroEmpleado: TLFPanel
        Left = 328
        Top = 0
        Width = 118
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFiltroEmpleado: TLFLabel
          Left = 12
          Top = 5
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Empl.'
        end
        object EFFiltroEmpleado: TLFEditFind2000
          Left = 42
          Top = 0
          Width = 74
          Height = 21
          TabOrder = 0
          OnChange = FiltroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EMPLEADO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object PNLFiltroFecha: TLFPanel
        Left = 446
        Top = 0
        Width = 384
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LFiltroFecha: TLFLabel
          Left = 6
          Top = 3
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha'
        end
        object DEFiltroFechaDesde: TLFDateEdit
          Left = 40
          Top = 0
          Width = 95
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = FiltroChange
        end
        object DEFiltroFechaHasta: TLFDateEdit
          Left = 138
          Top = 0
          Width = 95
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = FiltroChange
        end
        object BMesAnterio: TButton
          Left = 234
          Top = 0
          Width = 25
          Height = 22
          Caption = '<<'
          TabOrder = 2
          OnClick = BMesAnterioClick
        end
        object BEjercicio: TButton
          Left = 260
          Top = 0
          Width = 31
          Height = 22
          Caption = 'A'#241'o'
          TabOrder = 3
          OnClick = BEjercicioClick
        end
        object BMes: TButton
          Left = 292
          Top = 0
          Width = 31
          Height = 22
          Caption = 'Mes'
          TabOrder = 4
          OnClick = BMesClick
        end
        object BHoy: TButton
          Left = 324
          Top = 0
          Width = 31
          Height = 22
          Caption = 'Hoy'
          TabOrder = 5
          OnClick = BHoyClick
        end
        object BMesSiguiente: TButton
          Left = 356
          Top = 0
          Width = 25
          Height = 22
          Caption = '>>'
          TabOrder = 6
          OnClick = BMesSiguienteClick
        end
      end
      object TBSep2: TToolButton
        Left = 830
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TBIncidenciaAnt: TToolButton
        Left = 838
        Top = 0
        Action = AinicidenciaAnt
      end
      object TBIncidenciaSig: TToolButton
        Left = 861
        Top = 0
        Action = AinicidenciaSig
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1007
      Height = 147
      inherited TSFicha: TTabSheet
        object SBAOperario: TSpeedButton [0]
          Left = 145
          Top = 28
          Width = 65
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+E para ver los datos del Empleado'
          GroupIndex = -1
          OnDblClick = SBAOperarioDblClick
        end
        object SBACalendari: TSpeedButton [1]
          Left = 344
          Top = 64
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBACalendariDblClick
        end
        object SBAHorario: TSpeedButton [2]
          Left = 344
          Top = 88
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAHorarioDblClick
        end
        inherited PEdit: TLFPanel
          Width = 999
          Height = 119
          inherited G2KTableLoc: TG2KTBLoc
            Top = 48
            Plan.Strings = (
              ' ')
            CamposADesplegar.Strings = (
              'FECHA')
            DataSource = DMPresencia.DSQMProCabPre
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CABECERA_PRESENCIA'
            CampoNum = 'RIG'
            CampoStr = 'NOMBRE_R_SOCIAL'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LOperario: TLFLabel
            Left = 23
            Top = 31
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object LFecha: TLFLabel
            Left = 33
            Top = 53
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LTotalHorasPre: TLFLabel
            Left = 176
            Top = 54
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total H. Pre.'
            FocusControl = DBETotalHoras
          end
          object LCalendario: TLFLabel
            Left = 16
            Top = 76
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Calendario'
          end
          object LHorario: TLFLabel
            Left = 31
            Top = 98
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horario'
          end
          object LRIG: TLFLabel
            Left = 24
            Top = 10
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Registro'
          end
          object DBEFOperario: TLFDBEditFind2000
            Left = 71
            Top = 28
            Width = 98
            Height = 21
            Color = clWhite
            DataField = 'OPERARIO'
            DataSource = DMPresencia.DSQMProCabPre
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescOperario: TLFDbedit
            Left = 170
            Top = 28
            Width = 353
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMPresencia.DSQMProCabPre
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            OnDblClick = SBAOperarioDblClick
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 71
            Top = 50
            Width = 98
            Height = 21
            DataField = 'FECHA'
            DataSource = DMPresencia.DSQMProCabPre
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBETotalHoras: TLFDbedit
            Left = 240
            Top = 50
            Width = 89
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIEMPO_TOTAL'
            DataSource = DMPresencia.DSxInfoActualizada
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
          object DBECalendario: TLFDbedit
            Left = 71
            Top = 72
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CALENDARIO'
            DataSource = DMPresencia.DSQMProCabPre
            Enabled = False
            ReadOnly = True
            TabOrder = 5
            OnChange = DBECalendarioChange
          end
          object DBEHorario: TLFDbedit
            Left = 71
            Top = 94
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'HORARIO'
            DataSource = DMPresencia.DSQMProCabPre
            Enabled = False
            ReadOnly = True
            TabOrder = 7
            OnChange = DBEHorarioChange
          end
          object EDescHorario: TLFEdit
            Left = 122
            Top = 94
            Width = 207
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 8
            OnDblClick = SBAHorarioDblClick
          end
          object EDescCalendario: TLFEdit
            Left = 122
            Top = 72
            Width = 207
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 6
            OnDblClick = SBACalendariDblClick
          end
          object DBERIG: TLFDbedit
            Left = 71
            Top = 6
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMPresencia.DSQMProCabPre
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        object LFToolBar1: TLFToolBar
          Left = 0
          Top = 0
          Width = 999
          Height = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 22
            DataSource = DMPresencia.DSQMProCabPre
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = LFDbNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object LFPanelNotas: TLFPanel
          Left = 0
          Top = 24
          Width = 999
          Height = 95
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object LFDbNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 999
            Height = 95
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMPresencia.DSQMProCabPre
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 999
          Height = 119
          DataSource = DMPresencia.DSQMProCabPre
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          UsaDicG2K = False
          CamposAOrdenar.Strings = (
            'CALENDARIO'
            'DESCRIPCION_CALENDARIO'
            'DESCRIPCION_HORARIO'
            'EJERCICIO'
            'ESTADO'
            'FECHA'
            'HORARIO'
            'ID_CAB_PRESENCIA'
            'ID_EMPLEADO'
            'NOMBRE_R_SOCIAL'
            'OPERARIO'
            'RIG'
            'SERIE'
            'TIEMPO_TOTAL'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'OPERARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_TOTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Left = 273
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 398
    Width = 1011
  end
  inherited PDetalle: TLFPanel [2]
    Top = 177
    Width = 1011
    Height = 221
    OnResize = PDetalleResize
    object splMarcajes: TSplitter [0]
      Left = 592
      Top = 22
      Width = 8
      Height = 153
      Cursor = crHSplit
      Color = clAppWorkSpace
      ParentColor = False
      OnMoved = splMarcajesMoved
    end
    inherited TBDetalle: TLFToolBar
      Width = 1011
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 200
        DataSource = DMPresencia.DSQMProDetPre
        Hints.Strings = ()
        Exclusivo = True
        InsertaUltimo = True
      end
      object TBSep1: TToolButton
        Left = 200
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBRecalcularDesdeMarcaje: TToolButton
        Left = 208
        Top = 0
        Hint = 'Recalcular desde los marjases'
        Caption = 'Recalcular dede marcajes'
        ImageIndex = 98
        ParentShowHint = False
        ShowHint = True
        OnClick = TBRecalcularDesdeMarcajeClick
      end
      object TBSep3: TToolButton
        Left = 231
        Top = 0
        Width = 8
        ImageIndex = 0
        Style = tbsSeparator
      end
      object PNLMostrarMarcajes: TLFPanel
        Left = 239
        Top = 2
        Width = 121
        Height = 17
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 1
        object CBMostrarMarcajes: TLFCheckBox
          Left = 0
          Top = 0
          Width = 121
          Height = 17
          Caption = 'Mostrar Marcajes'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          OnClick = CBMostrarMarcajesClick
          Alignment = taLeftJustify
        end
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 592
      Height = 153
      Align = alLeft
      DataSource = DMPresencia.DSQMProDetPre
      OnColEnter = DBGFDetalleColEnter
      OnColExit = DBGFDetalleColExit
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      IniStorage = FSMain
      ColumnaInicial = 1
      UsaDicG2K = False
      AutoCambiarColumna = True
      Transaction = DMPresencia.TLocal
      Campos.Strings = (
        'TIPO_PRE'
        'ID_INCIDENCIA')
      CamposAMostrar.Strings = (
        'TIPO_PRE'
        '0'
        'ID_INCIDENCIA'
        '0')
      CamposAMostrarAnchos.Strings = (
        '30'
        '0'
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      ColumnasCheckBoxes.Strings = (
        'ESTADO')
      ColumnasChecked.Strings = (
        '5')
      ColumnasNoChecked.Strings = (
        '0')
      Numericos.Strings = (
        'TIPO'
        'ID_INCIDENCIA')
      Tablas.Strings = (
        'PRO_SYS_TIPO_PRESENCIA'
        'PRO_SYS_TIPO_INCIDENCIA')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'DESCRIPCION'
        'DESCRIPCION'
        '(por asignar)'
        '(por asignar)'
        '(por asignar)')
      OnBusqueda = DBGFDetalleBusqueda
      OnRowChange = DBGFDetalleRowChange
      Planes.Strings = (
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        'ID_INCIDENCIA'
        ''
        ''
        ''
        '')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_PRE'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'HORA_ENTRADA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_SALIDA'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_INCIDENCIA'
          Width = 36
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIT_INCIDENCIA'
          ReadOnly = True
          Width = 177
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO_DEC'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 35
          Visible = True
        end>
    end
    object DBNotas: TLFDBMemo
      Left = 0
      Top = 175
      Width = 1011
      Height = 46
      Align = alBottom
      DataField = 'NOTAS'
      DataSource = DMPresencia.DSQMProDetPre
      TabOrder = 2
    end
    object DBGMarcajes: TDBGridFind2000
      Left = 600
      Top = 22
      Width = 411
      Height = 153
      Align = alClient
      Color = clInfoBk
      DataSource = DMPresencia.DSQMMarcajes
      PopupMenu = CEDetallePMEdit
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGFDetalleColEnter
      OnColExit = DBGFDetalleColExit
      OnDrawColumnCell = DBGMarcajesDrawColumnCell
      OnDblClick = DBGMarcajesDblClick
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 1
      UsaDicG2K = False
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = True
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMPresencia.TLocal
      BuscarNums = False
      CamposAMostrarAnchos.Strings = (
        '30'
        '0'
        '0'
        '0'
        '0'
        '0')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'ESTADO')
      ColumnasChecked.Strings = (
        '5')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Titulos.Strings = (
        'DESCRIPCION'
        '(por asignar)'
        '(por asignar)')
      Posicion = tpCentrado
      OnBusqueda = DBGFDetalleBusqueda
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        ''
        ''
        '')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_MARCAJE'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_MARCAJE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LATITUD'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LONGITUD'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDENTIFICADOR_INCIDENCIA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDENTIFICADOR_EMPLEADO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDENTIFICADOR_DISPOSITIVO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDENTIFICADOR_TIPO_MARCAJE'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ERROR_AL_PROCESAR'
          Width = 250
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CENotas
    Left = 476
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 512
    Top = 40
  end
  inherited ALMain: TLFActionList
    Left = 520
    Top = 24
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AComprobarParejas: TAction
      Category = 'Procesos'
      Caption = 'Comprobar marcajes'
      Hint = 'Comprobar marcajes'
      ImageIndex = 118
      OnExecute = AComprobarParejasExecute
    end
    object ARecogerMarcajesImesD: TAction
      Category = 'Procesos'
      Caption = 'Recogida de Marcajes'
      Hint = 'Lee los marcajes de la aplicacion externa'
      ImageIndex = 49
      OnExecute = ARecogerMarcajesImesDExecute
    end
    object AinicidenciaAnt: TAction
      Category = 'Procesos'
      Caption = 'inicidencia Anterior'
      Hint = 'Busca el registro con errores anterior'
      ImageIndex = 53
      OnExecute = AinicidenciaAntExecute
    end
    object AinicidenciaSig: TAction
      Category = 'Procesos'
      Caption = 'inicidencia Siguiente'
      Hint = 'Busca el registro con errores siguiente'
      ImageIndex = 52
      OnExecute = AinicidenciaSigExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBMostrarMarcajes.Checked')
    Left = 432
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CENotas
    Left = 480
    Top = 112
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 520
    Top = 112
  end
  object ALOperario: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 552
    Top = 32
    object AAOperario: TAction
      Caption = 'AAOperario'
      OnExecute = AAOperarioExecute
    end
    object ACalendario: TAction
      Caption = 'Calendario'
      OnExecute = ACalendarioExecute
    end
    object AHorario: TAction
      Caption = 'Horario'
      OnExecute = AHorarioExecute
    end
    object AMuestraMarcajes: TAction
      Caption = 'Muestra Marcajes'
      Hint = 'Muestra Marcajes'
    end
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = LFPanelNotas
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 480
    Top = 72
  end
  object CENotasPMEdit: TPopUpTeclas
    Left = 520
    Top = 72
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
    end
  end
end
