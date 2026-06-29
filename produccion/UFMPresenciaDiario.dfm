inherited FMPresenciaDiario: TFMPresenciaDiario
  Left = 350
  Top = 197
  Width = 812
  Height = 583
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Diario de Presencia'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 802
    Height = 530
    inherited TBMain: TLFToolBar
      Width = 798
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 3
      inherited EPMain: THYMEditPanel
        Width = 40
        Hint = 'Salir'
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      object TSep1: TToolButton
        Left = 40
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBNuevo: TToolButton
        Left = 48
        Top = 0
        Hint = 'Limpiar Filtros'
        Caption = 'Limpiar Filtros'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TBNuevoClick
      end
    end
    object PEFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 798
      Height = 76
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LFecha: TLFLabel
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
      object LCalendario: TLFLabel
        Left = 446
        Top = 7
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Calendario'
      end
      object LOperario: TLFLabel
        Left = 15
        Top = 28
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Operario'
      end
      object LHorario: TLFLabel
        Left = 462
        Top = 29
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Horario'
      end
      object LIncidencia: TLFLabel
        Left = 447
        Top = 51
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Incidencia'
      end
      object DEFiltroFechaDesde: TLFDateEdit
        Left = 58
        Top = 3
        Width = 99
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
        OnChange = FiltroChange
      end
      object DEFiltroFechaHasta: TLFDateEdit
        Left = 193
        Top = 3
        Width = 99
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnChange = FiltroChange
      end
      object DescCalendario: TLFDbedit
        Left = 555
        Top = 3
        Width = 243
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = DMPresenciaDiario.DSxCalendario
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
      object LFEOperario: TLFEditFind2000
        Left = 58
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
      object LFEHorario: TLFEditFind2000
        Left = 500
        Top = 25
        Width = 54
        Height = 21
        TabOrder = 11
        OnChange = LFEHorarioChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'HORARIO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'OPE_HORARIOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'HORARIO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DescHorario: TLFDbedit
        Left = 555
        Top = 25
        Width = 243
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = DMPresenciaDiario.DSxHorario
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object LFEFCalendario: TLFEditFind2000
        Left = 500
        Top = 3
        Width = 54
        Height = 21
        TabOrder = 9
        OnChange = LFEFCalendarioChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CALENDARIO'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'OPE_CALENDARIO_C'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'CALENDARIO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object LFEIncidencia: TLFEditFind2000
        Left = 500
        Top = 47
        Width = 54
        Height = 21
        TabOrder = 13
        OnChange = LFEIncidenciaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_INCIDENCIA'
        CampoStr = 'DESCRIPCION'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_SYS_TIPO_INCIDENCIA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ID_INCIDENCIA')
        Filtros = []
      end
      object DescInc: TLFDbedit
        Left = 555
        Top = 47
        Width = 243
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = DMPresenciaDiario.DSxIncidencia
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object DescOperario: TLFEdit
        Left = 113
        Top = 25
        Width = 179
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object BMesAnterio: TButton
        Left = 293
        Top = 3
        Width = 25
        Height = 22
        Caption = '<<'
        TabOrder = 2
        OnClick = BMesAnterioClick
      end
      object BEjercicio: TButton
        Left = 293
        Top = 25
        Width = 41
        Height = 22
        Caption = 'A'#241'o'
        TabOrder = 5
        OnClick = BEjercicioClick
      end
      object BMes: TButton
        Left = 319
        Top = 3
        Width = 31
        Height = 22
        Caption = 'Mes'
        TabOrder = 3
        OnClick = BMesClick
      end
      object BHoy: TButton
        Left = 334
        Top = 25
        Width = 42
        Height = 22
        Caption = 'Hoy'
        TabOrder = 6
        OnClick = BHoyClick
      end
      object BMesSiguiente: TButton
        Left = 351
        Top = 3
        Width = 25
        Height = 22
        Caption = '>>'
        TabOrder = 4
        OnClick = BMesSiguienteClick
      end
    end
    object PEMain: TLFPanel
      Left = 2
      Top = 104
      Width = 798
      Height = 339
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 798
        Height = 339
        Align = alClient
        DataSource = DMPresenciaDiario.DSQMProDetPre
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
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
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'DESC_OPERARIO'
          'FECHA'
          'OPERARIO'
          'RIG'
          'TIPO'
          'TIPO_PRE'
          'ID_INCIDENCIA'
          'DESC_INCIDENCIA')
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
            Color = clInfoBk
            Expanded = False
            FieldName = 'RIG'
            Width = 49
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'OPERARIO'
            Visible = False
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA'
            Width = 85
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'HORARIO'
            Visible = False
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DESC_HORARIO'
            Visible = False
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CALENDARIO'
            Visible = False
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DESC_CALENDARIO'
            Visible = False
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIPO_PRE'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'HORA_ENTRADA'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'HORA_SALIDA'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIEMPO'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ID_INCIDENCIA'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DESC_INCIDENCIA'
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'OPERARIO'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DESC_OPERARIO'
            Width = 200
            Visible = True
          end>
      end
    end
    object PanelTotales: TLFPanel
      Left = 2
      Top = 443
      Width = 798
      Height = 85
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      object LTotalTiempo: TLFLabel
        Left = 9
        Top = 28
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
      object DBTCodigoOperario: TDBText
        Left = 436
        Top = 26
        Width = 42
        Height = 17
        Color = 8404992
        DataField = 'OPERARIO'
        DataSource = DMPresenciaDiario.DSQMProDetPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LMarcajeOperario: TLFLabel
        Left = 384
        Top = 27
        Width = 49
        Height = 13
        Alignment = taRightJustify
        Caption = 'Operario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBTCodigoCalendario: TDBText
        Left = 436
        Top = 44
        Width = 42
        Height = 17
        Color = 8404992
        DataField = 'CALENDARIO'
        DataSource = DMPresenciaDiario.DSQMProDetPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LMarcajeCalendario: TLFLabel
        Left = 372
        Top = 45
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Calendario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBTTituloCalendario: TDBText
        Left = 481
        Top = 44
        Width = 259
        Height = 17
        Color = 8404992
        DataField = 'DESC_CALENDARIO'
        DataSource = DMPresenciaDiario.DSQMProDetPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LMarcajeHorario: TLFLabel
        Left = 391
        Top = 63
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Horario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBTCodigoHorario: TDBText
        Left = 436
        Top = 62
        Width = 42
        Height = 17
        Color = 8404992
        DataField = 'HORARIO'
        DataSource = DMPresenciaDiario.DSQMProDetPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBTTituloHorario: TDBText
        Left = 481
        Top = 62
        Width = 259
        Height = 17
        Color = 8404992
        DataField = 'DESC_HORARIO'
        DataSource = DMPresenciaDiario.DSQMProDetPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object DBTTituloOprerario: TDBText
        Left = 481
        Top = 26
        Width = 259
        Height = 17
        Color = 8404992
        DataField = 'DESC_OPERARIO'
        DataSource = DMPresenciaDiario.DSQMProDetPre
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LDatosFiltro: TLFLabel
        Left = 9
        Top = 4
        Width = 70
        Height = 13
        Caption = 'Datos Filtro:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LDatosMarcaje: TLFLabel
        Left = 369
        Top = 4
        Width = 87
        Height = 13
        Caption = 'Datos Marcaje:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LHora: TLFLabel
        Left = 145
        Top = 28
        Width = 8
        Height = 13
        Caption = 'h'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LTiempoTotal: TLFLabel
        Left = 87
        Top = 27
        Width = 57
        Height = 16
        AutoSize = False
        Color = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 530
    Width = 802
  end
  inherited CEMain: TControlEdit
    Left = 400
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 440
    Top = 0
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 480
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 520
    Top = 0
  end
end
