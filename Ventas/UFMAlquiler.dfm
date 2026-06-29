inherited FMAlquiler: TFMAlquiler
  Left = 474
  Top = 182
  Width = 966
  Height = 577
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Alquiler / Cuotas'
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 956
    Height = 273
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 952
      inherited NavMain: THYMNavigator
        DataSource = DMAlquiler.DSQMAqluiler
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Visible = True
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Visible = True
        Left = 314
        Hint = 'Refresca datos'
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 630
      Height = 243
      inherited TSFicha: TTabSheet
        object SBAPedido: TSpeedButton [0]
          Left = 103
          Top = 52
          Width = 127
          Height = 19
          Hint = 'Ir a pedido asociado al alquiler'
          GroupIndex = -1
          Caption = 'Ver Pedido'
          OnDblClick = SBAPedidoDblClick
        end
        object SBAAlbaran: TSpeedButton [1]
          Left = 101
          Top = 95
          Width = 124
          Height = 22
          Hint = 'Ir al albaran asociado al pedido'
          GroupIndex = -1
          Caption = 'Ver Albaran'
          OnDblClick = SBAAlbaranDblClick
        end
        inherited PEdit: TLFPanel
          Width = 622
          Height = 215
          inherited G2KTableLoc: TG2KTBLoc
            Left = 104
            Plan.Strings = (
              
                'PLAN SORT (JOIN (VER_CABECERAS_PEDIDO CAB INDEX (GES_CABECERAS_S' +
                '_IDX2),'
              
                '                 VER_CABECERAS_PEDIDO PED INDEX (GES_CABECERAS_S' +
                '_PED_ID),'
              
                '                 VER_CABECERAS_PEDIDO TER INDEX (PK_SYS_TERCEROS' +
                ')))')
            CamposADesplegar.Strings = (
              'CLIENTE'
              'NOMBRE_R_SOCIAL')
            Tabla_a_buscar = 'VER_ALQUILER'
            CampoNum = 'ID_ALQ'
            CampoStr = 'PEDIDO'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID_ALQ')
          end
          object LPedidoAlbaranDeposito: TLFLabel
            Left = 0
            Top = 0
            Width = 622
            Height = 13
            Align = alTop
            Caption = 'Pedidos / Alb. Deposito'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LAlquiler: TLFLabel
            Left = 63
            Top = 27
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alquiler'
            FocusControl = DBEAlquiler
          end
          object LPedido: TLFLabel
            Left = 64
            Top = 49
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pedido'
            FocusControl = DBEPedido
          end
          object LEstadoPedido: TLFLabel
            Left = 28
            Top = 93
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado Pedido'
            FocusControl = DBEEstadoPedido
          end
          object LAlbaran: TLFLabel
            Left = 61
            Top = 115
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Albaran'
            FocusControl = DBEAlbaran
          end
          object LEstadoAlbaran: TLFLabel
            Left = 25
            Top = 137
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado Albaran'
            FocusControl = DBEEstadoAlbaran
          end
          object LUnidadesSerializadas: TLFLabel
            Left = 16
            Top = 159
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Serializadas'
            FocusControl = DBEUnidadesSerializadas
          end
          object LFechaUltimaCuota: TLFLabel
            Left = 21
            Top = 181
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Final Alq.'
            FocusControl = DBEUnidadesSerializadas
          end
          object LAlmacenDeposito: TLFLabel
            Left = 11
            Top = 72
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almacen Deposito'
            FocusControl = DBEFAlmacenDeposito
          end
          object LFechaProximaCuota: TLFLabel
            Left = 228
            Top = 181
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Prox. Cuota'
            FocusControl = DBEUnidadesSerializadas
          end
          object LUnidadesPorSerializar: TLabel
            Left = 176
            Top = 159
            Width = 111
            Height = 13
            Caption = 'Faltan %d unidades'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBEAlquiler: TLFDbedit
            Left = 103
            Top = 24
            Width = 64
            Height = 21
            DataField = 'ID_ALQ'
            DataSource = DMAlquiler.DSQMAqluiler
            TabOrder = 0
            OnChange = DBEAlquilerChange
          end
          object DBEPedido: TLFDbedit
            Left = 103
            Top = 46
            Width = 130
            Height = 21
            Color = clAqua
            DataField = 'PEDIDO'
            DataSource = DMAlquiler.DSQMAqluiler
            TabOrder = 1
          end
          object DBEEstadoPedido: TLFDbedit
            Left = 103
            Top = 90
            Width = 64
            Height = 21
            DataField = 'ESTADO_PEDIDO'
            DataSource = DMAlquiler.DSQMAqluiler
            TabOrder = 4
          end
          object DBEAlbaran: TLFDbedit
            Left = 103
            Top = 112
            Width = 130
            Height = 21
            Color = clAqua
            DataField = 'ALBARAN'
            DataSource = DMAlquiler.DSQMAqluiler
            TabOrder = 5
          end
          object DBEEstadoAlbaran: TLFDbedit
            Left = 103
            Top = 134
            Width = 64
            Height = 21
            DataField = 'ESTADO_ALBARAN'
            DataSource = DMAlquiler.DSQMAqluiler
            TabOrder = 6
          end
          object DBETituloCliente: TLFDbedit
            Left = 234
            Top = 46
            Width = 375
            Height = 21
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = DMAlquiler.DSQMAqluiler
            Enabled = False
            TabOrder = 2
          end
          object DBEUnidadesSerializadas: TLFDbedit
            Left = 103
            Top = 156
            Width = 64
            Height = 21
            DataField = 'UNIDADES_SERIALIZADAS'
            DataSource = DMAlquiler.DSQMAqluiler
            TabOrder = 7
          end
          object DBDEFechaUltimaCuota: TLFDBDateEdit
            Left = 103
            Top = 178
            Width = 122
            Height = 21
            DataField = 'FECHA_FIN_CUOTA'
            DataSource = DMAlquiler.DSQMAqluiler
            ReadOnly = True
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 8
          end
          object DBEFAlmacenDeposito: TLFDBEditFind2000
            Left = 103
            Top = 68
            Width = 64
            Height = 21
            DataField = 'ALMACEN_DEPOSITO'
            DataSource = DMAlquiler.DSQMAqluiler
            TabOrder = 3
            OnChange = DBEFAlmacenDepositoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'AL_TITULO'
            CondicionBusqueda = 'TIPO = '#39'D'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EAlmacenDeposito: TLFEdit
            Left = 168
            Top = 68
            Width = 265
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 9
            Text = 'EAlmacenDeposito'
          end
          object DBEFechaProximaCuota: TLFDBDateEdit
            Left = 312
            Top = 178
            Width = 122
            Height = 21
            DataField = 'FECHA_PROX_CUOTA'
            DataSource = DMAlquiler.DSQMAqluiler
            ReadOnly = True
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 622
          Height = 215
          DataSource = DMAlquiler.DSQMAqluiler
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ReadOnly = True
          CamposAOrdenar.Strings = (
            'ALBARAN'
            'ALMACEN_DEPOSITO'
            'CLIENTE'
            'ESTADO_ALBARAN'
            'ESTADO_PEDIDO'
            'FECHA_FIN_CUOTA'
            'ID_ALQ'
            'NOMBRE_R_SOCIAL'
            'PEDIDO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ALQ'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PEDIDO'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_PEDIDO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALBARAN'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_ALBARAN'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_DEPOSITO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES_SERIALIZADAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN_CUOTA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PROX_CUOTA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end>
        end
      end
    end
    object PNLNrosSerie: TLFPanel
      Left = 632
      Top = 28
      Width = 322
      Height = 243
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object DBGNroSerieActivo: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 322
        Height = 221
        Align = alClient
        DataSource = DMAlquiler.DSTmpNroSerie
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
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
        Transaction = DMAlquiler.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'SELECCIONADO')
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
            Color = clInfoBk
            Expanded = False
            FieldName = 'ALMACEN'
            ReadOnly = True
            Width = 33
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
            FieldName = 'NSERIE'
            ReadOnly = True
            Width = 139
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SELECCIONADO'
            Width = 21
            Visible = True
          end>
      end
      object TBNrosSerie: TLFToolBar
        Left = 0
        Top = 0
        Width = 322
        Height = 22
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object TButtGeneraDevolucion: TToolButton
          Left = 0
          Top = 0
          Action = AGeneraDevolucion
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 524
    Width = 956
  end
  object PNLDetalle: TLFPanel [2]
    Left = 0
    Top = 273
    Width = 956
    Height = 251
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PNLCuotas: TLFPanel
      Left = 0
      Top = 0
      Width = 264
      Height = 251
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object LCuotas: TLFLabel
        Left = 0
        Top = 29
        Width = 264
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Cuotas Vencidas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TBCuotas: TLFToolBar
        Left = 0
        Top = 0
        Width = 264
        Height = 29
        Caption = 'Cuotas'
        EdgeBorders = [ebBottom]
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavCuotas: THYMNavigator
          Left = 0
          Top = 2
          Width = 120
          Height = 22
          DataSource = DMAlquiler.DSCuotaDetalle
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
        object TButtSep2: TToolButton
          Left = 120
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtCuota: TToolButton
          Left = 128
          Top = 2
          Action = ACrearCuota
          ParentShowHint = False
          ShowHint = True
        end
      end
      object DBGCuotas: TDBGridFind2000
        Left = 0
        Top = 42
        Width = 264
        Height = 209
        Align = alClient
        Color = clInfoBk
        DataSource = DMAlquiler.DSCuotaDetalle
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGCuotasDrawColumnCell
        OnDblClick = DBGCuotasDblClick
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
            FieldName = 'LINEA'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IMPORTE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_DOC'
            Visible = True
          end>
      end
    end
    object PNLRevisiones: TLFPanel
      Left = 264
      Top = 0
      Width = 434
      Height = 251
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LRevisiones: TLFLabel
        Left = 0
        Top = 29
        Width = 434
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Revisiones'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TBRevisiones: TLFToolBar
        Left = 0
        Top = 0
        Width = 434
        Height = 29
        Caption = 'Cuotas'
        EdgeBorders = [ebBottom]
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavRevisiones: THYMNavigator
          Left = 0
          Top = 2
          Width = 132
          Height = 22
          DataSource = DMAlquiler.DSAlquilerRevision
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh]
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
        object TButtSep1: TToolButton
          Left = 132
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtGeneraDeposito: TToolButton
          Left = 140
          Top = 2
          Action = AGeneraDeposito
          ParentShowHint = False
          ShowHint = True
        end
        object TButtSep3: TToolButton
          Left = 163
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TButtGenerarDepositos: TToolButton
          Left = 171
          Top = 2
          Action = AGenerarDeposito
          ParentShowHint = False
          ShowHint = True
        end
      end
      object DBGRevisiones: TDBGridFind2000
        Left = 0
        Top = 42
        Width = 434
        Height = 209
        Align = alClient
        DataSource = DMAlquiler.DSAlquilerRevision
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGRevisionesDrawColumnCell
        OnDblClick = DBGRevisionesDblClick
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
          'DEVOLUCION')
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
            FieldName = 'ALBARAN'
            Width = 104
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DEVOLUCION'
            Width = 61
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_MOV_DEPOSITO'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ALMACEN_DEPOSITO'
            Width = 49
            Visible = True
          end>
      end
    end
    object PNLArticulo: TLFPanel
      Left = 698
      Top = 0
      Width = 258
      Height = 251
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object LArticulo: TLFLabel
        Left = 0
        Top = 29
        Width = 258
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'Articulos / Nros. Serie'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object TBArticulos: TLFToolBar
        Left = 0
        Top = 0
        Width = 258
        Height = 29
        Caption = 'Cuotas'
        EdgeBorders = [ebBottom]
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavNrosSerie: THYMNavigator
          Left = 0
          Top = 2
          Width = 120
          Height = 22
          DataSource = DMAlquiler.DSNrosSerie
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      object DBGNrosSerie: TDBGridFind2000
        Left = 0
        Top = 42
        Width = 258
        Height = 209
        Align = alClient
        DataSource = DMAlquiler.DSNrosSerie
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGNrosSerieDrawColumnCell
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
            Width = 47
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NSERIE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_CADUCIDAD'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_GARANTIA_CLIENTE'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_GARANTIA_PROVEEDOR'
            Width = 72
            Visible = True
          end>
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 376
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 408
    Top = 0
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 0
    object AOtros: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object AVerPedido: TAction
      Category = 'Otros'
      Caption = 'Ver Pedido'
      Hint = 'Ir a pedido asociado al alquiler'
      ImageIndex = 62
      OnExecute = AVerPedidoExecute
    end
    object AVerAlbaran: TAction
      Category = 'Otros'
      Caption = 'Ver Albaran Deposito'
      Hint = 'Ir al albaran de deposito asociado al pedido'
      ImageIndex = 60
      OnExecute = AVerAlbaranExecute
    end
    object AProcesos: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ATraspasarAlbaran: TAction
      Category = 'Procesos'
      Caption = 'Traspasar a Albaran'
      Hint = 'Traspasa el pedido a albaran'
      ImageIndex = 36
      OnExecute = ATraspasarAlbaranExecute
    end
    object ACrearCuota: TAction
      Category = 'Procesos'
      Caption = 'Crear/Ver Cuota'
      Hint = 
        'Crea cuota asociada al pedido.'#13#10'Si ya tiene cuota asociada la mu' +
        'estra.'
      ImageIndex = 42
      OnExecute = ACrearCuotaExecute
    end
    object AGeneraDeposito: TAction
      Category = 'Procesos'
      Caption = 'Genera Albaran Deposito'
      Hint = 'Genera Albaran de deposito'
      ImageIndex = 36
      OnExecute = AGeneraDepositoExecute
    end
    object AGeneraDevolucion: TAction
      Category = 'Procesos'
      Caption = 'Genera Devolucion'
      Hint = 'Crea Albaran de devolucion'
      ImageIndex = 49
      OnExecute = AGeneraDevolucionExecute
    end
    object AVerCuota: TAction
      Category = 'Otros'
      Caption = 'Ver Cuota'
      Hint = 'Muestra cuota asociada a este pedido'
      ImageIndex = 42
      OnExecute = AVerCuotaExecute
    end
    object AGenerarDeposito: TAction
      Category = 'Procesos'
      Caption = 'Generar Deposito'
      Hint = 'Genera deposito de los albaranes con deposito pendiente'
      ImageIndex = 21
      OnExecute = AGenerarDepositoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 472
    Top = 0
  end
end
