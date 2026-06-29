inherited ProFMMarcajesOpeEsp: TProFMMarcajesOpeEsp
  Left = 407
  Top = 174
  Width = 645
  Height = 453
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes Operario Especial'
  PopupMenu = CEDetMOPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 635
    Height = 400
    inherited TBMain: TLFToolBar
      Width = 631
      inherited NavMain: THYMNavigator
        DataSource = ProDMMarcajesOpeEsp.DSQMProCabMarca
        Hints.Strings = ()
        EditaControl = DBEFOperario
        InsertaControl = DBEFOperario
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
      Width = 631
      Height = 145
      Align = alTop
      inherited TSFicha: TTabSheet
        object SBAOperario: TSpeedButton [0]
          Left = 139
          Top = 22
          Width = 65
          Height = 24
          Hint = 'Doble click o Ctrl+Alt+E para ver los datos del Empleado'
          GroupIndex = -1
          OnDblClick = SBAOperarioDblClick
        end
        inherited PEdit: TLFPanel
          Width = 623
          Height = 117
          inherited G2KTableLoc: TG2KTBLoc
            Top = 48
            Plan.Strings = (
              ' ')
            CamposADesplegar.Strings = (
              'FECHA'
              'NOMBRE_R_SOCIAL')
            DataSource = ProDMMarcajesOpeEsp.DSQMProCabMarca
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_PRO_ORD_CAB_MARCA'
            CampoNum = 'RIG'
            CampoStr = 'OPERARIO'
            CondicionBusqueda = 'TIPO='#39'MO'#39
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LOperario: TLFLabel
            Left = 26
            Top = 40
            Width = 40
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Operario'
          end
          object LFecha: TLFLabel
            Left = 26
            Top = 62
            Width = 40
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Fecha'
          end
          object LTotalHoras: TLFLabel
            Left = 176
            Top = 63
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total h. Lab.'
            FocusControl = DBETotalHoras
          end
          object LRIG: TLFLabel
            Left = 47
            Top = 19
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'RIG'
            FocusControl = DBERIG
          end
          object DBEFOperario: TLFDBEditFind2000
            Left = 71
            Top = 37
            Width = 98
            Height = 21
            Color = clWhite
            DataField = 'OPERARIO'
            DataSource = ProDMMarcajesOpeEsp.DSQMProCabMarca
            TabOrder = 1
            OnChange = DBEFOperarioChange
            OnDblClick = SBAOperarioDblClick
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
            Tabla_asociada.CampoCodigo = 'EMPLEADO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescOperario: TLFDbedit
            Left = 170
            Top = 37
            Width = 353
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = ProDMMarcajesOpeEsp.DSQMProCabMarca
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
          object DBDateTimePicker4: TLFDBDateEdit
            Left = 71
            Top = 59
            Width = 98
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMMarcajesOpeEsp.DSQMProCabMarca
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBETotalHoras: TLFDbedit
            Left = 240
            Top = 59
            Width = 89
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIEMPO_TOT'
            DataSource = ProDMMarcajesOpeEsp.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBERIG: TLFDbedit
            Left = 71
            Top = 15
            Width = 98
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = ProDMMarcajesOpeEsp.DSQMProCabMarca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 623
          Height = 117
          DataSource = ProDMMarcajesOpeEsp.DSQMProCabMarca
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          UsaDicG2K = False
          CamposAOrdenar.Strings = (
            'DESCRIPCION_MAQ'
            'FECHA'
            'ID_ORDEN'
            'MAQUINA'
            'NOMBRE_R_SOCIAL'
            'OPERARIO'
            'PROVEEDOR'
            'RIG'
            'RIG_OFF'
            'TIEMPO_TOT'
            'TIPOFASE'
            'TIPOIMPUTACION'
            'VARIOS')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 266
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
              FieldName = 'TIEMPO_TOT'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOIMPUTACION'
              Visible = True
            end>
        end
      end
    end
    object PNLDetMO: TLFPanel
      Left = 2
      Top = 173
      Width = 631
      Height = 225
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 631
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
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 200
          Height = 22
          DataSource = ProDMMarcajesOpeEsp.DSQMProDetMarca
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetMOPMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = True
          ControlEdit = CEDetMO
          OrdenAscendente = True
          InsertaUltimo = True
        end
      end
      object DBMNotas: TLFDBMemo
        Left = 0
        Top = 189
        Width = 631
        Height = 36
        Align = alBottom
        DataField = 'NOTAS'
        DataSource = ProDMMarcajesOpeEsp.DSQMProDetMarca
        TabOrder = 2
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 631
        Height = 167
        Align = alClient
        DataSource = ProDMMarcajesOpeEsp.DSQMProDetMarca
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFDetalleColEnter
        OnColExit = DBGFDetalleColExit
        OnDblClick = DBGFDetalleDblClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 2
        UsaDicG2K = False
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = True
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 0
        BaseDeDatos = DMMain.DataBase
        Transaction = ProDMMarcajesOpeEsp.TLocal
        BuscarNums = False
        Campos.Strings = (
          'RECURSO'
          'IMPUTACION'
          'TIPOFASE'
          'TIPOTAREA'
          'ID_ORDEN')
        CamposAMostrar.Strings = (
          'RECURSO'
          '0'
          'IMPUTACION'
          '0'
          'TIPOFASE'
          '0'
          'TIPOTAREA'
          '0'
          'ID_ORDEN'
          '1'
          'RIG_OF')
        CamposAMostrarAnchos.Strings = (
          '5'
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
          'ESTADO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'RECURSO'
          'IMPUTACION'
          'FASE'
          'TAREA'
          'ID_ORDEN')
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tablas.Strings = (
          'PRO_RECURSOS'
          'OPE_EMPLEADO_PRE'
          'PRO_SYS_FASES'
          'PRO_SYS_TAREAS'
          'PRO_ORD')
        Acciones.Strings = (
          ''
          ''
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'DESCRIPCION'
          'TITULO'
          'TITULO'
          'COMPUESTO')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleBusqueda
        Planes.Strings = (
          ''
          ''
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'RECURSO'
          'IMPUTACION'
          'FASE'
          'TAREA'
          'ID_ORDEN'
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
            Width = 32
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IDTAREA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
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
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_FASE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 197
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPOTAREA'
            Width = 64
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_TAREA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 193
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA_INICIO'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'HORA_FIN'
            Width = 54
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIEMPO'
            ReadOnly = True
            Width = 58
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIEMPO_DEC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RECURSO'
            Width = 64
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_RECURSO'
            ReadOnly = True
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRECIO_RECURSO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TOTAL_RECURSO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES_FAB'
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPUTACION'
            Width = 64
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_IMPUTACION'
            ReadOnly = True
            Width = 64
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ESTADO'
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 400
    Width = 635
    ButtonWidth = 70
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetMO
    Left = 348
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 400
    Top = 80
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 472
    Top = 120
    object ARecalcula: TAction
      Category = 'Procesos'
      Caption = 'Recalcula tiempos'
      ImageIndex = 11
      OnExecute = ARecalculaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  object CEDetMO: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CEDetMOPMEdit
    Teclas = DMMain.Teclas
    Left = 352
    Top = 104
  end
  object CEDetMOPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 400
    Top = 128
    object CEDetMOMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetMOMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetMOMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetMOMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetMOMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetMOMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetMOMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetMOMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetMOMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetMOMirefresh: TMenuItem
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
    Left = 520
    Top = 120
    object AAOperario: TAction
      Caption = 'AAOperario'
      OnExecute = AAOperarioExecute
    end
  end
end
