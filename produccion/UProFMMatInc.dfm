inherited ProFMMatInc: TProFMMatInc
  Left = 472
  Top = 156
  Width = 800
  Height = 529
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Incidencias Material'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 476
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = ProDMMatInc.DSQMProCabInc
        Hints.Strings = ()
        EditaControl = DBEFIdOrden
        InsertaControl = DBEFIdOrden
        InsertaUltimo = True
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEFIdOrden
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
      Width = 786
      Height = 173
      Align = alTop
      inherited TSFicha: TTabSheet
        object SBAMovManStock: TSpeedButton [0]
          Left = 606
          Top = 91
          Width = 115
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          OnDblClick = SBAMovManStockDblClick
        end
        inherited PEdit: TLFPanel
          Width = 778
          Height = 145
          inherited G2KTableLoc: TG2KTBLoc
            Left = 16
            Top = 8
            Plan.Strings = (
              '')
            DataSource = ProDMMatInc.DSQMProCabInc
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_MAT_INC_C'
            CampoNum = 'RIG'
            CampoStr = 'FECHA'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LIdOrden: TLFLabel
            Left = 38
            Top = 29
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id. Orden'
          end
          object LFecha: TLFLabel
            Left = 202
            Top = 6
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LLineaFase: TLFLabel
            Left = 28
            Top = 72
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'L'#237'nea Fase'
          end
          object LParte: TLFLabel
            Left = 44
            Top = 6
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Parte n'#186
          end
          object LIDOrden2: TLFLabel
            Left = 558
            Top = 29
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id. Orden'
          end
          object LFase: TLFLabel
            Left = 579
            Top = 51
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LAlmacenSalida: TLFLabel
            Left = 30
            Top = 94
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Salida'
          end
          object LAlmacenLanzamiento: TLFLabel
            Left = 34
            Top = 118
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alm. Lanz.'
          end
          object LTotal: TLFLabel
            Left = 576
            Top = 72
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total'
          end
          object LMovManStock: TLFLabel
            Left = 576
            Top = 94
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Mov.'
          end
          object LOrden: TLFLabel
            Left = 53
            Top = 51
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object DBEFIdOrden: TLFDBEditFind2000
            Left = 86
            Top = 25
            Width = 98
            Height = 21
            DataField = 'ID_ORDEN'
            DataSource = ProDMMatInc.DSQMProCabInc
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ORD'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_ORDEN'
            CampoStr = 'COMPUESTO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFIdOrdenBusqueda
            OrdenadoPor.Strings = (
              'ID_ORDEN')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitulo: TLFDbedit
            Left = 185
            Top = 69
            Width = 361
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'DESCRIPFASE'
            DataSource = ProDMMatInc.DSQMProCabInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 237
            Top = 3
            Width = 98
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMMatInc.DSQMProCabInc
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEFFase: TLFDBEditFind2000
            Left = 86
            Top = 69
            Width = 98
            Height = 21
            DataField = 'LINEA_FASE'
            DataSource = ProDMMatInc.DSQMProCabInc
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ORD_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'LINEA_FASE'
            CampoStr = 'FASE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFFaseBusqueda
            OrdenadoPor.Strings = (
              'ORDEN, LINEA_FASE')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBERig: TLFDbedit
            Left = 86
            Top = 3
            Width = 98
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = ProDMMatInc.DSQMProCabInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object EIdOrden: TLFEdit
            Left = 606
            Top = 25
            Width = 100
            Height = 21
            TabStop = False
            TabOrder = 7
            OnKeyDown = EIdOrdenKeyDown
          end
          object EFase: TLFEdit
            Left = 606
            Top = 47
            Width = 100
            Height = 21
            TabStop = False
            TabOrder = 8
            OnKeyDown = EFaseKeyDown
          end
          object LFDBEFAlmSal: TLFDBEditFind2000
            Left = 86
            Top = 91
            Width = 98
            Height = 21
            DataField = 'ALMACEN_SAL'
            DataSource = ProDMMatInc.DSQMProCabInc
            TabOrder = 5
            OnChange = LFDBEFAlmSalChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBEFAlmLanz: TLFDBEditFind2000
            Left = 86
            Top = 113
            Width = 98
            Height = 21
            DataField = 'ALMACEN_LAN'
            DataSource = ProDMMatInc.DSQMProCabInc
            TabOrder = 6
            OnChange = LFDBEFAlmLanzChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDescAlmSal: TLFEdit
            Left = 185
            Top = 91
            Width = 361
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 13
          end
          object LFDescAlmLanz: TLFEdit
            Left = 185
            Top = 113
            Width = 361
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBEDescCompuesto: TLFDbedit
            Left = 185
            Top = 47
            Width = 117
            Height = 21
            Color = clInfoBk
            DataField = 'COMPUESTO'
            DataSource = ProDMMatInc.DSQMProCabInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 10
          end
          object DBETituloCompuesto: TLFDbedit
            Left = 303
            Top = 47
            Width = 243
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMMatInc.DSQMProCabInc
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object LFDBTotal: TLFDbedit
            Left = 606
            Top = 69
            Width = 100
            Height = 21
            Color = clInfoBk
            DataField = 'TOTALDETALLE'
            DataSource = ProDMMatInc.DSxTotalDetalle
            Enabled = False
            TabOrder = 9
          end
          object DBEMovManStock: TLFDbedit
            Left = 606
            Top = 91
            Width = 100
            Height = 21
            Color = clAqua
            DataField = 'RIG_MOV'
            DataSource = ProDMMatInc.DSQMProCabInc
            Enabled = False
            TabOrder = 15
          end
          object DBEOrden: TLFDbedit
            Left = 86
            Top = 47
            Width = 98
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            DataField = 'ORDEN'
            DataSource = ProDMMatInc.DSQMProCabInc
            Enabled = False
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
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 145
          DataSource = ProDMMatInc.DSQMProCabInc
          CamposAOrdenar.Strings = (
            'ALMACEN_LAN'
            'ALMACEN_SAL'
            'FASES'
            'FECHA'
            'ID_CIERRE'
            'ID_INC_C'
            'ID_ORDEN'
            'LINEA_FASE'
            'ORDEN'
            'RIG'
            'RIG_MOV'
            'SERIE'
            'SUBORDEN')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 73
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPUESTO'
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FASES'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPFASE'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_CIERRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA_FASE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_INC_C'
              Visible = True
            end>
        end
      end
    end
    object PNDetalle: TLFPanel
      Left = 2
      Top = 201
      Width = 786
      Height = 273
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object ToolBar1: TLFToolBar
        Left = 0
        Top = 0
        Width = 786
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 200
          Height = 22
          DataSource = ProDMMatInc.DSQMProDetInc
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGMateriales
          InsertaControl = DBGMateriales
          Exclusivo = True
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = True
        end
      end
      object DBMIncidencia: TLFDBMemo
        Left = 0
        Top = 206
        Width = 786
        Height = 67
        Align = alBottom
        DataField = 'NOTAS'
        DataSource = ProDMMatInc.DSQMProDetInc
        TabOrder = 1
      end
      object DBGMateriales: TDBGridFind2000
        Left = 0
        Top = 25
        Width = 786
        Height = 181
        Align = alClient
        DataSource = ProDMMatInc.DSQMProDetInc
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnKeyUp = DBGMaterialesKeyUp
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 1
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
        Transaction = ProDMMatInc.TLocal
        BuscarNums = False
        Campos.Strings = (
          'COMPONENTE'
          'COMPONENTE'
          'ID_UBICACION')
        CamposAMostrar.Strings = (
          'COMPONENTE'
          '0'
          'COMPONENTE'
          '0'
          'ID_UBICACION'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          'ARTICULO'
          ''
          '')
        CamposDesplegar.Strings = (
          '0'
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        MensajeNoExiste = False
        Numericos.Strings = (
          'BARRAS'
          'ARTICULO'
          'ID_UBICACION')
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tablas.Strings = (
          'ART_ARTICULOS_BARRAS'
          'ART_ARTICULOS'
          'ART_ALMACENES_UBICACIONES')
        Acciones.Strings = (
          ''
          ''
          '')
        Titulos.Strings = (
          ''
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGMaterialesBusqueda
        Planes.Strings = (
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'BARRAS'
          'ARTICULO'
          '')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
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
            Width = 33
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPONENTE'
            Width = 65
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'Descripcion'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 205
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNDS'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRE_COS_UNI'
            Width = 57
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTAL'
            Width = 58
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_LOTE'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescLote'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID_UBICACION'
            Width = 60
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO_UBICACION'
            ReadOnly = True
            Width = 120
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 476
    Width = 790
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 364
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 400
    Top = 8
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 8
    object AMovManStock: TAction
      Caption = 'Ir a Movimiento Manual de Stock'
      Hint = 'Ir a Movimiento Manual de Stock'
      OnExecute = AMovManStockExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 480
    Top = 8
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 280
    Top = 160
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 320
    Top = 160
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
