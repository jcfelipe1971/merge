inherited FMEscandalloProd: TFMEscandalloProd
  Left = 340
  Top = 279
  HelpContext = 276
  Caption = 'Escandallo de Producci'#243'n'
  ClientHeight = 422
  ClientWidth = 590
  PopupMenu = CEProcesosPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 212
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = DMEscandalloProd.DSQMEscandallo
        Hints.Strings = ()
        EditaControl = DBEUnidades
        InsertaControl = DBEFArticulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
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
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Left = 282
        Hint = 'Coste total de la Producci'#243'n'
        ImageIndex = 1
        Visible = True
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 182
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 154
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
            Left = 37
            Top = 75
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Coste'
          end
          object LBLCosteTotal: TLFLabel
            Left = 295
            Top = 75
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
            DataSource = DMEscandalloProd.DSQMEscandallo
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
            DataSource = DMEscandalloProd.DSQMEscandallo
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
            DataSource = DMEscandalloProd.DSQMEscandallo
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
            DataSource = DMEscandalloProd.DSQMEscandallo
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
              Top = 24
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Desde'
            end
            object LBLFechaHasta: TLFLabel
              Left = 187
              Top = 24
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
              DataSource = DMEscandalloProd.DSQMEscandallo
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
              DataSource = DMEscandalloProd.DSQMEscandallo
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
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMEscandalloProd.DSxArticulos
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
          object DBECoste: TLFDbedit
            Left = 68
            Top = 71
            Width = 117
            Height = 21
            DataField = 'COSTE'
            DataSource = DMEscandalloProd.DSQMEscandallo
            TabOrder = 5
          end
          object ECoste: TLFEdit
            Left = 410
            Top = 71
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
              DataSource = DMEscandalloProd.DSQMEscandallo
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
              DataSource = DMEscandalloProd.DSQMEscandallo
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
            DataSource = DMEscandalloProd.DSQMEscandalloProc
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
            DataSource = DMEscandalloProd.DSQMEscandalloProc
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
            AutoCambiarColumna = True
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
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
          DataSource = DMEscandalloProd.DSQMEscandallo
          CamposAOrdenar.Strings = (
            'ACTIVO'
            'ARTICULO'
            'COSTE'
            'FECHA_DESDE'
            'FECHA_HASTA'
            'NUMERO'
            'UNIDADES')
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 205
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_DESDE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_HASTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
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
      DataSource = DMEscandalloProd.DSQMEscandalloDet
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGFDetalleColEnter
      OnDblClick = DBGFDetalleDblClick
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
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
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
      CamposNoAccesibles.Strings = (
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
          Expanded = False
          FieldName = 'DETALLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 265
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
        DataSource = DMEscandalloProd.DSQMEscandalloDet
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
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 378
    Top = 16
    object ALstEscandallo: TAction
      Category = 'Listados'
      Caption = 'Listado de Escandallo'
      Hint = 'Listado de Escandallo'
      ImageIndex = 14
      OnExecute = ALstEscandalloExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 416
    Top = 16
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEProcesos
    Complementario = PMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 493
    Top = 145
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 462
    Top = 144
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
    Left = 496
    Top = 176
  end
  object CEProcesosPMEdit: TPopUpTeclas
    Left = 464
    Top = 176
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
