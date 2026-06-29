inherited FMEscandalloProd_kri: TFMEscandalloProd_kri
  Left = 340
  Top = 279
  HelpContext = 276
  Caption = 'Escandallo de Producci'#243'n - KRI'
  ClientHeight = 422
  ClientWidth = 590
  PopupMenu = CEProcesosPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 212
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = DMEscandalloProd_kri.DSQMEscandallo
        Hints.Strings = ()
        EditaControl = DBEUnidades
        InsertaControl = DBEFArticulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Listado de escandallo'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 296
        Hint = 'Coste total de la Producci'#243'n'
        ImageIndex = 1
        Visible = True
        OnClick = TbuttCompClick
      end
      object TBCopiaEscandalloTyC: TToolButton
        Left = 319
        Top = 0
        Hint = 'Crear copia del escandallo para todas las tallas y colores'
        Caption = 'Copia Escandallo TyC'
        ImageIndex = 10
        OnClick = TBCopiaEscandalloTyCClick
      end
      object TButtFiltroActivo: TToolButton
        Left = 342
        Top = 0
        Caption = 'Todos'
        ImageIndex = 146
        OnClick = TButtFiltroActivoClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 182
      inherited TSFicha: TTabSheet
        object SBCompuesto: TSpeedButton [0]
          Left = 192
          Top = 32
          Width = 369
          Height = 22
          Action = ACompuesto
          Margin = 121
        end
        inherited PEdit: TLFPanel
          Width = 578
          Height = 154
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMEscandalloProd_kri.DSQMEscandallo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ver_articulos_esc_prod_tit_kri'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'articulo')
          end
          object LBLNumero: TLFLabel
            Left = 27
            Top = 9
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'mero'
          end
          object LBLArticulo: TLFLabel
            Left = 27
            Top = 31
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LBLUnidades: TLFLabel
            Left = 19
            Top = 53
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Unidades'
          end
          object LBLCoste: TLFLabel
            Left = 8
            Top = 75
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Inc. s/Prod.'
          end
          object LBLCosteUnitario: TLFLabel
            Left = 288
            Top = 80
            Width = 150
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste Total Produccion Unitario'
          end
          object LPesoKri: TLFLabel
            Left = 456
            Top = 108
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso'
          end
          object LBLCosteTotal: TLFLabel
            Left = 327
            Top = 58
            Width = 111
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste Total Producci'#243'n'
          end
          object DBENumero: TLFDbedit
            Left = 68
            Top = 5
            Width = 117
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NUMERO'
            DataSource = DMEscandalloProd_kri.DSQMEscandallo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEFArticulo: TLFDBEditFind2000
            Left = 68
            Top = 27
            Width = 117
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMEscandalloProd_kri.DSQMEscandallo
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            BuscarChar = False
            Tabla_a_buscar = 'VER_ARTICULOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFArticuloBusqueda
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEUnidades: TLFDbedit
            Left = 68
            Top = 49
            Width = 117
            Height = 21
            DataField = 'UNIDADES'
            DataSource = DMEscandalloProd_kri.DSQMEscandallo
            TabOrder = 4
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 195
            Top = 7
            Width = 69
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMEscandalloProd_kri.DSQMEscandallo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object GBVigencia: TGroupBox
            Left = 68
            Top = 96
            Width = 353
            Height = 51
            Caption = 'Fechas Vigencia'
            TabOrder = 6
            object LBLFechaDesde: TLFLabel
              Left = 14
              Top = 23
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Desde'
            end
            object LBLFechaHasta: TLFLabel
              Left = 187
              Top = 23
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Hasta'
            end
            object DBDTPDesde: TLFDBDateEdit
              Left = 82
              Top = 20
              Width = 87
              Height = 21
              DataField = 'FECHA_DESDE'
              DataSource = DMEscandalloProd_kri.DSQMEscandallo
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DBDTPHasta: TLFDBDateEdit
              Left = 252
              Top = 20
              Width = 87
              Height = 21
              DataField = 'FECHA_HASTA'
              DataSource = DMEscandalloProd_kri.DSQMEscandallo
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
          end
          object DBETitArticulo: TLFDbedit
            Left = 186
            Top = 27
            Width = 378
            Height = 21
            TabStop = False
            Color = clAqua
            DataField = 'TITULO'
            DataSource = DMEscandalloProd_kri.DSxArticulos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            OnDblClick = DBETitArticuloDblClick
          end
          object DBECoste: TLFDbedit
            Left = 68
            Top = 71
            Width = 117
            Height = 21
            DataField = 'COSTE'
            DataSource = DMEscandalloProd_kri.DSQMEscandallo
            TabOrder = 5
          end
          object ECoste: TLFEdit
            Left = 442
            Top = 55
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
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
          object DBESumaPesos: TLFDbedit
            Left = 488
            Top = 104
            Width = 76
            Height = 21
            Color = clInfoBk
            DataField = 'SUM_UNID_KRI'
            DataSource = DMEscandalloProd_kri.DSQMEscandallo
            ReadOnly = True
            TabOrder = 8
          end
          object ECosteTotal: TLFEdit
            Left = 442
            Top = 77
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
        end
      end
      object TSProcesos: TTabSheet [1]
        Caption = '&Procesos'
        ImageIndex = 2
        OnShow = TSProcesosShow
        object TBProcesoso: TLFToolBar
          Left = 0
          Top = 0
          Width = 578
          Height = 24
          AutoSize = True
          EdgeBorders = []
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object PNLInfoProceso: TLFPanel
            Left = 0
            Top = 2
            Width = 323
            Height = 22
            Align = alTop
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBENumeroArticulo: TLFDbedit
              Left = 1
              Top = 1
              Width = 41
              Height = 21
              Color = clInfoBk
              DataField = 'NUMERO'
              DataSource = DMEscandalloProd_kri.DSQMEscandallo
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEArtProcesos: TLFDbedit
              Left = 43
              Top = 1
              Width = 280
              Height = 21
              Color = clInfoBk
              DataField = 'ARTICULO'
              DataSource = DMEscandalloProd_kri.DSQMEscandallo
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 323
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavProcesos: THYMNavigator
            Left = 331
            Top = 2
            Width = 220
            Height = 22
            DataSource = DMEscandalloProd_kri.DSQMEscandalloProc
            Align = alTop
            Flat = True
            ParentShowHint = False
            PopupMenu = CEProcesosPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFProcesos
            InsertaControl = DBGFProcesos
            Exclusivo = True
            ControlEdit = CEProcesos
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavMainClickAfterAdjust
          end
        end
        object PNProcesos: TLFPanel
          Left = 0
          Top = 24
          Width = 578
          Height = 130
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFProcesos: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 578
            Height = 130
            Align = alClient
            DataSource = DMEscandalloProd_kri.DSQMEscandalloProc
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            IniStorage = FSMain
            Insercion = False
            ColumnaInicial = 0
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
              'PROCESO'
              'OPERARIO')
            CamposAMostrar.Strings = (
              'PROCESO'
              '0'
              'OPERARIO'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'PROCESO'
              'TITULO'
              'OPERARIO'
              'TITULO_OP')
            CamposNoAccesibles.Strings = (
              'TITULO_PROCESO'
              'TITULO_OP')
            MensajeNoExiste = False
            Numericos.Strings = (
              'PROCESO'
              'TERCERO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'EMP_PROCESOS_PRODUCCION'
              'SYS_TERCEROS')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'TITULO'
              'NOMBRE_R_SOCIAL')
            Posicion = tpCentrado
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'PROCESO'
                Width = 39
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_PROCESO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Width = 202
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DURACION'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PRECIO'
                Width = 47
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'OPERARIO'
                Width = 29
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_OP'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Width = 176
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 154
          DataSource = DMEscandalloProd_kri.DSQMEscandallo
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'ARTICULO'
            'COSTE'
            'FECHA_DESDE'
            'FECHA_HASTA'
            'NUMERO'
            'TITULO'
            'UNIDADES')
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO'
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 228
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_DESDE'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_HASTA'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 34
              Visible = True
            end>
        end
      end
    end
  end
  object PDetalle: TLFPanel [1]
    Left = 0
    Top = 212
    Width = 590
    Height = 186
    Align = alClient
    TabOrder = 2
    object DBGFDetalle: TDBGridFind2000
      Left = 1
      Top = 26
      Width = 588
      Height = 159
      Align = alClient
      DataSource = DMEscandalloProd_kri.DSQMEscandalloDet
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGFDetalleColEnter
      OnColExit = DBGFDetalleColExit
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
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
      BuscarNums = False
      BuscarChars = False
      Campos.Strings = (
        'DETALLE')
      CamposAMostrar.Strings = (
        'DETALLE'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'TITULO'
        'CANTIDAD'
        'COSTE'
        'P_COSTE'
        'DETALLE'
        'LINEA')
      CamposNoAccesibles.Strings = (
        'TITULO'
        'P_COSTE')
      MensajeNoExiste = False
      Numericos.Strings = (
        'ARTICULO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_ARTICULOS_EF')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      OnBusqueda = DBGFDetalleBusqueda
      OrdenMultiple = True
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 20
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DETALLE'
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COSTE'
          Title.Alignment = taRightJustify
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'P_COSTE'
          ReadOnly = True
          Title.Alignment = taRightJustify
          Visible = True
        end>
    end
    object TBDetalle: TLFToolBar
      Left = 1
      Top = 1
      Width = 588
      Height = 25
      EdgeBorders = []
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 2
        Width = 220
        Height = 22
        DataSource = DMEscandalloProd_kri.DSQMEscandalloDet
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFDetalle
        InsertaControl = DBGFDetalle
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Complementario = TBDetalle
    Left = 493
    Top = 116
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 464
    Top = 116
    inherited CEMainMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 474
    Top = 8
    object ALstEscandallo: TAction
      Category = 'Listados'
      Caption = 'Listado de Escandallo'
      Hint = 'Listado de Escandallo'
      ImageIndex = 125
      OnExecute = ALstEscandalloExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 125
    end
    object AExportacionJMTChem: TAction
      Category = 'Listados'
      Caption = 'Exportacion JMTChem'
      Hint = 'Exportacion JMTChem'
      ImageIndex = 36
      OnExecute = AExportacionJMTChemExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      Hint = 'Otros'
      ImageIndex = 99
    end
    object ACompuesto: TAction
      Category = 'Otros'
      Caption = 'Compuesto'
      Hint = 'Ver articulo asociado al Compuesto'
      OnExecute = ACompuestoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DBGFDetalle.Columns'
      'DBGFProcesos.Columns'
      'DBGMain.Columns')
    Left = 470
    Top = 42
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEProcesos
    Complementario = PMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 533
    Top = 25
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 502
    Top = 24
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
  object CEProcesos: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSProcesos
    FichaExclusiva = TSProcesos
    SubComplementario = ALMain
    PopUpMenu = CEProcesosPMEdit
    Teclas = DMMain.Teclas
    Left = 536
    Top = 80
  end
  object CEProcesosPMEdit: TPopUpTeclas
    Left = 504
    Top = 80
    object CEProcesosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEProcesosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEProcesosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEProcesosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEProcesosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEProcesosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEProcesosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEProcesosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEProcesosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEProcesosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
