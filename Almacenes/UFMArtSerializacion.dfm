inherited FMArtSerializacion: TFMArtSerializacion
  Left = 384
  Top = 88
  Width = 800
  Height = 574
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Serializaci'#243'n de Art'#237'culos'
  Menu = MainMenu1
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 348
    Align = alTop
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = DMArtSerializacion.DSQMArtSerializacion
        Hints.Strings = ()
        EditaControl = DMMMNotas
        InsertaControl = DBEFNSerie
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
      end
      object PNLFiltroArticuloSerie: TLFPanel
        Left = 299
        Top = 0
        Width = 358
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LBuscaArticulo: TLFLabel
          Left = 13
          Top = 4
          Width = 44
          Height = 13
          Alignment = taRightJustify
          Caption = 'Articulo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object LBuscaSerie: TLFLabel
          Left = 203
          Top = 4
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object LFBuscarArticulo: TLFEditFind2000
          Left = 61
          Top = 0
          Width = 120
          Height = 21
          TabOrder = 0
          OnChange = LFBuscarSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object LFBuscarSerie: TLFEditFind2000
          Left = 236
          Top = 0
          Width = 120
          Height = 21
          TabOrder = 1
          OnChange = LFBuscarSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'NSERIE'
          CampoStr = 'ARTICULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ARTICULOS_SERIALIZACION'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = LFBuscarSerieBusqueda
          OrdenadoPor.Strings = (
            'NSERIE')
          Filtros = [obEmpresa, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 318
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 778
          Height = 290
          object LBLCodigo: TLFLabel
            Left = 20
            Top = 17
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo'
          end
          object LBLNSerie: TLFLabel
            Left = 14
            Top = 39
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Serie'
          end
          object LBLAlmacen: TLFLabel
            Left = 12
            Top = 83
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen'
          end
          object LBLNotas: TLFLabel
            Left = 25
            Top = 105
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LBLArticulo: TLFLabel
            Left = 18
            Top = 61
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LClienteReparacion: TLFLabel
            Left = 187
            Top = 16
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente Reparacion'
          end
          object DBECodigo: TLFDbedit
            Left = 58
            Top = 13
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
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
          object ETitAlmacen: TLFEdit
            Left = 180
            Top = 79
            Width = 365
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
            TabOrder = 8
          end
          object DMMMNotas: TLFDBMemo
            Left = 58
            Top = 101
            Width = 487
            Height = 89
            DataField = 'NOTAS'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
            TabOrder = 4
          end
          object GBFechas: TGroupBox
            Left = 58
            Top = 198
            Width = 718
            Height = 75
            Caption = 'Fechas'
            TabOrder = 6
            object LBLFechaCaducidad: TLFLabel
              Left = 20
              Top = 32
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Caducidad'
            end
            object LBLGarantiaCli: TLFLabel
              Left = 402
              Top = 32
              Width = 94
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fin Garant'#237'a Cliente'
            end
            object LBLFinGarantiaProv: TLFLabel
              Left = 207
              Top = 32
              Width = 87
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fin Garant'#237'a Prov.'
            end
            object DBDTPGarProv: TLFDBDateEdit
              Left = 299
              Top = 28
              Width = 87
              Height = 21
              DataField = 'FECHA_GARANTIA_PROVEEDOR'
              DataSource = DMArtSerializacion.DSQMArtSerializacion
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
            object DBDTPFechaCad: TLFDBDateEdit
              Left = 109
              Top = 28
              Width = 87
              Height = 21
              DataField = 'FECHA_CADUCIDAD'
              DataSource = DMArtSerializacion.DSQMArtSerializacion
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object DBDTPGarCliente: TLFDBDateEdit
              Left = 501
              Top = 28
              Width = 87
              Height = 21
              DataField = 'FECHA_GARANTIA_CLIENTE'
              DataSource = DMArtSerializacion.DSQMArtSerializacion
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
          end
          object GBBarras: TGroupBox
            Left = 549
            Top = 52
            Width = 228
            Height = 138
            Caption = 'C'#243'digo de barras'
            TabOrder = 9
            object ICodBarras: TImage
              Left = 2
              Top = 15
              Width = 224
              Height = 121
              Align = alClient
            end
          end
          object ETitArticulo: TLFEdit
            Left = 180
            Top = 57
            Width = 365
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
            TabOrder = 7
          end
          object DBEFNSerie: TLFDBEditFind2000
            Left = 58
            Top = 35
            Width = 121
            Height = 21
            DataField = 'NSERIE'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
            TabOrder = 1
            OnChange = DBEFNSerieChange
            OnKeyDown = DBEFNSerieKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            BuscarChar = False
            Tabla_a_buscar = 'ART_ARTICULOS_SERIALIZACION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'NSERIE'
            CampoStr = 'NSERIE'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFNSerieBusqueda
            OrdenadoPor.Strings = (
              'NSERIE')
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEArticulo: TLFFibDBEditFind
            Left = 58
            Top = 57
            Width = 121
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
            TabOrder = 2
            OnChange = DBEArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object DBEAlmacen: TLFDBEditFind2000
            Left = 58
            Top = 79
            Width = 121
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
            TabOrder = 3
            OnChange = DBEAlmacenChange
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
          object DBECliRepara: TLFDbedit
            Left = 282
            Top = 13
            Width = 61
            Height = 21
            DataField = 'CLIENTE_REPARACION'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
            TabOrder = 5
            OnChange = DBECliReparaChange
          end
          object DescCliente: TLFDbedit
            Left = 344
            Top = 13
            Width = 273
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NombreCliente'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object CKEstado: TLFDBCheckBox
            Left = 282
            Top = 36
            Width = 121
            Height = 17
            Caption = 'En Stock'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = DMArtSerializacion.DSQMArtSerializacion
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 290
          DataSource = DMArtSerializacion.DSQMArtSerializacion
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ALMACEN'
            'ARTICULO'
            'FECHA_CADUCIDAD'
            'FECHA_GARANTIA_CLIENTE'
            'FECHA_GARANTIA_PROVEEDOR')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSERIE'
              Width = 127
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 193
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CADUCIDAD'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_GARANTIA_CLIENTE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_GARANTIA_PROVEEDOR'
              Width = 80
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 521
    Width = 790
    EdgeBorders = []
    ParentColor = False
    TabOrder = 0
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 348
    Width = 790
    Height = 173
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object LFPanelOrigen: TLFPanel
      Left = 0
      Top = 0
      Width = 392
      Height = 173
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object DBGOrigen: TDBGridFind2000
        Left = 0
        Top = 26
        Width = 392
        Height = 147
        Align = alClient
        DataSource = DMArtSerializacion.DSxOrigen
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGOrigenDblClick
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
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        Transaction = DMArtSerializacion.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'TIPO'
          'RIG'
          'FECHA'
          'LINEA')
        ColumnasCheckBoxes.Strings = (
          'SIGNO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGNO'
            Visible = True
          end>
      end
      object TBOrigen: TLFToolBar
        Left = 0
        Top = 0
        Width = 392
        Height = 26
        EdgeInner = esNone
        EdgeOuter = esNone
        TabOrder = 1
        Separators = True
        object NavOrigen: THYMNavigator
          Left = 0
          Top = 2
          Width = 80
          Height = 22
          DataSource = DMArtSerializacion.DSxOrigen
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
    object LFPanelDest: TLFPanel
      Left = 392
      Top = 0
      Width = 398
      Height = 173
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 1
      object DBGDestino: TDBGridFind2000
        Left = 0
        Top = 26
        Width = 398
        Height = 147
        Align = alClient
        DataSource = DMArtSerializacion.DSxDestino
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGDestinoDblClick
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
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        Transaction = DMArtSerializacion.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'TIPO'
          'RIG'
          'FECHA'
          'LINEA')
        ColumnasCheckBoxes.Strings = (
          'SIGNO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'LINEA'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SIGNO'
            Visible = True
          end>
      end
      object TBDestino: TLFToolBar
        Left = 0
        Top = 0
        Width = 398
        Height = 26
        EdgeBorders = []
        TabOrder = 1
        Separators = True
        object NavDestino: THYMNavigator
          Left = 0
          Top = 2
          Width = 80
          Height = 22
          DataSource = DMArtSerializacion.DSxDestino
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 296
    Top = 184
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 348
    Top = 184
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 698
    Top = 50
    object ARestoSeries: TAction
      Category = 'Procesos'
      Caption = 'A'#241'adir los n'#250'meros de series que faltan'
      Hint = 'A'#241'adir los n'#250'meros de series que faltan'
      ImageIndex = 115
      OnExecute = ARestoSeriesExecute
    end
    object AAnyadirEtiquetas: TAction
      Category = 'Procesos'
      Caption = 'A'#241'adir las etiquetas seleccionadas para su impresi'#243'n'
      Hint = 'A'#241'adir las etiquetas seleccionadas para su impresi'#243'n'
      ImageIndex = 95
      OnExecute = AAnyadirEtiquetasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AImpresion: TAction
      Category = 'Listados'
      Caption = 'Mantenimiento de impresi'#243'n de C'#243'digos de Barras'
      Hint = 'Mantenimiento de impresi'#243'n de C'#243'digos de Barras'
      ImageIndex = 38
      OnExecute = AImpresionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ALstSerializacion: TAction
      Category = 'Listados'
      Caption = 'Listado Serializaci'#243'n'
      ImageIndex = 14
      OnExecute = ALstSerializacionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 572
  end
  object CodBarras: TCodeBar
    Alto = 100
    OrigenY = 0
    OrigenX = 0
    Modulo = 1
    Ratio = 2
    Tipo = cb128
    ChequearDigito = False
    TipoChequeo = csmModulo10
    Porcentaje = 20
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 626
    Top = 73
  end
  object MainMenu1: TMainMenu
    AutoHotkeys = maManual
    Left = 660
    Top = 48
  end
end
