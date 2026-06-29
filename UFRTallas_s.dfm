object FRTallas_s: TFRTallas_s
  Left = 0
  Top = 0
  Width = 841
  Height = 238
  TabOrder = 0
  object PNLDetalleTallas: TLFPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 238
    Align = alClient
    TabOrder = 0
    object DBGFDetalleTallasPrecios: TDBGridFind2000
      Left = 1
      Top = 23
      Width = 839
      Height = 214
      Align = alClient
      DataSource = DSQMver_detalles_gr_sd_pv
      TabOrder = 2
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
        'REF_PROVEEDOR'
        'S_COLOR')
      CamposAMostrar.Strings = (
        'REF_PROVEEDOR'
        '1'
        'TEMPORADA'
        'S_COLOR'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        'REF_PROVEEDOR'
        'S_COLOR')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CamposNoAccesibles.Strings = (
        'ID_D_E_GR')
      MensajeNoExiste = False
      Numericos.Strings = (
        'REF_PROVEEDOR'
        'S_COLOR')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'ART_ARTICULOS_MODELOS'
        'VER_ART_MOD_COLOR_PROV')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      Posicion = tpCentrado
      OnRowChange = DBGFDetalleTallasPreciosRowChange
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'REF_PROVEEDOR'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_COLOR'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITMC'
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P01'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P02'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P03'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P04'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P05'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P06'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P07'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P08'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P09'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P10'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P11'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P12'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P13'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P14'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P15'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P16'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P17'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P18'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P19'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P20'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P21'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P22'
          Width = 40
          Visible = True
        end>
    end
    object DBGFDetalleTallas: TDBGridFind2000
      Left = 1
      Top = 23
      Width = 839
      Height = 214
      Align = alClient
      DataSource = DSQMver_detalles_gr_sd
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = DBGFDetalleTallasColEnter
      OnDrawColumnCell = DBGFDetalleTallasDrawColumnCell
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
        'REF_PROVEEDOR'
        'S_COLOR')
      CamposAMostrar.Strings = (
        'REF_PROVEEDOR'
        '1'
        'TEMPORADA'
        'S_COLOR'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        'REF_PROVEEDOR'
        'S_COLOR')
      CamposDesplegar.Strings = (
        '1'
        '1')
      CampoAOrdenarColor = clInfoBk
      CamposNoAccesibles.Strings = (
        'ID_D_E_GR')
      MensajeNoExiste = False
      Numericos.Strings = (
        'REF_PROVEEDOR'
        'S_COLOR')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'ART_ARTICULOS_MODELOS'
        'VER_ART_MOD_COLOR_PROV')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'TITULO')
      Posicion = tpCentrado
      OnBusqueda = DBGFDetalleTallasBusqueda
      OnCampoDevuelve = DBGFDetalleTallasCampoDevuelve
      OnExiste = DBGFDetalleTallasExiste
      OnRowChange = DBGFDetalleTallasRowChange
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'REF_PROVEEDOR'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'S_COLOR'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITMC'
          Width = 164
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_VENTA'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAJA_EDI'
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_CAJA_EDI'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T01'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T02'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T03'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T04'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T05'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T06'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T07'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T08'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T09'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T10'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T11'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T12'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T13'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T14'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T15'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T16'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T17'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T18'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T19'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T20'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T21'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'T22'
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UTOTAL'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PTOTAL'
          ReadOnly = True
          Width = 74
          Visible = True
        end>
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 839
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
      TabOrder = 1
      Separators = True
      object NavTallas: THYMNavigator
        Left = 0
        Top = 0
        Width = 200
        Height = 22
        DataSource = DSQMver_detalles_gr_sd
        Flat = True
        ParentShowHint = False
        PopupMenu = CETallasPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFDetalleTallas
        InsertaControl = DBGFDetalleTallas
        Exclusivo = True
        ControlEdit = CETallas
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton1: TToolButton
        Left = 200
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TCPrecios: TTabControl
        Left = 208
        Top = 0
        Width = 125
        Height = 22
        Style = tsFlatButtons
        TabOrder = 1
        Tabs.Strings = (
          'Unidades'
          'Precios')
        TabIndex = 0
        OnChange = TCPreciosChange
      end
      object TBStockTallas: TToolButton
        Left = 333
        Top = 0
        Action = AStockTallas
      end
      object TButtTraspasaLineaAOrdenProduccion: TToolButton
        Left = 356
        Top = 0
        Hint = 'Traspasa la Linea a Orden de Produccion'
        Action = ATraspasaLineaOrdenProduccion
      end
      object TBTraspasaPedidoAOrdenProduccion: TToolButton
        Left = 379
        Top = 0
        Action = ATraspasaPedidoAOrdenProduccion
      end
      object TBTraspasaAgrupPedidoAOrdenProduccion: TToolButton
        Left = 402
        Top = 0
        Action = ATraspasaAgrupPedidoAOrdenProduccion
      end
      object TBNuevoArticulo: TToolButton
        Left = 425
        Top = 0
        Action = ANuevoArticulo
        ImageIndex = 2
      end
      object TButtSeleccionarKit: TToolButton
        Left = 448
        Top = 0
        Action = ASeleccionarKit
      end
      object TBInsercionMasivaModelo: TToolButton
        Left = 471
        Top = 0
        Action = AInsercionMasivaModelo
      end
    end
  end
  object DSQMver_detalles_gr_sd: TDataSource
    Left = 40
    Top = 64
  end
  object CETallas: TControlEdit
    PopUpMenu = CETallasPMEdit
    Teclas = DMMain.Teclas
    Left = 248
    Top = 64
  end
  object CETallasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 248
    Top = 96
    object CETallasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CETallasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CETallasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CETallasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CETallasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CETallasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CETallasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CETallasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CETallasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CETallasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object ActionList1: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 144
    Top = 64
    object AStockTallas: TAction
      Caption = 'AStockTallas'
      Hint = 'Consulta de stocks por modelo y color'
      ImageIndex = 128
      OnExecute = AStockTallasExecute
    end
    object APreciosPorTalla: TAction
      Caption = 'APreciosPorTalla'
      ImageIndex = 81
    end
    object ATraspasaLineaOrdenProduccion: TAction
      Caption = 'Traspasa a Orden de Produccion'
      Hint = 'Traspaso de la Linea a Orden de Produccion'
      ImageIndex = 42
      OnExecute = ATraspasaLineaOrdenProduccionExecute
    end
    object ATraspasaPedidoAOrdenProduccion: TAction
      Caption = 'Traspasa Pedido a Orden Produccion'
      Hint = 'Traspasa Todo el  Pedido a una nueva Orden Produccion'
      ImageIndex = 92
      OnExecute = ATraspasaPedidoAOrdenProduccionExecute
    end
    object ATraspasaAgrupPedidoAOrdenProduccion: TAction
      Caption = 'Traspasa Agrupacion de Pedido a Ordende Produccion'
      Hint = 'Traspasa Agrupacion de Pedido a Ordende Produccion'
      ImageIndex = 35
      OnExecute = ATraspasaAgrupPedidoAOrdenProduccionExecute
    end
    object ANuevoArticulo: TAction
      Caption = '&Nuevo Articulo'
      Hint = 'Crear un nuevo Art'#237'culo'
      ImageIndex = 57
      ShortCut = 16462
      OnExecute = ANuevoArticuloExecute
    end
    object ASeleccionarKit: TAction
      Caption = 'Seleccionar Kit'
      Hint = 'Selecionar Kit de Tallas'
      ImageIndex = 140
      OnExecute = ASeleccionarKitExecute
    end
    object AInsercionMasivaModelo: TAction
      Caption = 'Insercion Masiva Modelo'
      Hint = 'Inserta todos los colores de un modelo'
      ImageIndex = 10
      OnExecute = AInsercionMasivaModeloExecute
    end
  end
  object DSQMver_detalles_gr_sd_pv: TDataSource
    Left = 40
    Top = 96
  end
end
