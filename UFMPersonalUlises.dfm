object FMPersonalUlises: TFMPersonalUlises
  Left = 321
  Top = 236
  Width = 811
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize]
  BorderWidth = 1
  Caption = 'Personal Ulises'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PopupMenu = CEPeticionRespuestaPMEdit
  Position = poDefaultPosOnly
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 801
    Height = 447
    Align = alClient
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 2
      Top = 2
      Width = 797
      Height = 26
      AutoSize = True
      BorderWidth = 1
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      Separators = True
      object TButtConectar: TToolButton
        Left = 0
        Top = 0
        Caption = 'Conectar'
        ImageIndex = 0
        OnClick = TButtConectarClick
      end
      object TButtDesconectar: TToolButton
        Left = 23
        Top = 0
        Caption = 'Desconectar'
        ImageIndex = 1
        OnClick = TButtDesconectarClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 797
      Height = 417
      ActivePage = TSFicha
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = '&Ficha'
        object PEdit: TLFPanel
          Left = 0
          Top = 0
          Width = 789
          Height = 389
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 0
          DesignSize = (
            789
            389)
          object G2KTableLoc: TG2KTBLoc
            Left = 64
            Top = 40
            Hint = 'Localizar'
            ImageIndex = 81
            Filtros = []
          end
          object LConnectionString: TLFLabel
            Left = 19
            Top = 12
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'ConnectionString'
          end
          object LDefaultDataBase: TLFLabel
            Left = 19
            Top = 36
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'DefaultDataBase'
          end
          object LAlmacenInteligente: TLFLabel
            Left = 7
            Top = 60
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen Inteligente'
          end
          object EConnectionString: TLFEdit
            Left = 104
            Top = 8
            Width = 680
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object EDefaultDataBase: TLFEdit
            Left = 104
            Top = 32
            Width = 680
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
          object EAlmacenInteligente: TLFEdit
            Left = 104
            Top = 56
            Width = 65
            Height = 21
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 2
            OnChange = EAlmacenInteligenteChange
          end
          object ETituloAlmacenInteligente: TLFEdit
            Left = 170
            Top = 56
            Width = 614
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      object TSTabla: TTabSheet
        Caption = '&Tabla'
        ImageIndex = 1
        object DBGMain: THYTDBGrid
          Left = 0
          Top = 0
          Width = 789
          Height = 389
          Align = alClient
          Color = clInfoBk
          DataSource = DMPersonalUlises.DSQPrueba
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = False
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
        end
      end
      object TSPeticionReposicion: TTabSheet
        Caption = 'Peticion Repo.'
        ImageIndex = 2
        object PCPeticionReposicion: TLFPageControl
          Left = 0
          Top = 0
          Width = 789
          Height = 389
          ActivePage = TSPeticion
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSPeticion: TTabSheet
            Caption = 'Peticion'
            OnHide = TSPeticionHide
            OnShow = TSPeticionShow
            object TBPeticionReposicion: TLFToolBar
              Left = 0
              Top = 0
              Width = 781
              Height = 29
              EdgeInner = esNone
              EdgeOuter = esNone
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavPeticionRepocicion: THYMNavigator
                Left = 0
                Top = 2
                Width = 240
                Height = 22
                DataSource = DMPersonalUlises.DSQMPeticRepo
                ParentShowHint = False
                PopupMenu = CEPeticionRepocicionPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                Exclusivo = True
                ControlEdit = CEPeticionRepocicion
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton1: TToolButton
                Left = 240
                Top = 2
                Width = 8
                Style = tbsSeparator
              end
              object TButtRegenerarPeticionReposicion: TToolButton
                Left = 248
                Top = 2
                Action = ARegenerarPeticionReposicion
              end
              object TButtServirReposicion: TToolButton
                Left = 271
                Top = 2
                Action = AServirReposicion
              end
              object ToolButton4: TToolButton
                Left = 294
                Top = 2
                Width = 8
                Style = tbsSeparator
              end
              object LAlmacenOrigen: TLFLabel
                Left = 302
                Top = 2
                Width = 80
                Height = 22
                Alignment = taRightJustify
                Caption = 'Almacen Orig.'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                Layout = tlCenter
              end
              object EFAlmacenOrigen: TLFEditFind2000
                Left = 382
                Top = 2
                Width = 51
                Height = 22
                TabOrder = 1
                OnChange = EFAlmacenOrigenChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'ALMACEN'
                CampoStr = 'TITULO'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'ART_ALMACENES'
                Tabla_asociada.DesplegarBusqueda = False
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object ETituloAlmacen: TLFEdit
                Left = 433
                Top = 2
                Width = 176
                Height = 22
                Color = clInfoBk
                Enabled = False
                TabOrder = 2
              end
            end
            object DBGFPeticionReposicion: TDBGridFind2000
              Left = 0
              Top = 29
              Width = 781
              Height = 332
              Align = alClient
              DataSource = DMPersonalUlises.DSQMPeticRepo
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
                'ARTICULO'
                'CANTIDAD'
                'DOCUMENTO'
                'LINEA'
                'LOTE')
              ColumnasCheckBoxes.Strings = (
                'ENTRADA'
                'ENVIADO')
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
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TIPO_ENTRADA'
                  ReadOnly = True
                  Width = 38
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'N3'
                  ReadOnly = True
                  Width = 74
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOCUMENTO'
                  ReadOnly = True
                  Width = 115
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA'
                  ReadOnly = True
                  Width = 36
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ARTICULO'
                  ReadOnly = True
                  Width = 105
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'CANTIDAD'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_ENVIAR'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTRADA'
                  Width = 34
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LOTE'
                  Width = 97
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'STOCK'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ENVIADO'
                  ReadOnly = True
                  Width = 45
                  Visible = True
                end>
            end
          end
          object TSRespuestaPeticion: TTabSheet
            Caption = 'Respuesta'
            ImageIndex = 1
            OnHide = TSRespuestaPeticionHide
            OnShow = TSRespuestaPeticionShow
            object TBPeticionRespuesta: TLFToolBar
              Left = 0
              Top = 0
              Width = 781
              Height = 29
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavPeticionRespuesta: THYMNavigator
                Left = 0
                Top = 2
                Width = 240
                Height = 22
                DataSource = DMPersonalUlises.DSQMPeticRepoResp
                ParentShowHint = False
                PopupMenu = CEPeticionRespuestaPMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                Exclusivo = True
                ControlEdit = CEPeticionRespuesta
                OrdenAscendente = True
                InsertaUltimo = False
              end
              object ToolButton5: TToolButton
                Left = 240
                Top = 2
                Width = 8
                Style = tbsSeparator
              end
              object TButtRefrescaPeticionRepoRespuesta: TToolButton
                Left = 248
                Top = 2
                Action = ARefrescaPeticionRepoRespuesta
              end
              object TButtGeneraMovimientos: TToolButton
                Left = 271
                Top = 2
                Action = AGeneraMovimientosPeticionRepo
              end
            end
            object DBGPeticionRespuesta: TDBGridFind2000
              Left = 0
              Top = 29
              Width = 781
              Height = 332
              Align = alClient
              DataSource = DMPersonalUlises.DSQMPeticRepoResp
              TabOrder = 1
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
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
              Transaction = DMPersonalUlises.TLocal
              BuscarNums = False
              Campos.Strings = (
                'ALMACEN')
              CamposAMostrar.Strings = (
                'ALMACEN'
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
                'ARTICULO'
                'CANTIDAD'
                'DOCUMENTO'
                'LINEA'
                'LOTE')
              ColumnasCheckBoxes.Strings = (
                'ENTRADA')
              ColumnasChecked.Strings = (
                '1')
              ColumnasNoChecked.Strings = (
                '0')
              MensajeNoExiste = False
              Numericos.Strings = (
                'ALMACEN')
              SalirSiVacio = False
              SalirSiNoExiste = False
              Tablas.Strings = (
                'ART_ALMACENES')
              Acciones.Strings = (
                '')
              Titulos.Strings = (
                'TITULO')
              Posicion = tpCentrado
              Planes.Strings = (
                '')
              OrdenMultiple = True
              OrdenadosPor.Strings = (
                'ALMACEN')
              Filtros = [obEmpresa]
              Entorno = DMMain.EntornoBusqueda
              Columns = <
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'TIPO_ENTRADA'
                  ReadOnly = True
                  Width = 38
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'N3'
                  ReadOnly = True
                  Width = 74
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'DOCUMENTO'
                  ReadOnly = True
                  Width = 115
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LINEA'
                  ReadOnly = True
                  Width = 36
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'ARTICULO'
                  ReadOnly = True
                  Width = 105
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'CANTIDAD'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'CANTIDAD_ENTRADA'
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'LOTE'
                  ReadOnly = True
                  Width = 97
                  Visible = True
                end
                item
                  Color = clInfoBk
                  Expanded = False
                  FieldName = 'STOCK'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ALMACEN'
                  Width = 40
                  Visible = True
                end>
            end
          end
        end
      end
      object TSPedidos: TTabSheet
        Caption = 'Pedidos'
        ImageIndex = 3
        OnHide = TSPedidosHide
        OnShow = TSPedidosShow
        object PNLPedidos: TLFPanel
          Left = 0
          Top = 29
          Width = 789
          Height = 360
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGFPedidos: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 789
            Height = 216
            Align = alTop
            DataSource = DMPersonalUlises.DSQPUlisesCab
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
              'CLIENTE'
              'EJERCICIO'
              'FECHA'
              'FORMA_PAGO'
              'LIQUIDO'
              'RIG'
              'SERIE'
              'SU_REFERENCIA'
              'TITULO')
            ColumnasCheckBoxes.Strings = (
              'ENVIADO'
              'PROCESAR')
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
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'PROCESAR'
                Width = 47
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ENVIADO'
                ReadOnly = True
                Width = 23
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Width = 53
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO'
                ReadOnly = True
                Width = 29
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CLIENTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SU_REFERENCIA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORMA_PAGO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO'
                ReadOnly = True
                Visible = True
              end>
          end
          object PNLPedidosDetalle: TLFPanel
            Left = 0
            Top = 216
            Width = 789
            Height = 144
            Align = alClient
            TabOrder = 1
            object TBPedidosDetalle: TLFToolBar
              Left = 1
              Top = 1
              Width = 787
              Height = 29
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object NavPedidosDetalle: THYMNavigator
                Left = 0
                Top = 2
                Width = 240
                Height = 22
                DataSource = DMPersonalUlises.DSQMDetalle
                ParentShowHint = False
                PopupMenu = CEPedidosDetallePMEdit
                ShowHint = True
                TabOrder = 0
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                Exclusivo = True
                ControlEdit = CEPedidosDetalle
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
            object DBGPedidosDetalle: THYTDBGrid
              Left = 1
              Top = 30
              Width = 787
              Height = 113
              Align = alClient
              Color = clInfoBk
              DataSource = DMPersonalUlises.DSQMDetalle
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 1
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
              AutoDeseleccionar = True
              ControlEdit = CEPedidosDetalle
              TabFicha = TSFicha
              PermutaPaneles = True
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'ORDEN'
                  Width = 31
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ARTICULO'
                  Width = 81
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 328
                  Visible = True
                end
                item
                  Color = clMoneyGreen
                  Expanded = False
                  FieldName = 'CANTIDAD'
                  ReadOnly = True
                  Visible = True
                end
                item
                  Color = clMoneyGreen
                  Expanded = False
                  FieldName = 'CANTIDAD_CONFIRMADA'
                  ReadOnly = True
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
                  FieldName = 'UNIDADES_SERVIDAS'
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'UNIDADES_PENDIENTES'
                  Width = 57
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'SERVIDO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'PRECIO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_2'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'DESCUENTO_3'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'B_DTO_LINEA'
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'LIQUIDO'
                  Visible = True
                end>
            end
          end
        end
        object TBPedidos: TLFToolBar
          Left = 0
          Top = 0
          Width = 789
          Height = 29
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavPedidos: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMPersonalUlises.DSQPUlisesCab
            ParentShowHint = False
            PopupMenu = CEPedidosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEPedidos
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton2: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtEnviarPedidos: TToolButton
            Left = 248
            Top = 2
            Action = AEnviarPedidos
          end
        end
      end
      object TSPedidosServidos: TTabSheet
        Caption = 'Pedidos &Servidos'
        OnHide = TSPedidosServidosHide
        OnShow = TSPedidosServidosShow
        object PNLPedidosServidos: TLFPanel
          Left = 0
          Top = 0
          Width = 789
          Height = 248
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBPedidosServidos: TLFToolBar
            Left = 0
            Top = 0
            Width = 789
            Height = 29
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavPedidosServidos: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMPersonalUlises.DSQPUlisesCabServ
              ParentShowHint = False
              PopupMenu = CEPedidosServidosPMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CEPedidosServidos
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton3: TToolButton
              Left = 240
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object TButtRefrescarPedidosServ: TToolButton
              Left = 248
              Top = 2
              Action = ARefrescarPedidosServ
            end
            object TButtGenerarAlbaranes: TToolButton
              Left = 271
              Top = 2
              Action = AGenerarAlbaranes
            end
          end
          object DBGFPedidosServidos: TDBGridFind2000
            Left = 0
            Top = 29
            Width = 789
            Height = 219
            Align = alClient
            DataSource = DMPersonalUlises.DSQPUlisesCabServ
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
              'BULTOS_SERVIDOS'
              'CLIENTE'
              'FECHA'
              'FECHA_CREACION'
              'FECHA_SERVICIO'
              'FORMA_PAGO'
              'KILOS'
              'LIQUIDO'
              'RIG'
              'SERIE'
              'SU_REFERENCIA'
              'TIPO'
              'TITULO')
            ColumnasCheckBoxes.Strings = (
              'PROCESAR')
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
                FieldName = 'PROCESAR'
                Width = 47
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CLIENTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SU_REFERENCIA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FORMA_PAGO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_SERVICIO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'BULTOS_SERVIDOS'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'KILOS'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_CREACION'
                ReadOnly = True
                Visible = True
              end>
          end
        end
        object PNLPedidosServidosDetalle: TLFPanel
          Left = 0
          Top = 248
          Width = 789
          Height = 141
          Align = alBottom
          TabOrder = 1
          object TBPedidosServidosDetalle: TLFToolBar
            Left = 1
            Top = 1
            Width = 787
            Height = 29
            TabOrder = 0
            Separators = True
            object NavPedidosServidosDetalle: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMPersonalUlises.DSQMDetalle
              ParentShowHint = False
              PopupMenu = CEPedidosServidosDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CEPedidosServidosDetalle
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
          object DBGPedidosServidosDetalle: THYTDBGrid
            Left = 1
            Top = 30
            Width = 787
            Height = 110
            Align = alClient
            DataSource = DMPersonalUlises.DSQMDetalle
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
            AutoDeseleccionar = True
            ControlEdit = CEPedidosServidosDetalle
            PermutaPaneles = False
            CamposAOrdenarImgs = DMMain.ILOrdGrid
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ORDEN'
                ReadOnly = True
                Width = 30
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ARTICULO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                ReadOnly = True
                Width = 303
                Visible = True
              end
              item
                Color = clMoneyGreen
                Expanded = False
                FieldName = 'CANTIDAD'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clMoneyGreen
                Expanded = False
                FieldName = 'CANTIDAD_CONFIRMADA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES_SERVIDAS'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'UNIDADES_PENDIENTES'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERVIDO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PRECIO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESCUENTO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESCUENTO_2'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESCUENTO_3'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'B_DTO_LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LIQUIDO'
                ReadOnly = True
                Visible = True
              end>
          end
        end
      end
    end
  end
  object TBActions: TLFToolBar
    Left = 0
    Top = 447
    Width = 801
    Height = 24
    Align = alBottom
    ButtonHeight = 21
    ButtonWidth = 51
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    List = True
    ShowCaptions = True
    TabOrder = 1
    ActionList = ALMain
    Separators = True
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 448
    Top = 8
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 408
    Top = 8
  end
  object LFActionList1: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 488
    Top = 8
    object ARegenerarPeticionReposicion: TAction
      Caption = 'Regenerar Peticion de Reposicion'
      Hint = 'Regenerar Peticion de Reposicion'
      ImageIndex = 39
      OnExecute = ARegenerarPeticionReposicionExecute
    end
    object AEnviarPedidos: TAction
      Caption = 'Enviar Pedidos'
      Hint = 'Enviar Pedidos'
      ImageIndex = 34
      OnExecute = AEnviarPedidosExecute
    end
    object ARefrescarPedidosServ: TAction
      Caption = 'Refrescar Pedidos Servidos'
      Hint = 'Refrescar Pedidos Servidos'
      ImageIndex = 39
      OnExecute = ARefrescarPedidosServExecute
    end
    object AGenerarAlbaranes: TAction
      Caption = 'Generar Albaranes'
      ImageIndex = 60
      OnExecute = AGenerarAlbaranesExecute
    end
    object AServirReposicion: TAction
      Caption = 'Servir Reposicion'
      Hint = 'Sirve los articulos marcados'
      ImageIndex = 43
      OnExecute = AServirReposicionExecute
    end
    object ARefrescaPeticionRepoRespuesta: TAction
      Caption = 'Refresca Respuesta Peticion Reposicion'
      Hint = 'Refresca Respuesta Peticion Reposicion'
      ImageIndex = 39
      OnExecute = ARefrescaPeticionRepoRespuestaExecute
    end
    object AGeneraMovimientosPeticionRepo: TAction
      Caption = 'Genera Movimientos de Peticion Reposicion'
      Hint = 'Genera Movimientos de Stock de la Peticion de Reposicion'
      ImageIndex = 111
      OnExecute = AGeneraMovimientosPeticionRepoExecute
    end
  end
  object CEPeticionRepocicion: TControlEdit
    DataSource = DMPersonalUlises.DSQMPeticRepo
    EnlazadoA = CEPeticionRespuesta
    SubComplementario = ALMain
    PopUpMenu = CEPeticionRepocicionPMEdit
    Teclas = DMMain.Teclas
    Left = 568
    Top = 140
  end
  object CEPeticionRepocicionPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 604
    Top = 140
    object CEPeticionRepocicionPMEditMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPeticionRepocicionPMEditMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPeticionRepocicionPMEditMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPeticionRepocicionPMEditMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPeticionRepocicionPMEditMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPeticionRepocicionPMEditMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPeticionRepocicionPMEditMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPeticionRepocicionPMEditMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPeticionRepocicionPMEditMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPeticionRepocicionPMEditMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEPeticionRepocicionPMEditMiSep: TMenuItem
      Caption = '-'
    end
    object CEPeticionRepocicionPMEditMibuscar: TMenuItem
      Caption = 'Buscar'
      Enabled = False
      ShortCut = 16450
    end
    object CEPeticionRepocicionPMEditMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
    end
    object CEPeticionRepocicionPMEditMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
    end
    object CEPeticionRepocicionPMEditMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      ShortCut = 16457
    end
    object CEPeticionRepocicionPMEditMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEPeticionRepocicionPMEditMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object CEPeticionRepocicionPMEditMicopy: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      ShortCut = 16451
    end
    object CEPeticionRepocicionPMEditMicut: TMenuItem
      Caption = 'Cortar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPeticionRepocicionPMEditMipaste: TMenuItem
      Caption = 'Pegar'
      Enabled = False
      ShortCut = 16470
    end
    object CEPeticionRepocicionPMEditMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      Enabled = False
      ShortCut = 16499
    end
    object CEPeticionRepocicionMifirst: TMenuItem
      Caption = 'Primero'
      ShortCut = 16464
    end
    object CEPeticionRepocicionMiprior: TMenuItem
      Caption = 'Anterior'
      ShortCut = 16449
    end
    object CEPeticionRepocicionMinext: TMenuItem
      Caption = 'Siguiente'
      ShortCut = 16467
    end
    object CEPeticionRepocicionMilast: TMenuItem
      Caption = #218'ltimo'
      ShortCut = 16469
    end
    object CEPeticionRepocicionMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      ShortCut = 16429
    end
    object CEPeticionRepocicionMidelete: TMenuItem
      Caption = 'Borrar'
      ShortCut = 16430
    end
    object CEPeticionRepocicionMiedit: TMenuItem
      Caption = 'Modificar'
      ShortCut = 16453
    end
    object CEPeticionRepocicionMipost: TMenuItem
      Caption = 'Grabar'
      ShortCut = 16455
    end
    object CEPeticionRepocicionMicancel: TMenuItem
      Caption = 'Cancelar'
      ShortCut = 16472
    end
    object CEPeticionRepocicionMirefresh: TMenuItem
      Caption = 'Refrescar'
      ShortCut = 16466
    end
  end
  object CEPedidos: TControlEdit
    DataSource = DMPersonalUlises.DSQPUlisesCab
    EnlazadoA = CEPedidosDetalle
    SubComplementario = ALMain
    PopUpMenu = CEPedidosPMEdit
    Teclas = DMMain.Teclas
    Left = 568
    Top = 204
  end
  object CEPedidosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 604
    Top = 204
    object CEPedidosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPedidosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPedidosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPedidosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPedidosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPedidosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPedidosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPedidosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPedidosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPedidosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEPedidosMiSep: TMenuItem
      Caption = '-'
    end
    object CEPedidosMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
    end
    object CEPedidosMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEPedidosMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEPedidosMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEPedidosMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEPedidosMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object CEPedidosMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEPedidosMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEPedidosMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEPedidosMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object CEPedidosServidos: TControlEdit
    DataSource = DMPersonalUlises.DSQPUlisesCabServ
    EnlazadoA = CEPedidosServidosDetalle
    SubComplementario = ALMain
    PopUpMenu = CEPedidosServidosPMEdit
    Teclas = DMMain.Teclas
    Left = 568
    Top = 268
  end
  object CEPedidosServidosPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 604
    Top = 268
    object CEPedidosServidosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPedidosServidosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPedidosServidosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPedidosServidosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPedidosServidosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPedidosServidosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPedidosServidosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPedidosServidosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPedidosServidosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPedidosServidosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEPedidosServidosMiSep: TMenuItem
      Caption = '-'
    end
    object CEPedidosServidosMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
    end
    object CEPedidosServidosMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEPedidosServidosMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEPedidosServidosMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEPedidosServidosMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEPedidosServidosMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object CEPedidosServidosMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEPedidosServidosMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEPedidosServidosMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEPedidosServidosMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object CEPedidosDetalle: TControlEdit
    DataSource = DMPersonalUlises.DSQMDetalle
    EnlazadoA = CEPedidosServidos
    SubComplementario = ALMain
    PopUpMenu = CEPedidosDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 568
    Top = 236
  end
  object CEPedidosDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 604
    Top = 236
    object CEPedidosDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPedidosDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPedidosDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPedidosDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPedidosDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPedidosDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPedidosDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPedidosDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPedidosDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPedidosDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEPedidosDetalleMiSep: TMenuItem
      Caption = '-'
    end
    object CEPedidosDetalleMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
    end
    object CEPedidosDetalleMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEPedidosDetalleMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEPedidosDetalleMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEPedidosDetalleMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEPedidosDetalleMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object CEPedidosDetalleMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEPedidosDetalleMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEPedidosDetalleMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEPedidosDetalleMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object CEPedidosServidosDetalle: TControlEdit
    DataSource = DMPersonalUlises.DSQMDetalle
    EnlazadoA = CEPeticionRepocicion
    SubComplementario = ALMain
    PopUpMenu = CEPedidosServidosDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 568
    Top = 300
  end
  object CEPedidosServidosDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 604
    Top = 300
    object CEPedidosServidosDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPedidosServidosDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPedidosServidosDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPedidosServidosDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPedidosServidosDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPedidosServidosDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPedidosServidosDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPedidosServidosDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPedidosServidosDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPedidosServidosDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEPedidosServidosDetalleMiSep: TMenuItem
      Caption = '-'
    end
    object CEPedidosServidosDetalleMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
    end
    object CEPedidosServidosDetalleMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEPedidosServidosDetalleMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEPedidosServidosDetalleMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEPedidosServidosDetalleMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEPedidosServidosDetalleMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
    end
    object CEPedidosServidosDetalleMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEPedidosServidosDetalleMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEPedidosServidosDetalleMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEPedidosServidosDetalleMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object CEPeticionRespuesta: TControlEdit
    DataSource = DMPersonalUlises.DSQMPeticRepo
    EnlazadoA = CEPedidos
    SubComplementario = ALMain
    PopUpMenu = CEPeticionRespuestaPMEdit
    Teclas = DMMain.Teclas
    Left = 568
    Top = 172
  end
  object CEPeticionRespuestaPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 604
    Top = 172
    object CEPeticionRespuestaMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPeticionRespuestaMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPeticionRespuestaMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPeticionRespuestaMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPeticionRespuestaMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPeticionRespuestaMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPeticionRespuestaMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPeticionRespuestaMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPeticionRespuestaMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPeticionRespuestaMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
