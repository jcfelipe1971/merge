inherited ProFMMarcajesTE: TProFMMarcajesTE
  Left = 308
  Top = 214
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Marcajes T.Exterior'
  PopupMenu = CEDetTePMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 398
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = ProDMMarcajesTe.DSQMProCabMarca
        Hints.Strings = ()
        EditaControl = DBEFProveedor
        InsertaControl = DBEFProveedor
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        DataSource = ProDMMarcajesTe.DSQMProCabMarca
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
            CampoStr = 'PROVEEDOR'
          end
          object LProveedor: TLFLabel
            Left = 17
            Top = 32
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LFecha: TLFLabel
            Left = 36
            Top = 54
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LTiempoTotal: TLFLabel
            Left = 208
            Top = 54
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total h. Lab.'
            FocusControl = DBETiempoTotal
          end
          object DBEFProveedor: TLFDBEditFind2000
            Left = 71
            Top = 29
            Width = 98
            Height = 21
            DataField = 'PROVEEDOR'
            DataSource = ProDMMarcajesTe.DSQMProCabMarca
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_PROVEEDORES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloProveedor: TLFDbedit
            Left = 170
            Top = 29
            Width = 353
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'DESC_PROVEEDOR'
            DataSource = ProDMMarcajesTe.DSQMProCabMarca
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DTPFecha: TLFDBDateEdit
            Left = 71
            Top = 51
            Width = 98
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMMarcajesTe.DSQMProCabMarca
            CheckOnExit = True
            ButtonWidth = 16
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBETiempoTotal: TLFDbedit
            Left = 272
            Top = 51
            Width = 98
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIEMPO_TOT'
            DataSource = ProDMMarcajesTe.DSxInfoActualizada
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
          DataSource = ProDMMarcajesTe.DSQMProCabMarca
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_PROVEEDOR'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 82
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
    object PNLDetalleTe: TLFPanel
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
        object HYMNavigator1: THYMNavigator
          Left = 0
          Top = 0
          Width = 200
          Height = 22
          DataSource = ProDMMarcajesTe.DSQMProDetMarca
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetTePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalleTe
          InsertaControl = DBGFDetalleTe
          Exclusivo = True
          ControlEdit = CEDetTe
          OrdenAscendente = True
          InsertaUltimo = True
        end
      end
      object DBGFDetalleTe: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 586
        Height = 163
        Align = alClient
        DataSource = ProDMMarcajesTe.DSQMProDetMarca
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGFDetalleTeColEnter
        OnColExit = DBGFDetalleTeColExit
        OnDblClick = DBGFDetalleTeDblClick
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
        Transaction = ProDMMarcajesTe.TLocal
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
          '1'
          'COMPUESTO'
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
        OnBusqueda = DBGFDetalleTeBusqueda
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
            Width = 34
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
            Expanded = False
            FieldName = 'RIG_OF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA_FASE'
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
            Width = 197
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
            ReadOnly = True
            Width = 193
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
            ReadOnly = True
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
            FieldName = 'FECHA_PREV'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_REAL'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_REF_SAL'
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
            Width = 39
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
        DataSource = ProDMMarcajesTe.DSQMProDetMarca
        TabOrder = 2
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    DataSource = ProDMMarcajesTe.DSQMProCabMarca
    EnlazadoA = CEDetTe
    Left = 404
    Top = 52
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 448
    Top = 56
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  object CEDetTe: TControlEdit
    DataSource = ProDMMarcajesTe.DSQMProDetMarca
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CEDetTePMEdit
    Teclas = DMMain.Teclas
    Left = 408
    Top = 96
  end
  object CEDetTePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 448
    Top = 96
    object CEDetTeMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetTeMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetTeMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetTeMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetTeMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetTeMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetTeMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetTeMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetTeMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetTeMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
