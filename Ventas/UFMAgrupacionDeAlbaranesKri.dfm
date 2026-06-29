inherited FMAgrupacionDeAlbaranesKri: TFMAgrupacionDeAlbaranesKri
  Left = 409
  Top = 191
  Width = 800
  Height = 598
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Agrupacion De Albaranes'
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 97
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        Width = 216
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 284
      end
      inherited TbuttComp: TToolButton
        Left = 292
      end
      object TButtRegenerar: TToolButton
        Left = 315
        Top = 0
        Hint = 'Refresca los datos'
        Caption = 'Regenerar'
        ImageIndex = 39
        OnClick = TButtRegenerarClick
      end
      object TBExportar: TToolButton
        Left = 338
        Top = 0
        Hint = 'Exportar a Excel'
        Caption = 'Exportar'
        ImageIndex = 36
        OnClick = TBExportarClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 67
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 778
          Height = 39
          inherited G2KTableLoc: TG2KTBLoc
            Tabla_a_buscar = 'GES_CABECERAS_S_AGRUP'
            CampoNum = 'ID_S_AG'
            CampoStr = 'INTERVALO'
            CondicionBusqueda = 'TIPO='#39'ALB'#39
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LAgrupacion: TLFLabel
            Left = 14
            Top = 12
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrupacion'
          end
          object LIntervaloAlbaranes: TLFLabel
            Left = 210
            Top = 12
            Width = 91
            Height = 13
            Alignment = taRightJustify
            Caption = 'Intervalo Albaranes'
          end
          object DBAgrupacion: TLFDbedit
            Left = 72
            Top = 8
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'ID_S_AG'
            DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
            TabOrder = 0
          end
          object DBEIntervaloAlbaranes: TLFDbedit
            Left = 305
            Top = 8
            Width = 472
            Height = 21
            Color = clInfoBk
            DataField = 'INTERVALO'
            DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 39
          DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
          CamposAMarcar.Strings = (
            'TAREA_1'
            'TAREA_10'
            'TAREA_2'
            'TAREA_3'
            'TAREA_4'
            'TAREA_5'
            'TAREA_6'
            'TAREA_7'
            'TAREA_8'
            'TAREA_9')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_S_AG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_4'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_5'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_6'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_7'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_8'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_9'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INTERVALO'
              Visible = True
            end>
        end
      end
      object TSPackingList: TTabSheet
        Caption = 'Packing List'
        ImageIndex = 2
        OnShow = TSPackingListShow
        object DBGPackingList: TDBGridFind2000
          Left = 0
          Top = 21
          Width = 778
          Height = 18
          Align = alClient
          DataSource = DMAgrupacionDeAlbaranesKri.DSxPackingList
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
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ARTICULO'
              ReadOnly = True
              Width = 101
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PEDIDO'
              ReadOnly = True
              Width = 82
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COLOR'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PATRON'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CAJA'
              ReadOnly = True
              Width = 150
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ALMACEN'
              ReadOnly = True
              Width = 34
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIENDA'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T01'
              ReadOnly = True
              Width = 21
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T02'
              ReadOnly = True
              Width = 23
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T03'
              ReadOnly = True
              Width = 22
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T04'
              ReadOnly = True
              Width = 23
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T05'
              ReadOnly = True
              Width = 25
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T06'
              ReadOnly = True
              Width = 24
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'T07'
              ReadOnly = True
              Width = 25
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'T08'
              Width = 25
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'UNID'
              ReadOnly = True
              Width = 34
              Visible = True
            end>
        end
        object DBGSeleccionaAgrupaciones: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 778
          Height = 21
          Align = alTop
          DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranesSeleccion
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
          Transaction = DMAgrupacionDeAlbaranesKri.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposNoAccesibles.Strings = (
            'TAREA_1'
            'TAREA_2'
            'TAREA_3'
            'TAREA_4'
            'TAREA_5'
            'TAREA_6'
            'TAREA_7'
            'TAREA_8'
            'TAREA_9'
            'TIPO'
            'EMPRESA'
            'CANAL')
          ColumnasCheckBoxes.Strings = (
            'TAREA_10')
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
              FieldName = 'ID_S_AG'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'INTERVALO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_10'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 545
    Width = 790
  end
  inherited PDetalle: TLFPanel [2]
    Top = 97
    Width = 790
    Height = 448
    inherited TBDetalle: TLFToolBar
      Width = 790
      inherited NavDetalle: THYMNavigator
        Width = 210
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 210
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBSeleccionarTodos: TToolButton
        Left = 218
        Top = 0
        Caption = 'Seleccionar Todos'
        ImageIndex = 146
        OnClick = TBSeleccionarTodosClick
      end
      object TBDeseleccionar: TToolButton
        Left = 241
        Top = 0
        Caption = 'Deseleccionar'
        ImageIndex = 147
        OnClick = TBDeseleccionarClick
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Left = 210
      Width = 579
      Height = 351
      Align = alCustom
      DataSource = DMAgrupacionDeAlbaranesKri.DSQCabecerasAlbaran
      PopupMenu = nil
      AutoPostEnCheckBox = True
      ColumnasCheckBoxes.Strings = (
        'ENTRADA_AGRUP')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      Columns = <
        item
          Expanded = False
          FieldName = 'ENTRADA_AGRUP'
          Width = 26
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
          FieldName = 'RIG'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ALMACEN'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA'
          ReadOnly = True
          Width = 80
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
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SU_REFERENCIA'
          ReadOnly = True
          Width = 200
          Visible = True
        end>
    end
    object PNLTareas: TLFPanel
      Left = 0
      Top = 22
      Width = 209
      Height = 426
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object DBCBAlbaran: TLFDBCheckBox
        Left = 48
        Top = 16
        Width = 160
        Height = 17
        Caption = 'Impresi'#243'n de Albaranes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_1'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCBPackingList: TLFDBCheckBox
        Left = 48
        Top = 57
        Width = 160
        Height = 17
        Caption = 'Packing List'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_2'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCBPackingListTotal: TLFDBCheckBox
        Left = 48
        Top = 98
        Width = 160
        Height = 17
        Caption = 'Packing List Total'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_3'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCBEtiquetasEnvio: TLFDBCheckBox
        Left = 48
        Top = 140
        Width = 160
        Height = 17
        Caption = 'Etiquetas de Envio'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_4'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCBTraspasaAFactura: TLFDBCheckBox
        Left = 48
        Top = 181
        Width = 160
        Height = 17
        Caption = 'Traspasa A Factura'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_5'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCBImprimeFactura: TLFDBCheckBox
        Left = 48
        Top = 222
        Width = 160
        Height = 17
        Caption = 'Impresi'#243'n de Facturas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_6'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCBRelacionCartaPortes: TLFDBCheckBox
        Left = 48
        Top = 264
        Width = 160
        Height = 17
        Caption = 'Relacion Carta de Portes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_7'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCBFacturacionCanarias: TLFDBCheckBox
        Left = 48
        Top = 343
        Width = 160
        Height = 17
        Caption = 'DBCBFacturacionCanarias'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 7
        TabStop = True
        Visible = False
        Alignment = taLeftJustify
        DataField = 'TAREA_9'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object CHBPrevisualizarEtiqueta: TLFCheckBox
        Left = 64
        Top = 157
        Width = 140
        Height = 17
        Caption = 'Previsualizar Etiqueta'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 8
        TabStop = True
        Alignment = taLeftJustify
      end
      object CHBPrevisualizarCartaPortes: TLFCheckBox
        Left = 64
        Top = 281
        Width = 140
        Height = 17
        Caption = 'Previsualizar C. de Portes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 9
        TabStop = True
        Alignment = taLeftJustify
      end
      object BImprimirAlbaranes: TButton
        Left = 7
        Top = 12
        Width = 26
        Height = 25
        Caption = '>'
        TabOrder = 10
        OnClick = BImprimirAlbaranesClick
      end
      object BPackingList: TButton
        Left = 7
        Top = 53
        Width = 27
        Height = 25
        Caption = '>'
        TabOrder = 11
        OnClick = BPackingListClick
      end
      object BPackingListTotal: TButton
        Left = 7
        Top = 94
        Width = 27
        Height = 25
        Caption = '>'
        TabOrder = 12
        OnClick = BPackingListTotalClick
      end
      object BEtiquetasEnvio: TButton
        Left = 7
        Top = 136
        Width = 27
        Height = 25
        Caption = '>'
        TabOrder = 13
        OnClick = BEtiquetasEnvioClick
      end
      object BTraspasaAFactura: TButton
        Left = 7
        Top = 177
        Width = 27
        Height = 25
        Caption = '>'
        TabOrder = 14
        OnClick = BTraspasaAFacturaClick
      end
      object BImpresionFacturas: TButton
        Left = 7
        Top = 218
        Width = 27
        Height = 25
        Caption = '>'
        TabOrder = 15
        OnClick = BImpresionFacturasClick
      end
      object BCartaRelacionPortes: TButton
        Left = 7
        Top = 260
        Width = 27
        Height = 25
        Caption = '>'
        TabOrder = 16
        OnClick = BCartaRelacionPortesClick
      end
      object CHBPrevisualizarAlbaran: TLFCheckBox
        Left = 64
        Top = 33
        Width = 140
        Height = 17
        Caption = 'Previsualizar Albaran'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 17
        TabStop = True
        Alignment = taLeftJustify
      end
      object CHBPrevisualizarFactura: TLFCheckBox
        Left = 64
        Top = 237
        Width = 140
        Height = 17
        Caption = 'Previsualizar Factura'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 18
        TabStop = True
        Alignment = taLeftJustify
      end
      object DBEEtiquetasSEUR: TLFDBCheckBox
        Left = 48
        Top = 303
        Width = 160
        Height = 17
        Caption = 'Etiquetas SEUR'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 19
        TabStop = True
        Alignment = taLeftJustify
        DataField = 'TAREA_8'
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object BEtiquetasSEUR: TButton
        Left = 7
        Top = 300
        Width = 27
        Height = 25
        Caption = '>'
        TabOrder = 20
        OnClick = BEtiquetasSEURClick
      end
      object CHBPrevisualizarEtiquetaSEUR: TLFCheckBox
        Left = 64
        Top = 319
        Width = 140
        Height = 17
        Caption = 'Previsualizar Etiqueta'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 21
        TabStop = True
        Alignment = taLeftJustify
      end
      object PNLCorteIgles: TLFPanel
        Left = 0
        Top = 369
        Width = 209
        Height = 57
        Align = alBottom
        TabOrder = 22
        object LPalets: TLFLabel
          Left = 40
          Top = 8
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Palets'
        end
        object LSeparador: TLFLabel
          Left = 127
          Top = 7
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Sep.'
        end
        object LNroProveedor: TLFLabel
          Left = 21
          Top = 30
          Width = 48
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nro. Prov.'
        end
        object BEportarCSV: TButton
          Left = 7
          Top = 4
          Width = 26
          Height = 25
          Hint = 'Exportar CSV El Corte Ingles'
          Caption = '>'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = BEportarCSVClick
        end
        object EPalets: TLFEdit
          Left = 72
          Top = 5
          Width = 49
          Height = 21
          TabOrder = 1
        end
        object ESeparador: TLFEdit
          Left = 152
          Top = 4
          Width = 49
          Height = 21
          TabOrder = 2
          Text = ';'
        end
        object ENroProveedor: TLFEdit
          Left = 72
          Top = 27
          Width = 129
          Height = 21
          TabOrder = 3
        end
      end
    end
    object PNLDireccion: TLFPanel
      Left = 210
      Top = 375
      Width = 578
      Height = 71
      Anchors = [akLeft, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 3
      object DBEDirBloqEscx: TLFDbedit
        Left = 266
        Top = 3
        Width = 51
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'DIR_BLOQUE_ESCALERA'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        TabOrder = 0
      end
      object DBEDirPisox: TLFDbedit
        Left = 318
        Top = 3
        Width = 34
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'DIR_PISO'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        TabOrder = 1
      end
      object DBEDirPuerta: TLFDbedit
        Left = 353
        Top = 3
        Width = 44
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        DataField = 'DIR_PUERTA'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        TabOrder = 2
      end
      object DBELocalidadNombre: TLFDbedit
        Left = 80
        Top = 25
        Width = 185
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO_LOCALIDAD'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object DBECpostal: TLFDbedit
        Left = 266
        Top = 25
        Width = 131
        Height = 21
        Color = clInfoBk
        DataField = 'CODIGO_POSTAL'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object DBEProvincia: TLFDbedit
        Left = 2
        Top = 47
        Width = 149
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO_PROVINCIA'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBEPais: TLFDbedit
        Left = 152
        Top = 47
        Width = 245
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO_PAIS'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEDirTipo: TLFDbedit
        Left = 2
        Top = 3
        Width = 29
        Height = 21
        Color = clInfoBk
        DataField = 'DIR_TIPO'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        TabOrder = 7
      end
      object DBEDireccion: TLFDbedit
        Left = 32
        Top = 3
        Width = 188
        Height = 21
        Color = clInfoBk
        DataField = 'DIR_NOMBRE'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        TabOrder = 8
      end
      object DBEDirNumero: TLFDbedit
        Left = 221
        Top = 3
        Width = 44
        Height = 21
        Color = clInfoBk
        DataField = 'DIR_NUMERO'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        TabOrder = 9
      end
      object DBELocalidad: TLFDbedit
        Left = 2
        Top = 25
        Width = 77
        Height = 21
        Color = clInfoBk
        DataField = 'LOCALIDAD'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        TabOrder = 10
      end
      object DBETelefono01: TLFDbedit
        Left = 402
        Top = 2
        Width = 131
        Height = 21
        Color = clInfoBk
        DataField = 'DIR_TELEFONO01'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 11
      end
      object DBETelefono02: TLFDbedit
        Left = 402
        Top = 24
        Width = 131
        Height = 21
        Color = clInfoBk
        DataField = 'DIR_TELEFONO02'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 12
      end
      object DBETelefax: TLFDbedit
        Left = 402
        Top = 46
        Width = 131
        Height = 21
        Color = clInfoBk
        DataField = 'DIR_TELEFAX'
        DataSource = DMAgrupacionDeAlbaranesKri.DSxDireccion
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 13
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 480
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 436
    Top = 4
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 29
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EPalets.Text'
      'ENroProveedor.Text'
      'ESeparador.Text')
    Left = 480
    Top = 29
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    inherited CEDetalleMiinsert: TMenuItem
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      Visible = False
    end
    inherited CEDetalleMipost: TMenuItem
      Visible = False
    end
  end
end
