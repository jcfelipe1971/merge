inherited FMBorradorContabilidad: TFMBorradorContabilidad
  Left = 371
  Top = 208
  Width = 770
  Height = 476
  HelpContext = 238
  ActiveControl = NavMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Borrador de Apuntes contables'
  FormStyle = fsNormal
  OldCreateOrder = False
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 760
    Height = 193
    TabOrder = 2
    inherited TBMain: TLFToolBar
      Width = 756
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        DataSource = DMBorradorContabilidad.DSQMAsientos
        Hints.Strings = ()
        TabOrder = 1
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 69
        DataSource = DMBorradorContabilidad.DSQMAsientos
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        TabOrder = 2
        OnClickRango = EPAsientosClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 297
      end
      inherited TbuttComp: TToolButton
        Left = 305
      end
      object TButtRefresca: TToolButton
        Left = 328
        Top = 0
        Hint = 'Refresca los datos'
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = TButtRefrescaClick
      end
      object TButtSesion: TToolButton
        Left = 351
        Top = 0
        Action = ASesion
        ImageIndex = 22
      end
      object TButtMostrarBorrador: TToolButton
        Left = 374
        Top = 0
        Action = ANormal
        ImageIndex = 23
      end
      object TButtSep5: TToolButton
        Left = 397
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLPlantilla: TLFPanel
        Left = 405
        Top = 0
        Width = 78
        Height = 22
        Align = alClient
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 0
        object LBLPlantilla: TLFLabel
          Left = 7
          Top = 4
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Plantilla '
          Layout = tlCenter
        end
        object EFPlantilla: TLFEditFind2000
          Left = 49
          Top = 0
          Width = 28
          Height = 21
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
          OnExit = EFPlantillaExit
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = True
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PLANTILLA'
          CampoStr = 'NOMBRE'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_PLANTILLAS_CON'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 756
      Height = 163
      TabOrder = 0
      TabInactiveColor = 14936297
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 748
          Height = 135
          inherited G2KTableLoc: TG2KTBLoc
            Top = 37
          end
          object LBLRIB: TLFLabel
            Left = 25
            Top = 6
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'R.I.B.'
          end
          object LBLTipo: TLFLabel
            Left = 30
            Top = 50
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBLCanal: TLFLabel
            Left = 24
            Top = 93
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LBLMoneda: TLFLabel
            Left = 12
            Top = 71
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLTipoKri: TLFLabel
            Left = 25
            Top = 28
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Diario'
          end
          object LSaldoDebe: TLFLabel
            Left = 12
            Top = 115
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Debe'
          end
          object LSaldoHaber: TLFLabel
            Left = 189
            Top = 115
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'S. Haber'
          end
          object DBERib: TLFDbedit
            Left = 57
            Top = 2
            Width = 60
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIB'
            DataSource = DMBorradorContabilidad.DSQMAsientos
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
          object DBDTPApunte: TLFDBDateEdit
            Left = 515
            Top = 2
            Width = 87
            Height = 21
            Hint = 'Fecha de asiento'
            DataField = 'FECHA'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBCHKBloqueado: TLFDBCheckBox
            Left = 682
            Top = 3
            Width = 49
            Height = 17
            Caption = 'Bloq.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'BLOQUEADO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETitulo: TLFDbedit
            Left = 118
            Top = 2
            Width = 396
            Height = 21
            DataField = 'TITULO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 1
          end
          object DBEFTipoAsiento: TLFDBEditFind2000
            Left = 57
            Top = 46
            Width = 60
            Height = 21
            DataField = 'TIPO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 6
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'VISIBLE=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnVerificacion = DBEFTipoAsientoVerificacion
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBETitTipo: TLFDbedit
            Left = 118
            Top = 46
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMBorradorContabilidad.DSxTipos
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
          object DBEFCanal: TLFDBEditFind2000
            Left = 57
            Top = 90
            Width = 60
            Height = 21
            DataField = 'CANAL'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 8
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMBorradorContabilidad.EntornoFind
          end
          object DBETituloCanal: TLFDbedit
            Left = 118
            Top = 90
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMBorradorContabilidad.DSxCanales
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
          object DBEFMoneda: TLFDBEditFind2000
            Left = 57
            Top = 68
            Width = 60
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 7
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_MONEDAS_CAMBIOS_TODAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'DESTINO'
            CampoStr = 'T_DESTINO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFMonedaBusqueda
            OrdenadoPor.Strings = (
              'DESTINO')
            Filtros = []
          end
          object DBETituloMoneda: TLFDbedit
            Left = 118
            Top = 68
            Width = 240
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'T_DESTINO'
            DataSource = DMBorradorContabilidad.DSxMonedas
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
          object PNLCambio: TLFPanel
            Left = 361
            Top = 26
            Width = 376
            Height = 36
            BevelOuter = bvNone
            TabOrder = 12
            object LCambioFecha: TLFLabel
              Left = 18
              Top = 10
              Width = 76
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cambio / Fecha'
            end
            object DBECambio: TLFDbedit
              Left = 100
              Top = 7
              Width = 109
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'CAMBIO'
              DataSource = DMBorradorContabilidad.DSxMonedas
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
            object DBEFechaCambio: TLFDbedit
              Left = 210
              Top = 7
              Width = 121
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'F_ALTA'
              DataSource = DMBorradorContabilidad.DSxMonedas
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
          end
          object PNLSaldo: TLFPanel
            Left = 361
            Top = 64
            Width = 376
            Height = 47
            BevelOuter = bvNone
            TabOrder = 13
            object LBLDebe: TLFLabel
              Left = 6
              Top = 4
              Width = 122
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Debe'
            end
            object LBLHaber: TLFLabel
              Left = 129
              Top = 4
              Width = 122
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Haber'
            end
            object LBLSaldo: TLFLabel
              Left = 252
              Top = 4
              Width = 117
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Saldo'
            end
            object DBEDebe: TLFDbedit
              Left = 6
              Top = 18
              Width = 122
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'DEBE'
              DataSource = DMBorradorContabilidad.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEHaber: TLFDbedit
              Left = 129
              Top = 18
              Width = 122
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'HABER'
              DataSource = DMBorradorContabilidad.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBESaldo: TLFDbedit
              Left = 252
              Top = 18
              Width = 117
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SALDO'
              DataSource = DMBorradorContabilidad.DSxInfoActualizada
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              OnChange = DBESaldoChange
            end
          end
          object DTPHora: TDBDateTimePicker
            Left = 603
            Top = 2
            Width = 76
            Height = 21
            CalAlignment = dtaLeft
            Date = 43669.4996623727
            Time = 43669.4996623727
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 3
            DataField = 'FECHA'
            DataSource = DMBorradorContabilidad.DSQMAsientos
          end
          object DBEFTipoAsientoKri: TLFDBEditFind2000
            Left = 57
            Top = 24
            Width = 60
            Height = 21
            DataField = 'TIPO_ASIENTO_KRI'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 5
            OnChange = DBEFTipoAsientoKriChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_ASIENTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'VISIBLE=1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBESDebe: TLFDbedit
            Left = 57
            Top = 112
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMBorradorContabilidad.DSxDebe
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBESHaber: TLFDbedit
            Left = 236
            Top = 112
            Width = 122
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SALDO'
            DataSource = DMBorradorContabilidad.DSxHaber
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
          end
          object ETitTipoKri: TLFEdit
            Left = 118
            Top = 24
            Width = 240
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 16
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 748
          Height = 135
          DataSource = DMBorradorContabilidad.DSQMAsientos
          UsaDicG2K = False
          CamposAOrdenar.Strings = (
            'FECHA'
            'RIB'
            'SALDO'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIB'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 28
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
              FieldName = 'DEBE'
              Title.Alignment = taRightJustify
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HABER'
              Title.Alignment = taRightJustify
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDO'
              Title.Alignment = taRightJustify
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 272
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 193
    Width = 760
    Height = 230
    TabOrder = 1
    inherited TBDetalle: TLFToolBar
      Width = 760
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        DataSource = DMBorradorContabilidad.DSQMApuntes
        Hints.Strings = ()
        Exclusivo = True
        OnChangeState = NavDetalleChangeState
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
      object TBSeparator1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtVerApunteIVA: TToolButton
        Left = 228
        Top = 0
        Action = AVerApunteIva
        Enabled = False
        ImageIndex = 110
        ParentShowHint = False
        ShowHint = True
      end
      object TButtDuplicarLinea: TToolButton
        Left = 251
        Top = 0
        Action = ADuplicarLinea
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Top = 43
      Width = 760
      Height = 187
      DataSource = DMBorradorContabilidad.DSQMApuntes
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnColEnter = DBGFDetalleColEnter
      IniStorage = FSMain
      UsaDicG2K = False
      AutoCambiarColumna = True
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BuscarNums = True
      Campos.Strings = (
        'ABONO'
        'CARGO'
        'TIPO'
        'PROYECTO')
      CamposAMostrar.Strings = (
        'ABONO'
        '0'
        'CARGO'
        '0'
        'TIPO'
        '0'
        'PROYECTO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        ''
        'TIPO_APUNTE'
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1'
        '1')
      CampoAOrdenarColor = clBlack
      Numericos.Strings = (
        'CUENTA'
        'CUENTA'
        'TIPO_APUNTE'
        'PROYECTO')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_SUBCUENTAS                 '
        'VER_SUBCUENTAS                 '
        'SYS_TIPO_APUNTE'
        'EMP_PROYECTOS')
      Acciones.Strings = (
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO')
      BeforeColExit = DBGFDetalleBeforeColExit
      OnBusqueda = DBGFDetalleBusqueda
      OnCampoDevuelve = DBGFDetalleCampoDevuelve
      OnRowChange = DBGFDetalleRowChange
      Planes.Strings = (
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        ''
        ''
        '')
      Columns = <
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CARGO'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 89
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ABONO'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TEXTO'
          Width = 183
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Title.Alignment = taRightJustify
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SERIE'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_FECHA'
          Width = 73
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROYECTO'
          Width = 58
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_PROYECTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 263
          Visible = True
        end>
    end
    object PNLTitulos: TLFPanel
      Left = 0
      Top = 22
      Width = 760
      Height = 21
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 2
      DesignSize = (
        760
        21)
      object LBLTituloAbono: TLFLabel
        Left = 395
        Top = 3
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Abono'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object LBLTituloCargo: TLFLabel
        Left = 18
        Top = 3
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cargo'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        Layout = tlCenter
      end
      object DBETitCta_Abono: TLFDbedit
        Left = 430
        Top = 0
        Width = 330
        Height = 21
        Hint = 'T'#237'tulo de la cuenta visible'
        TabStop = False
        Anchors = [akLeft]
        AutoSize = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMBorradorContabilidad.DSxAbonos
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
      object DBETitCta_Cargo: TLFDbedit
        Left = 50
        Top = 0
        Width = 330
        Height = 21
        Hint = 'T'#237'tulo de la cuenta visible'
        TabStop = False
        AutoSize = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMBorradorContabilidad.DSxCargos
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
  inherited TBActions: TLFToolBar
    Top = 423
    Width = 760
    ParentColor = False
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    Left = 508
    Top = 256
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 544
    Top = 256
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
  end
  inherited ALMain: TLFActionList
    Left = 196
    Top = 282
    object AValidar: TAction
      Category = 'Procesos'
      Caption = 'Validar el Asiento'
      Hint = 'Validar el Asiento'
      ImageIndex = 19
      OnExecute = AValidarExecute
    end
    object AValidarTodos: TAction
      Category = 'Procesos'
      Caption = 'Valida todos los asientos'
      Hint = 'Valida todos los asientos'
      ImageIndex = 19
      OnExecute = AValidarTodosExecute
    end
    object ATraspasa: TAction
      Category = 'Procesos'
      Caption = 'Traspasa a Contabilidad'
      Hint = 'Traspasa a Contabilidad'
      ImageIndex = 36
      ShortCut = 16468
      OnExecute = ATraspasaExecute
    end
    object ATraspasaFiltrados: TAction
      Category = 'Procesos'
      Caption = 'Traspaso Asientos Filtrados a Contabilidad'
      Hint = 'Traspaso Asientos Filtrados a Contabilidad'
      ImageIndex = 36
      OnExecute = ATraspasaFiltradosExecute
    end
    object ASep: TAction
      Category = 'Procesos'
      Caption = '-'
    end
    object ACuadrar: TAction
      Category = 'Procesos'
      Caption = 'Cuadrar el Asiento'
      Hint = 'Cuadrar el Asiento'
      ImageIndex = 3
      OnExecute = ACuadrarExecute
    end
    object APasaAPlantilla: TAction
      Category = 'Procesos'
      Caption = 'Exportar el Asiento a Plantilla'
      Hint = 'Exportar el Asiento a Plantilla'
      ImageIndex = 42
      OnExecute = APasaAPlantillaExecute
    end
    object APasaDePlantilla: TAction
      Category = 'Procesos'
      Caption = 'Importar el Asiento de Plantilla'
      Hint = 'Importar el Asiento de Plantilla'
      ImageIndex = 43
      ShortCut = 16464
      OnExecute = APasaDePlantillaExecute
    end
    object ARenumera: TAction
      Category = 'Procesos'
      Caption = 'Ajusta contador de Relaci'#243'n Interna Contable'
      Hint = 'Ajusta contador de Relaci'#243'n Interna Contable'
      ImageIndex = 122
      OnExecute = ARenumeraExecute
    end
    object ACambiaTexto: TAction
      Category = 'Procesos'
      Caption = 'Pasar texto de asiento a apuntes'
      Hint = 'Sustituye el texto de los apuntes por el del asiento'
      ImageIndex = 18
      OnExecute = ACambiaTextoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AVerTerceroAsiento: TAction
      Category = 'Otros'
      Caption = 'Ver Informaci'#243'n Extendida'
      Hint = 'Ver Informaci'#243'n Extendida'
      ImageIndex = 1
      ShortCut = 16452
      OnExecute = AVerTerceroAsientoExecute
    end
    object ACentroCoste: TAction
      Category = 'Otros'
      Caption = 'Introduce Centro de Coste'
      Hint = 'Introduce Centro de Coste'
      ImageIndex = 56
      ShortCut = 49231
      OnExecute = ACentroCosteExecute
    end
    object AContaExtracto: TAction
      Category = 'Otros'
      Caption = 'Consultas al Libro de Mayor'
      Hint = 'Consultas al Libro de Mayor'
      ImageIndex = 125
      OnExecute = AContaExtractoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosAsiento: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos del Asiento'
      Hint = 'Visualiza los adjuntos del Asiento'
      ImageIndex = 59
      OnExecute = AAdjuntosAsientoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 244
    Top = 278
  end
  inherited CEDetalle: TControlEdit
    SubComplementario = ALMain
    Left = 516
    Top = 305
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 556
    Top = 304
  end
  object ALBorrador: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 407
    Top = 272
    object ASesion: TAction
      Caption = 'Mostrar borrador de esta sesi'#243'n'
      Hint = 'Mostrar Borrador de esta sesi'#243'n'
      ImageIndex = 21
      OnExecute = ASesionExecute
    end
    object ANormal: TAction
      Caption = 'Mostrar todo el borrador'
      Hint = 'Mostrar todo el Borrador'
      ImageIndex = 11
      OnExecute = ANormalExecute
    end
    object AVerApunteIva: TAction
      Caption = 'Ver base imponible del apunte de IVA'
      Hint = 'Ver base imponible del Apunte de IVA'
      ImageIndex = 56
      ShortCut = 16449
      OnExecute = AVerApunteIvaExecute
    end
    object ADuplicarLinea: TAction
      Caption = 'Duplicar Linea'
      Hint = 'Duplicar inea actual'
      ImageIndex = 37
      ShortCut = 120
      OnExecute = ADuplicarLineaExecute
    end
  end
end
