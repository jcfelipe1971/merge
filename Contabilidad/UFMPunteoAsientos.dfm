inherited FMPunteoAsientos: TFMPunteoAsientos
  Left = 204
  Top = 180
  Width = 1278
  Height = 530
  HelpContext = 247
  ActiveControl = EFCuenta
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Punteo de Asientos'
  Constraints.MinHeight = 400
  Constraints.MinWidth = 800
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1268
    Height = 477
    Constraints.MinWidth = 500
    TabOrder = 1
    object splNorma43: TSplitter [0]
      Left = 756
      Top = 28
      Width = 5
      Height = 447
      Cursor = crHSplit
      Color = clAppWorkSpace
      ParentColor = False
      Visible = False
      OnMoved = splNorma43Moved
    end
    inherited TBMain: TLFToolBar
      Width = 1264
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 2
      inherited NavMain: THYMNavigator
        Width = 110
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepTerc: TToolButton
        Left = 164
      end
      inherited TbuttComp: TToolButton
        Left = 172
      end
      object TButtSep1: TToolButton
        Left = 195
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLTBMain: TLFPanel
        Left = 203
        Top = 0
        Width = 229
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LDigiteCuenta: TLFLabel
          Left = 8
          Top = 4
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Digite la Cuenta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EFCuenta: TLFEditFind2000
          Left = 106
          Top = 0
          Width = 122
          Height = 21
          TabOrder = 0
          OnExit = EFCuentaExit
          OnKeyDown = EFCuentaKeyDown
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CUENTA'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'Nivel >= 5'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tabla_a_buscar = 'CON_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CUENTA')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object TButtSep2: TToolButton
        Left = 432
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPunteo: TToolButton
        Left = 440
        Top = 0
        Hint = 'Visualiza solo cuentas punteadas'
        Caption = 'Punteadas'
        ImageIndex = 23
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtPunteoClick
      end
      object TButtNoPunteo: TToolButton
        Left = 463
        Top = 0
        Hint = 'Visualiza cuentas no punteadas'
        Caption = 'No Punteadas'
        ImageIndex = 22
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtNoPunteoClick
      end
      object TButtTodos: TToolButton
        Left = 486
        Top = 0
        Hint = 'Visualiza toda la cuenta'
        Caption = 'Todos'
        ImageIndex = 21
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtTodosClick
      end
      object TButtSep3: TToolButton
        Left = 509
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PFiltroFechas: TLFPanel
        Left = 517
        Top = 0
        Width = 344
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LFEntreFechaKri: TLFLabel
          Left = 4
          Top = 4
          Width = 33
          Height = 13
          Alignment = taCenter
          Caption = 'Fecha '
          Layout = tlCenter
        end
        object LFDEDesdeFecha: TLFDateEdit
          Left = 39
          Top = 0
          Width = 98
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          OnChange = LFDEDesdeFechaChange
        end
        object LFDEHastaFecha: TLFDateEdit
          Left = 136
          Top = 0
          Width = 97
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          OnChange = LFDEHastaFechaChange
        end
        object BMesAnterior: TButton
          Left = 232
          Top = 0
          Width = 21
          Height = 21
          Hint = 'Mes Anterior'
          Caption = '<'
          TabOrder = 2
          OnClick = BMesAnteriorClick
        end
        object BEjercicio: TButton
          Left = 254
          Top = 0
          Width = 21
          Height = 21
          Hint = 'A'#241'o'
          Caption = 'A'
          TabOrder = 3
          OnClick = BEjercicioClick
        end
        object BMes: TButton
          Left = 276
          Top = 0
          Width = 21
          Height = 21
          Hint = 'Mes'
          Caption = 'M'
          TabOrder = 4
          OnClick = BMesClick
        end
        object BSemana: TButton
          Left = 298
          Top = 0
          Width = 21
          Height = 21
          Hint = 'Semana'
          Caption = 'S'
          TabOrder = 5
          OnClick = BSemanaClick
        end
        object BMesSiguiente: TButton
          Left = 320
          Top = 0
          Width = 21
          Height = 21
          Hint = 'Mes Siguente'
          Caption = '>'
          TabOrder = 6
          OnClick = BMesSiguienteClick
        end
      end
      object TButtSep4: TToolButton
        Left = 861
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMuestraNorma43: TToolButton
        Left = 869
        Top = 0
        Hint = 'Muestra Norma43'
        Caption = 'Muestra Norma43'
        ImageIndex = 3
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtMuestraNorma43Click
      end
      object TBSep1: TToolButton
        Left = 892
        Top = 0
        Width = 8
        ImageIndex = 4
        Style = tbsSeparator
      end
      object CBSepararImportes: TLFCheckBox
        Left = 900
        Top = 0
        Width = 101
        Height = 22
        Hint = 'Separar Importes Debe y Haber'
        Caption = 'Separar Importes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        OnClick = CBSepararImportesClick
        Alignment = taLeftJustify
      end
    end
    object PNLPunteo: TLFPanel
      Left = 2
      Top = 28
      Width = 754
      Height = 447
      Align = alLeft
      TabOrder = 0
      object TBPunteo: TLFToolBar
        Left = 1
        Top = 1
        Width = 752
        Height = 21
        AutoSize = True
        ButtonHeight = 21
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        TabOrder = 0
        Separators = True
        object PNLTB2: TLFPanel
          Left = 0
          Top = 0
          Width = 755
          Height = 21
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          object LCuenta: TLFLabel
            Left = 237
            Top = 4
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LBLSaldo: TLFLabel
            Left = 2
            Top = 4
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Saldo'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object LBLSaldoPunteado: TLFLabel
            Left = 118
            Top = 4
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Punt.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
          object ESaldo: TLFEdit
            Left = 36
            Top = 0
            Width = 78
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
            TabOrder = 0
          end
          object DBESaldoPunteado: TLFDbedit
            Left = 153
            Top = 0
            Width = 78
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMPunteoAsientos.DSxSaldoPunteado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            OnChange = DBESaldoPunteadoN43Change
          end
          object ECuenta: TLFEdit
            Left = 282
            Top = 0
            Width = 120
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
            TabOrder = 2
            OnChange = DBESaldoPunteadoN43Change
          end
          object ETituloCuenta: TLFEdit
            Left = 403
            Top = 0
            Width = 318
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
            TabOrder = 3
            OnChange = DBESaldoPunteadoN43Change
          end
        end
      end
      object DBGFPunteo: TDBGridFind2000
        Left = 1
        Top = 22
        Width = 752
        Height = 424
        Align = alClient
        BiDiMode = bdLeftToRight
        DataSource = DMPunteoAsientos.DSQMPunteos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFPunteoDrawColumnCell
        OnDblClick = DBGFPunteoDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = False
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'IMPORTE'
          'PUNTEO'
          'SIGNO'
          'TEXTO'
          'ASIENTO'
          'FECHA'
          'FECHA_PUNTEO'
          'RIC')
        ColumnasCheckBoxes.Strings = (
          'PUNTEO')
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
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ASIENTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 57
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TEXTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 300
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SIGNO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
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
            FieldName = 'IMPORTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 73
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_DEBE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 73
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE_HABER'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 73
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PUNTEO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Width = 22
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_PUNTEO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RELACION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 150
            Visible = True
          end>
      end
    end
    object PNLNorma43: TLFPanel
      Left = 761
      Top = 28
      Width = 505
      Height = 447
      Align = alClient
      BevelOuter = bvNone
      Constraints.MinWidth = 455
      TabOrder = 1
      Visible = False
      object TBNorma43: TLFToolBar
        Left = 0
        Top = 0
        Width = 505
        Height = 24
        AutoSize = True
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Images = DMMain.ILMain_Ac
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Wrapable = False
        Separators = True
        object TButtPunteoN43: TToolButton
          Left = 0
          Top = 2
          Hint = 'Visualiza solo cuentas punteadas'
          Caption = 'Cuentas Punteadas'
          ImageIndex = 23
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtPunteoN43Click
        end
        object TButtNoPunteoN43: TToolButton
          Left = 23
          Top = 2
          Hint = 'Visualiza solo cuentas no punteadas'
          Caption = 'Cuentas No Punteadas'
          ImageIndex = 22
          ParentShowHint = False
          ShowHint = True
          OnClick = TButtNoPunteoN43Click
        end
        object TButtTodosN43: TToolButton
          Left = 46
          Top = 2
          Hint = 'Visualiza todas las cuentas'
          Caption = 'Todas'
          ImageIndex = 21
          OnClick = TButtTodosN43Click
        end
        object TBSincronizaPunteo: TToolButton
          Left = 69
          Top = 2
          Hint = 
            'Sincroniza Punteo - Busca un registro compatible para vinculacio' +
            'n'
          Caption = 'Sincroniza Punteo'
          ImageIndex = 67
          OnClick = TBSincronizaPunteoClick
        end
        object LBanco: TLFLabel
          Left = 92
          Top = 2
          Width = 43
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Banco'
          Layout = tlCenter
        end
        object EFBanco: TLFEditFind2000
          Left = 135
          Top = 2
          Width = 16
          Height = 22
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Text = '0'
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'BANCO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'BANCO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ToolButton4: TToolButton
          Left = 151
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object LEntidad: TLFLabel
          Left = 159
          Top = 2
          Width = 44
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Entidad'
          Layout = tlCenter
        end
        object EFEntidad: TLFEditFind2000
          Left = 203
          Top = 2
          Width = 35
          Height = 22
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          Text = '0000'
          OnChange = EFEntidadChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ENTIDAD'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_BANCOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ENTIDAD')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object ToolButton3: TToolButton
          Left = 238
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtVincularN43: TToolButton
          Left = 246
          Top = 2
          Action = AVincularN43
          ParentShowHint = False
          ShowHint = True
        end
        object ToolButton2: TToolButton
          Left = 269
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object LSaldoPunteadoN43: TLFLabel
          Left = 277
          Top = 2
          Width = 31
          Height = 22
          Alignment = taRightJustify
          Caption = 'Punt.'
          Layout = tlCenter
        end
        object DBESaldoPunteadoN43: TLFDbedit
          Left = 308
          Top = 2
          Width = 78
          Height = 22
          TabStop = False
          AutoSize = False
          Color = clInfoBk
          DataField = 'SALDO'
          DataSource = DMPunteoAsientos.DSxSaldoN43
          Enabled = False
          TabOrder = 2
          OnChange = DBESaldoPunteadoN43Change
        end
        object ToolButton5: TToolButton
          Left = 386
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TBGeneraAsiento: TToolButton
          Left = 394
          Top = 2
          Action = AGeneraAsiento
          ParentShowHint = False
          ShowHint = True
        end
        object LApuntesKri: TLFLabel
          Left = 417
          Top = 2
          Width = 27
          Height = 22
          Alignment = taRightJustify
          Caption = 'Apu.'
          Layout = tlCenter
        end
        object ToolButton6: TToolButton
          Left = 444
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TBTesoreria: TToolButton
          Left = 452
          Top = 2
          Action = ATesoreria
          ParentShowHint = False
          ShowHint = True
        end
        object LRecibos: TLFLabel
          Left = 475
          Top = 2
          Width = 28
          Height = 22
          Alignment = taRightJustify
          Caption = 'Rec.'
          Layout = tlCenter
        end
      end
      object PNLDetalleNorma43: TLFPanel
        Left = 0
        Top = 259
        Width = 505
        Height = 188
        Align = alBottom
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = True
        ParentFont = False
        TabOrder = 1
        DesignSize = (
          505
          188)
        object DBImporte: TDBText
          Left = 360
          Top = 1
          Width = 106
          Height = 17
          Alignment = taRightJustify
          Anchors = [akTop, akRight]
          Color = clInfoBk
          DataField = 'IMPORTE'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBTTitConceptoComun: TDBText
          Left = 34
          Top = 18
          Width = 432
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          DataField = 'TIT_CONC_COMUN'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBConcComun: TDBText
          Left = 2
          Top = 18
          Width = 32
          Height = 16
          Color = clWhite
          DataField = 'CONCEPTO_COMUN'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBConcPropio: TDBText
          Left = 2
          Top = 32
          Width = 32
          Height = 16
          Color = clInfoBk
          DataField = 'CONCEPTO_PROPIO'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBTTitConceptoPropio: TDBText
          Left = 34
          Top = 32
          Width = 432
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'TIT_CONC_PROPIO'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBFecOperacion: TDBText
          Left = 114
          Top = 48
          Width = 103
          Height = 16
          Color = clWhite
          DataField = 'FECHA_OPERACION'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBFecValor: TDBText
          Left = 2
          Top = 48
          Width = 111
          Height = 16
          Color = clWhite
          DataField = 'FECHA_VALOR'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBReferencia1: TDBText
          Left = 2
          Top = 64
          Width = 464
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'REFERENCIA1'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBReferencia2: TDBText
          Left = 2
          Top = 80
          Width = 464
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          Color = clWhite
          DataField = 'REFERENCIA2'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBNorma43Det: TDBText
          Left = 1
          Top = 96
          Width = 465
          Height = 73
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'CONCEPTO'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object DBTRelacion: TDBText
          Left = 2
          Top = 169
          Width = 464
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          Color = clYellow
          DataField = 'RELACION'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ParentColor = False
        end
        object LFDBCBPunteoN43: TLFDBCheckBox
          Left = 2
          Top = 1
          Width = 111
          Height = 17
          Caption = 'Punteo'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'PUNTEO'
          DataSource = DMPunteoAsientos.DSQMNorma43
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object DBGFNorma43: TDBGridFind2000
        Left = 0
        Top = 24
        Width = 505
        Height = 235
        Align = alClient
        BiDiMode = bdLeftToRight
        DataSource = DMPunteoAsientos.DSQMNorma43
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ParentBiDiMode = False
        ParentFont = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFNorma43DrawColumnCell
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = False
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'FECHA_VALOR'
          'FECHA_OPERACION'
          'IMPORTE'
          'CONCEPTO_PROPIO')
        ColumnasCheckBoxes.Strings = (
          'PUNTEO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PUNTEO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 22
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_OPERACION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SIGNO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 17
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'IMPORTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 46
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CONCEPTO_PROPIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 34
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TIT_CONC_PROPIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 181
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA_VALOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RELACION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ReadOnly = True
            Width = 271
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 477
    Width = 1268
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 288
    Top = 160
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 328
    Top = 160
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 400
    Top = 160
    object AVincularN43: TAction
      Category = 'Punteo'
      Caption = 'Vincular N43'
      Hint = 'Vincula registros de la norma 43 importada con apuntes'
      ImageIndex = 143
      ShortCut = 86
      OnExecute = AVincularN43Execute
    end
    object AGeneraAsiento: TAction
      Category = 'Punteo'
      Caption = 'Genera Asiento'
      Hint = 'Genera Asiento seg'#250'n plantilla asociada'
      ImageIndex = 30
      ShortCut = 49217
      OnExecute = AGeneraAsientoExecute
    end
    object ATesoreria: TAction
      Category = 'Punteo'
      Caption = 'Tesoreria'
      Hint = 'Busca recibos de este importe en tesoreria'
      ImageIndex = 56
      ShortCut = 49236
      OnExecute = ATesoreriaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Punteo'
      Caption = 'Punteo'
      Hint = 'Punteo'
      ImageIndex = 118
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadoPunteo: TAction
      Category = 'Listados'
      Caption = 'Listado de Punteo'
      Hint = 'Listado de Punteo'
      ImageIndex = 14
      OnExecute = AListadoPunteoExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfListadoPunteo: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuracion de Listado de Punteo'
      Hint = 'Configuracion de Listado de Punteo'
      ImageIndex = 77
      OnExecute = AConfListadoPunteoExecute
    end
    object APuntearImporte: TAction
      Category = 'Punteo'
      Caption = 'Puntear por Importes'
      Hint = 'Puntear Importes Iguales con Diferente Signo'
      ImageIndex = 19
      OnExecute = APuntearImporteExecute
    end
    object APuntearImporteTodos: TAction
      Category = 'Punteo'
      Caption = 'Puntear por Importes (Todos)'
      Hint = 'Puntear Importes Iguales con Diferente Signo (Todos)'
      ImageIndex = 19
      OnExecute = APuntearImporteTodosExecute
    end
    object AImportarNorma43: TAction
      Category = 'Punteo'
      Caption = 'Importar fichero Norma 43'
      Hint = 'Importar fichero Norma 43'
      ImageIndex = 123
      OnExecute = AImportarNorma43Execute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'splNorma43.Left'
      'CBSepararImportes.Checked')
    Left = 370
    Top = 160
  end
end
