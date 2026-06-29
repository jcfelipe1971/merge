inherited ProFMMarcajesVa: TProFMMarcajesVa
  Left = 313
  Top = 159
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes Varios'
  PopupMenu = CeDetVaPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 398
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBEditFind20001
        InsertaControl = DBEditFind20001
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neRango, neSalir]
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
            Tabla_a_buscar = 'PRO_ORD_CAB_MARCA'
            CampoNum = 'RIG'
            CampoStr = 'VARIOS'
          end
          object Label11: TLFLabel
            Left = 35
            Top = 32
            Width = 30
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Otros'
          end
          object Label9: TLFLabel
            Left = 36
            Top = 54
            Width = 30
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Fecha'
          end
          object Label10: TLFLabel
            Left = 178
            Top = 55
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total h. Lab.'
            FocusControl = DBEdit6
          end
          object DBEdit7: TLFDbedit
            Left = 169
            Top = 29
            Width = 353
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMMarcajesVa.DSxCabRecurso
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBDateTimePicker3: TLFDBDateEdit
            Left = 72
            Top = 51
            Width = 98
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMMarcajesVa.DSQMProCabMarca
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEdit6: TLFDbedit
            Left = 241
            Top = 51
            Width = 89
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIEMPO_TOT'
            DataSource = ProDMMarcajesVa.DSQMProCabMarca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBEditFind20001: TLFDBEditFind2000
            Left = 72
            Top = 29
            Width = 96
            Height = 21
            DataField = 'VARIOS'
            DataSource = ProDMMarcajesVa.DSQMProCabMarca
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tiporecurso='#39'VAR'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 117
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VARIOS'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescripVar'
              Width = 271
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_TOT'
              Width = 58
              Visible = True
            end>
        end
      end
    end
    object PNLDetVa: TLFPanel
      Left = 2
      Top = 173
      Width = 586
      Height = 223
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
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
        TabOrder = 0
        Separators = True
        object NavDetalleVar: THYMNavigator
          Left = 0
          Top = 0
          Width = 200
          Height = 22
          DataSource = ProDMMarcajesVa.DSQMProDetMarca
          Flat = True
          ParentShowHint = False
          PopupMenu = CeDetVaPMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalleVa
          InsertaControl = DBGFDetalleVa
          Exclusivo = True
          ControlEdit = CeDetVa
          OrdenAscendente = True
          InsertaUltimo = True
        end
      end
      object DBGFDetalleVa: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 586
        Height = 163
        Align = alClient
        DataSource = ProDMMarcajesVa.DSQMProDetMarca
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFDetalleVaColEnter
        OnColExit = DBGFDetalleVaColExit
        OnDblClick = DBGFDetalleVaDblClick
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
        IndiceBitmapAscendente = 0
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 0
        BaseDeDatos = DMMain.DataBase
        Transaction = ProDMMarcajesVa.TLocal
        BuscarNums = False
        Campos.Strings = (
          'LINEA_FASE'
          'LINEA_TAREA'
          'RECURSO'
          'RIG_OF'
          'IDTAREA')
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
          'EJERCICIO')
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
          'ESTADO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'LINEA_FASE'
          'LINEA_TAREA'
          'RECURSO'
          'RIG_OF'
          'IDENTIFICADOR')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'PRO_ORD_FASES'
          'PRO_ORD_TAREA'
          'PRO_RECURSOS'
          'PRO_ORD'
          'PRO_VER_TAREAS_ABIERTAS')
        Acciones.Strings = (
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
          'TAREA')
        Posicion = tpCentrado
        OnBusqueda = DBGFDetalleVaBusqueda
        Planes.Strings = (
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
          'IDENTIFICADOR')
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
            Expanded = False
            FieldName = 'RIG_OF'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_FASE'
            Width = 38
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
            Width = 197
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_TAREA'
            Width = 39
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
            Width = 197
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
            Width = 43
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
            Width = 47
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
            Width = 197
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
            ReadOnly = True
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
            Visible = True
          end>
      end
      object DBMemo1: TLFDBMemo
        Left = 0
        Top = 185
        Width = 586
        Height = 38
        Align = alBottom
        DataSource = ProDMMarcajesVa.DSQMProDetMarca
        TabOrder = 2
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CeDetVa
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 304
    Top = 40
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 150
    Top = 22
  end
  object CeDetVa: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CeDetVaPMEdit
    Teclas = DMMain.Teclas
    Left = 272
    Top = 72
  end
  object CeDetVaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 304
    Top = 72
    object CeDetVaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CeDetVaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CeDetVaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CeDetVaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CeDetVaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CeDetVaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CeDetVaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CeDetVaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CeDetVaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CeDetVaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
