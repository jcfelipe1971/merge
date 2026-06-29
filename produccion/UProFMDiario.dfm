object ProFMDiario: TProFMDiario
  Left = 366
  Top = 71
  Width = 812
  Height = 583
  Caption = 'Diario de Tareas'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PEFiltro: TLFPanel
    Left = 0
    Top = 26
    Width = 804
    Height = 76
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LFechaDesde: TLFLabel
      Left = 25
      Top = 7
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LFechaHasta: TLFLabel
      Left = 161
      Top = 7
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta'
    end
    object LRecurso: TLFLabel
      Left = 300
      Top = 7
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Recurso'
    end
    object LOperario: TLFLabel
      Left = 300
      Top = 28
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Operario'
    end
    object LMaquina: TLFLabel
      Left = 297
      Top = 51
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'M'#225'quina'
    end
    object LTrabajadorExterno: TLFLabel
      Left = 554
      Top = 7
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'T.Ext.'
    end
    object LVarios: TLFLabel
      Left = 553
      Top = 30
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Varios'
    end
    object LCompuesto: TLFLabel
      Left = 2
      Top = 28
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Compuesto'
    end
    object LOrden: TLFLabel
      Left = 40
      Top = 51
      Width = 14
      Height = 13
      Alignment = taRightJustify
      Caption = 'OF'
    end
    object FechaD: TLFDateEdit
      Left = 58
      Top = 3
      Width = 99
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 0
    end
    object FechaH: TLFDateEdit
      Left = 193
      Top = 3
      Width = 99
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 1
    end
    object Recurso: TEditFind2000
      Left = 343
      Top = 3
      Width = 54
      Height = 21
      TabOrder = 5
      OnChange = RecursoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoADevolver = 'RECURSO'
      CampoNum = 'RECURSO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_SYS_RECURSOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'RECURSO')
      Filtros = []
    end
    object DBEDescripRecurso: TLFDbedit
      Left = 398
      Top = 3
      Width = 150
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMDiario.DSxRecurso
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
    object LFEOperario: TLFEditFind2000
      Left = 343
      Top = 25
      Width = 54
      Height = 21
      TabOrder = 7
      OnChange = LFEOperarioChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'EMPLEADO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'ACTIVO=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_EMPLEADOS_EF'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'EMPLEADO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object DescOperario: TLFDbedit
      Left = 398
      Top = 25
      Width = 150
      Height = 21
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMDiario.DSxOperario
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
    end
    object LFEMaquina: TLFEditFind2000
      Left = 343
      Top = 47
      Width = 54
      Height = 21
      TabOrder = 9
      OnChange = LFEMaquinaChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CODMAQ'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_MAQUINAS_C'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODMAQ')
      Filtros = []
    end
    object LFEVarios: TLFEditFind2000
      Left = 584
      Top = 26
      Width = 54
      Height = 21
      TabOrder = 10
      OnChange = LFEVariosChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'RECURSO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_RECURSOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'RECURSO')
      Filtros = []
    end
    object DescMaquina: TLFDbedit
      Left = 398
      Top = 47
      Width = 150
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'DESCRIPCION'
      DataSource = ProDMDiario.DSxMaquina
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 11
    end
    object DescTExt: TLFDbedit
      Left = 639
      Top = 4
      Width = 150
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMDiario.DSTExt
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 12
    end
    object DescVarios: TLFDbedit
      Left = 639
      Top = 26
      Width = 150
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = ProDMDiario.DSxVarios
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 13
    end
    object LFEText: TLFEditFind2000
      Left = 584
      Top = 4
      Width = 54
      Height = 21
      TabOrder = 14
      OnChange = LFETextChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'PROVEEDOR'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_PROVEEDORES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object LFEFCompuesto: TLFEditFind2000
      Left = 58
      Top = 25
      Width = 79
      Height = 21
      TabOrder = 2
      OnChange = LFEFCompuestoChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'COMPUESTO'
      CampoStr = 'FECHA_ORD'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_ORD'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = LFEFCompuestoBusqueda
      OrdenadoPor.Strings = (
        'COMPUESTO')
      Filtros = []
    end
    object LFOrden: TLFEditFind2000
      Left = 58
      Top = 47
      Width = 54
      Height = 21
      TabOrder = 4
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ID_ORDEN'
      CampoStr = 'COMPUESTO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'PRO_ORD'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = LFOrdenBusqueda
      OrdenadoPor.Strings = (
        'ID_ORDEN')
      Filtros = []
    end
    object DescCompuesto: TLFEdit
      Left = 138
      Top = 25
      Width = 153
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
      TabOrder = 3
    end
  end
  object PEMain: TLFPanel
    Left = 0
    Top = 102
    Width = 804
    Height = 377
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object DBGFDetalle: TDBGridFind2000
      Left = 0
      Top = 0
      Width = 804
      Height = 377
      Align = alClient
      DataSource = ProDMDiario.DSQMProDetMarca
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGFDetalleDblClick
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
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'ESTADO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_PREV'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FECHA_REAL'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 27
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ORDEN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG_OF'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'SUBORDEN'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_FASE'
          Width = 57
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescripFase'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA_TAREA'
          Width = 62
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescripTarea'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 103
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_INICIO'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'HORA_FIN'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO'
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES_FAB'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_RECURSO'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_RECURSO'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECURSO'
          Width = 46
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescripRec'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 127
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPLEADO'
          Width = 45
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
          FieldName = 'MAQUINA'
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_MAQUINA'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_TE'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VARIOS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_VARIOS'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 22
          Visible = True
        end>
    end
  end
  object LFToolBar1: TLFToolBar
    Left = 0
    Top = 0
    Width = 804
    Height = 26
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 2
    Separators = True
    object TBFiltrar: TToolButton
      Left = 0
      Top = 0
      Hint = 'Filtrar'
      Caption = 'Filtrar'
      ImageIndex = 5
      ParentShowHint = False
      ShowHint = True
      OnClick = TBFiltrarClick
    end
    object TBNuevo: TToolButton
      Left = 23
      Top = 0
      Hint = 'Nueva consulta'
      Caption = 'Nuevo'
      ImageIndex = 146
      ParentShowHint = False
      ShowHint = True
      OnClick = TBNuevoClick
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object EPSalir: THYMEditPanel
      Left = 54
      Top = 0
      Width = 40
      Height = 22
      Hint = 'Salir'
      VisibleButtons = [neRango, neSalir]
      ParentShowHint = False
      SalirCaption = 'Salida'
      SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
      ShowHint = True
      TabOrder = 0
      Flat = True
      Exclusivo = True
      OnClickRango = EPSalirClickRango
    end
  end
  object PanelTotales: TLFPanel
    Left = 0
    Top = 479
    Width = 804
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 3
    object LTotalUnidades: TLFLabel
      Left = 14
      Top = 51
      Width = 87
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Unidades'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LTotalTiempo: TLFLabel
      Left = 26
      Top = 31
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Tiempo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LTotalCoste: TLFLabel
      Left = 35
      Top = 11
      Width = 66
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total Coste'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object DBTTotalUnidades: TDBText
      Left = 104
      Top = 50
      Width = 104
      Height = 17
      Alignment = taRightJustify
      Color = 8404992
      DataField = 'TUNDS'
      DataSource = ProDMDiario.DSQMProDetMarcaT
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBTTotalTiempo: TDBText
      Left = 104
      Top = 30
      Width = 104
      Height = 17
      Alignment = taRightJustify
      Color = 8404992
      DataField = 'TTIEMPO'
      DataSource = ProDMDiario.DSQMProDetMarcaT
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object DBTTotalCoste: TDBText
      Left = 104
      Top = 10
      Width = 104
      Height = 17
      Alignment = taRightJustify
      Color = 8404992
      DataField = 'TIMPORTE'
      DataSource = ProDMDiario.DSQMProDetMarcaT
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredProps.Strings = (
      'DBGFDetalle.Columns'
      'DBGFDetalle.Titulos')
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 176
    Top = 216
  end
end
