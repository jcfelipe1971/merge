object ZFMTraspasoMultiCanalMasivo: TZFMTraspasoMultiCanalMasivo
  Left = 663
  Top = 174
  Width = 492
  Height = 611
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Traspaso de Documentos '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNMain: TLFPanel
    Left = 0
    Top = 0
    Width = 484
    Height = 584
    Align = alClient
    TabOrder = 0
    object PNTraspaso: TLFPanel
      Left = 1
      Top = 27
      Width = 482
      Height = 556
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object GBDatos: TGroupBox
        Left = 0
        Top = 149
        Width = 482
        Height = 69
        Align = alTop
        Caption = 'Datos Destino'
        TabOrder = 1
        object LCanalDestino: TLFLabel
          Left = 5
          Top = 23
          Width = 66
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal Destino'
        end
        object LSerieDestino: TLFLabel
          Left = 13
          Top = 44
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Serie'
        end
        object EFCanales: TEditFind2000
          Left = 74
          Top = 19
          Width = 72
          Height = 21
          TabOrder = 0
          OnChange = EFCanalesChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFSeriesD: TEditFind2000
          Left = 74
          Top = 41
          Width = 72
          Height = 21
          TabOrder = 1
          OnChange = EFSeriesDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFSeriesDBusqueda
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloCanalDestino: TLFEdit
          Left = 147
          Top = 19
          Width = 321
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 2
        end
        object ETituloSerieDestino: TLFEdit
          Left = 147
          Top = 41
          Width = 321
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
      end
      object GBOrigen: TGroupBox
        Left = 0
        Top = 37
        Width = 482
        Height = 112
        Align = alTop
        Caption = 'Datos Origen'
        TabOrder = 0
        object LSerieOrigen: TLFLabel
          Left = 13
          Top = 45
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie Origen'
        end
        object LCanalOrigen: TLFLabel
          Left = 10
          Top = 23
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal Origen'
        end
        object LDesdeFecha: TLFLabel
          Left = 7
          Top = 68
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LHastaFecha: TLFLabel
          Left = 186
          Top = 68
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LHastaRIG: TLFLabel
          Left = 200
          Top = 89
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Rig'
        end
        object LDEsdeRIG: TLFLabel
          Left = 21
          Top = 89
          Width = 50
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Rig'
        end
        object EFSeriesOr: TLFEditFind2000
          Left = 74
          Top = 41
          Width = 72
          Height = 21
          TabOrder = 1
          OnChange = EFSeriesOrChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFSeriesOrBusqueda
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object LFFechaD: TLFDateEdit
          Left = 74
          Top = 63
          Width = 105
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 2
          OnExit = LFFechaDExit
        end
        object LFFechaH: TLFDateEdit
          Left = 250
          Top = 63
          Width = 105
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 3
          OnExit = LFFechaHExit
        end
        object LFRigH: TLFEditFind2000
          Left = 250
          Top = 84
          Width = 83
          Height = 21
          TabOrder = 5
          OnChange = LFRigHChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'RIG'
          CampoStr = 'FECHA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CABECERAS_FACTURA'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = LFRigHBusqueda
          OrdenadoPor.Strings = (
            'FECHA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object LFRigD: TLFEditFind2000
          Left = 74
          Top = 84
          Width = 83
          Height = 21
          TabOrder = 4
          OnChange = LFRigDChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'RIG'
          CampoStr = 'FECHA'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CABECERAS_FACTURA'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = LFRigDBusqueda
          OrdenadoPor.Strings = (
            'FECHA')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFCanalOr: TLFEdit
          Left = 74
          Top = 19
          Width = 72
          Height = 21
          Color = clInfoBk
          TabOrder = 0
          OnChange = EFCanalOrChange
        end
        object ETituloCanalOrigen: TLFEdit
          Left = 147
          Top = 19
          Width = 321
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 6
        end
        object ETituloSerieOrigen: TLFEdit
          Left = 147
          Top = 41
          Width = 321
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 7
        end
      end
      object GBGrid: TGroupBox
        Left = 0
        Top = 345
        Width = 482
        Height = 211
        Align = alClient
        TabOrder = 4
        object PNLGrids: TLFPanel
          Left = 2
          Top = 66
          Width = 478
          Height = 143
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGRecibos: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 239
            Height = 143
            Align = alLeft
            DataSource = ZDMTraspasoMultiCanalMasivo.DSxRecibosG
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
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
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'PAGADO'
              'Traspasar')
            ColumnasChecked.Strings = (
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CTA_PAGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LIQUIDO'
                Visible = True
              end>
          end
          object DBReciboAct: TDBGridFind2000
            Left = 239
            Top = 0
            Width = 239
            Height = 143
            Align = alClient
            DataSource = ZDMTraspasoMultiCanalMasivo.DSxRecibosGAct
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            ReadOnly = True
            TabOrder = 1
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
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'PAGADO'
              'Traspasar')
            ColumnasChecked.Strings = (
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'CTA_PAGO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LIQUIDO'
                Visible = True
              end>
          end
        end
        object PNLPie: TLFPanel
          Left = 2
          Top = 15
          Width = 478
          Height = 51
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LCuentaTesoreria: TLFLabel
            Left = 3
            Top = 7
            Width = 126
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Contable Tesoreria'
          end
          object LTotalSeleccionFiltro: TLFLabel
            Left = 35
            Top = 28
            Width = 94
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total selecci'#243'n filtro'
          end
          object LFETotalSelec: TLFDbedit
            Left = 133
            Top = 24
            Width = 87
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SUMA_LIQUIDO'
            DataSource = ZDMTraspasoMultiCanalMasivo.DSxRecibos
            ReadOnly = True
            TabOrder = 1
            OnChange = LFETotalSelecChange
          end
          object EFCuentaCaja: TLFEditFind2000
            Left = 133
            Top = 2
            Width = 87
            Height = 21
            TabOrder = 0
            OnChange = EFCuentaCajaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CONTRA_CONTABLES'
            Tabla_asociada.DesplegarBusqueda = False
            OnBusqueda = EFCuentaCajaBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCuenta: TLFEdit
            Left = 221
            Top = 2
            Width = 232
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 2
          end
        end
      end
      object PNLInfoProceso: TLFPanel
        Left = 0
        Top = 0
        Width = 482
        Height = 37
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 5
        DesignSize = (
          482
          37)
        object LFaltan: TLFLabel
          Left = 102
          Top = 2
          Width = 377
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '?'
          Color = clInfoBk
          ParentColor = False
        end
        object LFactura: TLFLabel
          Left = 102
          Top = 19
          Width = 377
          Height = 16
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = '...'
          Color = clInfoBk
          ParentColor = False
        end
        object LBLProcesando: TLFLabel
          Left = 2
          Top = 19
          Width = 99
          Height = 16
          AutoSize = False
          Caption = 'Procesando'
          Color = clInfoBk
          ParentColor = False
        end
        object LBLFaltan: TLFLabel
          Left = 2
          Top = 2
          Width = 99
          Height = 16
          AutoSize = False
          Caption = 'Faltan'
          Color = clInfoBk
          ParentColor = False
        end
      end
      object PNLFiltros: TLFPanel
        Left = 0
        Top = 218
        Width = 482
        Height = 89
        Align = alTop
        BevelOuter = bvNone
        Caption = 'PNLFiltros'
        TabOrder = 2
        object GTraspasos: TGroupBox
          Left = 0
          Top = 0
          Width = 190
          Height = 89
          Align = alLeft
          Caption = 'Traspasos'
          TabOrder = 0
          object LPorcentajeDestino: TLFLabel
            Left = 30
            Top = 29
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = '% destino'
          end
          object LTotalDestino: TLFLabel
            Left = 14
            Top = 52
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total destino'
          end
          object LPorciento: TLFLabel
            Left = 140
            Top = 29
            Width = 8
            Height = 13
            Caption = '%'
          end
          object LMoneda: TLFLabel
            Left = 140
            Top = 52
            Width = 6
            Height = 13
            Caption = '$'
          end
          object LFEPorcentajeD: TLFEdit
            Left = 77
            Top = 26
            Width = 59
            Height = 21
            TabOrder = 0
            OnExit = LFEPorcentajeDExit
          end
          object LFETotalD: TLFEdit
            Left = 77
            Top = 48
            Width = 59
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 1
          end
        end
        object GBVarios: TGroupBox
          Left = 292
          Top = 0
          Width = 190
          Height = 89
          Align = alRight
          TabOrder = 2
          object LFechaDocumento: TLFLabel
            Left = 16
            Top = 52
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Doc.'
          end
          object DEFechaDst: TLFDateEdit
            Left = 80
            Top = 48
            Width = 89
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 0
          end
          object CBCerrarFactura: TLFCheckBox
            Left = 40
            Top = 12
            Width = 137
            Height = 17
            Caption = 'Cerrar Factura Destino'
            ClicksDisabled = False
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBBorraDoc: TLFCheckBox
            Left = 237
            Top = 19
            Width = 126
            Height = 17
            Caption = 'Borrar Doc. Origen'
            ClicksDisabled = False
            Enabled = False
            TabOrder = 2
            TabStop = True
            Visible = False
            Alignment = taLeftJustify
          end
        end
        object RGDocumento: TRadioGroup
          Left = 190
          Top = 0
          Width = 102
          Height = 89
          Align = alClient
          Caption = 'DocDest'
          ItemIndex = 0
          Items.Strings = (
            'Facturas')
          TabOrder = 1
          Visible = False
          OnClick = RGDocumentoClick
        end
      end
      object PNLBotones: TLFPanel
        Left = 0
        Top = 307
        Width = 482
        Height = 38
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 3
        object BEmpezar: TBitBtn
          Left = 127
          Top = 7
          Width = 85
          Height = 30
          Caption = 'Empezar'
          TabOrder = 0
          OnClick = BEmpezarClick
          NumGlyphs = 2
        end
        object BInterrumpir: TBitBtn
          Left = 271
          Top = 7
          Width = 85
          Height = 30
          Caption = 'Interrumpir'
          Enabled = False
          TabOrder = 1
          OnClick = BInterrumpirClick
          NumGlyphs = 2
        end
      end
    end
    object TBTraspaso: TLFToolBar
      Left = 1
      Top = 1
      Width = 482
      Height = 26
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object TButtTrapasa: TToolButton
        Left = 0
        Top = 0
        Action = ATraspasa
      end
      object TButtSalir: TToolButton
        Left = 23
        Top = 0
        Action = ASalir
      end
    end
  end
  object ALMain: TActionList
    Images = DMMain.ILMain_Ac
    Left = 392
    Top = 140
    object ATraspasa: TAction
      Caption = 'Trapasa'
      Hint = 'Realizar Traspaso'
      ImageIndex = 36
      OnExecute = ATraspasaExecute
    end
    object ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
  end
end
