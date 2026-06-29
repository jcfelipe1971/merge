inherited ProFMMarcajesMaqEsp: TProFMMarcajesMaqEsp
  Left = 255
  Top = 200
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes M'#225'quina Especial'
  PopupMenu = CeDetMaqPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 398
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        Width = 210
        DataSource = ProDMMarcajesMaqEsp.DSQMProCabMarca
        Hints.Strings = ()
        EditaControl = DBEFMaquina
        InsertaControl = DBEFMaquina
      end
      inherited TSepNav: TToolButton
        Left = 210
      end
      inherited EPMain: THYMEditPanel
        Left = 218
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 298
      end
      inherited TbuttComp: TToolButton
        Left = 306
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 145
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 117
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              ' ')
            CamposADesplegar.Strings = (
              'FECHA'
              'DESCRIPCION_MAQ')
            DataSource = ProDMMarcajesMaqEsp.DSQMProCabMarca
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_PRO_ORD_CAB_MARCA'
            CampoNum = 'RIG'
            CampoStr = 'FECHA'
            CondicionBusqueda = 'TIPO='#39'HM'#39
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LMaquina: TLFLabel
            Left = 26
            Top = 32
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
          end
          object LFecha: TLFLabel
            Left = 37
            Top = 54
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LTiempoTotal: TLFLabel
            Left = 177
            Top = 55
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total h. Lab.'
            FocusControl = DBETiempoTotal
          end
          object DBEFMaquina: TLFDBEditFind2000
            Left = 71
            Top = 29
            Width = 98
            Height = 21
            DataField = 'MAQUINA'
            DataSource = ProDMMarcajesMaqEsp.DSQMProCabMarca
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
          object DBEMaquina: TLFDbedit
            Left = 170
            Top = 29
            Width = 353
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'DESCRIPCION_MAQ'
            DataSource = ProDMMarcajesMaqEsp.DSQMProCabMarca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 71
            Top = 51
            Width = 98
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMMarcajesMaqEsp.DSQMProCabMarca
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBETiempoTotal: TLFDbedit
            Left = 240
            Top = 51
            Width = 89
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIEMPO_TOT'
            DataSource = ProDMMarcajesMaqEsp.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 117
          DataSource = ProDMMarcajesMaqEsp.DSQMProCabMarca
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
              FieldName = 'DESCRIPCION_MAQ'
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
      Width = 586
      Height = 223
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFDetalleMaq: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 586
        Height = 163
        Align = alClient
        DataSource = ProDMMarcajesMaqEsp.DSQMProDetMarca
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFDetalleMaqColEnter
        OnColExit = DBGFDetalleMaqColExit
        OnDblClick = DBGFDetalleMaqDblClick
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 2
        UsaDicG2K = True
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
        BuscarNums = False
        Campos.Strings = (
          'RECURSO'
          'TIPOFASE'
          'TIPOTAREA'
          'ID_ORDEN')
        CamposAMostrar.Strings = (
          'RECURSO'
          '0'
          'TIPOFASE'
          '0'
          'TIPOTAREA'
          '0'
          'ID_ORDEN'
          '1'
          'RIG_OF')
        CamposAMostrarAnchos.Strings = (
          '10'
          '0'
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          ''
          ''
          ''
          '')
        CamposDesplegar.Strings = (
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
          'FASE'
          'TAREA'
          'ID_ORDEN')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'PRO_RECURSOS'
          'PRO_SYS_FASES'
          'PRO_SYS_TAREAS'
          'PRO_ORD')
        Acciones.Strings = (
          ''
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'TITULO'
          'TITULO'
          'COMPUESTO')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleMaqBusqueda
        Planes.Strings = (
          ''
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'RECURSO'
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
            Width = 40
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
            FieldName = 'TIPOTAREA'
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
          end>
      end
      object DBMNotas: TLFDBMemo
        Left = 0
        Top = 185
        Width = 586
        Height = 38
        Align = alBottom
        DataField = 'NOTAS'
        DataSource = ProDMMarcajesMaqEsp.DSQMProDetMarca
        Enabled = False
        TabOrder = 1
      end
      object ToolBar1: TLFToolBar
        Left = 0
        Top = 0
        Width = 586
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
          DataSource = ProDMMarcajesMaqEsp.DSQMProDetMarca
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
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CeDetMaq
    Left = 212
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 272
    Top = 24
  end
  inherited ALMain: TLFActionList
    Left = 272
    Top = 56
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
    Left = 184
    Top = 72
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
