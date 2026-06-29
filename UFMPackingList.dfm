inherited FMPackingList: TFMPackingList
  Left = 264
  Top = 251
  Width = 1201
  Height = 489
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Packing List'
  OldCreateOrder = True
  PopupMenu = CEDetallePMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object spl1: TSplitter [0]
    Left = 896
    Top = 0
    Width = 9
    Height = 436
    Cursor = crHSplit
    Align = alRight
    Color = clMedGray
    ParentColor = False
  end
  inherited PMain: TLFPanel
    Width = 896
    Height = 436
    TabOrder = 2
    inherited TBMain: TLFToolBar
      Width = 892
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neReport, neSalir]
        Hints.Strings = ()
        OnClickReport = EPMainClickReport
      end
      object TBEtiqueta: TToolButton
        Left = 60
        Top = 0
        Action = AEtiquetaPackingList
      end
      object TBSep2: TToolButton
        Left = 83
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBEnviarMail: TToolButton
        Left = 91
        Top = 0
        Action = AEnviarCorreo
      end
      object TBSep9: TToolButton
        Left = 114
        Top = 0
        Width = 8
        ImageIndex = 36
        Style = tbsSeparator
      end
      object PNLTipoBultoDefecto: TLFPanel
        Left = 122
        Top = 0
        Width = 506
        Height = 22
        BevelOuter = bvNone
        Caption = 'PNLTipoBultoDefecto'
        TabOrder = 1
        object LTipoBultoDefecto: TLFLabel
          Left = 12
          Top = 5
          Width = 71
          Height = 13
          Hint = 'Tipo Bulto Defecto'
          Alignment = taRightJustify
          Caption = 'Tipo Bulto Def.'
        end
        object LContadorBulto: TLFLabel
          Left = 423
          Top = 4
          Width = 20
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro.'
        end
        object EFTipoBultoDefecto: TLFEditFind2000
          Left = 88
          Top = 1
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFTipoBultoDefectoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'BULTO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_BULTOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'BULTO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETipoBultoDefecto: TLFEdit
          Left = 153
          Top = 1
          Width = 239
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 1
        end
        object EContadorBulto: TLFEdit
          Left = 447
          Top = 0
          Width = 58
          Height = 21
          TabOrder = 2
        end
      end
      object TBCrearCajas: TToolButton
        Left = 628
        Top = 0
        Action = ACrearBultos
      end
    end
    object PNLBultos: TLFPanel
      Left = 2
      Top = 28
      Width = 892
      Height = 406
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 0
      object PDetalle: TLFPanel
        Left = 2
        Top = 169
        Width = 888
        Height = 235
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 2
        TabOrder = 0
        object TBDetalle: TLFToolBar
          Left = 2
          Top = 2
          Width = 884
          Height = 24
          EdgeBorders = []
          Flat = True
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 160
            Height = 22
            DataSource = DMPackingList.DSQMBultosDet
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TSep1: TToolButton
            Left = 160
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object PBulto: TLFPanel
            Left = 168
            Top = 0
            Width = 89
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object DBEBultoActual: TLFDbedit
              Left = 0
              Top = 0
              Width = 89
              Height = 21
              Color = clInfoBk
              DataField = 'NUMERO_BULTO'
              DataSource = DMPackingList.DSQMBultoActual
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clRed
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object TSep2: TToolButton
            Left = 257
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtTraspasarUds: TToolButton
            Left = 265
            Top = 0
            Action = ATraspasarUds
          end
          object TButtTraspasarTodasUds: TToolButton
            Left = 288
            Top = 0
            Action = ATraspasarTodasUds
          end
          object TBSep5: TToolButton
            Left = 311
            Top = 0
            Width = 8
            ImageIndex = 19
            Style = tbsSeparator
          end
          object TBDistribuir: TToolButton
            Left = 319
            Top = 0
            Action = ADistribuir
          end
          object TBSep7: TToolButton
            Left = 342
            Top = 0
            Width = 8
            ImageIndex = 98
            Style = tbsSeparator
          end
          object TButtDividirEnCajas: TToolButton
            Left = 350
            Top = 0
            Action = ADividirEnBultos
          end
          object TBSep10: TToolButton
            Left = 373
            Top = 0
            Width = 8
            ImageIndex = 97
            Style = tbsSeparator
          end
          object TBBorrarLinea: TToolButton
            Left = 381
            Top = 0
            Action = ABorrarLinea
          end
          object PNLBuscarArticulo: TLFPanel
            Left = 404
            Top = 0
            Width = 180
            Height = 22
            BevelOuter = bvNone
            TabOrder = 2
            object LArticulo: TLFLabel
              Left = 17
              Top = 4
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Articulo'
            end
            object EFArticulo: TLFEditFind2000
              Left = 56
              Top = 0
              Width = 121
              Height = 21
              TabOrder = 0
              OnChange = EFArticuloChange
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
              SalirSiNoExiste = True
              Tabla_a_buscar = 'VER_ARTICULOS_EF'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ARTICULO')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
          end
        end
        object DBGDetalle: TDBGridFind2000
          Left = 2
          Top = 26
          Width = 884
          Height = 207
          Align = alClient
          DataSource = DMPackingList.DSQMBultosDet
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGDetalleColEnter
          OnDrawColumnCell = DBGDetalleDrawColumnCell
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
          Transaction = DMPackingList.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'Nivel'
            'Orden'
            'Articulo'
            'Numero_Bulto'
            'Titulo'
            'Unidades'
            'Peso_Unitario'
            'ALFA_1'
            'ALFA_2')
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
              FieldName = 'NIVEL'
              ReadOnly = True
              Width = 30
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ORDEN'
              ReadOnly = True
              Width = 35
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO_BULTO_DET'
              Width = 70
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NUMERO_BULTO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 250
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNIDADES'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO_UNITARIO'
              Width = 52
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PESO_LINEA'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD_ETIQUETAS'
              Width = 75
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALFA_1'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALFA_2'
              ReadOnly = True
              Width = 50
              Visible = True
            end>
        end
      end
      object PCMain: TLFPageControl
        Left = 2
        Top = 2
        Width = 888
        Height = 167
        ActivePage = TSBulto
        Align = alTop
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 1
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSBulto: TTabSheet
          Caption = 'Bulto'
          object TBBulto: TLFToolBar
            Left = 0
            Top = 0
            Width = 880
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Separators = True
            object NavBulto: THYMNavigator
              Left = 0
              Top = 0
              Width = 104
              Height = 22
              DataSource = DMPackingList.DSQMBultoActual
              VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
              ParentShowHint = False
              PopupMenu = CEMainPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBENumeroBulto
              Exclusivo = True
              ControlEdit = CEMain
              OrdenAscendente = True
              InsertaUltimo = False
              OnClickAfterAdjust = NavBultoClickAfterAdjust
            end
            object TBSep6: TToolButton
              Left = 104
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBGenerarSSCC: TToolButton
              Left = 112
              Top = 0
              Action = AGenerarSSCC
            end
          end
          object PNLBulto: TLFPanel
            Left = 0
            Top = 22
            Width = 880
            Height = 111
            Align = alTop
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 1
            object LVolumen: TLFLabel
              Left = 143
              Top = 92
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Volumen'
            end
            object LUnidades: TLFLabel
              Left = 431
              Top = 48
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Unidades'
            end
            object LTituloBulto: TLFLabel
              Left = 33
              Top = 26
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'Titulo'
            end
            object LTipoBulto: TLFLabel
              Left = 38
              Top = 47
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo'
            end
            object LSSCC: TLFLabel
              Left = 447
              Top = 92
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'SSCC'
            end
            object LPesoNeto: TLFLabel
              Left = 425
              Top = 4
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso Neto'
            end
            object LPesoBruto: TLFLabel
              Left = 424
              Top = 26
              Width = 52
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peso Bruto'
            end
            object LPeso: TLFLabel
              Left = 35
              Top = 92
              Width = 24
              Height = 13
              Hint = 'Peso del conenedor (caja, palet, etc.)'
              Alignment = taRightJustify
              Caption = 'Peso'
            end
            object LNumero: TLFLabel
              Left = 22
              Top = 4
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Numero'
            end
            object LDiametroUnitario: TLFLabel
              Left = 265
              Top = 92
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Diametro'
            end
            object LAltura: TLFLabel
              Left = 448
              Top = 70
              Width = 27
              Height = 13
              Hint = 'Peso del conenedor (caja, palet, etc.)'
              Alignment = taRightJustify
              Caption = 'Altura'
            end
            object LAlto: TLFLabel
              Left = 41
              Top = 70
              Width = 18
              Height = 13
              Hint = 'Peso del conenedor (caja, palet, etc.)'
              Alignment = taRightJustify
              Caption = 'Alto'
            end
            object LAncho: TLFLabel
              Left = 153
              Top = 70
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ancho'
            end
            object LFondo: TLFLabel
              Left = 277
              Top = 70
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fondo'
            end
            object DBEDiametroUnitario: TLFDbedit
              Left = 312
              Top = 89
              Width = 64
              Height = 21
              DataField = 'DIAMETRO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 9
            end
            object ETipoBulto: TLFEdit
              Left = 129
              Top = 45
              Width = 248
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 15
            end
            object DBEVolumen: TLFDbedit
              Left = 189
              Top = 89
              Width = 64
              Height = 21
              DataField = 'VOLUMEN'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 7
            end
            object DBETotalUnidades: TLFDbedit
              Left = 480
              Top = 45
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'SUM_UNIDADES'
              DataSource = DMPackingList.DSQMBultoActual
              Enabled = False
              TabOrder = 14
            end
            object DBETituloBulto: TLFDbedit
              Left = 64
              Top = 23
              Width = 313
              Height = 21
              DataField = 'TITULO_BULTO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 1
            end
            object DBESSCC: TLFDbedit
              Left = 480
              Top = 89
              Width = 304
              Height = 21
              DataField = 'SSCC'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 11
            end
            object DBEPesoNeto: TLFDbedit
              Left = 480
              Top = 1
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'PESO_NETO'
              DataSource = DMPackingList.DSQMBultoActual
              Enabled = False
              TabOrder = 12
            end
            object DBEPesoBruto: TLFDbedit
              Left = 480
              Top = 23
              Width = 64
              Height = 21
              Color = clInfoBk
              DataField = 'PESO_BRUTO'
              DataSource = DMPackingList.DSQMBultoActual
              Enabled = False
              TabOrder = 13
            end
            object DBEPESO: TLFDbedit
              Left = 64
              Top = 89
              Width = 64
              Height = 21
              DataField = 'PESO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 6
            end
            object DBENumeroBulto: TLFDbedit
              Left = 64
              Top = 1
              Width = 121
              Height = 21
              DataField = 'NUMERO_BULTO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 0
              OnChange = DBENumeroBultoChange
            end
            object DBEFTipoBulto: TLFDBEditFind2000
              Left = 64
              Top = 45
              Width = 64
              Height = 21
              DataField = 'BULTO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 2
              OnChange = DBEFTipoBultoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ART_BULTOS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'BULTO'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OrdenadoPor.Strings = (
                'BULTO')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEAltura: TLFDbedit
              Left = 480
              Top = 67
              Width = 64
              Height = 21
              DataField = 'ALTURA'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 10
            end
            object DBEAlto: TLFDbedit
              Left = 64
              Top = 67
              Width = 64
              Height = 21
              DataField = 'ALTO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 3
            end
            object DBEAncho: TLFDbedit
              Left = 189
              Top = 67
              Width = 64
              Height = 21
              DataField = 'ANCHO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 4
            end
            object DBEFondo: TLFDbedit
              Left = 312
              Top = 67
              Width = 64
              Height = 21
              DataField = 'FONDO'
              DataSource = DMPackingList.DSQMBultoActual
              TabOrder = 5
            end
            object BCalcularVolumen: TButton
              Left = 254
              Top = 91
              Width = 21
              Height = 18
              Hint = 'Calcular Volumen'
              Caption = 'C'
              TabOrder = 8
              Visible = False
              OnClick = BCalcularVolumenClick
            end
          end
        end
        object TSEmbarque: TTabSheet
          Caption = 'Embarque'
          ImageIndex = 1
          object TBEmbarque: TLFToolBar
            Left = 0
            Top = 0
            Width = 880
            Height = 26
            EdgeBorders = []
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Separators = True
            object NavEmbarque: THYMNavigator
              Left = 0
              Top = 0
              Width = 104
              Height = 22
              DataSource = DMPackingList.DSQMDatosEmbarque
              VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
              Flat = True
              ParentShowHint = False
              PopupMenu = CEMainPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CEMain
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object PNLEmbarque: TLFPanel
            Left = 0
            Top = 26
            Width = 880
            Height = 113
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            OnResize = PNLEmbarqueResize
            object PNLDatosEmbarque: TLFPanel
              Left = 0
              Top = 0
              Width = 293
              Height = 113
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object LFechaPackingList: TLFLabel
                Left = 30
                Top = 3
                Width = 30
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha'
              end
              object DBDEFechaEmbarque: TLFDBDateEdit
                Left = 64
                Top = 0
                Width = 121
                Height = 21
                DataField = 'FECHA_PACKING_LIST'
                DataSource = DMPackingList.DSQMDatosEmbarque
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 0
              end
            end
            object PNLDatosEmbarqueIzq: TLFPanel
              Left = 293
              Top = 0
              Width = 299
              Height = 113
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object LDatosEmbarqueIzq: TLFLabel
                Left = 0
                Top = 0
                Width = 99
                Height = 13
                Align = alTop
                Caption = 'Datos Embarque Izq.'
              end
              object DBMIzquierda: TLFDBMemo
                Left = 0
                Top = 13
                Width = 299
                Height = 100
                Align = alClient
                DataField = 'DATOS_EMBARQUE_IZQ'
                DataSource = DMPackingList.DSQMDatosEmbarque
                TabOrder = 0
              end
            end
            object PNLDatosEmbarqueDer: TLFPanel
              Left = 592
              Top = 0
              Width = 288
              Height = 113
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 2
              object LDatosEmbarqueDer: TLFLabel
                Left = 0
                Top = 0
                Width = 102
                Height = 13
                Align = alTop
                Caption = 'Datos Embarque Der.'
              end
              object DBMDerecha: TLFDBMemo
                Left = 0
                Top = 13
                Width = 288
                Height = 100
                Align = alClient
                DataField = 'DATOS_EMBARQUE_DER'
                DataSource = DMPackingList.DSQMDatosEmbarque
                TabOrder = 0
              end
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 436
    Width = 1191
    TabOrder = 0
  end
  object PNLArbol: TLFPanel [3]
    Left = 905
    Top = 0
    Width = 286
    Height = 436
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 1
    object TVBultos: TTreeView
      Left = 0
      Top = 22
      Width = 286
      Height = 414
      Align = alClient
      DragMode = dmAutomatic
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Images = DMMain.ILMain_Ac
      Indent = 19
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      OnChange = TVBultosChange
      OnCustomDrawItem = TVBultosCustomDrawItem
      OnDeletion = TVBultosDeletion
      OnDragDrop = TVBultosDragDrop
      OnDragOver = TVBultosDragOver
    end
    object TBArbol: TLFToolBar
      Left = 0
      Top = 0
      Width = 286
      Height = 22
      AutoSize = True
      DisabledImages = DMMain.ILMain_In
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Separators = True
      object TBInsertarBulto: TToolButton
        Left = 0
        Top = 0
        Action = AInsertarBulto
      end
      object TBBorrarBulto: TToolButton
        Left = 23
        Top = 0
        Action = ABorrarBulto
      end
      object TBSep1: TToolButton
        Left = 46
        Top = 0
        Width = 8
        ImageIndex = 91
        Style = tbsSeparator
      end
      object TBSubirOrdenBulto: TToolButton
        Left = 54
        Top = 0
        Action = ASubirOrdenBulto
      end
      object TBBajarOrdenBulto: TToolButton
        Left = 77
        Top = 0
        Action = ABajarOrdenBulto
      end
      object TBSep3: TToolButton
        Left = 100
        Top = 0
        Width = 8
        ImageIndex = 53
        Style = tbsSeparator
      end
      object TBTraspasarBulto: TToolButton
        Left = 108
        Top = 0
        Action = ATraspasarBulto
      end
      object TBAgrupar: TToolButton
        Left = 131
        Top = 0
        Action = AAgrupar
      end
      object TBSep4: TToolButton
        Left = 154
        Top = 0
        Width = 8
        ImageIndex = 110
        Style = tbsSeparator
      end
      object TBCambiarNumBultoIni: TToolButton
        Left = 162
        Top = 0
        Action = ACambiarNumBultoIni
      end
      object TBSep8: TToolButton
        Left = 185
        Top = 0
        Width = 8
        ImageIndex = 123
        Style = tbsSeparator
      end
      object TBBorrarCajasVacias: TToolButton
        Left = 193
        Top = 0
        Action = ABorrarBultosVacios
      end
    end
  end
  inherited CEMain: TControlEdit
    PanelEdicion = PNLBulto
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 652
    Top = 2
    object AInformePackingList: TAction
      Category = 'Listados'
      Caption = 'Informe Packing List'
      Hint = 'Informe Packing List'
      ImageIndex = 14
      OnExecute = AInformePackingListExecute
    end
    object AEnviarCorreo: TAction
      Category = 'Listados'
      Caption = 'Enviar Correo'
      Hint = 'Enviar Correo'
      ImageIndex = 34
      OnExecute = AEnviarCorreoExecute
    end
    object AEtiquetaPackingList: TAction
      Category = 'Listados'
      Caption = 'Etiquetas'
      ImageIndex = 95
      OnExecute = AEtiquetaPackingListExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
      OnExecute = LFCategoryAction1Execute
    end
    object AConfListadoPackingList: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Packing List'
      ImageIndex = 77
      OnExecute = AConfListadoPackingListExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ADistribuir: TAction
      Category = 'Procesos'
      Caption = 'Distribuir bultos'
      Hint = 'Distribuir bultos'
      ImageIndex = 97
      OnExecute = ADistribuirExecute
    end
    object AConfEtiquetaPackingList: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n Etiqueta'
      ImageIndex = 77
      OnExecute = AConfEtiquetaPackingListExecute
    end
    object ABorrarBultosVacios: TAction
      Category = 'Procesos'
      Caption = 'Borrar Bultos Vacios'
      Hint = 'Borrar Bultos Vacios'
      ImageIndex = 29
      OnExecute = ABorrarBultosVaciosExecute
    end
    object AAgregarArticulosSinControlStock: TAction
      Category = 'Procesos'
      Caption = 'Agregar Articulos sin Control de Stock'
      Hint = 'Agregar Articulos sin Control de Stock'
      ImageIndex = 49
      OnExecute = AAgregarArticulosSinControlStockExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFTipoBultoDefecto.Text')
    Left = 688
    Top = 2
  end
  object ALPackingList: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 724
    object ATraspasarUds: TAction
      Caption = 'Traspasar unidades'
      Hint = 'Traspasar unidades a otro bulto'
      ImageIndex = 16
      OnExecute = ATraspasarUdsExecute
    end
    object ATraspasarTodasUds: TAction
      Caption = 'Traspasar todas las unidades'
      Hint = 'Traspasar todas las unidades a otro bulto'
      ImageIndex = 25
      Visible = False
      OnExecute = ATraspasarTodasUdsExecute
    end
    object ATraspasarBulto: TAction
      Caption = 'Mover el bulto dentro de otro.'
      Hint = 'Mover el bulto dentro de otro.'
      ImageIndex = 96
      OnExecute = ATraspasarBultoExecute
    end
    object ABorrarBulto: TAction
      Caption = 'Borrar bulto'
      Hint = 'Borra bulto'
      ImageIndex = 20
      OnExecute = ABorrarBultoExecute
    end
    object ASubirOrdenBulto: TAction
      Caption = 'Subir orden del bulto'
      Hint = 'Subir orden del bulto'
      ImageIndex = 53
      OnExecute = ASubirOrdenBultoExecute
    end
    object ABajarOrdenBulto: TAction
      Caption = 'Bajar orden del bulto'
      Hint = 'Bajar orden del bulto'
      ImageIndex = 52
      OnExecute = ABajarOrdenBultoExecute
    end
    object ACambiarNumBultoIni: TAction
      Caption = 'Cambiar n'#250'mero bulto inicial'
      Hint = 'Cambiar n'#250'mero bulto inicial'
      ImageIndex = 122
      OnExecute = ACambiarNumBultoIniExecute
    end
    object AAgrupar: TAction
      Caption = 'Agrupar bulto'
      Hint = 'Agrupar bulto con otro en su mismo nivel'
      ImageIndex = 10
      Visible = False
      OnExecute = AAgruparExecute
    end
    object AInsertarBulto: TAction
      Caption = 'Insertar Bulto'
      Hint = 'Insertar Bulto'
      ImageIndex = 90
      OnExecute = AInsertarBultoExecute
    end
    object AGenerarSSCC: TAction
      Caption = 'Generar SSCC'
      Hint = 'Generar SSCC para este bulto'
      ImageIndex = 38
      OnExecute = AGenerarSSCCExecute
    end
    object ADividirEnBultos: TAction
      Caption = 'Dividir En Bultos'
      Hint = 'Dividir la linea en bultos'
      ImageIndex = 96
      OnExecute = ADividirEnBultosExecute
    end
    object ACrearBultos: TAction
      Caption = 'Crear Bultos'
      Hint = 'Crear masivamente bultos'
      ImageIndex = 90
      OnExecute = ACrearBultosExecute
    end
    object ABorrarLinea: TAction
      Caption = 'Borrar Linea'
      Hint = 'Borrar Linea del Packing List'
      ImageIndex = 27
      OnExecute = ABorrarLineaExecute
    end
  end
  object CEDetalle: TControlEdit
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 544
    Top = 272
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 584
    Top = 272
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
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
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
