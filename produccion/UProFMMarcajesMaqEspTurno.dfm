inherited ProFMMarcajesMaqEspTurno: TProFMMarcajesMaqEspTurno
  Left = 223
  Top = 259
  Width = 800
  Height = 550
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes M'#225'quina Especial Turno'
  PopupMenu = CeDetMaqPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 497
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
        Hints.Strings = ()
        EditaControl = DBEID_Orden
        InsertaControl = DBEID_Orden
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Width = 54
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 145
      Align = alTop
      inherited TSFicha: TTabSheet
        object SBAOrden: TSpeedButton [0]
          Left = 76
          Top = 86
          Width = 65
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+S para ver los datos de la Orden'
          GroupIndex = -1
        end
        inherited PEdit: TLFPanel
          Width = 778
          Height = 117
          inherited G2KTableLoc: TG2KTBLoc
            Left = 12
            Top = 4
            Plan.Strings = (
              ' ')
            DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_ORD_CAB_MARCA'
            CampoNum = 'ID_ORDEN'
            CampoStr = 'TIPOFASE'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LOrden: TLFLabel
            Left = 39
            Top = 30
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LFase: TLFLabel
            Left = 44
            Top = 51
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LMaquina: TLFLabel
            Left = 27
            Top = 72
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
          end
          object DBEID_Orden: TLFDBEditFind2000
            Left = 71
            Top = 26
            Width = 98
            Height = 21
            DataField = 'ID_ORDEN'
            DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'FECHA_ORD'
            CondicionBusqueda = 'SITUACION >0 AND SITUACION<4'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFase: TLFDBEditFind2000
            Left = 71
            Top = 48
            Width = 98
            Height = 21
            DataField = 'TIPOFASE'
            DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
            TabOrder = 1
            OnChange = DBEFaseChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ORD_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPOFASE'
            CampoStr = 'FASE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFaseBusqueda
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitulo_Maquina: TLFDbedit
            Left = 170
            Top = 70
            Width = 353
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'DescripMaq'
            DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEMaquina: TLFDBEditFind2000
            Left = 71
            Top = 70
            Width = 98
            Height = 21
            DataField = 'MAQUINA'
            DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
            TabOrder = 3
            OnChange = DBEMaquinaChange
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
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitulo_Fase: TLFDbedit
            Left = 170
            Top = 48
            Width = 353
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'DescripFase'
            DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object ECompuesto: TLFDbedit
            Left = 170
            Top = 26
            Width = 169
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'COMPUESTO'
            DataSource = ProDMMarcajesMaqEspTurno.DSxCompuesto
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
          Width = 778
          Height = 117
          DataSource = ProDMMarcajesMaqEspTurno.DSQMProCabMarca
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOFASE'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescripFase'
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
              Width = 154
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Compuesto'
              Width = 65
              Visible = True
            end>
        end
      end
    end
    object PNLDetMaq: TLFPanel
      Left = 2
      Top = 173
      Width = 786
      Height = 322
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFDetalleMaq: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 786
        Height = 262
        Align = alClient
        DataSource = ProDMMarcajesMaqEspTurno.DSQMProDetMarca
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFDetalleMaqColEnter
        OnColExit = DBGFDetalleMaqColExit
        IniStorage = FSMain
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
        Campos.Strings = (
          'RECURSO'
          'TIPOTAREA'
          'TURNO'
          'CAUSA'
          'TIPO_DEFECTO')
        CamposAMostrar.Strings = (
          'RECURSO'
          '0'
          'TIPOTAREA'
          '0'
          'TURNO'
          '0'
          'CAUSA'
          '0'
          'TIPO_DEFECTO'
          '0')
        CamposAMostrarAnchos.Strings = (
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
          '')
        CamposDesplegar.Strings = (
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
          'RECURSO'
          'TAREA'
          'TURNO'
          'CAUSA'
          'CODIGO_DEFECTO')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'PRO_RECURSOS'
          'PRO_SYS_TAREAS'
          'PRO_TURNOS'
          'PRO_CAUSAS'
          'PRO_SYS_TIPO_DEFECTO')
        Acciones.Strings = (
          ''
          ''
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'TITULO'
          'DESCRIPCION'
          'DESCRIPCION'
          'DESCRIPCION')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleMaqBusqueda
        Planes.Strings = (
          ''
          ''
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'RECURSO'
          'TAREA'
          'TURNO'
          'CAUSA'
          'CODIGO_DEFECTO')
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FECHA_DET'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOTAREA'
            Width = 36
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescripTarea'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TURNO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescTurno'
            ReadOnly = True
            Width = 168
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
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIEMPO'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_FAB'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NO_PRODUCTIVA'
            Width = 77
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORAS_NO_PRODUCTIVAS'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_DEFEC'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MOTIVO'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAUSA'
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescCausa'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DEFECTO'
            Width = 74
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescDefecto'
            ReadOnly = True
            Width = 123
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECURSO'
            Width = 65
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
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 786
        Height = 22
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object NavDetMaq: THYMNavigator
          Left = 0
          Top = 0
          Width = 200
          Height = 22
          DataSource = ProDMMarcajesMaqEspTurno.DSQMProDetMarca
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
      object DBMNotas: TLFDBMemo
        Left = 0
        Top = 284
        Width = 786
        Height = 38
        Align = alBottom
        DataField = 'NOTAS'
        DataSource = ProDMMarcajesMaqEspTurno.DSQMProDetMarca
        TabOrder = 2
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 497
    Width = 790
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CeDetMaq
    Left = 212
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 272
    Top = 24
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 272
    Top = 56
    object ALstInforme: TAction
      Category = 'Listado'
      Caption = 'Listado Informe'
      Hint = 'Listado Informe Marcajes'
      ImageIndex = 14
      OnExecute = ALstInformeExecute
    end
    object ALstEficiencia: TAction
      Category = 'Listado'
      Caption = 'Listado Eficiencia'
      Hint = 'Listado Eficiencia Marcajes'
      ImageIndex = 14
      OnExecute = ALstEficienciaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 206
    Top = 134
  end
  object CeDetMaq: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CeDetMaqPMEdit
    Teclas = DMMain.Teclas
    Left = 168
    Top = 40
  end
  object CeDetMaqPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 272
    Top = 88
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
