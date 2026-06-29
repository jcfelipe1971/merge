inherited ProFMMarcajesMaq: TProFMMarcajesMaq
  Left = 440
  Top = 143
  Width = 907
  Height = 477
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes M'#225'quina'
  PopupMenu = CeDetMaqPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 897
    Height = 424
    inherited TBMain: TLFToolBar
      Width = 893
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = ProDMMarcajesMaq.DSQMProCabMarca
        Hints.Strings = ()
        EditaControl = DBEFMaquina
        InsertaControl = DBEFMaquina
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Width = 78
        VisibleButtons = [neRango, neReport, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 296
      end
      inherited TbuttComp: TToolButton
        Left = 304
      end
    end
    inherited PCMain: TLFPageControl
      Width = 893
      Height = 145
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 885
          Height = 117
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              ' ')
            Tabla_a_buscar = 'PRO_ORD_CAB_MARCA'
            CampoNum = 'MAQUINA'
            CampoStr = 'FECHA'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LMaquina: TLFLabel
            Left = 26
            Top = 9
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
          end
          object LFecha: TLFLabel
            Left = 37
            Top = 31
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LHorasLab: TLFLabel
            Left = 7
            Top = 75
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total h. Lab.'
            FocusControl = DBETiempoTotal
          end
          object LOperario: TLFLabel
            Left = 27
            Top = 53
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operario'
          end
          object DBEFMaquina: TLFDBEditFind2000
            Left = 71
            Top = 7
            Width = 80
            Height = 21
            DataField = 'MAQUINA'
            DataSource = ProDMMarcajesMaq.DSQMProCabMarca
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODMAQ')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescripcionMaquina: TLFDbedit
            Left = 153
            Top = 7
            Width = 350
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'DescripMaq'
            DataSource = ProDMMarcajesMaq.DSQMProCabMarca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBDateTimePicker1: TLFDBDateEdit
            Left = 71
            Top = 29
            Width = 80
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMMarcajesMaq.DSQMProCabMarca
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBETiempoTotal: TLFDbedit
            Left = 71
            Top = 73
            Width = 80
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIEMPO_TOT'
            DataSource = ProDMMarcajesMaq.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBEFOperario: TLFDBEditFind2000
            Left = 71
            Top = 51
            Width = 80
            Height = 21
            DataField = 'OPERARIO'
            DataSource = ProDMMarcajesMaq.DSQMProCabMarca
            TabOrder = 3
            OnChange = DBEFOperarioChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.CampoCodigo = 'EMPLEADO'#13#10
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            CampoADevolver = 'EMPLEADO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'EMPLEADO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitOperario: TLFEdit
            Left = 153
            Top = 51
            Width = 350
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
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 885
          Height = 117
          DataSource = ProDMMarcajesMaq.DSQMProCabMarca
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescripMaq'
              Width = 283
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_TOT'
              Visible = True
            end>
        end
      end
    end
    object PNLDetMaq: TLFPanel
      Left = 2
      Top = 173
      Width = 893
      Height = 249
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFDetalleMaq: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 893
        Height = 170
        Align = alClient
        DataSource = ProDMMarcajesMaq.DSQMProDetMarca
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColExit = DBGFDetalleMaqColExit
        OnDblClick = DBGFDetalleMaqDblClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 1
        UsaDicG2K = True
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
        BuscarNums = False
        Campos.Strings = (
          'LINEA_FASE'
          'LINEA_TAREA'
          'RECURSO'
          'RIG_OF'
          'IDTAREA'
          'TIPO_INCIDENCIA_MAQ')
        CamposAMostrar.Strings = (
          'LINEA_FASE'
          '0'
          'LINEA_TAREA'
          '0'
          'RECURSO'
          '0'
          'RIG_OF'
          '0'
          'IDTAREA'
          '4'
          'TITULO_COMPUESTO'
          'COMPUESTO'
          'RIG_OF'
          'EJERCICIO'
          'TIPO_INCIDENCIA_MAQ'
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
          ''
          ''
          ''
          ''
          '')
        CamposDesplegar.Strings = (
          '1'
          '1'
          '1'
          '1'
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'ESTADO'
          'NO_PRODUCTIVA')
        ColumnasChecked.Strings = (
          '1'
          '1')
        ColumnasNoChecked.Strings = (
          '0'
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'LINEA_FASE'
          'LINEA_TAREA'
          'RECURSO'
          'RIG_OF'
          'IDENTIFICADOR'
          'TIPO')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'PRO_ORD_FASES'
          'PRO_ORD_TAREA'
          'PRO_RECURSOS'
          'PRO_ORD'
          'PRO_VER_TAREAS_ABIERTAS'
          'SYS_TIPO_INCIDENCIAS_MAQ')
        Acciones.Strings = (
          ''
          ''
          ''
          ''
          ''
          '')
        Titulos.Strings = (
          'FASE'
          'TAREA'
          'TITULO'
          'ESCANDALLO'
          'TAREA'
          'DESCRIPCION')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleMaqBusqueda
        Planes.Strings = (
          ''
          ''
          ''
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'LINEA_FASE'
          'LINEA_TAREA'
          'RECURSO'
          'RIG_OF'
          'LINEA_TAREA'
          'TIPO')
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
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDTAREA'
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
            FieldName = 'COMPUESTO'
            ReadOnly = True
            Width = 100
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescCompuesto'
            ReadOnly = True
            Width = 200
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
            FieldName = 'DescripFase'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_TAREA'
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
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_MARCAJE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA_INICIO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA_FIN'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIEMPO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIEMPO_DEC'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OPERARIO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TitOperario'
            ReadOnly = True
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECURSO'
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
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_RECURSO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL_RECURSO'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_FAB'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_INCIDENCIA_MAQ'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescIncidencia'
            ReadOnly = True
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EFICIENCIA'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOTIVO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NO_PRODUCTIVA'
            Visible = True
          end>
      end
      object DBMNotas: TLFDBMemo
        Left = 0
        Top = 192
        Width = 893
        Height = 57
        Align = alBottom
        DataField = 'NOTAS'
        DataSource = ProDMMarcajesMaq.DSQMProDetMarca
        TabOrder = 1
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 893
        Height = 22
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 2
        Separators = True
        object NavDetMaq: THYMNavigator
          Left = 0
          Top = 0
          Width = 200
          Height = 22
          DataSource = ProDMMarcajesMaq.DSQMProDetMarca
          Flat = True
          ParentShowHint = False
          PopupMenu = CeDetMaqPMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalleMaq
          InsertaControl = DBGFDetalleMaq
          Exclusivo = True
          ControlEdit = CeDetMaq
          OrdenAscendente = True
          InsertaUltimo = True
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 424
    Width = 897
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CeDetMaq
    Left = 798
    Top = 1
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 831
    Top = 1
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 864
    Top = 1
  end
  inherited FSMain: TLFFibFormStorage
    Left = 766
    Top = 1
  end
  object CeDetMaq: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CeDetMaqPMEdit
    Teclas = DMMain.Teclas
    Left = 798
    Top = 32
  end
  object CeDetMaqPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 831
    Top = 32
    object CeDetMaqMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CeDetMaqMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CeDetMaqMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CeDetMaqMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CeDetMaqMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CeDetMaqMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CeDetMaqMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CeDetMaqMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CeDetMaqMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CeDetMaqMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
