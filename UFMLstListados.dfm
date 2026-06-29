inherited FMLstListados: TFMLstListados
  Left = 269
  Top = 181
  Caption = 'Listados personalizados'
  ClientHeight = 573
  ClientWidth = 792
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Top = 23
    Width = 792
    Height = 550
    inherited TBMain: TLFToolBar
      Width = 792
      inherited TButtRecargar: TToolButton
        DropdownMenu = popUpListados
        Style = tbsDropDown
      end
      inherited TButtImprimir: TToolButton
        Left = 85
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 157
      end
      inherited TButtSalir: TToolButton
        Left = 229
      end
      inherited TButtConf: TToolButton
        Left = 301
      end
      object TButtEstablecerPorDefecto: TToolButton
        Left = 373
        Top = 0
        Action = AEstablecerPorDefecto
      end
      object tbDesarrollo: TToolButton
        Left = 445
        Top = 0
        Caption = 'Desarrollo'
        DropdownMenu = popDesarrollo
        ImageIndex = 97
        Style = tbsDropDown
      end
      object tbEliminar: TToolButton
        Left = 530
        Top = 0
        Action = AEliminar
      end
      object tbExportar: TToolButton
        Left = 602
        Top = 0
        Action = AExportarListadoHTML
      end
    end
    inherited PCMain: TLFPageControl
      Width = 792
      Height = 514
      inherited TSLimites: TTabSheet
        inherited PNLLimites: TLFPanel
          Width = 780
          Height = 481
          inherited PNLLimFilMae: TLFPanel
            Top = 197
            Width = 780
          end
          inherited GBEjemploEditFindDesdeHasta: TGroupBox
            Top = 222
            Width = 780
            DesignSize = (
              780
              65)
            inherited TitDesCli: TLFDbedit
              Width = 562
            end
            inherited EdHasCli: TLFEditFind2000
              OnBusqueda = BusquedaEF
            end
            inherited TitHasCli: TLFDbedit
              Width = 562
            end
          end
          object GBEjemploListaDeValores: TGroupBox
            Left = 0
            Top = 287
            Width = 780
            Height = 144
            Align = alTop
            Caption = ' Clientes '
            TabOrder = 2
            Visible = False
            DesignSize = (
              780
              144)
            object LFLabel1: TLFLabel
              Left = 66
              Top = 20
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LFEditFind20001: TLFEditFind2000
              Left = 104
              Top = 16
              Width = 81
              Height = 21
              TabOrder = 0
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CLIENTE'
              CampoStr = 'NOMBRE_COMERCIAL'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_CLIENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object LFDbedit1: TLFDbedit
              Left = 186
              Top = 16
              Width = 562
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'NOMBRE_COMERCIAL'
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object ListBox1: TListBox
              Left = 104
              Top = 38
              Width = 537
              Height = 97
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              TabOrder = 2
            end
            object Button1: TButton
              Left = 655
              Top = 40
              Width = 89
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Eliminar'
              TabOrder = 3
              OnClick = BtnEliminarClick
            end
            object Button2: TButton
              Left = 655
              Top = 72
              Width = 89
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Eliminar Todos'
              TabOrder = 4
            end
            object Button3: TButton
              Left = 655
              Top = 104
              Width = 89
              Height = 25
              Anchors = [akTop, akRight]
              Caption = 'Eliminar Todos'
              TabOrder = 5
            end
          end
          object GBEjemploEditFind: TGroupBox
            Left = 0
            Top = 149
            Width = 780
            Height = 48
            Align = alTop
            Caption = ' Clientes '
            TabOrder = 3
            Visible = False
            DesignSize = (
              780
              48)
            object LFLabel2: TLFLabel
              Left = 94
              Top = 20
              Width = 3
              Height = 13
              Alignment = taRightJustify
            end
            object LFEditFind20002: TLFEditFind2000
              Left = 104
              Top = 16
              Width = 81
              Height = 21
              TabOrder = 0
              OnChange = PonTitulo
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CLIENTE'
              CampoStr = 'NOMBRE_COMERCIAL'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_CLIENTES_EF'
              Tabla_asociada.DesplegarBusqueda = False
              OnBusqueda = BusquedaEF
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object LFDbedit2: TLFDbedit
              Left = 186
              Top = 16
              Width = 562
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'NOMBRE_COMERCIAL'
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
          object GBEjemploCheckBox: TGroupBox
            Left = 0
            Top = 431
            Width = 780
            Height = 43
            Align = alTop
            Caption = 'Ejemplo CheckBox'
            TabOrder = 4
            Visible = False
            object LFCheckBox1: TLFCheckBox
              Left = 64
              Top = 16
              Width = 385
              Height = 17
              Caption = 'Seleccionado'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CambiaCH
            end
          end
          object GBEjemploFechaDesdeHasta: TGroupBox
            Left = 0
            Top = 86
            Width = 780
            Height = 63
            Align = alTop
            Caption = 'Fechas'
            TabOrder = 5
            Visible = False
            object LFLabel5: TLFLabel
              Left = 66
              Top = 18
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LFLabel6: TLFLabel
              Left = 69
              Top = 40
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object LFDateEdit3: TLFDateEdit
              Left = 104
              Top = 14
              Width = 121
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
              OnChange = CambiaDE
            end
            object LFDateEdit4: TLFDateEdit
              Left = 104
              Top = 36
              Width = 121
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 1
            end
          end
          object GBEjemploFecha: TGroupBox
            Left = 0
            Top = 43
            Width = 780
            Height = 43
            Align = alTop
            Caption = 'Fechas'
            TabOrder = 6
            Visible = False
            object LFLabel4: TLFLabel
              Left = 66
              Top = 18
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LFDateEdit2: TLFDateEdit
              Left = 104
              Top = 14
              Width = 121
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
              OnChange = CambiaDE
            end
          end
          object GBEjemploCadena: TGroupBox
            Left = 0
            Top = 0
            Width = 780
            Height = 43
            Align = alTop
            Caption = 'Fechas'
            TabOrder = 7
            Visible = False
            object LFLabel7: TLFLabel
              Left = 66
              Top = 18
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object LFEdit2: TLFEdit
              Left = 104
              Top = 14
              Width = 233
              Height = 21
              TabOrder = 0
            end
          end
        end
      end
      inherited TSOpciones: TTabSheet
        TabVisible = False
        inherited PNLOpciones: TLFPanel
          Width = 780
          Visible = True
        end
      end
      inherited TSAgrupOrd: TTabSheet
        inherited PNLOpcGen: TLFPanel
          Width = 780
          Visible = True
          inherited CBOrden: TLFComboBox
            OnChange = CBOrdenChange
          end
        end
        inherited PNLTipoInforme: TLFPanel
          Width = 780
          inherited RGResumido: TRadioGroup
            Width = 491
          end
        end
        inherited PNLTotales: TLFPanel
          Width = 780
          inherited GBAgrupadoPor: TGroupBox
            Width = 588
          end
          inherited RGSaltoPagina: TRadioGroup
            Left = 588
          end
        end
      end
      object TSDesarrollo: TTabSheet
        Caption = 'Desarrollo'
        object PCDebug: TLFPageControl
          Left = 0
          Top = 0
          Width = 784
          Height = 485
          ActivePage = TSListado
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          OnChange = PCDebugChange
          OnChanging = PCDebugChanging
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSListado: TTabSheet
            Caption = 'Consulta y Descripci'#243'n'
            ImageIndex = 6
            object PNLDesConsultaCabecera: TLFPanel
              Left = 0
              Top = 0
              Width = 776
              Height = 41
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object BGuardaEdicion: TButton
                Left = 104
                Top = 8
                Width = 105
                Height = 25
                Caption = 'Guardar y Cerrar'
                TabOrder = 1
                OnClick = BGuardaEdicionClick
              end
              object BAbreEdicion: TButton
                Left = 16
                Top = 8
                Width = 75
                Height = 25
                Caption = 'Abrir'
                TabOrder = 0
                OnClick = BAbreEdicionClick
              end
            end
            object PNLDesConsultaSQL: TLFPanel
              Left = 321
              Top = 41
              Width = 455
              Height = 416
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 2
              object LConsultaSQL: TLFLabel
                Left = 0
                Top = 0
                Width = 455
                Height = 13
                Align = alTop
                Caption = 'Consula SQL'
              end
              object DBMConsulaSQL: TLFDBMemo
                Left = 0
                Top = 13
                Width = 455
                Height = 403
                Align = alClient
                DataField = 'CONSULTA'
                DataSource = DMLstListados.DSQMEdicionListado
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
              end
            end
            object PNLDesConsultaDatos: TLFPanel
              Left = 0
              Top = 41
              Width = 321
              Height = 416
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 1
              object LTitulo: TLFLabel
                Left = 7
                Top = 8
                Width = 26
                Height = 13
                Caption = 'Titulo'
              end
              object LOrden: TLFLabel
                Left = 8
                Top = 136
                Width = 29
                Height = 13
                Alignment = taRightJustify
                Caption = 'Orden'
              end
              object DBCBMostrarTabSalida: TLFDBCheckBox
                Left = 8
                Top = 56
                Width = 300
                Height = 17
                Caption = 'Mostrar Tab Salida'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'MOSTRAR_SALIDA'
                DataSource = DMLstListados.DSQMEdicionListado
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCBPerimitirDefinirNuevosListados: TLFDBCheckBox
                Left = 8
                Top = 72
                Width = 300
                Height = 17
                Caption = 'Permitir definir nuevos listados'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'PERMITIR_NUEVOS_LISTADOS'
                DataSource = DMLstListados.DSQMEdicionListado
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCBPermitirDisenarListados: TLFDBCheckBox
                Left = 8
                Top = 88
                Width = 300
                Height = 17
                Caption = 'Permitir dise'#241'ar listados'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 3
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'PERMITIR_MODIFICAR_LISTADOS'
                DataSource = DMLstListados.DSQMEdicionListado
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCBPermitirEliminarListados: TLFDBCheckBox
                Left = 8
                Top = 104
                Width = 300
                Height = 17
                Caption = 'Permitir eliminar listados'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 4
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'PERMITIR_ELIMINAR'
                DataSource = DMLstListados.DSQMEdicionListado
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBEOrden: TLFDbedit
                Left = 40
                Top = 132
                Width = 49
                Height = 21
                DataField = 'ORDEN'
                DataSource = DMLstListados.DSQMEdicionListado
                TabOrder = 5
              end
              object DBETitulo: TLFDbedit
                Left = 8
                Top = 24
                Width = 300
                Height = 21
                DataField = 'TITULO'
                DataSource = DMLstListados.DSQMEdicionListado
                TabOrder = 0
              end
            end
          end
          object TSEdicionFiltros: TTabSheet
            Caption = 'Filtros'
            object DBGFDetalle: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 776
              Height = 457
              Align = alClient
              DataSource = DMLstListados.DSQMFiltros
              Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
              Insercion = True
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = True
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
              Transaction = DMLstListados.TLocal
              BuscarNums = False
              BuscarChars = False
              CamposAMostrarAnchos.Strings = (
                '0'
                '0'
                '0'
                '0'
                '0'
                '0')
              CampoAOrdenarColor = clBlack
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'CAMPO_CODIGO'
                'CAMPO_TITULO'
                'CONDICION_BUSQUEDA'
                'MOSTRAR_TITULO'
                'ORDEN'
                'PARAMETRO'
                'TABLA'
                'TEXTO'
                'TIPO')
              CamposNoAccesibles.Strings = (
                'EMPRESA'
                'GRUPO'
                'LISTADO')
              MensajeNoExiste = False
              SalirSiVacio = False
              SalirSiNoExiste = False
              Posicion = tpCentrado
              OnBusqueda = DBGFDetalleBusqueda
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                ''
                ''
                ''
                '')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'PARAMETRO'
                  Width = 131
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 30
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'MOSTRAR_TITULO'
                  Width = 91
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TEXTO'
                  Width = 291
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TABLA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CAMPO_CODIGO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CAMPO_TITULO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CONDICION_BUSQUEDA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDEN'
                  Width = 33
                  Visible = True
                end>
            end
          end
          object tsDebOrdenes: TTabSheet
            Caption = #211'rdenes'
            ImageIndex = 8
            object DBGOrdenes: TDBGridFind2000
              Left = 0
              Top = 0
              Width = 776
              Height = 457
              Align = alClient
              DataSource = DMLstListados.DSQMOrdenes
              Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              IniStorage = FSMain
              Insercion = True
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = True
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
              Transaction = DMLstListados.TLocal
              BuscarNums = False
              BuscarChars = False
              CamposAMostrarAnchos.Strings = (
                '0'
                '0'
                '0'
                '0'
                '0'
                '0')
              CampoAOrdenarColor = clBlack
              CampoAOrdenarBitmaps = DMMain.ILOrdGrid
              CamposAOrdernar.Strings = (
                'CAMPO_CODIGO'
                'CAMPO_TITULO'
                'CONDICION_BUSQUEDA'
                'MOSTRAR_TITULO'
                'ORDEN'
                'PARAMETRO'
                'TABLA'
                'TEXTO'
                'TIPO')
              CamposNoAccesibles.Strings = (
                'EMPRESA'
                'GRUPO'
                'LISTADO')
              MensajeNoExiste = False
              SalirSiVacio = False
              SalirSiNoExiste = False
              Posicion = tpCentrado
              OnBusqueda = DBGFDetalleBusqueda
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                ''
                ''
                ''
                '')
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Expanded = False
                  FieldName = 'NUMERO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ORDEN'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SQL'
                  Visible = True
                end>
            end
          end
          object tsParametros: TTabSheet
            Caption = 'Parametros Filtros'
            ImageIndex = 1
            object vleParametros: TValueListEditor
              Left = 0
              Top = 0
              Width = 776
              Height = 457
              Align = alClient
              Color = clInfoBk
              Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing, goAlwaysShowEditor, goThumbTracking]
              Strings.Strings = (
                '')
              TabOrder = 0
              TitleCaptions.Strings = (
                'Par'#225'metro'
                'Valor')
              ColWidths = (
                180
                590)
            end
          end
          object tsOrdenes: TTabSheet
            Caption = 'Parametros Ordenes'
            ImageIndex = 2
            object vleOrdenes: TValueListEditor
              Left = 0
              Top = 0
              Width = 776
              Height = 457
              Align = alClient
              Color = clInfoBk
              Strings.Strings = (
                '')
              TabOrder = 0
              TitleCaptions.Strings = (
                'Par'#225'metro'
                'Valor')
              ColWidths = (
                180
                590)
            end
          end
          object tsFiltros: TTabSheet
            Caption = 'Busquedas Desde Hasta'
            ImageIndex = 3
            object vleFiltros: TValueListEditor
              Left = 0
              Top = 0
              Width = 776
              Height = 457
              Align = alClient
              Color = clInfoBk
              Strings.Strings = (
                '')
              TabOrder = 0
              TitleCaptions.Strings = (
                'Par'#225'metro'
                'Valor')
              ColWidths = (
                180
                590)
            end
          end
          object TSSQl: TTabSheet
            Caption = 'Testeo'
            object Splitter1: TSplitter
              Left = 0
              Top = 257
              Width = 776
              Height = 5
              Cursor = crVSplit
              Align = alTop
            end
            object PNLTesteoTop: TLFPanel
              Left = 0
              Top = 0
              Width = 776
              Height = 257
              Align = alTop
              TabOrder = 0
              object Splitter2: TSplitter
                Left = 338
                Top = 1
                Width = 5
                Height = 255
                Cursor = crHSplit
              end
              object PNLTesteoParametros: TLFPanel
                Left = 1
                Top = 1
                Width = 337
                Height = 255
                Align = alLeft
                TabOrder = 0
                DesignSize = (
                  337
                  255)
                object BMostrarConsultaYPrametros: TButton
                  Left = 58
                  Top = 200
                  Width = 217
                  Height = 25
                  Anchors = [akLeft, akBottom]
                  Caption = 'Mostrar Consulta y Par'#225'metros'
                  TabOrder = 0
                  OnClick = BMostrarConsultaYPrametrosClick
                end
                object BTestearListado: TButton
                  Left = 58
                  Top = 226
                  Width = 217
                  Height = 25
                  Anchors = [akLeft, akBottom]
                  Caption = 'Testear Listado'
                  TabOrder = 1
                  OnClick = BTestearListadoClick
                end
                object vleParamssql: TValueListEditor
                  Left = 1
                  Top = 1
                  Width = 335
                  Height = 196
                  Align = alTop
                  Anchors = [akLeft, akTop, akRight, akBottom]
                  Strings.Strings = (
                    '')
                  TabOrder = 2
                  TitleCaptions.Strings = (
                    'Par'#225'metro'
                    'Valor')
                  ColWidths = (
                    129
                    200)
                end
              end
              object memSQL: TLFMemo
                Left = 343
                Top = 1
                Width = 432
                Height = 255
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Courier New'
                Font.Style = []
                ParentFont = False
                ReadOnly = True
                TabOrder = 1
              end
            end
            object DBGResultadoTesteo: TDBGridFind2000
              Left = 0
              Top = 262
              Width = 776
              Height = 195
              Align = alClient
              DataSource = DMLstListados.DSQMListado
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
              IndiceBitmapAscendente = 0
              IndiceBitmapChecked = -1
              IndiceBitmapDescendente = 0
              BuscarNums = False
              CampoAOrdenarColor = clInfoBk
              MensajeNoExiste = False
              SalirSiVacio = False
              SalirSiNoExiste = False
              Posicion = tpCentrado
              OrdenMultiple = True
              Filtros = []
            end
          end
          object tsDebug: TTabSheet
            Caption = 'Debug'
            object memLog: TLFMemo
              Left = 0
              Top = 0
              Width = 776
              Height = 457
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Courier New'
              Font.Style = []
              Lines.Strings = (
                'memLog')
              ParentFont = False
              PopupMenu = PopupMenu1
              ReadOnly = True
              ScrollBars = ssVertical
              TabOrder = 0
              Visible = False
            end
          end
          object tsAyuda: TTabSheet
            Caption = 'Ayuda'
            ImageIndex = 5
            object memAyuda: TLFMemo
              Left = 0
              Top = 0
              Width = 776
              Height = 457
              Align = alClient
              Lines.Strings = (
                'Hay diferentes tipos de par'#225'metros:'
                '        - 0: Un solo filtro con EditFind'
                '        - 1: Desde Hasta con EditFind'
                '        - 2: Lista de valores con desde/hasta'
                '        - 3: Desde Hasta Fecha'
                '        - 4: Una sola fecha'
                '        - 5: Texto'
                '        - 6: Check')
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  object Panel1: TLFPanel [1]
    Left = 0
    Top = 0
    Width = 792
    Height = 23
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      792
      23)
    object DBETituloListado: TLFDbedit
      Left = 2
      Top = 2
      Width = 788
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clInfoBk
      DataField = 'TITULO'
      DataSource = DMLstListados.DSQMConf
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited ALMain: TLFActionList
    Left = 432
    Top = 48
    inherited APrev: TAction
      OnExecute = TButtPrevisualizarClick
    end
    object AEstablecerPorDefecto: TAction
      Caption = 'Por Defecto'
      Hint = 'Establece el listado por defecto'
      ImageIndex = 42
      OnExecute = AEstablecerPorDefectoExecute
    end
    object AEliminar: TAction
      Caption = 'Eliminar'
      Hint = 'Eliminar el listado'
      ImageIndex = 27
      OnExecute = AEliminarExecute
    end
    object AExportarListadoHTML: TAction
      Caption = 'Exportar'
      Hint = 'Exporta el listado en formato HTML'
      ImageIndex = 36
      OnExecute = AExportarListadoHTMLExecute
    end
    object ACrearFiltros: TAction
      Caption = 'Crear Filtros'
      Hint = 'Crea los filtros de listado'
      OnExecute = ACrearFiltrosExecute
    end
    object ALimpiarFiltros: TAction
      Caption = 'Limpiar Filtros'
      Hint = 'Elimina los filtros de listado'
      OnExecute = ALimpiarFiltrosExecute
    end
    object AExportarConfiguracionListado: TAction
      Caption = 'Exportar Configuracion Listado'
      OnExecute = AExportarConfiguracionListadoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Active = False
    Left = 464
  end
  object popUpListados: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = popUpListadosPopup
    Left = 528
    Top = 48
    object AAA1: TMenuItem
      Caption = 'AAA'
    end
  end
  object popDesarrollo: TPopupMenu
    AutoHotkeys = maManual
    Left = 496
    Top = 48
    object MICrearFiltros: TMenuItem
      Action = ACrearFiltros
    end
    object MILimpiarFiltros: TMenuItem
      Action = ALimpiarFiltros
    end
    object MIExportarConfiguracionListado: TMenuItem
      Action = AExportarConfiguracionListado
    end
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 696
    Top = 48
    object Limpiar1: TMenuItem
      Caption = 'Limpiar'
      OnClick = Limpiar1Click
    end
  end
  object AbZipper1: TAbZipper
    AutoSave = False
    DOSMode = False
    StoreOptions = [soStripDrive, soRemoveDots, soRecurse]
    Left = 624
    Top = 48
  end
  object AbZipBrowser1: TAbZipBrowser
    TarAutoHandle = False
    Left = 656
    Top = 48
  end
end
