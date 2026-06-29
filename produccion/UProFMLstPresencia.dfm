inherited ProFMLstPresencia: TProFMLstPresencia
  Left = 362
  Top = 220
  Caption = 'Listados Control Presencia'
  ClientHeight = 370
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 304
    TabOrder = 1
    inherited TBMain: TLFToolBar
      TabOrder = 4
    end
    inherited PBListado: TProgressBar
      Top = 288
    end
    inherited PCMain: TLFPageControl
      Top = 77
      Height = 211
      TabOrder = 3
      TabStop = False
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 77
      Width = 592
      Height = 211
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LDesdeOperario: TLFLabel
        Left = 33
        Top = 28
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Operario'
      end
      object LHastaOperario: TLFLabel
        Left = 36
        Top = 50
        Width = 71
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Operario'
      end
      object LDesdeCalendario: TLFLabel
        Left = 23
        Top = 76
        Width = 84
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Calendario'
      end
      object LHastaCalendario: TLFLabel
        Left = 26
        Top = 97
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Calendario'
      end
      object LDesdeHorario: TLFLabel
        Left = 39
        Top = 124
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Horario'
      end
      object LHastaHorario: TLFLabel
        Left = 42
        Top = 145
        Width = 65
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Horario'
      end
      object LDesdeIncidencia: TLFLabel
        Left = 24
        Top = 168
        Width = 83
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Incidencia'
      end
      object LHastaIncidencia: TLFLabel
        Left = 27
        Top = 190
        Width = 80
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Incidencia'
      end
      object EFOperarioD: TLFEditFind2000
        Left = 110
        Top = 24
        Width = 64
        Height = 21
        TabOrder = 0
        OnChange = EFOperarioDChange
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
      object EOperarioD: TLFEdit
        Left = 175
        Top = 24
        Width = 328
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
        TabOrder = 8
      end
      object EOperarioH: TLFEdit
        Left = 175
        Top = 46
        Width = 328
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
        TabOrder = 9
      end
      object EFOperarioH: TLFEditFind2000
        Left = 110
        Top = 46
        Width = 64
        Height = 21
        TabOrder = 1
        OnChange = EFOperarioHChange
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
      object EFHorarioD: TLFEditFind2000
        Left = 110
        Top = 118
        Width = 64
        Height = 21
        TabOrder = 4
        OnChange = EFHorarioDChange
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
        Filtros = []
      end
      object DescHorarioD: TLFDbedit
        Left = 175
        Top = 118
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ProDMLstPresencia.DSxHorarioD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object DescHorarioH: TLFDbedit
        Left = 175
        Top = 140
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ProDMLstPresencia.DSxHorarioH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object EFHorarioH: TLFEditFind2000
        Left = 110
        Top = 140
        Width = 64
        Height = 21
        TabOrder = 5
        OnChange = EFHorarioHChange
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
        Filtros = []
      end
      object DescCalendarioD: TLFDbedit
        Left = 175
        Top = 71
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ProDMLstPresencia.DSxCalendarioD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
      object DescCalendarioH: TLFDbedit
        Left = 175
        Top = 93
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ProDMLstPresencia.DSxCalendariH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 13
      end
      object DescIncidenciaD: TLFDbedit
        Left = 175
        Top = 166
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ProDMLstPresencia.DSxIncidenciaD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 14
      end
      object DescIncidenciaH: TLFDbedit
        Left = 175
        Top = 188
        Width = 328
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DESCRIPCION'
        DataSource = ProDMLstPresencia.DSxIncidenciaH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 15
      end
      object EFCalendarioD: TLFEditFind2000
        Left = 110
        Top = 71
        Width = 64
        Height = 21
        TabOrder = 2
        OnChange = EFCalendarioDChange
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
      object EFCalendarioH: TLFEditFind2000
        Left = 110
        Top = 93
        Width = 64
        Height = 21
        TabOrder = 3
        OnChange = EFCalendarioHChange
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
      object EFIncidenciaD: TLFEditFind2000
        Left = 110
        Top = 166
        Width = 64
        Height = 21
        TabOrder = 6
        OnChange = EFIncidenciaDChange
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
      object EFIncidenciaH: TLFEditFind2000
        Left = 110
        Top = 188
        Width = 64
        Height = 21
        TabOrder = 7
        OnChange = EFIncidenciaHChange
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
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object LabelFechaD: TLFLabel
        Left = 44
        Top = 12
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LabelFechaH: TLFLabel
        Left = 216
        Top = 12
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object DEFiltroFechaDesde: TLFDateEdit
        Left = 111
        Top = 8
        Width = 94
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DEFiltroFechaHasta: TLFDateEdit
        Left = 282
        Top = 8
        Width = 94
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object BMesAnterio: TButton
        Left = 386
        Top = 8
        Width = 25
        Height = 22
        Caption = '<<'
        TabOrder = 2
        OnClick = BMesAnterioClick
      end
      object BEjercicio: TButton
        Left = 412
        Top = 8
        Width = 31
        Height = 22
        Caption = 'A'#241'o'
        TabOrder = 3
        OnClick = BEjercicioClick
      end
      object BMes: TButton
        Left = 444
        Top = 8
        Width = 31
        Height = 22
        Caption = 'Mes'
        TabOrder = 4
        OnClick = BMesClick
      end
      object BHoy: TButton
        Left = 476
        Top = 8
        Width = 31
        Height = 22
        Caption = 'Hoy'
        TabOrder = 5
        OnClick = BHoyClick
      end
      object BMesSiguiente: TButton
        Left = 508
        Top = 8
        Width = 25
        Height = 22
        Caption = '>>'
        TabOrder = 6
        OnClick = BMesSiguienteClick
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 304
    TabOrder = 0
    inherited EComentario: TLFEdit
      TabOrder = 2
    end
    inherited CBOrden: TLFComboBox
      TabOrder = 0
    end
    inherited TDPFechaListado: TLFDateEdit
      TabOrder = 1
    end
  end
  inherited ALMain: TLFActionList
    Left = 412
    Top = 0
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 380
    Top = 0
  end
end
